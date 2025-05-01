/*****************************
CREATES SCHEMA 
*****************************/

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

/*****************************
DATA POPULATION 
*****************************/

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
('Darren', 'Woods'),

-- More Attendees (101-175)
('Isla', 'Mitchell'),
('Liam', 'Douglas'),
('Nina', 'Reyes'),
('Owen', 'Spencer'),
('Paige', 'Harrington'),
('Quinn', 'Barnes'),
('Riley', 'Foster'),
('Sophie', 'Hayes'),
('Tyler', 'Murphy'),
('Uma', 'Kennedy'),
('Victor', 'Diaz'),
('Willow', 'Romero'),
('Xander', 'Lawson'),
('Yara', 'Blake'),
('Zane', 'Wheeler'),
('Ariana', 'Huff'),
('Bryce', 'Griffin'),
('Camila', 'Nash'),
('Derek', 'Fleming'),
('Emilia', 'Bennett'),
('Finn', 'Chavez'),
('Gia', 'Holloway'),
('Hugo', 'Walters'),
('Ivy', 'Reed'),
('Jake', 'Harrington'),
('Kara', 'Stevens'),
('Leo', 'Marquez'),
('Maya', 'Schmidt'),
('Noah', 'Klein'),
('Olivia', 'Jennings'),
('Parker', 'Bishop'),
('Quincy', 'Cohen'),
('Rose', 'Fitzgerald'),
('Sean', 'Moore'),
('Tessa', 'Vaughn'),
('Ulysses', 'Ray'),
('Vera', 'Salazar'),
('Wyatt', 'Boone'),
('Ximena', 'Drake'),
('Yusuf', 'Conrad'),
('Zoe', 'Barron'),
('Adrian', 'Lowell'),
('Bianca', 'Everett'),
('Carlos', 'Chan'),
('Delilah', 'Park'),
('Elliot', 'Randall'),
('Freya', 'Carson'),
('Gavin', 'Rios'),
('Helena', 'Sharp'),
('Ian', 'Goodwin'),
('Jade', 'Cross'),
('Keith', 'Sawyer'),
('Lila', 'Bryant'),
('Miles', 'Delgado'),
('Nora', 'Sutton'),
('Oscar', 'Perkins'),
('Penny', 'Manning'),
('Reid', 'Thorpe'),
('Sasha', 'Wyatt'),
('Theo', 'Barrett'),
('Una', 'Stanton'),
('Vince', 'Greer'),
('Wendy', 'Baxter'),
('Xavier', 'Doyle'),
('Yasmine', 'Kent'),
('Zion', 'McNeil'),
('Alina', 'Morris'),
('Beau', 'Lambert'),
('Celeste', 'Hahn'),
('Dante', 'Glass'),
('Elsie', 'Baird'),
('Felix', 'Rosales'),
('Gemma', 'Strickland'),
('Harvey', 'Tran'),
('Iris', 'McKay'),
('Jasper', 'Nguyen'),
('Kinsley', 'Beach'),
('Lorenzo', 'Hines'),
('Millie', 'Booth'),
('Nikolai', 'Valdez'),
('Opal', 'Pitts'),
('Preston', 'Noble'),
('Raya', 'Sears'),
('Sterling', 'Grimes'),
('Talia', 'Poole'),
('Uriel', 'Franco'),
('Vivian', 'Randolph'),
('Wes', 'Huber'),
('Yvette', 'Calhoun'),
('Zack', 'Barrera');

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
(100, 'darren.woods@example.com'),

