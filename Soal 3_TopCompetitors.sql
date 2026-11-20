WITH hackerrank AS (
    SELECT
        h.hacker_id,
        h.name,
        COUNT(DISTINCT s.challenge_id) AS total_full_score
    FROM hackers h
    JOIN submissions s
        ON h.hacker_id = s.hacker_id
    JOIN challenges c
        ON s.challenge_id = c.challenge_id
    JOIN difficulty d
        ON c.difficulty_level = d.difficulty_level
    WHERE s.score = d.score
    GROUP BY h.hacker_id, h.name
    HAVING COUNT(DISTINCT s.challenge_id) > 1
)
SELECT
    hacker_id,
    name
FROM hackerrank
ORDER BY total_full_score DESC, hacker_id ASC;