-- Lab 4
-- cpark44
-- Oct 27, 2022

USE `STUDENTS`;
-- STUDENTS-1
-- Find all students who study in classroom 111. For each student list first and last name. Sort the output by the last name of the student.
select FirstName, LastName
from list 
where classroom = 111
order by LastName;


USE `STUDENTS`;
-- STUDENTS-2
-- For each classroom report the grade that is taught in it. Report just the classroom number and the grade number. Sort output by classroom in descending order.
select distinct classroom, grade
from list
order by classroom desc;


USE `STUDENTS`;
-- STUDENTS-3
-- Find all teachers who teach fifth grade. Report first and last name of the teachers and the room number. Sort the output by room number.
select distinct First, Last, teachers.classroom
from teachers
join list on teachers.classroom = list.classroom and list.grade = 5
order by teachers.classroom ;


USE `STUDENTS`;
-- STUDENTS-4
-- Find all students taught by OTHA MOYER. Output first and last names of students sorted in alphabetical order by their last name.
select FirstName, LastName
from list
natural join teachers
where First = "OTHA" and Last = "MOYER"
order by LastName;


USE `STUDENTS`;
-- STUDENTS-5
-- For each teacher teaching grades K through 3, report the grade (s)he teaches. Output teacher last name, first name, and grade. Each name has to be reported exactly once. Sort the output by grade and alphabetically by teacher’s last name for each grade.
select distinct Last, First, grade
from teachers 
join list on teachers.classroom = list.classroom
where grade <= 3
order by grade, Last;


USE `BAKERY`;
-- BAKERY-1
-- Find all chocolate-flavored items on the menu whose price is under $5.00. For each item output the flavor, the name (food type) of the item, and the price. Sort your output in descending order by price.
select Flavor, Food, Price
from goods
where Flavor = "chocolate" and price < 5
order by price desc;


USE `BAKERY`;
-- BAKERY-2
-- Report the prices of the following items (a) any cookie priced above $1.10, (b) any lemon-flavored items, or (c) any apple-flavored item except for the pie. Output the flavor, the name (food type) and the price of each pastry. Sort the output in alphabetical order by the flavor and then pastry name.
select Flavor, food, price
from goods
where (food = "cookie" and price > 1.1) or (flavor = "lemon") or (flavor = "apple " and food != "pie")
order by flavor, food;


USE `BAKERY`;
-- BAKERY-3
-- Find all customers who made a purchase on October 3, 2007. Report the name of the customer (last, first). Sort the output in alphabetical order by the customer’s last name. Each customer name must appear at most once.
select distinct LastName, Firstname
from customers 
join receipts on customers.cid = receipts.customer
where SaleDate = "2007-10-03"
order by LastName;


USE `BAKERY`;
-- BAKERY-4
-- Find all different cakes purchased on October 4, 2007. Each cake (flavor, food) is to be listed once. Sort output in alphabetical order by the cake flavor.
select distinct Flavor, Food
from goods 
join items on items.item = goods.gid
join receipts on items.receipt = receipts.RNumber
where Food = "cake" and SaleDate = "2007-10-4"
order by Flavor;


USE `BAKERY`;
-- BAKERY-5
-- List all pastries purchased by ARIANE CRUZEN on October 25, 2007. For each pastry, specify its flavor and type, as well as the price. Output the pastries in the order in which they appear on the receipt (each pastry needs to appear the number of times it was purchased).
select DISTINCT Flavor, Food, Price
from goods 
join items on items.Item = goods.GId
join receipts on receipts.RNumber = items.Receipt
join customers on receipts.customer = customers.CId
where LastName = "CRUZEN" and FirstName = "ARIANE" and SaleDate = "2007-10-25";


USE `BAKERY`;
-- BAKERY-6
-- Find all types of cookies purchased by KIP ARNN during the month of October of 2007. Report each cookie type (flavor, food type) exactly once in alphabetical order by flavor.

select Flavor, Food
from goods 
join items on items.item = goods.GId
join receipts on receipts.RNumber = items.Receipt
join customers on customers.CId = receipts.customer
where Food = "cookie" and FirstName = "KIP" and LastName = "ARNN" and SaleDate >= "2007-10-1" and SaleDate <= "2007-10-31"
order by Flavor;


