SELECT
    login.emp_id AS emp_id,
    SUM(TIMESTAMPDIFF(HOUR, login.timestamp, logout.timestamp)) AS work_hours
FROM
    attendance AS login
    JOIN attendance AS logout ON login.emp_id = logout.emp_id
        AND DATE(login.timestamp) = DATE(logout.timestamp)
WHERE
    WEEKDAY(login.timestamp) IN (1, 7)
    AND WEEKDAY(logout.timestamp) IN (1, 7)
    AND TIME(login.timestamp) < TIME(logout.timestamp)
GROUP BY
    login.emp_id
