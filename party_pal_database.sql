-- creates tables

CREATE DATABASE IF NOT EXISTS party_pal;
USE party_pal;

CREATE TABLE IF NOT EXISTS users (
	user_id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(50),
last_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS emails (
	email_id INT AUTO_INCREMENT PRIMARY KEY,
	user_id INT,
	email VARCHAR(50),
	FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS phones (
	phone_id INT AUTO_INCREMENT PRIMARY KEY,
	user_id INT,
	phone_number VARCHAR(50),
	FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS attendees (
	attendee_id INT AUTO_INCREMENT PRIMARY KEY,
	user_id INT,
	FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS organizers (
	organizer_id INT AUTO_INCREMENT PRIMARY KEY,
	user_id INT,
	FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS performers (
	performer_id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT,
	FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS sponsors (
sponsor_id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT,
	FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS events (
	event_id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS venues (
	venue_id INT AUTO_INCREMENT PRIMARY KEY,
	address VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS event_venues (
	event_venue_id INT AUTO_INCREMENT PRIMARY KEY,
	event_id INT,
FOREIGN KEY (event_id) REFERENCES events(event_id),
venue_id INT,
FOREIGN KEY (venue_id) REFERENCES venues(venue_id)
);

CREATE TABLE IF NOT EXISTS sessions (
	session_id INT AUTO_INCREMENT PRIMARY KEY,
	event_id INT,
	start_time DATETIME,
	end_time DATETIME, 
	FOREIGN KEY (event_id) REFERENCES events(event_id)
);

CREATE TABLE IF NOT EXISTS tickets (
	ticket_id INT AUTO_INCREMENT PRIMARY KEY,
attendee_id INT,
FOREIGN KEY (attendee_id) REFERENCES attendees(attendee_id),
session_id INT,
FOREIGN KEY (session_id) REFERENCES sessions(session_id),
	type VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS organizations (
	organization_id INT AUTO_INCREMENT PRIMARY KEY,
	organizer_id INT,
	FOREIGN KEY (organizer_id) REFERENCES organizers(organizer_id),
	event_venue_id INT,
	FOREIGN KEY (event_venue_id) REFERENCES event_venues(event_venue_id)
);

CREATE TABLE performances (
	performance_id INT AUTO_INCREMENT PRIMARY KEY,
	performer_id INT,
	FOREIGN KEY (performer_id) REFERENCES performers(performer_id),
	event_venue_id INT,
	FOREIGN KEY (event_venue_id) REFERENCES event_venues(event_venue_id)
);

CREATE TABLE sponsorships (
	sponsorship_id INT AUTO_INCREMENT PRIMARY KEY,
	sponsor_id INT,
	FOREIGN KEY (sponsor_id) REFERENCES sponsors(sponsor_id),
	event_venue_id INT,
	FOREIGN KEY (event_venue_id) REFERENCES event_venues(event_venue_id)
);



-- populating tables

-- Insert users
INSERT INTO users (first_name, last_name) VALUES 
-- Attendees (1–25)
('Alice', 'Johnson'),
('Bob', 'Smith'),
('Charlie', 'Brown'),
('Diana', 'Prince'),
('Eve', 'Adams'),
('Tom', 'Anderson'),
('Laura', 'Palmer'),
('Mike', 'Ross'),
('Rachel', 'Zane'),
('Harvey', 'Specter'),
('Louis', 'Litt'),
('Jessica', 'Pearson'),
('Katrina', 'Bennett'),
('Sheila', 'Sazs'),
('Brian', 'Altman'),
('Tony', 'Stark'),
('Bruce', 'Wayne'),
('Clark', 'Kent'),
('Lois', 'Lane'),
('Peter', 'Parker'),
('Mary', 'Jane'),
('Ned', 'Leeds'),
('Gwen', 'Stacy'),
('Miles', 'Morales'),
('May', 'Parker'),

-- Organizers (26–50)
('Olivia', 'Benson'),
('Elliot', 'Stabler'),
('Fin', 'Tutuola'),
('Amanda', 'Rollins'),
('Rafael', 'Barba'),
('Casey', 'Novak'),
('Alex', 'Cabot'),
('Donald', 'Cragen'),
('George', 'Huang'),
('Melinda', 'Warner'),
('John', 'Munch'),
('Nick', 'Amaro'),
('Carisi', 'Dominick'),
('Jocelyn', 'Carter'),
('Harold', 'Finch'),
('John', 'Reese'),
('Root', 'Samantha'),
('Sameen', 'Shaw'),
('Lionel', 'Fusco'),
('Grace', 'Hendricks'),
('Greer', 'Control'),
('Bear', 'Dog'),
('Logan', 'Pierce'),
('Carl', 'Elias'),
('Zoe', 'Morgan'),

-- Performers (51–75)
('David', 'Tennant'),
('Matt', 'Smith'),
('Jodie', 'Whittaker'),
('Peter', 'Capaldi'),
('Christopher', 'Eccleston'),
('Karen', 'Gillan'),
('Arthur', 'Darvill'),
('Billie', 'Piper'),
('Freema', 'Agyeman'),
('Catherine', 'Tate'),
('Alex', 'Kingston'),
('John', 'Barrowman'),
('Noel', 'Clarke'),
('Mickey', 'Smith'),
('Rory', 'Williams'),
('Clara', 'Oswald'),
('Amy', 'Pond'),
('River', 'Song'),
('Jack', 'Harkness'),
('Martha', 'Jones'),
('Donna', 'Noble'),
('Wilfred', 'Mott'),
('Rose', 'Tyler'),
('Osgood', 'Petronella'),
('The', 'Doctor'),

-- Sponsors (76–100)
('Elon', 'Musk'),
('Jeff', 'Bezos'),
('Warren', 'Buffett'),
('Mark', 'Zuckerberg'),
('Bill', 'Gates'),
('Tim', 'Cook'),
('Sundar', 'Pichai'),
('Satya', 'Nadella'),
('Susan', 'Wojcicki'),
('Sheryl', 'Sandberg'),
('Jack', 'Dorsey'),
('Larry', 'Page'),
('Sergey', 'Brin'),
('Marissa', 'Mayer'),
('Meg', 'Whitman'),
('Ginni', 'Rometty'),
('Anne', 'Mulcahy'),
('Ursula', 'Burns'),
('Indra', 'Nooyi'),
('Carly', 'Fiorina'),
('Howard', 'Schultz'),
('Fred', 'Smith'),
('Doug', 'McMillon'),
('Mary', 'Barra'),
('Darren', 'Woods');

-- Insert emails
INSERT INTO emails (user_id, email) VALUES 
(1, 'alice.johnson@example.com'),
(2, 'bob.smith@example.com'),
(3, 'charlie.brown@example.com'),
(4, 'diana.prince@example.com'),
(5, 'eve.adams@example.com'),
(6, 'tom.anderson@example.com'),
(7, 'laura.palmer@example.com'),
(8, 'mike.ross@example.com'),
(9, 'rachel.zane@example.com'),
(10, 'harvey.specter@example.com'),
(11, 'louis.litt@example.com'),
(12, 'jessica.pearson@example.com'),
(13, 'katrina.bennett@example.com'),
(14, 'sheila.sazs@example.com'),
(15, 'brian.altman@example.com'),
(16, 'tony.stark@example.com'),
(17, 'bruce.wayne@example.com'),
(18, 'clark.kent@example.com'),
(19, 'lois.lane@example.com'),
(20, 'peter.parker@example.com'),
(21, 'mary.jane@example.com'),
(22, 'ned.leeds@example.com'),
(23, 'gwen.stacy@example.com'),
(24, 'miles.morales@example.com'),
(25, 'may.parker@example.com'),

(26, 'olivia.benson@example.com'),
(27, 'elliot.stabler@example.com'),
(28, 'fin.tutuola@example.com'),
(29, 'amanda.rollins@example.com'),
(30, 'rafael.barba@example.com'),
(31, 'casey.novak@example.com'),
(32, 'alex.cabot@example.com'),
(33, 'donald.cragen@example.com'),
(34, 'george.huang@example.com'),
(35, 'melinda.warner@example.com'),
(36, 'john.munch@example.com'),
(37, 'nick.amaro@example.com'),
(38, 'carisi.dominick@example.com'),
(39, 'jocelyn.carter@example.com'),
(40, 'harold.finch@example.com'),
(41, 'john.reese@example.com'),
(42, 'root.samantha@example.com'),
(43, 'sameen.shaw@example.com'),
(44, 'lionel.fusco@example.com'),
(45, 'grace.hendricks@example.com'),
(46, 'greer.control@example.com'),
(47, 'bear.dog@example.com'),
(48, 'logan.pierce@example.com'),
(49, 'carl.elias@example.com'),
(50, 'zoe.morgan@example.com'),

(51, 'david.tennant@example.com'),
(52, 'matt.smith@example.com'),
(53, 'jodie.whittaker@example.com'),
(54, 'peter.capaldi@example.com'),
(55, 'christopher.eccleston@example.com'),
(56, 'karen.gillan@example.com'),
(57, 'arthur.darvill@example.com'),
(58, 'billie.piper@example.com'),
(59, 'freema.agyeman@example.com'),
(60, 'catherine.tate@example.com'),
(61, 'alex.kingston@example.com'),
(62, 'john.barrowman@example.com'),
(63, 'noel.clarke@example.com'),
(64, 'mickey.smith@example.com'),
(65, 'rory.williams@example.com'),
(66, 'clara.oswald@example.com'),
(67, 'amy.pond@example.com'),
(68, 'river.song@example.com'),
(69, 'jack.harkness@example.com'),
(70, 'martha.jones@example.com'),
(71, 'donna.noble@example.com'),
(72, 'wilfred.mott@example.com'),
(73, 'rose.tyler@example.com'),
(74, 'osgood.petronella@example.com'),
(75, 'the.doctor@example.com'),

(76, 'elon.musk@example.com'),
(77, 'jeff.bezos@example.com'),
(78, 'warren.buffett@example.com'),
(79, 'mark.zuckerberg@example.com'),
(80, 'bill.gates@example.com'),
(81, 'tim.cook@example.com'),
(82, 'sundar.pichai@example.com'),
(83, 'satya.nadella@example.com'),
(84, 'susan.wojcicki@example.com'),
(85, 'sheryl.sandberg@example.com'),
(86, 'jack.dorsey@example.com'),
(87, 'larry.page@example.com'),
(88, 'sergey.brin@example.com'),
(89, 'marissa.mayer@example.com'),
(90, 'meg.whitman@example.com'),
(91, 'ginni.rometty@example.com'),
(92, 'anne.mulcahy@example.com'),
(93, 'ursula.burns@example.com'),
(94, 'indra.nooyi@example.com'),
(95, 'carly.fiorina@example.com'),
(96, 'howard.schultz@example.com'),
(97, 'fred.smith@example.com'),
(98, 'doug.mcmillon@example.com'),
(99, 'mary.barra@example.com'),
(100, 'darren.woods@example.com');

-- Insert phone numbers
INSERT INTO phones (user_id, phone_number) VALUES
(1, '555-0001'),
(2, '555-0002'),
(3, '555-0003'),
(4, '555-0004'),
(5, '555-0005'),
(6, '555-0006'),
(7, '555-0007'),
(8, '555-0008'),
(9, '555-0009'),
(10, '555-0010'),
(11, '555-0011'),
(12, '555-0012'),
(13, '555-0013'),
(14, '555-0014'),
(15, '555-0015'),
(16, '555-0016'),
(17, '555-0017'),
(18, '555-0018'),
(19, '555-0019'),
(20, '555-0020'),
(21, '555-0021'),
(22, '555-0022'),
(23, '555-0023'),
(24, '555-0024'),
(25, '555-0025'),

(26, '555-0026'),
(27, '555-0027'),
(28, '555-0028'),
(29, '555-0029'),
(30, '555-0030'),
(31, '555-0031'),
(32, '555-0032'),
(33, '555-0033'),
(34, '555-0034'),
(35, '555-0035'),
(36, '555-0036'),
(37, '555-0037'),
(38, '555-0038'),
(39, '555-0039'),
(40, '555-0040'),
(41, '555-0041'),
(42, '555-0042'),
(43, '555-0043'),
(44, '555-0044'),
(45, '555-0045'),
(46, '555-0046'),
(47, '555-0047'),
(48, '555-0048'),
(49, '555-0049'),
(50, '555-0050'),

(51, '555-0051'),
(52, '555-0052'),
(53, '555-0053'),
(54, '555-0054'),
(55, '555-0055'),
(56, '555-0056'),
(57, '555-0057'),
(58, '555-0058'),
(59, '555-0059'),
(60, '555-0060'),
(61, '555-0061'),
(62, '555-0062'),
(63, '555-0063'),
(64, '555-0064'),
(65, '555-0065'),
(66, '555-0066'),
(67, '555-0067'),
(68, '555-0068'),
(69, '555-0069'),
(70, '555-0070'),
(71, '555-0071'),
(72, '555-0072'),
(73, '555-0073'),
(74, '555-0074'),
(75, '555-0075'),

(76, '555-0076'),
(77, '555-0077'),
(78, '555-0078'),
(79, '555-0079'),
(80, '555-0080'),
(81, '555-0081'),
(82, '555-0082'),
(83, '555-0083'),
(84, '555-0084'),
(85, '555-0085'),
(86, '555-0086'),
(87, '555-0087'),
(88, '555-0088'),
(89, '555-0089'),
(90, '555-0090'),
(91, '555-0091'),
(92, '555-0092'),
(93, '555-0093'),
(94, '555-0094'),
(95, '555-0095'),
(96, '555-0096'),
(97, '555-0097'),
(98, '555-0098'),
(99, '555-0099'),
(100, '555-0100');


-- Insert attendees (users 1–25)
INSERT INTO attendees (user_id) VALUES
(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),
(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),
(21),(22),(23),(24),(25);

-- Insert organizers (users 26–50)
INSERT INTO organizers (user_id) VALUES
(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),
(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),
(46),(47),(48),(49),(50);

-- Insert performers (users 51–75)
INSERT INTO performers (user_id) VALUES
(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),
(61),(62),(63),(64),(65),(66),(67),(68),(69),(70),
(71),(72),(73),(74),(75);

-- Insert sponsors (users 76–100)
INSERT INTO sponsors (user_id) VALUES
(76),(77),(78),(79),(80),(81),(82),(83),(84),(85),
(86),(87),(88),(89),(90),(91),(92),(93),(94),(95),
(96),(97),(98),(99),(100);

-- Insert events
INSERT INTO events (name) VALUES
('Tech Conference 2025'),
('Music Festival'),
('Charity Gala'),
('Startup Pitch Day'),
('Art Expo'),
('Film Premiere'),
('Gaming Convention'),
('Book Fair'),
('Food Carnival'),
('Wine Tasting'),
('Auto Show'),
('Science Symposium'),
('AI Hackathon'),
('Health Summit'),
('Fashion Week'),
('Dance Marathon'),
('Pet Adoption Fair'),
('Career Expo'),
('Education Forum'),
('Robotics Challenge'),
('Beach Cleanup Drive'),
('Climate Action Summit'),
('Investor Meetup'),
('Cultural Night'),
('Space Exploration Talk');

-- Insert venues
INSERT INTO venues (address) VALUES
('123 Main St, New York, NY'),
('456 Elm St, San Francisco, CA'),
('789 Maple Ave, Chicago, IL'),
('101 First Ave, Austin, TX'),
('202 Second St, Boston, MA'),
('303 Third Blvd, Miami, FL'),
('404 Fourth Dr, Seattle, WA'),
('505 Fifth Ln, Denver, CO'),
('606 Sixth Ct, Portland, OR'),
('707 Seventh Pl, Atlanta, GA'),
('808 Eighth Rd, Phoenix, AZ'),
('909 Ninth Ave, Las Vegas, NV'),
('111 Tenth St, Detroit, MI'),
('222 Eleventh Ave, Minneapolis, MN'),
('333 Twelfth St, Kansas City, MO'),
('444 Thirteenth Dr, Orlando, FL'),
('555 Fourteenth Blvd, Dallas, TX'),
('666 Fifteenth Rd, San Diego, CA'),
('777 Sixteenth Ln, Raleigh, NC'),
('888 Seventeenth Pl, Nashville, TN'),
('999 Eighteenth Ave, Columbus, OH'),
('1010 Nineteenth St, Charlotte, NC'),
('1111 Twentieth Ct, Indianapolis, IN'),
('1212 TwentyFirst Blvd, Salt Lake City, UT'),
('1313 TwentySecond Ave, Milwaukee, WI');

-- Insert event_venues (1–25)
INSERT INTO event_venues (event_id, venue_id) VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),
(6,6),(7,7),(8,8),(9,9),(10,10),
(11,11),(12,12),(13,13),(14,14),(15,15),
(16,16),(17,17),(18,18),(19,19),(20,20),
(21,21),(22,22),(23,23),(24,24),(25,25);

-- Insert sessions (25 events, 1 session each for simplicity)
INSERT INTO sessions (event_id, start_time, end_time) VALUES
(1, '2025-06-01 10:00:00', '2025-06-01 12:00:00'),
(2, '2025-06-01 13:00:00', '2025-06-01 15:00:00'),
(3, '2025-07-10 18:00:00', '2025-07-10 21:00:00'),
(4, '2025-08-15 19:00:00', '2025-08-15 23:00:00'),
(5, '2025-09-01 09:00:00', '2025-09-01 12:00:00'),
(6, '2025-09-01 13:00:00', '2025-09-01 16:00:00'),
(7, '2025-09-02 10:00:00', '2025-09-02 12:00:00'),
(8, '2025-09-03 10:00:00', '2025-09-03 12:00:00'),
(9, '2025-09-04 10:00:00', '2025-09-04 12:00:00'),
(10, '2025-09-05 10:00:00', '2025-09-05 12:00:00'),
(11, '2025-06-02 10:00:00', '2025-06-02 12:00:00'),
(12, '2025-06-02 13:00:00', '2025-06-02 15:00:00'),
(13, '2025-06-03 10:00:00', '2025-06-03 12:00:00'),
(14, '2025-06-03 13:00:00', '2025-06-03 15:00:00'),
(15, '2025-07-11 10:00:00', '2025-07-11 12:00:00'),
(16, '2025-07-11 13:00:00', '2025-07-11 15:00:00'),
(17, '2025-07-12 18:00:00', '2025-07-12 21:00:00'),
(18, '2025-07-13 18:00:00', '2025-07-13 21:00:00'),
(19, '2025-08-16 10:00:00', '2025-08-16 12:00:00'),
(20, '2025-08-16 13:00:00', '2025-08-16 15:00:00'),
(21, '2025-08-17 19:00:00', '2025-08-17 23:00:00'),
(22, '2025-08-18 19:00:00', '2025-08-18 23:00:00'),
(23, '2025-06-04 09:00:00', '2025-06-04 11:00:00'),
(24, '2025-06-04 11:30:00', '2025-06-04 13:30:00'),
(25, '2025-06-04 14:00:00', '2025-06-04 16:00:00');

-- Insert tickets (25 attendees × 1 session each)
INSERT INTO tickets (attendee_id, session_id, type) VALUES
(1,1,'VIP'),
(2,2,'General'),
(3,3,'General'),
(4,4,'VIP'),
(5,5,'General'),
(6,6,'VIP'),
(7,7,'General'),
(8,8,'VIP'),
(9,9,'General'),
(10,10,'VIP'),
(11,11,'General'),
(12,12,'General'),
(13,13,'VIP'),
(14,14,'General'),
(15,15,'General'),
(16,16,'VIP'),
(17,17,'VIP'),
(18,18,'General'),
(19,19,'VIP'),
(20,20,'General'),
(21,21,'VIP'),
(22,22,'General'),
(23,23,'VIP'),
(24,24,'General'),
(25,25,'VIP');

-- Insert organizations (organizer_id 1–25 to event_venues 1–25)
INSERT INTO organizations (organizer_id, event_venue_id) VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),
(6,6),(7,7),(8,8),(9,9),(10,10),
(11,11),(12,12),(13,13),(14,14),(15,15),
(16,16),(17,17),(18,18),(19,19),(20,20),
(21,21),(22,22),(23,23),(24,24),(25,25);

-- Insert performances (performer_id 1–25 to event_venues 1–25)
INSERT INTO performances (performer_id, event_venue_id) VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),
(6,6),(7,7),(8,8),(9,9),(10,10),
(11,11),(12,12),(13,13),(14,14),(15,15),
(16,16),(17,17),(18,18),(19,19),(20,20),
(21,21),(22,22),(23,23),(24,24),(25,25);

-- Insert sponsorships (sponsor_id 1–25 to event_venues 1–25)
INSERT INTO sponsorships (sponsor_id, event_venue_id) VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),
(6,6),(7,7),(8,8),(9,9),(10,10),
(11,11),(12,12),(13,13),(14,14),(15,15),
(16,16),(17,17),(18,18),(19,19),(20,20),
(21,21),(22,22),(23,23),(24,24),(25,25);
