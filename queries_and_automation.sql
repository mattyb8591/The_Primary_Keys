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

-- A query to create a view and another query to demonstrate its use:

-- A trigger that updates or inserts data based on an insert:

-- A query to demonstrate the trigger's functionality:
