/* sample queries demonstrating CRUD operations, joins, and aggregate functions */

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