(101, 'isla.mitchell@example.com'),
(102, 'liam.douglas@example.com'),
(103, 'nina.reyes@example.com'),
(104, 'owen.spencer@example.com'),
(105, 'paige.harrington@example.com'),
(106, 'quinn.barnes@example.com'),
(107, 'riley.foster@example.com'),
(108, 'sophie.hayes@example.com'),
(109, 'tyler.murphy@example.com'),
(110, 'uma.kennedy@example.com'),
(111, 'victor.diaz@example.com'),
(112, 'willow.romero@example.com'),
(113, 'xander.lawson@example.com'),
(114, 'yara.blake@example.com'),
(115, 'zane.wheeler@example.com'),
(116, 'ariana.huff@example.com'),
(117, 'bryce.griffin@example.com'),
(118, 'camila.nash@example.com'),
(119, 'derek.fleming@example.com'),
(120, 'emilia.bennett@example.com'),
(121, 'finn.chavez@example.com'),
(122, 'gia.holloway@example.com'),
(123, 'hugo.walters@example.com'),
(124, 'ivy.reed@example.com'),
(125, 'jake.harrington@example.com'),
(126, 'kara.stevens@example.com'),
(127, 'leo.marquez@example.com'),
(128, 'maya.schmidt@example.com'),
(129, 'noah.klein@example.com'),
(130, 'olivia.jennings@example.com'),
(131, 'parker.bishop@example.com'),
(132, 'quincy.cohen@example.com'),
(133, 'rose.fitzgerald@example.com'),
(134, 'sean.moore@example.com'),
(135, 'tessa.vaughn@example.com'),
(136, 'ulysses.ray@example.com'),
(137, 'vera.salazar@example.com'),
(138, 'wyatt.boone@example.com'),
(139, 'ximena.drake@example.com'),
(140, 'yusuf.conrad@example.com'),
(141, 'zoe.barron@example.com'),
(142, 'adrian.lowell@example.com'),
(143, 'bianca.everett@example.com'),
(144, 'carlos.chan@example.com'),
(145, 'delilah.park@example.com'),
(146, 'elliot.randall@example.com'),
(147, 'freya.carson@example.com'),
(148, 'gavin.rios@example.com'),
(149, 'helena.sharp@example.com'),
(150, 'ian.goodwin@example.com'),
(151, 'jade.cross@example.com'),
(152, 'keith.sawyer@example.com'),
(153, 'lila.bryant@example.com'),
(154, 'miles.delgado@example.com'),
(155, 'nora.sutton@example.com'),
(156, 'oscar.perkins@example.com'),
(157, 'penny.manning@example.com'),
(158, 'reid.thorpe@example.com'),
(159, 'sasha.wyatt@example.com'),
(160, 'theo.barrett@example.com'),
(161, 'una.stanton@example.com'),
(162, 'vince.greer@example.com'),
(163, 'wendy.baxter@example.com'),
(164, 'xavier.doyle@example.com'),
(165, 'yasmine.kent@example.com'),
(166, 'zion.mcneil@example.com'),
(167, 'alina.morris@example.com'),
(168, 'beau.lambert@example.com'),
(169, 'celeste.hahn@example.com'),
(170, 'dante.glass@example.com'),
(171, 'elsie.baird@example.com'),
(172, 'felix.rosales@example.com'),
(173, 'gemma.strickland@example.com'),
(174, 'harvey.tran@example.com'),
(175, 'iris.mckay@example.com');

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
(100, '555-0100'),

(101, '900-000-0101'),
(102, '900-000-0102'),
(103, '900-000-0103'),
(104, '900-000-0104'),
(105, '900-000-0105'),
(106, '900-000-0106'),
(107, '900-000-0107'),
(108, '900-000-0108'),
(109, '900-000-0109'),
(110, '900-000-0110'),
(111, '900-000-0111'),
(112, '900-000-0112'),
(113, '900-000-0113'),
(114, '900-000-0114'),
(115, '900-000-0115'),
(116, '900-000-0116'),
(117, '900-000-0117'),
(118, '900-000-0118'),
(119, '900-000-0119'),
(120, '900-000-0120'),
(121, '900-000-0121'),
(122, '900-000-0122'),
(123, '900-000-0123'),
(124, '900-000-0124'),
(125, '900-000-0125'),
(126, '900-000-0126'),
(127, '900-000-0127'),
(128, '900-000-0128'),
(129, '900-000-0129'),
(130, '900-000-0130'),
(131, '900-000-0131'),
(132, '900-000-0132'),
(133, '900-000-0133'),
(134, '900-000-0134'),
(135, '900-000-0135'),
(136, '900-000-0136'),
(137, '900-000-0137'),
(138, '900-000-0138'),
(139, '900-000-0139'),
(140, '900-000-0140'),
(141, '900-000-0141'),
(142, '900-000-0142'),
(143, '900-000-0143'),
(144, '900-000-0144'),
(145, '900-000-0145'),
(146, '900-000-0146'),
(147, '900-000-0147'),
(148, '900-000-0148'),
(149, '900-000-0149'),
(150, '900-000-0150'),
(151, '900-000-0151'),
(152, '900-000-0152'),
(153, '900-000-0153'),
(154, '900-000-0154'),
(155, '900-000-0155'),
(156, '900-000-0156'),
(157, '900-000-0157'),
(158, '900-000-0158'),
(159, '900-000-0159'),
(160, '900-000-0160'),
(161, '900-000-0161'),
(162, '900-000-0162'),
(163, '900-000-0163'),
(164, '900-000-0164'),
(165, '900-000-0165'),
(166, '900-000-0166'),
(167, '900-000-0167'),
(168, '900-000-0168'),
(169, '900-000-0169'),
(170, '900-000-0170'),
(171, '900-000-0171'),
(172, '900-000-0172'),
(173, '900-000-0173'),
(174, '900-000-0174'),
(175, '900-000-0175');


