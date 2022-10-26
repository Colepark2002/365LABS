-- Lab 2
-- cpark44
-- Oct 12, 2022

USE `cpark44`;
-- AIRLINES
-- Create and populate relational tables corresponding to the AIRLINES dataset (schema and data provided on Canvas)
DROP TABLE IF EXISTS flights;
DROP TABLE IF EXISTS airlines;
DROP TABLE IF EXISTS airports;




CREATE TABLE airports(
City VARCHAR(100) NOT NULL,
AirportCode VARCHAR(3) NOT NULL,
AirportName VARCHAR(100) NOT NULL,
Country VARCHAR(100) NOT NULL,
CountryAbbrev VARCHAR(100) NOT NULL,
UNIQUE (AirportCode)
);


insert into airports (City, AirportCode, AirportName, Country, CountryAbbrev) values ("Aberdeen", "APG", "Phillips AAF", "United States", "US");
insert into airports (City, AirportCode, AirportName, Country, CountryAbbrev) values ("Aberdeen", "ABR", "Municipal", "United States", "US");
insert into airports (City, AirportCode, AirportName, Country, CountryAbbrev) values ("Abilene", "DYS", "Dyess AFB", "United States", "US");
insert into airports (City, AirportCode, AirportName, Country, CountryAbbrev) values ("Abilene", "ABI", "Municipal", "United States", "US");
insert into airports (City, AirportCode, AirportName, Country, CountryAbbrev) values ("Abingdon", "VJI", "Virginia Highlands", "United States", "US");
insert into airports (City, AirportCode, AirportName, Country, CountryAbbrev) values ("Ada", "ADT", "Ada", "United States", "US");
insert into airports (City, AirportCode, AirportName, Country, CountryAbbrev) values ("Adak Island", "ADK", "Adak Island Ns", "United States", "US");
insert into airports (City, AirportCode, AirportName, Country, CountryAbbrev) values ("Adrian", "ADG", "Lenawee County", "United States", "US");
insert into airports (City, AirportCode, AirportName, Country, CountryAbbrev) values ("Afton", "AFO", "Municipal", "United States", "US");
insert into airports (City, AirportCode, AirportName, Country, CountryAbbrev) values ("Aiken", "AIK", "Municipal", "United States", "US");
insert into airports (City, AirportCode, AirportName, Country, CountryAbbrev) values ("Ainsworth", "ANW", "Ainsworth", "United States", "US");
insert into airports (City, AirportCode, AirportName, Country, CountryAbbrev) values ("Akhiok", "AKK", "Akhiok SPB", "United States", "US");
insert into airports (City, AirportCode, AirportName, Country, CountryAbbrev) values ("Akiachak", "KKI", "Spb", "United States", "US");
insert into airports (City, AirportCode, AirportName, Country, CountryAbbrev) values ("Akiak", "AKI", "Akiak", "United States", "US");
insert into airports (City, AirportCode, AirportName, Country, CountryAbbrev) values ("Akron CO", "AKO", "Colorado Plains Regional Airport", "United States", "US");
insert into airports (City, AirportCode, AirportName, Country, CountryAbbrev) values ("Akron/Canton OH", "CAK", "Akron/canton Regional", "United States", "US");
insert into airports (City, AirportCode, AirportName, Country, CountryAbbrev) values ("Akron/Canton", "AKC", "Fulton International", "United States", "US");

CREATE TABLE airlines(
Id INT PRIMARY KEY NOT NULL,
Airline VARCHAR(100) NOT NULL,
Abbreviation VARCHAR(100) NOT NULL UNIQUE,
Country VARCHAR(100) NOT NULL
);

insert into airlines (Id, Airline, Abbreviation, Country) values (1, "United Airlines", "UAL", "USA");
insert into airlines (Id, Airline, Abbreviation, Country) values (2, "US Airways", "USAir", "USA");
insert into airlines (Id, Airline, Abbreviation, Country) values (3, "Delta Airlines", "Delta", "USA");
insert into airlines (Id, Airline, Abbreviation, Country) values (4, "Southwest Airlines", "Southwest", "USA");
insert into airlines (Id, Airline, Abbreviation, Country) values (5, "American Airlines", "American", "USA");
insert into airlines (Id, Airline, Abbreviation, Country) values (6, "Northwest Airlines", "Northwest", "USA");
insert into airlines (Id, Airline, Abbreviation, Country) values (7, "Continental Airlines", "Continental", "USA");
insert into airlines (Id, Airline, Abbreviation, Country) values (8, "JetBlue Airways", "JetBlue", "USA");
insert into airlines (Id, Airline, Abbreviation, Country) values (9, "Frontier Airlines", "Frontier", "USA");
insert into airlines (Id, Airline, Abbreviation, Country) values (10, "AirTran Airways", "AirTran", "USA");
insert into airlines (Id, Airline, Abbreviation, Country) values (11, "Allegiant Air", "Allegiant", "USA");
insert into airlines (Id, Airline, Abbreviation, Country) values (12, "Virgin America", "Virgin", "USA");

CREATE TABLE flights(
Airline INT NOT NULL,
FlightNo INT NOT NULL,
SourceAirport VARCHAR(3) NOT NULL,
DestAirport VARCHAR(3) NOT NULL,
FOREIGN KEY (SourceAirport) REFERENCES airports (AirportCode),
FOREIGN KEY (DestAirport) REFERENCES airports (AirportCode),
PRIMARY KEY (Airline,FlightNo),
FOREIGN KEY (Airline) REFERENCES airlines (Id)
);


insert into flights (Airline, FlightNo, SourceAirport, DestAirport) values (1, 28, "APG", "ABR");
insert into flights (Airline, FlightNo, SourceAirport, DestAirport) values (1, 29, "AIK", "ADT");
insert into flights (Airline, FlightNo, SourceAirport, DestAirport) values (1, 44, "AKO", "AKI");
insert into flights (Airline, FlightNo, SourceAirport, DestAirport) values (1, 45, "CAK", "APG");
insert into flights (Airline, FlightNo, SourceAirport, DestAirport) values (1, 54, "AFO", "AKO");
insert into flights (Airline, FlightNo, SourceAirport, DestAirport) values (3, 2, "AIK", "ADT");
insert into flights (Airline, FlightNo, SourceAirport, DestAirport) values (3, 3, "DYS", "ABI");
insert into flights (Airline, FlightNo, SourceAirport, DestAirport) values (3, 26, "AKK", "VJI");
insert into flights (Airline, FlightNo, SourceAirport, DestAirport) values (9, 1260, "AKO", "AKC");
insert into flights (Airline, FlightNo, SourceAirport, DestAirport) values (9, 1261, "APG", "ABR");
insert into flights (Airline, FlightNo, SourceAirport, DestAirport) values (9, 1286, "ABR", "APG");
insert into flights (Airline, FlightNo, SourceAirport, DestAirport) values (9, 1287, "DYS", "ANW");
insert into flights (Airline, FlightNo, SourceAirport, DestAirport) values (10, 6, "KKI", "AKC");
insert into flights (Airline, FlightNo, SourceAirport, DestAirport) values (10, 7, "VJI", "APG");
insert into flights (Airline, FlightNo, SourceAirport, DestAirport) values (10, 54, "ADT", "APG");
insert into flights (Airline, FlightNo, SourceAirport, DestAirport) values (6, 4, "AIK", "AKO");
insert into flights (Airline, FlightNo, SourceAirport, DestAirport) values (6, 5, "CAK", "APG");
insert into flights (Airline, FlightNo, SourceAirport, DestAirport) values (6, 28, "AKO", "ABI");
insert into flights (Airline, FlightNo, SourceAirport, DestAirport) values (6, 29, "ABR", "ABI");


SHOW TABLES;
SELECT * FROM airlines;
SELECT * FROM airports;
SELECT * FROM flights;


USE `cpark44`;
-- KATZENJAMMER
-- Create and populate the KATZENJAMMER database
DROP TABLE IF EXISTS Tracklists;
DROP TABLE IF EXISTS Vocals;
DROP TABLE IF EXISTS Performance;
DROP TABLE IF EXISTS Instruments;
DROP TABLE IF EXISTS Band;
DROP TABLE IF EXISTS Albums;
DROP TABLE IF EXISTS Songs;


CREATE TABLE Songs(
SongId INT  NOT NULL PRIMARY KEY, 
Title VARCHAR(100) NOT NULL
);

CREATE TABLE Albums(
AId   INT  NOT NULL PRIMARY KEY,
Title VARCHAR(100) NOT NULL,
Year  INT  NOT NULL,
Label VARCHAR(100) NOT NULL,
Type  VARCHAR(100) NOT NULL
);

CREATE TABLE Band(
Id INT  NOT NULL PRIMARY KEY, 
Firstname VARCHAR(100) NOT NULL,
Lastname  VARCHAR(100) NOT NULL
);

CREATE TABLE Instruments(
SongId INT  NOT NULL, 
BandmateId INT  NOT NULL,
Instrument VARCHAR(100) NOT NULL,
FOREIGN KEY (SongId) REFERENCES Songs (SongId),
PRIMARY KEY (SongId,BandmateId,Instrument)
);

CREATE TABLE Performance(
SongId INT NOT NULL, 
Bandmate INT NOT NULL,
StagePosition VARCHAR(100) NOT NULL,
FOREIGN KEY (SongId) REFERENCES Songs (SongId),
FOREIGN KEY (Bandmate) REFERENCES Band (Id),
PRIMARY KEY (SongId,Bandmate)
);

CREATE TABLE Tracklists(
AlbumId INT NOT NULL, 
Position INT NOT NULL,
SongId INT NOT NULL,
FOREIGN KEY (AlbumId) REFERENCES Albums(AId),
FOREIGN KEY (SongId) REFERENCES Songs(SongId)
);

CREATE TABLE Vocals(
SongId   INT  NOT NULL, 
Bandmate INT  NOT NULL,
`Type` VARCHAR(100) NOT NULL,
FOREIGN KEY (SongId) REFERENCES Songs(SongId)
);

