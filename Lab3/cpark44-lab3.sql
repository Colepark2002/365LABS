-- Lab 3
-- cpark44
-- Oct 18, 2022

USE `cpark44`;
-- BAKERY-1
-- Using a single SQL statement, reduce the prices of Lemon Cake and Napoleon Cake by $2.
-- BAKERY - 1
UPDATE goods
SET Price = Price - 2
WHERE (Flavor = 'lemon'  OR Flavor = 'Napoleon') AND Food = 'cake';


USE `cpark44`;
-- BAKERY-2
-- Using a single SQL statement, increase by 15% the price of all Apricot or Chocolate flavored items with a current price below $5.95.
-- BAKERY-2
UPDATE goods
SET Price = Price * 1.15
WHERE (Flavor = 'Apricot' OR Flavor = 'Chocolate') AND Price < 5.95;


USE `cpark44`;
-- BAKERY-3
-- Add the capability for the database to record payment information for each receipt in a new table named payments (see assignment PDF for task details)
-- BAKERY - 3
DROP TABLE IF EXISTS payments;
CREATE TABLE payments (
Receipt VARCHAR(100) NOT NULL,
Amount NUMERIC (10,2) NOT NULL,
PaymentSettled TIMESTAMP NOT NULL,
PaymentType VARCHAR(100) NOT NULL, 
FOREIGN KEY (Receipt) REFERENCES receipts (RNumber),
PRIMARY KEY (Amount, PaymentSettled, PaymentType)
);


USE `cpark44`;
-- BAKERY-4
-- Create a database trigger to prevent the sale of Meringues (any flavor) and all Almond-flavored items on Saturdays and Sundays.
CREATE TRIGGER stop_weekend_sales BEFORE INSERT ON items
FOR EACH ROW
    BEGIN
    DECLARE receiptDate date; -- date from receipt
    DECLARE currFood VARCHAR (100); -- food to be inserted
    DECLARE currFlavor VARCHAR (100); -- flavor to be inserted

    SELECT Food into currFood FROM goods WHERE GId = NEW.Item; 
    SELECT Flavor into currFlavor FROM goods WHERE GId = NEW.Item;
    SELECT SaleDate into receiptDate FROM receipts WHERE RNumber = NEW.Receipt;
    
    if(
    (DAYNAME(receiptDate) = 'Saturday' OR DAYNAME(receiptDate) = 'Sunday')
    AND (currFood = 'Meringue' OR currFlavor = 'Almond' )
    )then
    
    signal sqlstate '45000' set message_text = "No Sales of Meringues or Almond flavored items until Monday";
    end if;
    
    END;


USE `cpark44`;
-- AIRLINES-1
-- Enforce the constraint that flights should never have the same airport as both source and destination (see assignment PDF)
-- AIRLINES - 1
CREATE TRIGGER same_source_and_dest BEFORE INSERT on flights
FOR EACH ROW
BEGIN
    DECLARE sourceAirport varchar(100);
    DECLARE destinationAirport varchar(100);
    SET sourceAirport = new.SourceAirport;
    SET destinationAirport = NEW.DestAirport;
    if(
    sourceAirport = destinationAirport
    ) then 
    signal sqlstate '45000'
    set message_text = "Source Airport and Destination Airport should not be the same";
    end if;
END;


USE `cpark44`;
-- AIRLINES-2
-- Add a "Partner" column to the airlines table to indicate optional corporate partnerships between airline companies (see assignment PDF)
DROP TRIGGER if EXISTS checkSelfPartner
DROP TRIGGER if EXISTS nonexistentAirline
DROP TRIGGER if EXISTS hasPartnerInsert
DROP TRIGGER if EXISTS checkPartnerOnUpdate

ALTER TABLE airlines ADD Partner VARCHAR (100);
UPDATE airlines SET Partner = 'JetBlue' WHERE Abbreviation = 'Southwest';
UPDATE airlines SET Partner = 'Southwest' WHERE Abbreviation = 'JetBlue';

CREATE TRIGGER checkSelfPartner BEFORE INSERT ON airlines
FOR EACH ROW
    BEGIN
    DECLARE currAirline VARCHAR (100);
    DECLARE currPartner VARCHAR (100);
    
    set currAirline = NEW.Abbreviation;
    set currPartner = NEW.Partner;
    
    if(
    currAirline = currPartner
    )then
    signal sqlstate '45000'
    set message_text = "Cannot Set Partner to Self";
    end if;
    END;
    
CREATE TRIGGER nonexistentAirline BEFORE INSERT ON airlines
FOR EACH ROW
    BEGIN
    
    DECLARE airline_exists VARCHAR (100);
    
    if (
    NEW.Partner is not null
    )then
    SELECT Abbreviation INTO airline_exists FROM airlines WHERE Abbreviation = NEW.PARTNER;
        if(airline_exists is null)then
        
        signal sqlstate '45000'
        set message_text = "Partner is non-existent";
        end if;
    end if;
    
    END;
    
CREATE TRIGGER hasPartnerInsert BEFORE INSERT ON airlines
FOR EACH ROW
    BEGIN
    DECLARE currPartner VARCHAR(100);
    if(
    NEW.PARTNER IS NOT NULL
    )then
    
    SELECT PARTNER INTO currPartner FROM airlines WHERE Abbreviation = NEW.Partner;
        if(currPartner IS NOT NULL)then
            signal sqlstate '45000'
            set message_text = "New Partner is already Partnered";
        end if;
    end if;
    END;

CREATE TRIGGER checkPartnerOnUpdate BEFORE UPDATE ON airlines
FOR EACH ROW
    BEGIN
    DECLARE currPartner VARCHAR (100);
    if (NEW.Partner IS NOT NULL)then
        SELECT Partner into currPartner FROM airlines WHERE Abbreviation = NEW.Partner;
        if(currPartner IS NOT NULL and currPartner != NEW.Abbreviation)then
            signal sqlstate '45000'
            set message_text = "cannot add partner";
        end if;
    end if;
    END;


USE `cpark44`;
-- KATZENJAMMER-1
-- Change the name of two instruments: 'bass balalaika' should become 'awesome bass balalaika', and 'guitar' should become 'acoustic guitar'. This will require several steps. You may need to change the length of the instrument name field to avoid data truncation. Make this change using a schema modification command, rather than a full DROP/CREATE of the table.
UPDATE Instruments
SET Instrument = 'acoustic guitar'
WHERE Instrument = 'guitar';

UPDATE Instruments
SET Instrument = 'awesome bass balalaika'
WHERE Instrument = 'bass balalaika';


USE `cpark44`;
-- KATZENJAMMER-2
-- Keep in the Vocals table only those rows where Solveig (id 1 -- you may use this numeric value directly) sang, but did not sing lead.
DELETE FROM Vocals WHERE (`Type` != 'lead' and Bandmate != 1);