-- Insert attendees (users 1–25)
INSERT INTO attendees (user_id) VALUES
(1),(2),(3),(4),(5),
(6),(7),(8),(9),(10),
(11),(12),(13),(14),(15),
(16),(17),(18),(19),(20),
(21),(22),(23),(24),(25),
(101),(102),(103),(104),(105),
(106),(107),(108),(109),(110),
(111),(112),(113),(114),(115),
(116),(117),(118),(119),(120),
(121),(122),(123),(124),(125),
(126),(127),(128),(129),(130),
(131),(132),(133),(134),(135),
(136),(137),(138),(139),(140),
(141),(142),(143),(144),(145),
(146),(147),(148),(149),(150),
(151),(152),(153),(154),(155),
(156),(157),(158),(159),(160),
(161),(162),(163),(164),(165),
(166),(167),(168),(169),(170),
(171),(172),(173),(174),(175);

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
(25,25,'VIP'),
(26, 17, 'VIP'),
(27, 23, 'General'),
(28, 24, 'VIP'),
(29, 25, 'General'),
(30, 26, 'General'),
(31, 17, 'VIP'),
(32, 18, 'General'),
(33, 19, 'VIP'),
(34, 10, 'General'),
(35, 6, 'General'),
(36, 7, 'VIP'),
(37, 8, 'General'),
(38, 9, 'VIP'),
(39, 10, 'General'),
(40, 11, 'VIP'),
(41, 12, 'General'),
(42, 13, 'VIP'),
(43, 14, 'General'),
(44, 15, 'VIP'),
(45, 16, 'General'),
(46, 17, 'VIP'),
(47, 18, 'General'),
(48, 19, 'VIP'),
(49, 20, 'General'),
(50, 21, 'VIP'),
(51, 22, 'General'),
(52, 23, 'VIP'),
(53, 24, 'General'),
(54, 25, 'VIP'),
(55, 16, 'General'),
(56, 17, 'VIP'),
(57, 18, 'General'),
(58, 19, 'VIP'),
(59, 20, 'General'),
(60, 1, 'VIP'),
(61, 2, 'General'),
(62, 3, 'VIP'),
(63, 4, 'General'),
(64, 5, 'VIP'),
(65, 6, 'General'),
(66, 7, 'VIP'),
(67, 8, 'General'),
(68, 9, 'VIP'),
(69, 10, 'General'),
(70, 11, 'VIP'),
(71, 12, 'General'),
(72, 13, 'VIP'),
(73, 14, 'General'),
(74, 15, 'VIP'),
(75, 16, 'General'),
(76, 17, 'VIP'),
(77, 18, 'General'),
(78, 19, 'VIP'),
(79, 20, 'General'),
(80, 21, 'VIP'),
(81, 22, 'General'),
(82, 23, 'VIP'),
(83, 24, 'General'),
(84, 25, 'VIP'),
(85, 16, 'General'),
(86, 17, 'VIP'),
(87, 18, 'General'),
(88, 19, 'VIP'),
(89, 20, 'General'),
(90, 1, 'VIP'),
(91, 2, 'General'),
(92, 3, 'VIP'),
(93, 4, 'General'),
(94, 5, 'VIP'),
(95, 6, 'General'),
(96, 7, 'VIP'),
(97, 8, 'General'),
(98, 9, 'VIP'),
(99, 10, 'General'),
(100, 11, 'VIP');

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

/*****************************
QUERIES AND AUTOMATION
*****************************/

-- A report query using a JOIN to report on an aggregate value with a GROUP BY clause:
/* This query reports on the number of tickets sold per event. It joins the Events, Tickets, and Sessions tables, 
groups by the Event ID and name, then orders them from highest to lowest. */
SELECT e.name AS event_name, COUNT(t.ticket_id) AS tickets_sold
FROM tickets t
JOIN sessions s ON t.session_id = s.session_id
JOIN events e ON s.event_id = e.event_id
GROUP BY e.event_id, e.name
ORDER BY tickets_sold DESC;

-- A query with a subquery:
/* This query retrieves event names that have not sold any tickets. The subquery finds events with at least one ticket sold by joining 
the Sessions and Tickets tables, and then the outer query filters out those events, and returns the ones with no ticket sales.
It returns nothing if all events have sold tickets. */
SELECT e.name AS event_name
FROM events e
WHERE e.event_id NOT IN (
    SELECT s.event_id
    FROM sessions s
    JOIN tickets t ON t.session_id = s.session_id
    GROUP BY s.event_id
    HAVING COUNT(t.ticket_id) > 0
);

-- A query to create a view and another query to demonstrate its use:
CREATE VIEW attendee_emails_numbers AS
SELECT emails.email, phones.phone_number
FROM attendees
INNER JOIN users
ON attendees.user_id = users.user_id
INNER JOIN emails
ON users.user_id = emails.user_id
INNER JOIN phones
ON users.user_id = phones.user_id;

SELECT email, phone_number
FROM attendee_emails_numbers;

-- A trigger that updates or inserts data based on an insert:
CREATE TABLE IF NOT EXISTS users_audit (
	audit_user_id INT NOT NULL,
    audit_time VARCHAR(50),
	audit_new_user VARCHAR(50)
);

DELIMITER //
CREATE TRIGGER user_insert
	AFTER INSERT ON users
	FOR EACH ROW 
	BEGIN
		INSERT INTO users_audit (audit_user_id, audit_time, audit_new_user)
        VALUES (new.user_id, NOW(), CONCAT('New row added for: ', new.first_name, ', ', new.last_name));
	END //
DELIMITER ;

DROP TRIGGER trigger_example;

-- A query to demonstrate the trigger's functionality:
INSERT INTO users (user_id, first_name, last_name)
VALUES (24, 'Dr.', 'Chase');

SELECT *
FROM users;

SELECT *
FROM users_audit;