INSERT INTO Songs(SongId,Title) VALUES (1,'Overture');
INSERT INTO Songs(SongId,Title) VALUES (2,'A Bar In Amsterdam');
INSERT INTO Songs(SongId,Title) VALUES (3,'Demon Kitty Rag');
INSERT INTO Songs(SongId,Title) VALUES (4,'Tea With Cinnamon');
INSERT INTO Songs(SongId,Title) VALUES (5,'Hey Ho on the Devil''s Back');
INSERT INTO Songs(SongId,Title) VALUES (6,'Wading in Deeper');
INSERT INTO Songs(SongId,Title) VALUES (7,'Le Pop');
INSERT INTO Songs(SongId,Title) VALUES (8,'Der Kapitan');
INSERT INTO Songs(SongId,Title) VALUES (9,'Virginia Clemm');
INSERT INTO Songs(SongId,Title) VALUES (10,'Play My Darling');
INSERT INTO Songs(SongId,Title) VALUES (11,'To the Sea');
INSERT INTO Songs(SongId,Title) VALUES (12,'Mother Superior');
INSERT INTO Songs(SongId,Title) VALUES (13,'Aint no Thang');
INSERT INTO Songs(SongId,Title) VALUES (14,'A Kiss Before You Go');
INSERT INTO Songs(SongId,Title) VALUES (15,'I Will Dance (When I Walk Away)');
INSERT INTO Songs(SongId,Title) VALUES (16,'Cherry Pie');
INSERT INTO Songs(SongId,Title) VALUES (17,'Land of Confusion');
INSERT INTO Songs(SongId,Title) VALUES (18,'Lady Marlene');
INSERT INTO Songs(SongId,Title) VALUES (19,'Rock-Paper-Scissors');
INSERT INTO Songs(SongId,Title) VALUES (20,'Cocktails and Ruby Slippers');
INSERT INTO Songs(SongId,Title) VALUES (21,'Soviet Trumpeter');
INSERT INTO Songs(SongId,Title) VALUES (22,'Loathsome M');
INSERT INTO Songs(SongId,Title) VALUES (23,'Shepherds Song');
INSERT INTO Songs(SongId,Title) VALUES (24,'Gypsy Flee');
INSERT INTO Songs(SongId,Title) VALUES (25,'Gods Great Dust Storm');
INSERT INTO Songs(SongId,Title) VALUES (26,'Ouch');
INSERT INTO Songs(SongId,Title) VALUES (27,'Listening to the World');
INSERT INTO Songs(SongId,Title) VALUES (28,'Johnny Blowtorch');
INSERT INTO Songs(SongId,Title) VALUES (29,'Flash');
INSERT INTO Songs(SongId,Title) VALUES (30,'Driving After You');
INSERT INTO Songs(SongId,Title) VALUES (31,'My Own Tune');
INSERT INTO Songs(SongId,Title) VALUES (32,'Badlands');
INSERT INTO Songs(SongId,Title) VALUES (33,'Old De Spain');
INSERT INTO Songs(SongId,Title) VALUES (34,'Oh My God');
INSERT INTO Songs(SongId,Title) VALUES (35,'Lady Gray');
INSERT INTO Songs(SongId,Title) VALUES (36,'Shine Like Neon Rays');
INSERT INTO Songs(SongId,Title) VALUES (37,'Flash in the Dark');
INSERT INTO Songs(SongId,Title) VALUES (38,'My Dear');
INSERT INTO Songs(SongId,Title) VALUES (39,'Bad Girl');
INSERT INTO Songs(SongId,Title) VALUES (40,'Rockland');
INSERT INTO Songs(SongId,Title) VALUES (41,'Curvaceous Needs');
INSERT INTO Songs(SongId,Title) VALUES (42,'Borka');
INSERT INTO Songs(SongId,Title) VALUES (43,'Let it Snow');

INSERT INTO Albums(AId,Title,Year,Label,Type) VALUES (1,'Le Pop',2008,'Propeller Recordings','Studio');
INSERT INTO Albums(AId,Title,Year,Label,Type) VALUES (2,'A Kiss Before You Go',2011,'Propeller Recordings','Studio');
INSERT INTO Albums(AId,Title,Year,Label,Type) VALUES (3,'A Kiss Before You Go: Live in Hamburg',2012,'Universal Music Group','Live');
INSERT INTO Albums(AId,Title,Year,Label,Type) VALUES (4,'Rockland',2015,'Propeller Recordings','Studio');

INSERT INTO Band(Id,Firstname,Lastname) VALUES (1,'Solveig','Heilo');
INSERT INTO Band(Id,Firstname,Lastname) VALUES (2,'Marianne','Sveen');
INSERT INTO Band(Id,Firstname,Lastname) VALUES (3,'Anne-Marit','Bergheim');
INSERT INTO Band(Id,Firstname,Lastname) VALUES (4,'Turid','Jorgensen');

INSERT INTO Instruments(SongId,BandmateId,Instrument) VALUES (1,1,'trumpet');
INSERT INTO Instruments(SongId,BandmateId,Instrument) VALUES (1,2,'keyboard');
INSERT INTO Instruments(SongId,BandmateId,Instrument) VALUES (1,3,'accordion');
INSERT INTO Instruments(SongId,BandmateId,Instrument) VALUES (1,4,'bass balalaika');
INSERT INTO Instruments(SongId,BandmateId,Instrument) VALUES (2,1,'trumpet');
INSERT INTO Instruments(SongId,BandmateId,Instrument) VALUES (2,2,'drums');
INSERT INTO Instruments(SongId,BandmateId,Instrument) VALUES (2,3,'guitar');
INSERT INTO Instruments(SongId,BandmateId,Instrument) VALUES (2,4,'bass balalaika');
INSERT INTO Instruments(SongId,BandmateId,Instrument) VALUES (3,1,'drums');
INSERT INTO Instruments(SongId,BandmateId,Instrument) VALUES (3,1,'ukalele');
INSERT INTO Instruments(SongId,BandmateId,Instrument) VALUES (3,2,'banjo');
INSERT INTO Instruments(SongId,BandmateId,Instrument) VALUES (3,3,'bass balalaika');
INSERT INTO Instruments(SongId,BandmateId,Instrument) VALUES (3,4,'keyboards');
INSERT INTO Instruments(SongId,BandmateId,Instrument) VALUES (4,1,'drums');
INSERT INTO Instruments(SongId,BandmateId,Instrument) VALUES (4,2,'ukalele');
INSERT INTO Instruments(SongId,BandmateId,Instrument) VALUES (4,3,'accordion');
INSERT INTO Instruments(SongId,BandmateId,Instrument) VALUES (4,4,'bass balalaika');

INSERT INTO Performance(SongId,Bandmate,StagePosition) VALUES (1,1,'back');
INSERT INTO Performance(SongId,Bandmate,StagePosition) VALUES (1,2,'left');
INSERT INTO Performance(SongId,Bandmate,StagePosition) VALUES (1,3,'center');
INSERT INTO Performance(SongId,Bandmate,StagePosition) VALUES (1,4,'right');
INSERT INTO Performance(SongId,Bandmate,StagePosition) VALUES (2,1,'center');
INSERT INTO Performance(SongId,Bandmate,StagePosition) VALUES (2,2,'back');
INSERT INTO Performance(SongId,Bandmate,StagePosition) VALUES (2,3,'left');
INSERT INTO Performance(SongId,Bandmate,StagePosition) VALUES (2,4,'right');
INSERT INTO Performance(SongId,Bandmate,StagePosition) VALUES (3,1,'back');
INSERT INTO Performance(SongId,Bandmate,StagePosition) VALUES (3,2,'right');
INSERT INTO Performance(SongId,Bandmate,StagePosition) VALUES (3,3,'center');
INSERT INTO Performance(SongId,Bandmate,StagePosition) VALUES (3,4,'left');
INSERT INTO Performance(SongId,Bandmate,StagePosition) VALUES (4,1,'back');
INSERT INTO Performance(SongId,Bandmate,StagePosition) VALUES (4,2,'center');
INSERT INTO Performance(SongId,Bandmate,StagePosition) VALUES (4,3,'left');
INSERT INTO Performance(SongId,Bandmate,StagePosition) VALUES (4,4,'right');

INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (1,1,1);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (1,2,2);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (1,3,3);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (1,4,4);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (1,5,5);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (1,6,6);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (1,7,7);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (1,8,8);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (1,9,9);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (1,10,10);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (1,11,11);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (1,12,12);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (1,13,13);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (2,1,14);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (2,2,15);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (2,3,16);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (2,4,17);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (2,5,18);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (2,6,19);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (2,7,20);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (2,8,21);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (2,9,22);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (2,10,23);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (2,11,24);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (2,12,25);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (3,1,14);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (3,2,26);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (3,3,3);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (3,4,15);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (3,5,11);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (3,6,19);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (3,7,18);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (3,8,16);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (3,9,12);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (3,10,17);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (3,11,22);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (3,12,20);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (3,13,2);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (3,14,5);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (3,15,8);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (3,16,7);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (3,17,25);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (3,18,13);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (3,19,24);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (4,1,33);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (4,2,41);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (4,3,34);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (4,4,35);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (4,5,31);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (4,6,36);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (4,7,30);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (4,8,37);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (4,9,38);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (4,10,39);
INSERT INTO Tracklists(AlbumId,Position,SongId) VALUES (4,11,40);

INSERT INTO Vocals(SongId,Bandmate,`Type`) VALUES (2,1,'lead');
INSERT INTO Vocals(SongId,Bandmate,`Type`) VALUES (2,3,'chorus');
INSERT INTO Vocals(SongId,Bandmate,`Type`) VALUES (2,4,'chorus');
INSERT INTO Vocals(SongId,Bandmate,`Type`) VALUES (3,2,'lead');
INSERT INTO Vocals(SongId,Bandmate,`Type`) VALUES (4,1,'chorus');
INSERT INTO Vocals(SongId,Bandmate,`Type`) VALUES (4,2,'lead');
INSERT INTO Vocals(SongId,Bandmate,`Type`) VALUES (4,3,'chorus');
INSERT INTO Vocals(SongId,Bandmate,`Type`) VALUES (4,4,'chorus');


SHOW TABLES;


USE `cpark44`;
-- BAKERY
-- Create and populate the BAKERY database
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS receipts;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS goods;





