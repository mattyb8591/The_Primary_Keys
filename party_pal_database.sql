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

-- Insert sample users
INSERT INTO users (first_name, last_name) VALUES 
('Alice', 'Johnson'),
('Bob', 'Smith'),
('Charlie', 'Brown'),
('Diana', 'Prince'),
('Eve', 'Adams'),
('Frank', 'Castle'),
('Grace', 'Hopper'),
('Hank', 'Pym');

-- Insert sample emails
INSERT INTO emails (user_id, email) VALUES 
(1, 'alice.johnson@example.com'),
(2, 'bob.smith@example.com'),
(3, 'charlie.brown@example.com'),
(4, 'diana.prince@example.com'),
(5, 'eve.adams@example.com'),
(6, 'frank.castle@example.com'),
(7, 'grace.hopper@example.com'),
(8, 'hank.pym@example.com');

-- Insert sample phone numbers
INSERT INTO phones (user_id, phone_number) VALUES
(1, '123-456-7890'),
(2, '234-567-8901'),
(3, '345-678-9012'),
(4, '456-789-0123'),
(5, '567-890-1234'),
(6, '678-901-2345'),
(7, '789-012-3456'),
(8, '890-123-4567');

-- Insert sample attendees
INSERT INTO attendees (user_id) VALUES
(1),
(2),
(3),
(4);

-- Insert sample organizers
INSERT INTO organizers (user_id) VALUES
(5),
(6);

-- Insert sample performers
INSERT INTO performers (user_id) VALUES
(7),
(8);

-- Insert sample sponsors
INSERT INTO sponsors (user_id) VALUES
(1),
(2);

-- Insert sample events
INSERT INTO events (name) VALUES
('Tech Conference 2025'),
('Music Festival'),
('Charity Gala');

-- Insert sample venues
INSERT INTO venues (address) VALUES
('123 Main St, New York, NY'),
('456 Elm St, San Francisco, CA'),
('789 Maple Ave, Chicago, IL');

-- Insert sample event-venues
INSERT INTO event_venues (event_id, venue_id) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Insert sample sessions
INSERT INTO sessions (event_id, start_time, end_time) VALUES
(1, '2025-06-01 10:00:00', '2025-06-01 12:00:00'),
(1, '2025-06-01 13:00:00', '2025-06-01 15:00:00'),
(2, '2025-07-10 18:00:00', '2025-07-10 21:00:00'),
(3, '2025-08-15 19:00:00', '2025-08-15 23:00:00');

-- Insert sample tickets
INSERT INTO tickets (attendee_id, session_id, type) VALUES
(1, 1, 'VIP'),
(2, 1, 'General'),
(3, 2, 'General'),
(4, 3, 'VIP');

-- Insert sample organizations
INSERT INTO organizations (organizer_id, event_venue_id) VALUES
(1, 1),
(2, 2);

-- Insert sample performances
INSERT INTO performances (performer_id, event_venue_id) VALUES
(1, 1),
(2, 2);

-- Insert sample sponsorships
INSERT INTO sponsorships (sponsor_id, event_venue_id) VALUES
(1, 1),
(2, 2);