USE `CSU`;
-- CSU-1
-- Report all campuses from Los Angeles county. Output the full name of campus in alphabetical order.
select campus
from campuses
where county = "Los Angeles"
order by campus;


USE `CSU`;
-- CSU-2
-- For each year between 1994 and 2000 (inclusive) report the number of students who graduated from California Maritime Academy Output the year and the number of degrees granted. Sort output by year.
select degrees.Year, Degrees
from degrees
join campuses on campuses.Id = degrees.CampusId
where campus = "California Maritime Academy" and degrees.Year <= 2000 and degrees.Year >= 1994
order by degrees.Year;


USE `CSU`;
-- CSU-3
-- Report undergraduate and graduate enrollments (as two numbers) in ’Mathematics’, ’Engineering’ and ’Computer and Info. Sciences’ disciplines for both Polytechnic universities of the CSU system in 2004. Output the name of the campus, the discipline and the number of graduate and the number of undergraduate students enrolled. Sort output by campus name, and by discipline for each campus.
select distinct campuses.campus, disciplines.name, Gr, Ug
from degrees
join campuses on campuses.id = degrees.CampusId
join discEnr on discEnr.CampusId = campuses.id
join disciplines on disciplines.Id = discEnr.Discipline
where (disciplines.Name = "Engineering" or disciplines.Name = "Mathematics" or disciplines.Name = "Computer and Info. Sciences") and campuses.campus like "%Polytechnic%"
order by campuses.campus, disciplines.Name;


USE `CSU`;
-- CSU-4
-- Report graduate enrollments in 2004 in ’Agriculture’ and ’Biological Sciences’ for any university that offers graduate studies in both disciplines. Report one line per university (with the two grad. enrollment numbers in separate columns), sort universities in descending order by the number of ’Agriculture’ graduate students.
select  distinct c1.campus, d1.Gr as Agriculture, d2.Gr as Biology
from disciplines as disc1 
join disciplines as disc2
join discEnr as d1 on d1.Discipline = disc1.Id
join discEnr as d2 on d2.Discipline = disc2.Id
join campuses as c1 on d1.CampusId = c1.Id
join campuses as c2 on d2.CampusId = c2.Id
where c1.campus = c2.campus 
and d1.year = 2004 
and d2.year = 2004 
and d1.Gr > 0
and d2.Gr > 0
and disc1.Name = "Agriculture"
and disc2.Name = "Biological Sciences"
order by d1.Gr desc;


USE `CSU`;
-- CSU-5
-- Find all disciplines and campuses where graduate enrollment in 2004 was at least three times higher than undergraduate enrollment. Report campus names, discipline names, and both enrollment counts. Sort output by campus name, then by discipline name in alphabetical order.
select campus, name, Ug, Gr
from disciplines
join discEnr on discipline = disciplines.Id
join campuses on CampusId = campuses.Id
where Gr / 3 > Ug and discEnr.year = 2004
order by campuses.campus, disciplines.name;


USE `CSU`;
-- CSU-6
-- Report the amount of money collected from student fees (use the full-time equivalent enrollment for computations) at ’Fresno State University’ for each year between 2002 and 2004 inclusively, and the amount of money (rounded to the nearest penny) collected from student fees per each full-time equivalent faculty. Output the year, the two computed numbers sorted chronologically by year.
select fees.year, (enrollments.FTE * fee) as COLLECTED, ROUND((enrollments.FTE * fee) / faculty.FTE, 2) as 'PER FACULTY'
from fees
join campuses on campuses.Id = fees.CampusId
join faculty on faculty.CampusId = campuses.Id and faculty.year = fees.year
join enrollments on enrollments.year = fees.year and enrollments.CampusId = campuses.Id
where fees.year <= 2004 and fees.year >= 2002 and campuses.campus = 'Fresno State University';