CREATE TABLE customers(
CId INT NOT NULL PRIMARY KEY, 
LastName VARCHAR(100) NOT NULL,
FirstName VARCHAR(100) NOT NULL
);

CREATE TABLE goods(
GId VARCHAR(100) NOT NULL PRIMARY KEY,
Flavor VARCHAR(100) NOT NULL,
Food VARCHAR(100) NOT NULL,
Price FLOAT NOT NULL,
UNIQUE (Flavor,Food)
);

CREATE TABLE receipts(
RNumber VARCHAR(100) NOT NULL PRIMARY KEY,
SaleDate Date NOT NULL,
Customer INTEGER  NOT NULL,
FOREIGN KEY (Customer) REFERENCES customers (CId)
);

CREATE TABLE items(
Receipt VARCHAR(100)  NOT NULL,
Ordinal INT  NOT NULL,
Item VARCHAR(100) NOT NULL,
PRIMARY KEY (Receipt, Ordinal),
FOREIGN KEY (Receipt) REFERENCES receipts(RNumber),
FOREIGN KEY (Item) REFERENCES goods(GId)
);








INSERT INTO customers(CId,LastName,FirstName) VALUES (1,'LOGAN','JULIET');
INSERT INTO customers(CId,LastName,FirstName) VALUES (2,'ARZT','TERRELL');
INSERT INTO customers(CId,LastName,FirstName) VALUES (3,'ESPOSITA','TRAVIS');
INSERT INTO customers(CId,LastName,FirstName) VALUES (4,'ENGLEY','SIXTA');
INSERT INTO customers(CId,LastName,FirstName) VALUES (5,'DUNLOW','OSVALDO');
INSERT INTO customers(CId,LastName,FirstName) VALUES (6,'SLINGLAND','JOSETTE');
INSERT INTO customers(CId,LastName,FirstName) VALUES (7,'TOUSSAND','SHARRON');
INSERT INTO customers(CId,LastName,FirstName) VALUES (8,'HELING','RUPERT');
INSERT INTO customers(CId,LastName,FirstName) VALUES (9,'HAFFERKAMP','CUC');
INSERT INTO customers(CId,LastName,FirstName) VALUES (10,'DUKELOW','CORETTA');
INSERT INTO customers(CId,LastName,FirstName) VALUES (11,'STADICK','MIGDALIA');
INSERT INTO customers(CId,LastName,FirstName) VALUES (12,'MCMAHAN','MELLIE');
INSERT INTO customers(CId,LastName,FirstName) VALUES (13,'ARNN','KIP');
INSERT INTO customers(CId,LastName,FirstName) VALUES (14,'S''OPKO','RAYFORD');
INSERT INTO customers(CId,LastName,FirstName) VALUES (15,'CALLENDAR','DAVID');
INSERT INTO customers(CId,LastName,FirstName) VALUES (16,'CRUZEN','ARIANE');
INSERT INTO customers(CId,LastName,FirstName) VALUES (17,'MESDAQ','CHARLENE');
INSERT INTO customers(CId,LastName,FirstName) VALUES (18,'DOMKOWSKI','ALMETA');
INSERT INTO customers(CId,LastName,FirstName) VALUES (19,'STENZ','NATACHA');
INSERT INTO customers(CId,LastName,FirstName) VALUES (20,'ZEME','STEPHEN');

INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('20-BC-C-10','Chocolate','Cake',8.95);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('20-BC-L-10','Lemon','Cake',8.95);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('20-CA-7.5','Casino','Cake',15.95);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('24-8x10','Opera','Cake',15.95);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('25-STR-9','Strawberry','Cake',11.95);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('26-8x10','Truffle','Cake',15.95);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('45-CH','Chocolate','Eclair',3.25);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('45-CO','Coffee','Eclair',3.5);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('45-VA','Vanilla','Eclair',3.25);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('46-11','Napoleon','Cake',13.49);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('90-ALM-I','Almond','Tart',3.75);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('90-APIE-10','Apple','Pie',5.25);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('90-APP-11','Apple','Tart',3.25);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('90-APR-PF','Apricot','Tart',3.25);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('90-BER-11','Berry','Tart',3.25);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('90-BLK-PF','Blackberry','Tart',3.25);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('90-BLU-11','Blueberry','Tart',3.25);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('90-CH-PF','Chocolate','Tart',3.75);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('90-CHR-11','Cherry','Tart',3.25);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('90-LEM-11','Lemon','Tart',3.25);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('90-PEC-11','Pecan','Tart',3.75);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('70-GA','Ganache','Cookie',1.15);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('70-GON','Gongolais','Cookie',1.15);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('70-R','Raspberry','Cookie',1.09);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('70-LEM','Lemon','Cookie',0.79);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('70-M-CH-DZ','Chocolate','Meringue',1.25);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('70-M-VA-SM-DZ','Vanilla','Meringue',1.15);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('70-MAR','Marzipan','Cookie',1.25);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('70-TU','Tuile','Cookie',1.25);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('70-W','Walnut','Cookie',0.79);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('50-ALM','Almond','Croissant',1.45);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('50-APP','Apple','Croissant',1.45);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('50-APR','Apricot','Croissant',1.45);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('50-CHS','Cheese','Croissant',1.75);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('50-CH','Chocolate','Croissant',1.75);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('51-APR','Apricot','Danish',1.15);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('51-APP','Apple','Danish',1.15);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('51-ATW','Almond','Twist',1.15);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('51-BC','Almond','Bear Claw',1.95);
INSERT INTO goods(GId,Flavor,Food,Price) VALUES ('51-BLU','Blueberry','Danish',1.15);

INSERT INTO receipts(RNumber,Customer,SaleDate) VALUES (18129,15,'2007-10-28');
INSERT INTO receipts(RNumber,Customer,SaleDate) VALUES (51991,14,'2007-10-17');
INSERT INTO receipts(RNumber,Customer,SaleDate) VALUES (83085,7,'2007-10-12');
INSERT INTO receipts(RNumber,Customer,SaleDate) VALUES (70723,20,'2007-10-28');
INSERT INTO receipts(RNumber,Customer,SaleDate) VALUES (13355,7,'2007-10-12');
INSERT INTO receipts(RNumber,Customer,SaleDate) VALUES (52761,8,'2007-10-27');
INSERT INTO receipts(RNumber,Customer,SaleDate) VALUES (99002,20,'2007-10-13');
INSERT INTO receipts(RNumber,Customer,SaleDate) VALUES (58770,18,'2007-10-22');
INSERT INTO receipts(RNumber,Customer,SaleDate) VALUES (84665,6,'2007-10-10');

INSERT INTO items(Receipt,Ordinal,Item) VALUES ('18129',1,'70-TU');
INSERT INTO items(Receipt,Ordinal,Item) VALUES ('51991',1,'90-APIE-10');
INSERT INTO items(Receipt,Ordinal,Item) VALUES ('51991',2,'90-CH-PF');
INSERT INTO items(Receipt,Ordinal,Item) VALUES ('51991',3,'90-APP-11');
INSERT INTO items(Receipt,Ordinal,Item) VALUES ('51991',4,'26-8x10');
INSERT INTO items(Receipt,Ordinal,Item) VALUES ('83085',1,'25-STR-9');
INSERT INTO items(Receipt,Ordinal,Item) VALUES ('83085',2,'24-8x10');
INSERT INTO items(Receipt,Ordinal,Item) VALUES ('83085',3,'90-APR-PF');
INSERT INTO items(Receipt,Ordinal,Item) VALUES ('83085',4,'51-ATW');
INSERT INTO items(Receipt,Ordinal,Item) VALUES ('83085',5,'26-8x10');
INSERT INTO items(Receipt,Ordinal,Item) VALUES ('70723',1,'45-CO');
INSERT INTO items(Receipt,Ordinal,Item) VALUES ('13355',1,'24-8x10');
INSERT INTO items(Receipt,Ordinal,Item) VALUES ('13355',2,'70-LEM');
INSERT INTO items(Receipt,Ordinal,Item) VALUES ('13355',3,'46-11');
INSERT INTO items(Receipt,Ordinal,Item) VALUES ('52761',1,'90-ALM-I');
INSERT INTO items(Receipt,Ordinal,Item) VALUES ('52761',2,'26-8x10');
INSERT INTO items(Receipt,Ordinal,Item) VALUES ('52761',3,'50-CHS');
INSERT INTO items(Receipt,Ordinal,Item) VALUES ('52761',4,'90-BLK-PF');
INSERT INTO items(Receipt,Ordinal,Item) VALUES ('52761',5,'90-ALM-I');
INSERT INTO items(Receipt,Ordinal,Item) VALUES ('99002',1,'50-CHS');
INSERT INTO items(Receipt,Ordinal,Item) VALUES ('99002',2,'45-VA');
INSERT INTO items(Receipt,Ordinal,Item) VALUES ('58770',1,'50-CHS');
INSERT INTO items(Receipt,Ordinal,Item) VALUES ('58770',2,'46-11');
INSERT INTO items(Receipt,Ordinal,Item) VALUES ('58770',3,'45-CH');
INSERT INTO items(Receipt,Ordinal,Item) VALUES ('58770',4,'20-CA-7.5');
INSERT INTO items(Receipt,Ordinal,Item) VALUES ('84665',1,'90-BER-11');


USE `cpark44`;
-- CUSTOM
-- Create and populate your custom database
DROP TABLE IF EXISTS agents;
DROP TABLE IF EXISTS maps;
DROP TABLE IF EXISTS players;
DROP TABLE IF EXISTS teams;

CREATE TABLE agents(
agent     VARCHAR(100) NOT NULL PRIMARY KEY,
pick_rate VARCHAR(100) NOT NULL,
rounds   INT NOT NULL,
rating    NUMERIC(5,2) NOT NULL,
ACS       NUMERIC(5,1) NOT NULL,
KD        NUMERIC(4,2) NOT NULL,
ADR       NUMERIC(5,1) NOT NULL,
KPR       NUMERIC(4,2) NOT NULL,
DPR       NUMERIC(4,2) NOT NULL,
APR       NUMERIC(4,2) NOT NULL,
FBPR      NUMERIC(4,2) NOT NULL,
FDPR      NUMERIC(4,2) NOT NULL,
HS        VARCHAR(100) NOT NULL,
FBSR      VARCHAR(100)  NOT NULL
);

