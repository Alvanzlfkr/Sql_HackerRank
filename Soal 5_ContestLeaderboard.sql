WITH cte1 AS (
    SELECT 
        h.hacker_id,
        h.name,
        s.challenge_id,
        MAX(s.score) as max_score 
    FROM Hackers h 
    JOIN Submissions s 
    ON s.hacker_id = h.hacker_id 
    group by 
        h.hacker_id, 
        h.name, 
        s.challenge_id
), 

cte2 AS (
    SELECT 
    hacker_id,
    name, 
    sum(max_score) as total_score 
    FROM cte1 
    GROUP BY hacker_id, name
)

SELECT hacker_id, name, total_score 
FROM cte2 
WHERE total_score> 0 
ORDER BY total_score DESC, hacker_id;