-- Query 1: Retrieve all upcoming football matches belonging to the 'Champions League' where the match status is 'Available'.
SELECT match_id,
       fixture,
       base_ticket_price::int
FROM   Matches
WHERE  tournament_category = 'Champions League'
  AND  match_status = 'Available';

-- Query 2: Search for all users whose full names start with 'Tanvir' or contain the phrase 'Haque' (case-insensitive).
SELECT user_id,
       full_name,
       email
FROM   Users
WHERE  full_name ILIKE 'Tanvir%'
   OR  full_name ILIKE '%Haque%';

-- Query 3: Retrieve all booking records where the payment status is missing (NULL), replacing the empty result with 'Action Required'.
SELECT booking_id,
       user_id,
       match_id,
       COALESCE(payment_status, 'Action Required') AS systematic_status
FROM   Bookings
WHERE  payment_status IS NULL;

-- Query 4: Retrieve match booking details along with the User's full name and the scheduled Match fixture teams.
SELECT bk.booking_id,
       ur.full_name,
       mh.fixture,
       bk.total_cost::int
FROM   Bookings AS bk
INNER  JOIN Users AS ur ON bk.user_id  = ur.user_id
INNER  JOIN Matches AS mh ON bk.match_id = mh.match_id;