USE `CSU`;
-- CSU-7
-- Find all campuses where enrollment in 2003 (use the FTE numbers), was higher than the 2003 enrollment in ’San Jose State University’. Report the name of campus, the 2003 enrollment number, the number of faculty teaching that year, and the student-to-faculty ratio, rounded to one decimal place. Sort output in ascending order by student-to-faculty ratio.
select c2.campus, e2.FTE, faculty.FTE, Round(e2.FTE / faculty.FTE, 1) as RATIO
from campuses as c1
join campuses as c2
join enrollments as e1 on e1.CampusId = c1.Id
join enrollments as e2 on e2.CampusId = c2.Id
join faculty on faculty.CampusId = c2.Id
where e1.year = 2003 and e2.year = 2003 and faculty.year = 2003 and c1.campus = "San Jose State University" and c2.campus != "San Jose State University" and e1.FTE < e2.FTE
order by RATIO;


USE `INN`;
-- INN-1
-- Find all modern rooms with a base price below $160 and two beds. Report room code and full room name, in alphabetical order by the code.
select RoomCode, RoomName
from rooms
where decor = "modern" and baseprice < 160 and beds = 2
order by RoomCode;


USE `INN`;
-- INN-2
-- Find all July 2010 reservations (a.k.a., all reservations that both start AND end during July 2010) for the ’Convoke and sanguine’ room. For each reservation report the last name of the person who reserved it, checkin and checkout dates, the total number of people staying and the daily rate. Output reservations in chronological order.
select LastName, checkin, checkout, (Adults + Kids) as Guests, Rate
from reservations
join rooms on room = RoomCode
where roomName = "Convoke and sanguine" and checkin >= "2010-7-1" and checkout <= "2010-7-31"
order by checkin;


USE `INN`;
-- INN-3
-- Find all rooms occupied on February 6, 2010. Report full name of the room, the check-in and checkout dates of the reservation. Sort output in alphabetical order by room name.
select  distinct roomname, checkin, checkout
from rooms
join reservations on RoomCode = Room
where checkin <= "2010-2-6" and checkout > "2010-2-6"
order by roomName;


USE `INN`;
-- INN-4
-- For each stay by GRANT KNERIEN in the hotel, calculate the total amount of money, he paid. Report reservation code, room name (full), checkin and checkout dates, and the total stay cost. Sort output in chronological order by the day of arrival.

select code, roomname, checkin, checkout, (rate * DATEDIFF(checkout ,checkin)) as PAID
from rooms
join reservations on Room = RoomCode
where FirstName = "GRANT" and LastName  = "KNERIEN"
order by checkin;


USE `INN`;
-- INN-5
-- For each reservation that starts on December 31, 2010 report the room name, nightly rate, number of nights spent and the total amount of money paid. Sort output in descending order by the number of nights stayed.
select roomname, rate, (DATEDIFF(checkout, checkin)) as Nights, (DATEDIFF(checkout, checkin) * rate) as Money
from rooms
join reservations on Room = RoomCode
where checkin = "2010-12-31"
order by Nights desc;


USE `INN`;
-- INN-6
-- Report all reservations in rooms with double beds that contained four adults. For each reservation report its code, the room abbreviation, full name of the room, check-in and check out dates. Report reservations in chronological order, then sorted by the three-letter room code (in alphabetical order) for any reservations that began on the same day.
select code, room, roomname, checkin, checkout
from rooms
join reservations on RoomCode = room
where bedtype = "double" and Adults = 4
order by checkin,room;


USE `MARATHON`;
-- MARATHON-1
-- Report the overall place, running time, and pace of TEDDY BRASEL.
select place, runtime, pace
from marathon
where FirstName = "TEDDY" and LastName = "Brasel";


USE `MARATHON`;
-- MARATHON-2
-- Report names (first, last), overall place, running time, as well as place within gender-age group for all female runners from QUNICY, MA. Sort output by overall place in the race.
select FirstName, Lastname, place, runtime, groupplace
from marathon
where sex = "F" and town = "QUNICY" and state = "MA"
order by place;


USE `MARATHON`;
-- MARATHON-3
-- Find the results for all 34-year old female runners from Connecticut (CT). For each runner, output name (first, last), town and the running time. Sort by time.
select FirstName, LastName, town, runtime
from marathon
where sex = "F" and age = 34 and state = "CT"
order by runtime;


USE `MARATHON`;
-- MARATHON-4
-- Find all duplicate bibs in the race. Report just the bib numbers. Sort in ascending order of the bib number. Each duplicate bib number must be reported exactly once.
select distinct m1.bibnumber 
from marathon as m1
join marathon as m2
where m1.bibnumber = m2.bibnumber and m1.FirstName != m2.FirstName and m1.LastName != m2.LastName
order by m1.bibnumber;


