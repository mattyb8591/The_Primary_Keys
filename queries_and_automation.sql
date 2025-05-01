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

-- A trigger that updates or inserts data based on an insert:

-- A query to demonstrate the trigger's functionality:
