/* sample queries demonstrating CRUD operations, joins, and aggregate functions */

-- CREATE
INSERT INTO users (first_name, last_name)
VALUES (‘Marc’, ‘Jabian’);

INSERT INTO events (name)
VALUES ('Sarah’s Birthday Party');

-- READ
SELECT users.user_id, first_name, last_name 
FROM users
JOIN attendees ON attendees.user_id = users.user_id;

SELECT events.event_id, name, address
FROM events 
JOIN event_venues ON events.event_id = event_venues.event_id
JOIN venues ON event_venues.venue_id = venues.venue_id;

-- UPDATE
UPDATE venues
SET address = ‘308 Negra Arroyo Lane’
WHERE venue_id = 3;

UPDATE events
SET name = 'Tech Conference 2026'
WHERE event_id = 1;

-- DELETE
DELETE FROM phones WHERE phone_id = 2;

DELETE FROM emails WHERE email_id = 2;

-- AGGREGATE FUNCTION (counts total attendees at an event)
SELECT e.name AS event_name, COUNT(t.ticket_id) AS total_attendees
FROM events e
JOIN sessions s ON e.event_id = s.event_id
JOIN tickets t ON s.session_id = t.session_id
GROUP BY e.event_id;

-- TRIGGER (adds log into audit table after a ticket is deleted)
CREATE TABLE IF NOT EXISTS ticket_audit (
	audit_id INT AUTO_INCREMENT PRIMARY KEY,
	audit_datetime DATETIME DEFAULT CURRENT_TIMESTAMP,
	audit_user VARCHAR(100),
	audit_action VARCHAR(255)
);
USE party_pal;
DROP TRIGGER IF EXISTS tr_ticket_delete;
DELIMITER //
CREATE TRIGGER tr_ticket_delete
AFTER DELETE ON tickets
FOR EACH ROW
BEGIN
    INSERT INTO ticket_audit (audit_datetime, audit_user, audit_action)
    VALUES (NOW(), USER(), CONCAT('Deleted ticket_id: ', OLD.ticket_id));
END;
