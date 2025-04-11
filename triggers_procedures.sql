-- trigger and procedure

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

-- PROCEDURE (retrieves the first and last name of the ticket owner for a given event and ticket_id)
DELIMITER //
CREATE PROCEDURE p_get_ticket_owner(IN event_name_param VARCHAR(50), IN ticket_id_param INT, OUT attendee_name_param VARCHAR(50))
    BEGIN
	
        -- retrieve who the ticket belongs to for a particular event
		SELECT CONCAT(users.first_name, ' ', users.last_name)
        INTO attendee_name_param
        FROM users
        INNER JOIN attendees
        ON users.user_id = attendees.user_id
        INNER JOIN tickets
        ON attendees.attendee_id = tickets.attendee_id
        INNER JOIN sessions
        ON tickets.session_id = sessions.session_id
        INNER JOIN events
        ON sessions.event_id = events.event_id
        WHERE events.name = event_name_param AND tickets.ticket_id = ticket_id_param;
        
        
    END // 
DELIMITER ;

SET @result = '';
CALL p_get_ticket_owner('Tech Conference 2025', 1, @result);
SELECT @result;