USE `MARATHON`;
-- MARATHON-5
-- List all runners who took first place and second place in their respective age/gender groups. List gender, age group, name (first, last) and age for both the winner and the runner up (in a single row). Include only age/gender groups with both a first and second place runner. Order the output by gender, then by age group.
select first.sex, first.agegroup, first.firstname, first.lastname, first.age, second.firstname, second.lastname, second.age
from marathon as first
join marathon as second on (first.groupplace = 1 and second.groupplace = 2) and (first.agegroup = second.agegroup) and (first.sex = second.sex)
order by first.sex, first.agegroup;


USE `AIRLINES`;
-- AIRLINES-1
-- Find all airlines that have at least one flight out of AXX airport. Report the full name and the abbreviation of each airline. Report each name only once. Sort the airlines in alphabetical order.
select distinct name, abbr
from airlines
join flights on Airline = Id
where source = "AXX" or destination = "AXX"
order by name;


USE `AIRLINES`;
-- AIRLINES-2
-- Find all destinations served from the AXX airport by Northwest. Re- port flight number, airport code and the full name of the airport. Sort in ascending order by flight number.

select flightno, code, airports.name
from flights
join airlines on Airline = Id
join airports on destination = Code
where source = "AXX" and abbr = "Northwest"
order by flightno;


USE `AIRLINES`;
-- AIRLINES-3
-- Find all *other* destinations that are accessible from AXX on only Northwest flights with exactly one change-over. Report pairs of flight numbers, airport codes for the final destinations, and full names of the airports sorted in alphabetical order by the airport code.
select f1.flightno, f2.flightno, f2.Destination, airports.name as code
from airlines
join flights as f1 on f1.airline = Id
join flights as f2 on f2.airline = Id
join airports on f2.destination = airports.code
where abbr = "Northwest" and f1.source = "AXX" and f2.destination != "AXX" and f1.destination = f2.source
order by f2.destination;


USE `AIRLINES`;
-- AIRLINES-4
-- Report all pairs of airports served by both Frontier and JetBlue. Each airport pair must be reported exactly once (if a pair X,Y is reported, then a pair Y,X is redundant and should not be reported).
select distinct Frontier.Source, Frontier.Destination
from flights as Frontier
join flights as JetBlue
join airlines as a1 on a1.Id = Frontier.airline
join airlines as a2 on a2.Id = JetBlue.airline
where Frontier.source = JetBlue.source and Frontier.Destination = JetBlue.Destination and Frontier.source < Frontier.Destination
and a1.name = "Frontier Airlines"
and a2.name = "JetBlue Airways";


USE `AIRLINES`;
-- AIRLINES-5
-- Find all airports served by ALL five of the airlines listed below: Delta, Frontier, USAir, UAL and Southwest. Report just the airport codes, sorted in alphabetical order.
select distinct f1.source
from
airlines as a1
join airlines as a2
join airlines as a3
join airlines as a4
join airlines as a5
join flights as f1 on f1.airline = a1.Id
join flights as f2 on f2.airline = a2.Id
join flights as f3 on f3.airline = a3.Id
join flights as f4 on f4.airline = a4.Id
join flights as f5 on f5.airline = a5.Id

where 
f1.source = f2.source 
and f2.source = f3.source 
and f3.source = f4.source 
and f4.source = f5.source
and a1.name = "Delta Airlines"
and a2.name = "Frontier Airlines"
and a3.name = "US Airways"
and a4.name = "United Airlines"
and a5.name = "Southwest Airlines"
order by f1.source;


USE `AIRLINES`;
-- AIRLINES-6
-- Find all airports that are served by at least three Southwest flights. Report just the three-letter codes of the airports — each code exactly once, in alphabetical order.
select distinct f1.source
from airlines
join flights as f1 on f1.airline = Id 
join flights as f2 on f2.airline = Id 
join flights as f3 on f3.airline = Id 
where f1.source = f2.source and f1.source = f3.source and name = "Southwest Airlines"
and f1.Destination != f2.Destination
and f1.Destination != f3.Destination
and f2.Destination != f3.Destination
order by f1.source;