CREATE TABLE maps(
map                         VARCHAR(100) NOT NULL PRIMARY KEY,
played                      VARCHAR(100) NOT NULL,
avg_spike_plant             VARCHAR(100) NOT NULL,
rounds                      INTEGER  NOT NULL,
atk_win_rate                VARCHAR(100) NOT NULL,
def_win_rate                VARCHAR(100) NOT NULL,
pistol_atk_win_rate         VARCHAR(100) NOT NULL,
pistol_def_win_rate         VARCHAR(100) NOT NULL,
second_round_conversion_atk VARCHAR(100) NOT NULL,
second_round_conversion_def VARCHAR(100) NOT NULL
);

CREATE TABLE teams(
team          VARCHAR(100) NOT NULL PRIMARY KEY,
country       VARCHAR(5) NOT NULL,
maps_played   INTEGER  NOT NULL,
maps_won      INTEGER  NOT NULL,
maps_won_perc      VARCHAR(6) NOT NULL,
atk_played    VARCHAR(5) NOT NULL,
atk_won       INTEGER  NOT NULL,
atk_won_perc       VARCHAR(6) NOT NULL,
def_played    VARCHAR(5) NOT NULL,
def_won       INTEGER  NOT NULL,
def_won_perc       VARCHAR(6) NOT NULL,
pistol_played INTEGER  NOT NULL,
pistol_won    INTEGER  NOT NULL,
pistol_won_perc    VARCHAR(6) NOT NULL
);

CREATE TABLE players(
player  VARCHAR(100) NOT NULL PRIMARY KEY,
country VARCHAR(100) NOT NULL,
team    VARCHAR(100) NOT NULL,
rounds  INTEGER  NOT NULL,
rating  NUMERIC(4,2) NOT NULL,
ACS     NUMERIC(5,1) NOT NULL,
KD      NUMERIC(4,2) NOT NULL,
ADR     NUMERIC(5,1) NOT NULL,
KPR     NUMERIC(4,2) NOT NULL,
DPR     NUMERIC(4,2) NOT NULL,
APR     NUMERIC(4,2) NOT NULL,
FBPR    NUMERIC(4,2) NOT NULL,
FDPR    NUMERIC(4,2) NOT NULL,
HS      VARCHAR(100) NOT NULL,
FBSR    VARCHAR(100) NOT NULL,
FOREIGN KEY (team) REFERENCES teams (team)
);




INSERT INTO agents(agent,pick_rate,rounds,rating,ACS,KD,ADR,KPR,DPR,APR,FBPR,FDPR,HS,FBSR) VALUES ('Jett','78.14%',462467,1.08,232.8,1.1,148.7,0.82,0.74,0.16,0.19,0.16,'25%','54%');
INSERT INTO agents(agent,pick_rate,rounds,rating,ACS,KD,ADR,KPR,DPR,APR,FBPR,FDPR,HS,FBSR) VALUES ('Sova','76.00%',450157,0.97,194.6,0.98,133.5,0.66,0.68,0.32,0.06,0.06,'25%','49%');
INSERT INTO agents(agent,pick_rate,rounds,rating,ACS,KD,ADR,KPR,DPR,APR,FBPR,FDPR,HS,FBSR) VALUES ('Astra','48.14%',284853,0.98,186.6,0.99,123.8,0.68,0.68,0.32,0.07,0.07,'26%','48%');
INSERT INTO agents(agent,pick_rate,rounds,rating,ACS,KD,ADR,KPR,DPR,APR,FBPR,FDPR,HS,FBSR) VALUES ('Viper','42.67%',253988,0.95,193.1,0.97,128.4,0.67,0.69,0.28,0.08,0.09,'25%','46%');
INSERT INTO agents(agent,pick_rate,rounds,rating,ACS,KD,ADR,KPR,DPR,APR,FBPR,FDPR,HS,FBSR) VALUES ('Killjoy','34.27%',202132,0.91,197.4,1,134.3,0.69,0.69,0.18,0.08,0.09,'22%','48%');
INSERT INTO agents(agent,pick_rate,rounds,rating,ACS,KD,ADR,KPR,DPR,APR,FBPR,FDPR,HS,FBSR) VALUES ('Chamber','34.14%',203821,1.01,214.6,1.09,140.2,0.77,0.71,0.15,0.13,0.11,'25%','55%');
INSERT INTO agents(agent,pick_rate,rounds,rating,ACS,KD,ADR,KPR,DPR,APR,FBPR,FDPR,HS,FBSR) VALUES ('Skye','30.47%',180913,0.94,186.1,0.93,122.8,0.66,0.71,0.29,0.08,0.1,'26%','45%');
INSERT INTO agents(agent,pick_rate,rounds,rating,ACS,KD,ADR,KPR,DPR,APR,FBPR,FDPR,HS,FBSR) VALUES ('Sage','28.04%',165744,0.93,178.2,0.9,117.5,0.63,0.7,0.33,0.07,0.09,'25%','45%');
INSERT INTO agents(agent,pick_rate,rounds,rating,ACS,KD,ADR,KPR,DPR,APR,FBPR,FDPR,HS,FBSR) VALUES ('KAY/O','25.84%',153811,1.02,193.5,0.92,127.5,0.66,0.72,0.43,0.08,0.1,'23%','46%');
INSERT INTO agents(agent,pick_rate,rounds,rating,ACS,KD,ADR,KPR,DPR,APR,FBPR,FDPR,HS,FBSR) VALUES ('Raze','23.79%',141825,1.07,236.1,1.05,156.6,0.79,0.75,0.23,0.15,0.14,'18%','50%');
INSERT INTO agents(agent,pick_rate,rounds,rating,ACS,KD,ADR,KPR,DPR,APR,FBPR,FDPR,HS,FBSR) VALUES ('Breach','19.83%',118077,0.9,175,0.9,117.1,0.63,0.7,0.28,0.06,0.07,'25%','46%');
INSERT INTO agents(agent,pick_rate,rounds,rating,ACS,KD,ADR,KPR,DPR,APR,FBPR,FDPR,HS,FBSR) VALUES ('Cypher','15.63%',92554,0.9,187.6,0.96,124.8,0.67,0.7,0.19,0.08,0.09,'26%','47%');
INSERT INTO agents(agent,pick_rate,rounds,rating,ACS,KD,ADR,KPR,DPR,APR,FBPR,FDPR,HS,FBSR) VALUES ('Reyna','15.12%',88068,1.04,226.2,1.05,148.5,0.79,0.76,0.18,0.13,0.14,'26%','49%');
INSERT INTO agents(agent,pick_rate,rounds,rating,ACS,KD,ADR,KPR,DPR,APR,FBPR,FDPR,HS,FBSR) VALUES ('Omen','13.58%',80855,0.97,186.5,0.95,121.3,0.66,0.7,0.33,0.07,0.08,'25%','47%');
INSERT INTO agents(agent,pick_rate,rounds,rating,ACS,KD,ADR,KPR,DPR,APR,FBPR,FDPR,HS,FBSR) VALUES ('Brimstone','10.64%',63430,1.02,193.4,0.95,125.9,0.66,0.7,0.42,0.07,0.08,'24%','48%');
INSERT INTO agents(agent,pick_rate,rounds,rating,ACS,KD,ADR,KPR,DPR,APR,FBPR,FDPR,HS,FBSR) VALUES ('Neon','1.06%',6388,0.99,218.9,0.98,143.1,0.75,0.76,0.18,0.15,0.17,'22%','47%');
INSERT INTO agents(agent,pick_rate,rounds,rating,ACS,KD,ADR,KPR,DPR,APR,FBPR,FDPR,HS,FBSR) VALUES ('Phoenix','0.45%',2593,1.06,226.6,1.06,149.8,0.79,0.74,0.2,0.14,0.12,'27%','52%');
INSERT INTO agents(agent,pick_rate,rounds,rating,ACS,KD,ADR,KPR,DPR,APR,FBPR,FDPR,HS,FBSR) VALUES ('Yoru','0.34%',1978,0.92,201.4,0.94,131.6,0.7,0.75,0.17,0.12,0.12,'25%','51%');

