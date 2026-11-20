WITH wand_minimum AS (
    SELECT
        wp.age,
        w.power,
        MIN(w.coins_needed) AS min_coins
    FROM wands w
    JOIN wands_property wp
        ON w.code = wp.code
    WHERE wp.is_evil = 0
    GROUP BY wp.age, w.power
)

SELECT
    w.id,
    wp.age,
    w.coins_needed,
    w.power
FROM wands w
JOIN wands_property wp
    ON w.code = wp.code
JOIN wand_minimum wm
    ON wp.age = wm.age
    AND w.power = wm.power
    AND w.coins_needed = wm.min_coins
WHERE wp.is_evil = 0
ORDER BY w.power DESC, wp.age DESC;