USE `KATZENJAMMER`;
-- KATZENJAMMER-1
-- Report, in order, the tracklist for ’Le Pop’. Output just the names of the songs in the order in which they occur on the album.
select Songs.Title
from Tracklists
join Albums on album = AId and Albums.Title = "Le Pop"
join Songs on SongId = Tracklists.Song;


USE `KATZENJAMMER`;
-- KATZENJAMMER-2
-- List the instruments each performer plays on ’Mother Superior’. Output the first name of each performer and the instrument, sort alphabetically by the first name.
select Band.FirstName, Instruments.Instrument
from Band
join Instruments on Bandmate = Id
join Songs on Song = SongId
where Title = "Mother Superior"
order by FirstName;


USE `KATZENJAMMER`;
-- KATZENJAMMER-3
-- List all instruments played by Anne-Marit at least once during the performances. Report the instruments in alphabetical order (each instrument needs to be reported exactly once).
select Distinct Instrument
from Performance
join Band on Bandmate = Id
join Instruments on Instruments.Bandmate = Id
where FirstName = "Anne-Marit"
order by Instrument;


USE `KATZENJAMMER`;
-- KATZENJAMMER-4
-- Find all songs that featured ukalele playing (by any of the performers). Report song titles in alphabetical order.
select Title
from Songs
join Instruments on Song = SongId
where Instrument = "ukalele"
order by Title;


USE `KATZENJAMMER`;
-- KATZENJAMMER-5
-- Find all instruments Turid ever played on the songs where she sang lead vocals. Report the names of instruments in alphabetical order (each instrument needs to be reported exactly once).
select Distinct Instrument
from Instruments
join Songs on SongId = Song
join Band on Bandmate = Id
join Vocals on Vocals.Song = Instruments.Song and Vocals.Bandmate = Id
where Firstname = "Turid" and VocalType = "Lead"
order by Instrument;


USE `KATZENJAMMER`;
-- KATZENJAMMER-6
-- Find all songs where the lead vocalist is not positioned center stage. For each song, report the name, the name of the lead vocalist (first name) and her position on the stage. Output results in alphabetical order by the song, then name of band member. (Note: if a song had more than one lead vocalist, you may see multiple rows returned for that song. This is the expected behavior).
select Title, Firstname, StagePosition
from Songs
join Performance on Song = SongId and StagePosition != "center"
join Band on Bandmate = Id
join Vocals on Vocals.Song = SongId and Vocals.Bandmate = Id and VocalType = "Lead"
order by Title,Firstname;


USE `KATZENJAMMER`;
-- KATZENJAMMER-7
-- Find a song on which Anne-Marit played three different instruments. Report the name of the song. (The name of the song shall be reported exactly once)
select Distinct Title
from Songs
join Instruments as t1 on t1.Song = SongId
join Instruments as t2 on t2.Song = SongId
join Instruments as t3 on t3.Song = SongId
join Band on t1.Bandmate = Id  and t2.Bandmate = Id and t3.Bandmate = Id and FirstName = "Anne-Marit"
where t1.instrument != t2.instrument and t1.instrument != t2.instrument and t2.instrument != t3.instrument;


USE `KATZENJAMMER`;
-- KATZENJAMMER-8
-- Report the positioning of the band during ’A Bar In Amsterdam’. (just one record needs to be returned with four columns (right, center, back, left) containing the first names of the performers who were staged at the specific positions during the song).
select b1.FirstName, b2.Firstname, b3.Firstname, b4.Firstname
from Songs
join Performance as p1 on p1.Song = SongId
join Performance as p2 on p2.Song = SongId
join Performance as p3 on p3.Song = SongId
join Performance as p4 on p4.Song = SongId
join Band as b1 on p1.Bandmate = b1.Id 
join Band as b2 on p2.Bandmate = b2.Id 
join Band as b3 on p3.Bandmate = b3.Id 
join Band as b4 on p4.Bandmate = b4.Id 
where Title = "A Bar In Amsterdam"
and p1.StagePosition = "right"
and p2.StagePosition = "center"
and p3.StagePosition = "back"
and p4.StagePosition = "left";