INSERT INTO maps(map,played,avg_spike_plant,rounds,atk_win_rate,def_win_rate,pistol_atk_win_rate,pistol_def_win_rate,second_round_conversion_atk,second_round_conversion_def) VALUES ('Ascent','23.17%
3396 out of 14658','30m 54s',67676,'47.13%','52.87%','46.29%','53.71%','89.24%','87.28%');
INSERT INTO maps(map,played,avg_spike_plant,rounds,atk_win_rate,def_win_rate,pistol_atk_win_rate,pistol_def_win_rate,second_round_conversion_atk,second_round_conversion_def) VALUES ('Haven','19.53%
2862 out of 14658','30m 49s',57488,'51.48%','48.52%','51.38%','48.62%','90.62%','82.88%');
INSERT INTO maps(map,played,avg_spike_plant,rounds,atk_win_rate,def_win_rate,pistol_atk_win_rate,pistol_def_win_rate,second_round_conversion_atk,second_round_conversion_def) VALUES ('Icebox','17.60%
2580 out of 14658','30m 49s',52100,'51.71%','48.29%','47.71%','52.29%','90.68%','81.17%');
INSERT INTO maps(map,played,avg_spike_plant,rounds,atk_win_rate,def_win_rate,pistol_atk_win_rate,pistol_def_win_rate,second_round_conversion_atk,second_round_conversion_def) VALUES ('Bind','13.69%
2007 out of 14658','30m 53s',40600,'49.81%','50.19%','50.30%','49.70%','91.17%','84.83%');
INSERT INTO maps(map,played,avg_spike_plant,rounds,atk_win_rate,def_win_rate,pistol_atk_win_rate,pistol_def_win_rate,second_round_conversion_atk,second_round_conversion_def) VALUES ('Breeze','10.55%
1546 out of 14658','30m 46s',31298,'51.40%','48.60%','50.42%','49.58%','89.66%','82.76%');
INSERT INTO maps(map,played,avg_spike_plant,rounds,atk_win_rate,def_win_rate,pistol_atk_win_rate,pistol_def_win_rate,second_round_conversion_atk,second_round_conversion_def) VALUES ('Split','10.43%
1529 out of 14658','30m 58s',31143,'46.95%','53.02%','47.63%','52.37%','89.96%','88.06%');
INSERT INTO maps(map,played,avg_spike_plant,rounds,atk_win_rate,def_win_rate,pistol_atk_win_rate,pistol_def_win_rate,second_round_conversion_atk,second_round_conversion_def) VALUES ('Fracture','5.03%
738 out of 14658','30m 51s',15119,'49.41%','50.59%','49.18%','50.82%','88.92%','86.46%');

INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Ninjas in Pyjamas','br',39,22,'56.41%','396',219,'55.30%','424',217,'51.18%',78,46,'58.97%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('T1','us',69,47,'68.12%','687',366,'53.28%','727',419,'57.63%',138,74,'53.62%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('ZETA DIVISION','jp',29,23,'79.31%','270',170,'62.96%','300',168,'56%',58,33,'56.90%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Renegades','ca',71,44,'61.97%','762',412,'54.07%','697',390,'55.95%',142,76,'53.52%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Gen.G Esports','ca',47,30,'63.83%','487',266,'54.62%','487',280,'57.49%',94,55,'58.51%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('VALORANDO','de',27,17,'62.96%','230',117,'50.87%','281',164,'58.36%',54,25,'46.30%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('TSM FTX','us',70,51,'72.86%','689',402,'58.35%','709',434,'61.21%',138,83,'60.14%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Cloud9','us',39,27,'69.23%','425',221,'52%','375',246,'65.60%',78,42,'53.85%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Built By Gamers','us',59,39,'66.10%','606',328,'54.13%','623',361,'57.95%',118,64,'54.24%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Dignitas','us',39,22,'56.41%','421',222,'52.73%','356',181,'50.84%',78,45,'57.69%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('100 Thieves','us',31,18,'58.06%','326',171,'52.45%','306',170,'55.56%',62,34,'54.84%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Luminosity Gaming','us',58,32,'55.17%','573',295,'51.48%','637',344,'54%',116,66,'56.90%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('303 Esports','us',37,11,'29.73%','389',160,'41.13%','367',179,'48.77%',74,32,'43.24%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Crazy Raccoon','jp',28,18,'64.29%','249',150,'60.24%','301',172,'57.14%',56,33,'58.93%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Wave Esports','eu',44,30,'68.18%','428',222,'51.87%','482',304,'63.07%',88,50,'56.82%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('HEET','gb',30,21,'70%','284',156,'54.93%','314',184,'58.60%',60,35,'58.33%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('FaZe Clan','us',53,39,'73.58%','516',316,'61.24%','498',309,'62.05%',106,58,'54.72%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('9z Team','ar',27,16,'59.26%','253',137,'54.15%','297',157,'52.86%',54,28,'51.85%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Team BDS','fr',28,17,'60.71%','289',167,'57.79%','302',156,'51.66%',56,32,'57.14%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('G2 Esports','eu',49,36,'73.47%','505',266,'52.67%','492',308,'62.60%',98,51,'52.04%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Complexity','us',95,63,'66.32%','936',529,'56.52%','1,049',572,'54.53%',190,98,'51.58%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('FULL SENSE','th',60,47,'78.33%','603',357,'59.20%','620',375,'60.48%',120,78,'65%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Sharper Esport','th',34,19,'55.88%','331',154,'46.53%','356',185,'51.97%',68,33,'48.53%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Paper Rex','sg',29,26,'89.66%','297',206,'69.36%','304',170,'55.92%',58,38,'65.52%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('BIG','de',28,15,'53.57%','307',146,'47.56%','296',158,'53.38%',56,32,'57.14%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('BOOM Esports','id',42,30,'71.43%','437',245,'56.06%','475',258,'54.32%',84,42,'50%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('BBL Esports','tr',35,19,'54.29%','382',198,'51.83%','371',173,'46.63%',70,34,'48.57%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('One Breath Gaming','ru',32,18,'56.25%','353',194,'54.96%','313',152,'48.56%',64,31,'48.44%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Rise','ca',44,26,'59.09%','427',209,'48.95%','441',260,'58.96%',88,50,'56.82%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('XSET','us',52,38,'73.08%','534',295,'55.24%','502',309,'61.55%',104,56,'53.85%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('FunPlus Phoenix','cis',35,27,'77.14%','378',230,'60.85%','354',203,'57.34%',70,44,'62.86%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Moon Raccoons','us',73,46,'63.01%','803',450,'56.04%','678',355,'52.36%',144,67,'46.53%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Global Esports','in',51,34,'66.67%','483',277,'57.35%','551',328,'59.53%',102,60,'58.82%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('God Particles','in',75,43,'57.33%','820',417,'50.85%','722',377,'52.22%',150,79,'52.67%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Velocity Gaming','in',50,33,'66%','498',281,'56.43%','506',287,'56.72%',100,55,'55%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('B4 eSports','br',36,23,'63.89%','364',177,'48.63%','382',221,'57.85%',72,41,'56.94%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('E-Xolos LAZER','mx',33,25,'75.76%','305',183,'60%','332',206,'62.05%',66,42,'63.64%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Team Finest','il',74,46,'62.16%','759',401,'52.83%','815',452,'55.46%',148,76,'51.35%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Team Liquid BR','br',33,26,'78.79%','293',179,'61.09%','332',205,'61.75%',66,35,'53.03%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Cloud9 White','us',38,26,'68.42%','351',209,'59.54%','405',227,'56.05%',76,48,'63.16%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('DRX VS','kr',30,27,'90%','295',202,'68.47%','249',169,'67.87%',60,39,'65%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Exotic','us',36,19,'52.78%','383',170,'44.39%','384',226,'58.85%',72,38,'52.78%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('CERBERUS Esports','vn',38,22,'57.89%','363',183,'50.41%','381',211,'55.38%',76,41,'53.95%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Elysium','us',41,24,'58.54%','387',209,'54.01%','443',242,'54.63%',82,42,'51.22%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('NYFU','us',75,52,'69.33%','762',417,'54.72%','772',462,'59.84%',150,88,'58.67%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Exceeli Esports','bd',29,16,'55.17%','311',150,'48.23%','269',137,'50.93%',58,31,'53.45%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Zero Marksmen Black','us',118,78,'66.10%','1,213',663,'54.66%','1,256',747,'59.47%',236,129,'54.66%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('iPon Esports','hu',37,19,'51.35%','401',201,'50.12%','422',217,'51.42%',74,26,'35.14%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('NRG Esports','ca',59,42,'71.19%','578',305,'52.77%','617',373,'60.45%',118,68,'57.63%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Tales of Eastern','cn',34,19,'55.88%','365',178,'48.77%','357',187,'52.38%',68,34,'50%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('TYLOO','cn',26,7,'26.92%','270',120,'44.44%','274',105,'38.32%',52,21,'40.38%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('O2 Gaming','cn',28,13,'46.43%','287',139,'48.43%','319',160,'50.16%',56,34,'60.71%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Built By Gamers Academy','ca',75,47,'62.67%','771',399,'51.75%','779',436,'55.97%',150,85,'56.67%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('TENSTAR','gb',40,26,'65%','392',224,'57.14%','418',224,'53.59%',80,47,'58.75%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Futbolist','tr',57,35,'61.40%','579',335,'57.86%','588',312,'53.06%',114,60,'52.63%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Reckoning Esports','in',46,28,'60.87%','441',222,'50.34%','487',293,'60.16%',92,45,'48.91%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Galakticos','tr',45,18,'40%','451',193,'42.79%','454',235,'51.76%',86,33,'38.37%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('VIRTUOSO','ca',49,30,'61.22%','491',280,'57.03%','491',250,'50.92%',98,61,'62.24%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Zero Zone','tr',28,17,'60.71%','291',167,'57.39%','257',142,'55.25%',56,33,'58.93%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('PROJECTX','ca',28,24,'85.71%','294',174,'59.18%','290',173,'59.66%',56,32,'57.14%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Griffin Esports','hk',26,15,'57.69%','280',150,'53.57%','279',147,'52.69%',52,27,'51.92%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Oblivion Force','hk',26,16,'61.54%','304',151,'49.67%','284',149,'52.46%',52,26,'50%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Oasis Gaming','ph',28,19,'67.86%','289',159,'55.02%','274',141,'51.46%',54,26,'48.15%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('YaLLa Esports','ae',30,15,'50%','310',144,'46.45%','306',163,'53.27%',60,28,'46.67%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Onic Esports','id',39,25,'64.10%','414',221,'53.38%','435',241,'55.40%',78,50,'64.10%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('NASR Esports','jo',26,10,'38.46%','277',132,'47.65%','282',130,'46.10%',52,21,'40.38%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Team RA''AD','eg',36,29,'80.56%','347',213,'61.38%','355',220,'61.97%',72,48,'66.67%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('INGAMING Esports','br',28,17,'60.71%','296',173,'58.45%','321',153,'47.66%',56,28,'50%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Team Duelist','ae',33,20,'60.61%','353',184,'52.12%','342',180,'52.63%',66,34,'51.52%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Pittsburgh Knights','us',65,38,'58.46%','634',324,'51.10%','652',365,'55.98%',126,71,'56.35%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Archons','ca',37,14,'37.84%','382',178,'46.60%','385',175,'45.45%',74,30,'40.54%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Able Esports','ca',31,14,'45.16%','331',133,'40.18%','295',161,'54.58%',60,26,'43.33%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('BeÅŸiktaÅŸ Esports','tr',27,16,'59.26%','244',120,'49.18%','298',185,'62.08%',54,31,'57.41%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Mustang Gaming Club','ma',28,16,'57.14%','283',145,'51.24%','253',142,'56.13%',56,35,'62.50%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Team Majesty','tn',29,15,'51.72%','277',134,'48.38%','290',155,'53.45%',56,24,'42.86%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Team Aurora','tr',34,22,'64.71%','341',176,'51.61%','321',198,'61.68%',68,50,'73.53%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Kingsmen','my',26,13,'50%','281',141,'50.18%','257',126,'49.03%',52,24,'46.15%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Border Monsters','co',33,20,'60.61%','270',141,'52.22%','359',202,'56.27%',66,37,'56.06%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Akave Esports','mx',38,20,'52.63%','395',199,'50.38%','386',206,'53.37%',76,38,'50%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Teal Seam','ca',74,46,'62.16%','753',379,'50.33%','789',453,'57.41%',148,74,'50%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('YFP Gaming','ca',60,36,'60%','607',302,'49.75%','664',391,'58.89%',120,73,'60.83%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Ghost Gaming','ca',57,41,'71.93%','553',340,'61.48%','555',328,'59.10%',114,69,'60.53%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('EDward Gaming','cn',44,33,'75%','439',248,'56.49%','471',287,'60.93%',88,53,'60.23%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Illuzion Orange','ca',35,17,'48.57%','371',171,'46.09%','338',175,'51.78%',70,31,'44.29%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('KRÜ Esports','cl',29,19,'65.52%','278',138,'49.64%','302',192,'63.58%',58,33,'56.90%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Team Vitality','eu',30,12,'40%','301',145,'48.17%','331',172,'51.96%',60,29,'48.33%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('KPI Gaming','ru',26,13,'50%','265',137,'51.70%','286',160,'55.94%',52,28,'53.85%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('DWG KIA','kr',30,19,'63.33%','310',158,'50.97%','308',175,'56.82%',60,32,'53.33%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Team Weibo','cn',44,28,'63.64%','489',262,'53.58%','485',267,'55.05%',88,51,'57.95%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('OG Esports','eu',27,15,'55.56%','269',130,'48.33%','308',189,'61.36%',54,34,'62.96%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Skull Cracker','latam',45,30,'66.67%','453',256,'56.51%','470',257,'54.68%',90,48,'53.33%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Hyperspace Dark','ca',46,30,'65.22%','467',264,'56.53%','470',255,'54.26%',92,53,'57.61%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('FenerbahÃ§e Esports','tr',42,26,'61.90%','448',248,'55.36%','379',212,'55.94%',82,42,'51.22%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Version1','ca',57,43,'75.44%','561',332,'59.18%','587',365,'62.18%',114,64,'56.14%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('19esports','es',38,27,'71.05%','370',196,'52.97%','403',236,'58.56%',76,36,'47.37%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Gamelanders Purple','br',29,19,'65.52%','289',167,'57.79%','272',134,'49.26%',58,26,'44.83%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Evil Geniuses','us',51,30,'58.82%','513',263,'51.27%','557',302,'54.22%',100,52,'52%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Ethereal','id',32,18,'56.25%','348',191,'54.89%','338',174,'51.48%',64,34,'53.13%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Enigma Gaming','in',65,46,'70.77%','682',429,'62.90%','585',321,'54.87%',130,69,'53.08%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Alter Ego CelesteÌ€','id',35,30,'85.71%','319',201,'63.01%','377',239,'63.40%',70,50,'71.43%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('World Game Star','kr',30,17,'56.67%','301',148,'49.17%','339',173,'51.03%',60,25,'41.67%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Alliance','eu',44,30,'68.18%','441',263,'59.64%','459',256,'55.77%',88,47,'53.41%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Thunderbolts Gaming','tr',50,30,'60%','506',279,'55.14%','536',282,'52.61%',100,59,'59%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('EZ KATKA','ru',31,21,'67.74%','300',189,'63%','311',183,'58.84%',62,37,'59.68%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Valkyrie','ca',46,22,'47.83%','505',274,'54.26%','450',206,'45.78%',92,46,'50%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Angry Titans','eu',34,21,'61.76%','331',177,'53.47%','343',197,'57.43%',68,35,'51.47%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('MiTH','th',38,20,'52.63%','415',210,'50.60%','393',201,'51.15%',76,37,'48.68%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Reformed','ca',54,32,'59.26%','538',264,'49.07%','569',310,'54.48%',108,63,'58.33%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Soniqs','ca',44,30,'68.18%','487',253,'51.95%','400',241,'60.25%',86,50,'58.14%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('The Goose House','gb',32,23,'71.88%','338',195,'57.69%','327',195,'59.63%',64,40,'62.50%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Bigetron Arctic','id',35,23,'65.71%','357',200,'56.02%','324',188,'58.02%',70,38,'54.29%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Team Basilisk','us',96,57,'59.38%','959',501,'52.24%','1,012',578,'57.11%',192,104,'54.17%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Shopify Rebellion','us',60,35,'58.33%','600',320,'53.33%','608',331,'54.44%',120,61,'50.83%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Ovation eSports','de',34,20,'58.82%','320',173,'54.06%','374',195,'52.14%',68,34,'50%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Cosmic Divide','ca',99,59,'59.60%','990',488,'49.29%','1,084',600,'55.35%',198,105,'53.03%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Team T69','in',26,9,'34.62%','255',124,'48.63%','276',121,'43.84%',52,23,'44.23%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('EXCEL','eu',66,45,'68.18%','715',398,'55.66%','656',392,'59.76%',132,78,'59.09%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('ownage','pl',53,36,'67.92%','525',286,'54.48%','586',330,'56.31%',106,57,'53.77%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('LDN Utd','lt',36,25,'69.44%','345',203,'58.84%','388',209,'53.87%',72,39,'54.17%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('CLG Red','us',40,21,'52.50%','381',192,'50.39%','414',199,'48.07%',80,43,'53.75%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('TSM FTX X','ca',36,22,'61.11%','345',198,'57.39%','377',196,'51.99%',72,42,'58.33%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('afterMath Esports','ca',45,22,'48.89%','452',214,'47.35%','484',257,'53.10%',90,50,'55.56%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Team 1337','ca',47,25,'53.19%','503',278,'55.27%','475',218,'45.89%',94,55,'58.51%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Ryze Gaming','latam',33,17,'51.52%','350',180,'51.43%','326',162,'49.69%',66,36,'54.55%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('True Rippers','in',62,33,'53.23%','654',321,'49.08%','730',380,'52.05%',124,64,'51.61%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('SÃ³ deus Sabe','latam',28,17,'60.71%','271',147,'54.24%','285',174,'61.05%',56,28,'50%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Salt Esports','pk',27,14,'51.85%','260',147,'56.54%','272',131,'48.16%',54,29,'53.70%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('South Built Esports','ph',50,26,'52%','563',279,'49.56%','553',276,'49.91%',100,52,'52%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Alpha Esports Pro','ph',28,16,'57.14%','277',132,'47.65%','303',173,'57.10%',56,27,'48.21%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('SoaR','ca',72,43,'59.72%','676',395,'58.43%','749',415,'55.41%',144,78,'54.17%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Fancy United Esports','vn',52,36,'69.23%','508',298,'58.66%','487',265,'54.41%',98,53,'54.08%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Nightblood Gaming','ca',54,25,'46.30%','517',236,'45.65%','531',264,'49.72%',108,47,'43.52%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Third Impact','ca',38,21,'55.26%','390',196,'50.26%','407',236,'57.99%',76,49,'64.47%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Rix.GG Lightning','eu',31,19,'61.29%','296',177,'59.80%','343',179,'52.19%',62,38,'61.29%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('ValorsGG','ca',34,16,'47.06%','361',165,'45.71%','351',178,'50.71%',68,33,'48.53%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('B4 Angels','br',42,26,'61.90%','464',255,'54.96%','382',202,'52.88%',84,41,'48.81%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Vireo.pro','us',53,26,'49.06%','524',268,'51.15%','556',290,'52.16%',106,39,'36.79%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Aspyre Entertainment','ca',104,58,'55.77%','1,035',506,'48.89%','1,044',532,'50.96%',204,98,'48.04%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Gen.G Black','us',28,14,'50%','253',111,'43.87%','303',171,'56.44%',56,27,'48.21%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Taipan Esports','ca',30,7,'23.33%','300',121,'40.33%','292',127,'43.49%',58,23,'39.66%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Fire Flux Esports','tr',47,31,'65.96%','505',289,'57.23%','506',277,'54.74%',94,53,'56.38%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Team Valor','in',48,25,'52.08%','500',247,'49.40%','543',289,'53.22%',96,47,'48.96%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Team Exploit','pk',33,21,'63.64%','329',171,'51.98%','329',176,'53.50%',66,37,'56.06%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('CGN Esports','de',38,22,'57.89%','405',215,'53.09%','383',197,'51.44%',76,42,'55.26%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Anorthosis Famagusta Esports','gr',29,16,'55.17%','284',141,'49.65%','309',164,'53.07%',58,28,'48.28%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Surreal Esports','tr',72,50,'69.44%','796',449,'56.41%','768',427,'55.60%',144,87,'60.42%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('47 Gaming','th',33,20,'60.61%','370',199,'53.78%','348',197,'56.61%',66,38,'57.58%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('DarkZero Esports','ca',88,57,'64.77%','930',550,'59.14%','861',470,'54.59%',176,92,'52.27%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('SCYTES Esports','ae',33,13,'39.39%','340',146,'42.94%','358',187,'52.23%',66,30,'45.45%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Natus Vincere','ru',38,23,'60.53%','392',212,'54.08%','417',208,'49.88%',76,38,'50%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Gringo Team','tr',26,17,'65.38%','247',135,'54.66%','259',151,'58.30%',50,24,'48%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Synergy','ca',42,22,'52.38%','421',211,'50.12%','434',236,'54.38%',84,44,'52.38%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Renegados','br',28,15,'53.57%','299',153,'51.17%','317',177,'55.84%',56,32,'57.14%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Kansas City Pioneers','us',63,41,'65.08%','628',333,'53.03%','622',361,'58.04%',122,69,'56.56%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Anonymo Mentos','pl',69,43,'62.32%','724',384,'53.04%','716',407,'56.84%',138,74,'53.62%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Action PH','ph',70,39,'55.71%','742',374,'50.40%','735',401,'54.56%',140,78,'55.71%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('KONE','cn',40,26,'65%','418',247,'59.09%','431',230,'53.36%',80,45,'56.25%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Kowareta','ca',55,33,'60%','564',307,'54.43%','573',303,'52.88%',110,60,'54.55%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Team Mystic','ca',62,42,'67.74%','588',303,'51.53%','682',400,'58.65%',124,73,'58.87%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('UGK Esports','ca',30,8,'26.67%','306',118,'38.56%','308',128,'41.56%',60,24,'40%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('TSM FTX Academy','us',60,36,'60%','614',319,'51.95%','628',348,'55.41%',120,71,'59.17%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Vexed Gaming','gb',35,24,'68.57%','323',184,'56.97%','348',209,'60.06%',70,38,'54.29%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Rated Gaming','ca',66,27,'40.91%','692',338,'48.84%','690',321,'46.52%',132,68,'51.52%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('TENSTAR Nova','fr',39,34,'87.18%','441',299,'67.80%','321',199,'61.99%',78,53,'67.95%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('FS Esports','in',27,12,'44.44%','277',122,'44.04%','294',152,'51.70%',54,26,'48.15%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('BEAST','id',29,16,'55.17%','320',173,'54.06%','318',160,'50.31%',58,30,'51.72%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Green Beans','ca',32,16,'50%','342',168,'49.12%','321',173,'53.89%',64,37,'57.81%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Team Big BAAM','vn',40,26,'65%','373',222,'59.52%','401',224,'55.86%',80,45,'56.25%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('ZHUQUE','cn',45,25,'55.56%','486',242,'49.79%','481',266,'55.30%',90,40,'44.44%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Project A','us',28,17,'60.71%','269',143,'53.16%','299',163,'54.52%',56,29,'51.79%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Case Esports','es',40,29,'72.50%','399',231,'57.89%','413',247,'59.81%',80,49,'61.25%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('NOM eSports','eu',35,22,'62.86%','373',188,'50.40%','370',214,'57.84%',70,31,'44.29%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Geekay Esports','ae',30,16,'53.33%','293',160,'54.61%','299',152,'50.84%',60,30,'50%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('incognito','pl',39,24,'61.54%','403',217,'53.85%','400',236,'59%',78,43,'55.13%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Team Lixa','tr',43,24,'55.81%','439',242,'55.13%','452',237,'52.43%',86,44,'51.16%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Guild X','eu',39,27,'69.23%','385',231,'60%','427',237,'55.50%',78,44,'56.41%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Polaris','us',29,22,'75.86%','278',167,'60.07%','277',150,'54.15%',58,35,'60.34%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Complexity GX3','us',33,17,'51.52%','383',203,'53%','280',135,'48.21%',66,30,'45.45%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Supermassive Blaze Female','tr',26,18,'69.23%','268',161,'60.07%','262',149,'56.87%',52,30,'57.69%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('G2 Gozen','eu',32,26,'81.25%','329',214,'65.05%','323',179,'55.42%',64,42,'65.63%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('BBL Queens','tr',27,17,'62.96%','272',162,'59.56%','272',134,'49.26%',54,24,'44.44%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Bleed eSports','sg',33,19,'57.58%','343',188,'54.81%','344',174,'50.58%',64,35,'54.69%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Eternal Fire','tr',26,19,'73.08%','272',151,'55.51%','236',152,'64.41%',52,26,'50%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('UP NEXT','ca',35,13,'37.14%','376',181,'48.14%','348',160,'45.98%',68,23,'33.82%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Radiance','us',41,23,'56.10%','443',217,'48.98%','452',255,'56.42%',82,50,'60.98%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Ahjin','us',29,13,'44.83%','267',132,'49.44%','306',152,'49.67%',58,26,'44.83%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Akrew','us',64,42,'65.63%','588',323,'54.93%','668',410,'61.38%',128,70,'54.69%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Knights Academy','ca',127,83,'65.35%','1,202',671,'55.82%','1,386',763,'55.05%',254,139,'54.72%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('KOVA','fi',40,27,'67.50%','382',223,'58.38%','439',229,'52.16%',80,43,'53.75%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('WATAHA','pl',44,26,'59.09%','472',235,'49.79%','482',281,'58.30%',88,40,'45.45%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('IlluZion','ca',50,28,'56%','540',257,'47.59%','509',277,'54.42%',100,51,'51%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Team Reckaroo','us',87,50,'57.47%','866',441,'50.92%','905',496,'54.81%',174,92,'52.87%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Team Mystic Venus','ca',29,15,'51.72%','307',148,'48.21%','314',181,'57.64%',58,33,'56.90%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('One Percent','ca',29,13,'44.83%','308',149,'48.38%','318',143,'44.97%',58,25,'43.10%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('GunsForHire','ca',49,28,'57.14%','483',249,'51.55%','535',291,'54.39%',98,52,'53.06%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('KRÜ Fem','latam',31,28,'90.32%','252',180,'71.43%','288',203,'70.49%',62,44,'70.97%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('bait academy','us',75,49,'65.33%','720',403,'55.97%','819',470,'57.39%',150,83,'55.33%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('The Guard','us',66,50,'75.76%','643',364,'56.61%','689',416,'60.38%',132,83,'62.88%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Run it Down','ca',101,58,'57.43%','1,061',567,'53.44%','1,054',535,'50.76%',202,98,'48.51%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Rebels Gaming','eu',39,22,'56.41%','405',207,'51.11%','412',224,'54.37%',78,39,'50%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('AWARIA','pl',53,34,'64.15%','615',352,'57.24%','493',247,'50.10%',106,61,'57.55%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Tropinha do TIKTOK','br',31,22,'70.97%','326',169,'51.84%','329',195,'59.27%',62,38,'61.29%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Thanos Mug Academy','us',45,24,'53.33%','453',236,'52.10%','455',241,'52.97%',90,52,'57.78%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Tone Gaming','ca',36,20,'55.56%','363',182,'50.14%','402',205,'51%',72,35,'48.61%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('MLC Esports','ma',28,26,'92.86%','270',172,'63.70%','307',192,'62.54%',56,33,'58.93%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('AIMPUNCH.','us',38,19,'50%','382',192,'50.26%','367',185,'50.41%',74,35,'47.30%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Pampas','cl',34,27,'79.41%','325',213,'65.54%','331',203,'61.33%',68,38,'55.88%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Lenny Time','ca',76,40,'52.63%','735',377,'51.29%','771',389,'50.45%',150,72,'48%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Gamerland Outlaws','hu',30,15,'50%','320',159,'49.69%','312',171,'54.81%',60,35,'58.33%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('ex-Flickbaiters','us',37,26,'70.27%','387',211,'54.52%','392',228,'58.16%',74,44,'59.46%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Kennesaw State University','ca',34,17,'50%','366',172,'46.99%','369',199,'53.93%',68,32,'47.06%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Hugh Jass Construction','ca',26,9,'34.62%','295',137,'46.44%','286',128,'44.76%',52,23,'44.23%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('KPMOONIIBLM9','sg',32,16,'50%','305',157,'51.48%','299',164,'54.85%',62,35,'56.45%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Goat Crew','latam',33,21,'63.64%','367',169,'46.05%','309',194,'62.78%',66,41,'62.12%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Balkan Stars','mk',29,18,'62.07%','306',152,'49.67%','301',167,'55.48%',58,33,'56.90%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Zero Marksmen Silver','ca',76,40,'52.63%','811',415,'51.17%','754',374,'49.60%',152,70,'46.05%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Team NKT','th',36,21,'58.33%','366',200,'54.64%','392',199,'50.77%',72,37,'51.39%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('MAJTKOMAT','pl',26,18,'69.23%','280',161,'57.50%','248',138,'55.65%',52,33,'63.46%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Team Assent','ca',35,22,'62.86%','345',190,'55.07%','330',175,'53.03%',70,32,'45.71%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Fenix Gaming','vn',26,8,'30.77%','256',109,'42.58%','244',105,'43.03%',52,27,'51.92%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Take It Easy','vn',26,14,'53.85%','245',118,'48.16%','273',151,'55.31%',52,27,'51.92%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('On Sla2ers','kr',42,29,'69.05%','390',232,'59.49%','408',254,'62.25%',84,52,'61.90%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Zenigma Alpha','ca',60,31,'51.67%','589',284,'48.22%','623',332,'53.29%',116,56,'48.28%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Undead BK','ar',37,20,'54.05%','405',198,'48.89%','307',155,'50.49%',74,33,'44.59%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Valar Morghulis','fr',26,16,'61.54%','292',149,'51.03%','277',147,'53.07%',52,23,'44.23%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('H20','eu',30,12,'40%','332',152,'45.78%','316',144,'45.57%',60,21,'35%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Dsyre','eu',34,23,'67.65%','373',212,'56.84%','315',180,'57.14%',68,40,'58.82%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Orgless5','in',28,12,'42.86%','275',146,'53.09%','297',123,'41.41%',56,30,'53.57%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('FOKUS','eu',58,44,'75.86%','591',373,'63.11%','544',307,'56.43%',116,67,'57.76%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Bonkers','au',37,22,'59.46%','409',210,'51.34%','401',208,'51.87%',74,37,'50%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('eBRO GAMING','ar',28,14,'50%','301',148,'49.17%','270',130,'48.15%',56,30,'53.57%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('NAOS Esports','ph',44,28,'63.64%','457',234,'51.20%','501',274,'54.69%',88,37,'42.05%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Team Rocket','ca',46,27,'58.70%','490',259,'52.86%','499',269,'53.91%',92,53,'57.61%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Stasis','us',57,30,'52.63%','564',282,'50%','565',292,'51.68%',114,59,'51.75%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('goofy gremlins','ca',26,6,'23.08%','262',108,'41.22%','280',112,'40%',52,21,'40.38%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('FYL','ca',46,22,'47.83%','486',238,'48.97%','457',229,'50.11%',92,49,'53.26%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Vexo Esports','ca',41,21,'51.22%','435',187,'42.99%','413',229,'55.45%',82,39,'47.56%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Omnipotent Gaming','ca',33,14,'42.42%','329',157,'47.72%','305',135,'44.26%',62,33,'53.23%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('SHOWRUNNERS','ca',27,12,'44.44%','297',130,'43.77%','275',135,'49.09%',54,26,'48.15%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Hidden Fang','ca',41,23,'56.10%','432',241,'55.79%','389',171,'43.96%',82,38,'46.34%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Yasei','ca',50,18,'36%','529',264,'49.91%','487',217,'44.56%',100,47,'47%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Acacia Gaming','ca',27,8,'29.63%','271',121,'44.65%','249',98,'39.36%',54,19,'35.19%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Fusion','co',31,20,'64.52%','334',178,'53.29%','260',144,'55.38%',62,32,'51.61%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Balanced Esports','ca',50,24,'48%','505',243,'48.12%','498',251,'50.40%',100,45,'45%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Bomb Crypto','br',31,18,'58.06%','288',151,'52.43%','338',194,'57.40%',62,34,'54.84%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('3p eSports','br',27,15,'55.56%','291',137,'47.08%','271',154,'56.83%',54,25,'46.30%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('SG E-SPORTS','br',35,22,'62.86%','318',166,'52.20%','356',208,'58.43%',70,37,'52.86%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Lusa White','br',26,15,'57.69%','254',153,'60.24%','264',128,'48.48%',52,32,'61.54%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('mibr','br',31,20,'64.52%','331',186,'56.19%','299',168,'56.19%',62,40,'64.52%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Botafogo eSports','br',43,29,'67.44%','428',232,'54.21%','444',251,'56.53%',86,47,'54.65%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('LORDS OF HEIST','id',29,16,'55.17%','293',153,'52.22%','314',163,'51.91%',58,29,'50%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Team Joy','vn',29,12,'41.38%','269',127,'47.21%','266',127,'47.74%',56,21,'37.50%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Unbeaten Esports','vn',40,26,'65%','365',220,'60.27%','368',205,'55.71%',74,43,'58.11%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('SpaceWalkers','vn',30,17,'56.67%','261',139,'53.26%','284',155,'54.58%',54,35,'64.81%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Team OK','vn',33,14,'42.42%','330',168,'50.91%','338',168,'49.70%',64,35,'54.69%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Brave Wolves','vn',35,20,'57.14%','343',182,'53.06%','359',187,'52.09%',70,34,'48.57%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('who cars?','dk',40,20,'50%','441',214,'48.53%','401',211,'52.62%',80,37,'46.25%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('VeselieVintovki','ru',27,14,'51.85%','279',148,'53.05%','264',144,'54.55%',54,29,'53.70%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Dobeg','ru',31,20,'64.52%','313',167,'53.35%','343',176,'51.31%',62,37,'59.68%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('XERXIA','th',51,32,'62.75%','564',321,'56.91%','494',261,'52.83%',98,55,'56.12%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Attack All Around','th',29,12,'41.38%','297',142,'47.81%','282',146,'51.77%',58,33,'56.90%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Los Grandes','br',31,22,'70.97%','333',180,'54.05%','332',190,'57.23%',62,31,'50%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Galatasaray Espor','tr',35,15,'42.86%','366',182,'49.73%','391',181,'46.29%',70,31,'44.29%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Alliance Coven','eu',29,16,'55.17%','293',172,'58.70%','296',148,'50%',58,28,'48.28%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Vi4 Esports','mx',36,22,'61.11%','366',206,'56.28%','361',186,'51.52%',72,42,'58.33%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Free Fall','ca',37,13,'35.14%','391',158,'40.41%','355',169,'47.61%',74,32,'43.24%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Girl Kissers','ca',35,18,'51.43%','350',163,'46.57%','392',197,'50.26%',70,33,'47.14%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('UNtapped','eu',35,24,'68.57%','336',196,'58.33%','362',194,'53.59%',70,35,'50%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('vSlash Esports','ae',39,25,'64.10%','375',193,'51.47%','401',230,'57.36%',78,46,'58.97%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('01 Esports','sa',41,24,'58.54%','417',222,'53.24%','441',238,'53.97%',82,38,'46.34%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('redCore','kw',31,19,'61.29%','329',164,'49.85%','337',192,'56.97%',62,38,'61.29%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Monsters have hearts','dz',33,15,'45.45%','361',189,'52.35%','319',141,'44.20%',64,28,'43.75%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Sector One','fr',27,15,'55.56%','300',158,'52.67%','304',142,'46.71%',54,26,'48.15%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('GT3 RS','tn',36,12,'33.33%','344',150,'43.60%','372',141,'37.90%',72,32,'44.44%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('TropiCaos','br',35,23,'65.71%','370',192,'51.89%','380',202,'53.16%',70,41,'58.57%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Oxygen Esports Academy','us',47,31,'65.96%','462',249,'53.90%','482',265,'54.98%',94,56,'59.57%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('No Namers','sg',51,31,'60.78%','516',270,'52.33%','553',288,'52.08%',102,58,'56.86%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Pack a Punch','us',42,27,'64.29%','439',232,'52.85%','448',252,'56.25%',84,50,'59.52%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Team Falcons','sa',45,31,'68.89%','466',240,'51.50%','486',296,'60.91%',90,52,'57.78%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('HolyMolly','kr',44,25,'56.82%','435',223,'51.26%','423',220,'52.01%',88,50,'56.82%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Maru Gaming','kr',38,21,'55.26%','373',183,'49.06%','399',220,'55.14%',76,42,'55.26%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Desperado','kr',32,15,'46.88%','310',139,'44.84%','350',188,'53.71%',64,30,'46.88%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Team T5','kr',32,18,'56.25%','312',157,'50.32%','326',174,'53.37%',64,34,'53.13%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Omni Performance SD','ca',38,12,'31.58%','416',186,'44.71%','336',140,'41.67%',76,37,'48.68%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Mugi','ca',29,10,'34.48%','317',133,'41.96%','278',142,'51.08%',58,30,'51.72%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Zer0 Latency','ca',51,27,'52.94%','577',289,'50.09%','559',267,'47.76%',102,52,'50.98%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Omni Performance Gaming','ca',37,17,'45.95%','365',174,'47.67%','408',210,'51.47%',74,38,'51.35%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Valor Esports','us',31,18,'58.06%','323',173,'53.56%','348',174,'50%',62,31,'50%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Celestial Aim','ca',29,9,'31.03%','300',120,'40%','299',148,'49.50%',58,24,'41.38%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Godalions','ca',30,15,'50%','326',164,'50.31%','327',151,'46.18%',60,33,'55%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Digital','ca',31,16,'51.61%','321',166,'51.71%','332',166,'50%',60,20,'33.33%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Emergence','ca',29,4,'13.79%','258',97,'37.60%','269',107,'39.78%',52,28,'53.85%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('The 11','us',51,35,'68.63%','510',282,'55.29%','514',300,'58.37%',102,57,'55.88%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Chosen 1''s','ca',27,14,'51.85%','296',143,'48.31%','241',122,'50.62%',54,23,'42.59%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('OpTic Gaming','ca',32,20,'62.50%','327',177,'54.13%','325',174,'53.54%',64,40,'62.50%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Team Synergy','us',26,10,'38.46%','268',122,'45.52%','251',131,'52.19%',52,27,'51.92%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('XPLDZ Gaming','eg',41,23,'56.10%','447',227,'50.78%','411',212,'51.58%',82,47,'57.32%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Dart Monkeys','us',45,29,'64.44%','494',281,'56.88%','422',223,'52.84%',90,48,'53.33%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('TLP Red','us',45,27,'60%','467',251,'53.75%','480',238,'49.58%',88,47,'53.41%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Chapter 4','ca',33,16,'48.48%','363',185,'50.96%','325',166,'51.08%',66,33,'50%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Boba Boy','ca',29,19,'65.52%','300',152,'50.67%','296',166,'56.08%',58,32,'55.17%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Night Wings Gaming','cn',27,11,'40.74%','285',145,'50.88%','276',129,'46.74%',54,28,'51.85%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Mach5','ca',34,15,'44.12%','372',177,'47.58%','293',147,'50.17%',68,41,'60.29%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Final Form','ca',29,16,'55.17%','299',173,'57.86%','314',147,'46.82%',58,33,'56.90%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('X10 CRIT Female','th',33,24,'72.73%','301',188,'62.46%','346',187,'54.05%',66,39,'59.09%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Glueface','ca',30,17,'56.67%','300',152,'50.67%','280',149,'53.21%',60,32,'53.33%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Hike Digital Esports','id',26,14,'53.85%','268',135,'50.37%','281',139,'49.47%',52,23,'44.23%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Nearest Airport','us',31,25,'80.65%','327',184,'56.27%','330',210,'63.64%',62,43,'69.35%');
INSERT INTO teams(team,country,maps_played,maps_won,maps_won_perc,atk_played,atk_won,atk_won_perc,def_played,def_won,def_won_perc,pistol_played,pistol_won,pistol_won_perc) VALUES ('Immortals Female','us',27,17,'62.96%','280',162,'57.86%','297',167,'56.23%',54,30,'55.56%');


INSERT INTO players(player,country,team,rounds,rating,ACS,KD,ADR,KPR,DPR,APR,FBPR,FDPR,HS,FBSR) VALUES ('f0rsakeN','id','Paper Rex',600,1.33,280.1,1.35,178.8,0.97,0.72,0.2,0.24,0.15,'26%','62%');
INSERT INTO players(player,country,team,rounds,rating,ACS,KD,ADR,KPR,DPR,APR,FBPR,FDPR,HS,FBSR) VALUES ('Cryocells','us','XSET',1036,1.33,269.7,1.53,165.3,0.99,0.65,0.12,0.21,0.13,'26%','61%');
INSERT INTO players(player,country,team,rounds,rating,ACS,KD,ADR,KPR,DPR,APR,FBPR,FDPR,HS,FBSR) VALUES ('babybay','us','FaZe Clan',1014,1.32,277.4,1.51,179.1,0.96,0.63,0.21,0.23,0.15,'22%','59%');
INSERT INTO players(player,country,team,rounds,rating,ACS,KD,ADR,KPR,DPR,APR,FBPR,FDPR,HS,FBSR) VALUES ('leaf','us','Cloud9',800,1.29,263.1,1.29,168.5,0.92,0.71,0.24,0.19,0.15,'23%','56%');
INSERT INTO players(player,country,team,rounds,rating,ACS,KD,ADR,KPR,DPR,APR,FBPR,FDPR,HS,FBSR) VALUES ('Laz','jp','ZETA DIVISION',570,1.27,257.4,1.38,160.8,0.87,0.63,0.25,0.18,0.1,'25%','65%');


