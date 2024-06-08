-- Упражнение 1:
-- Рассчитать средний, минимальный, максимальный рост и суммарную зарплату игроков:

SELECT
    AVG(height) AS avg_height,    -- Средний рост игроков
    MIN(height) AS min_height,    -- Минимальный рост игроков
    MAX(height) AS max_height,    -- Максимальный рост игроков
    SUM(salary) AS total_salary   -- Cуммарная зарплата игроков
FROM
    player;

-- Упражнение 2:
-- Рассчитать статистику по росту и зарплате для каждой позиции
   
SELECT
    position,                            
    ROUND(AVG(height), 2) AS avg_height, -- Средний рост с округлением до 2 знаков после запятой
    MIN(height) AS min_height,           -- Минимальный рост
    MAX(height) AS max_height,           -- Максимальный рост
    SUM(salary) AS total_salary          -- Cуммарная зарплата
FROM
    player
GROUP BY
    position                             -- Группировка по позиции
ORDER BY
    1;                                   -- Сортировка по позиции
    
-- Упражнение 3:
-- Ищем города, в которых есть более одной команды
    
SELECT
    city          
FROM
    team
GROUP BY
    city
HAVING
    COUNT(*) > 1;  -- Условие: количество команд больше одной
    
-- Упражнение 4:
-- Ищем общее количество очков, набранных победителями для каждой команды
    
SELECT
    SUM(g.owner_score + g.guest_score) AS total_points,  -- Общее количество очков
    t.name                                               -- Название команды
FROM
    game AS g
INNER JOIN
    team AS t ON t.id = g.winner_team_id
GROUP BY
    t.name                                               -- Группировка по названию команды
ORDER BY
    1 ;                                                  -- Сортировка по общему количеству очков
    
-- Упражнение 5:
-- Определяем класс роста для игроков и подсчитать их количество в каждом классе
    
SELECT
    CASE
        WHEN height < 190 THEN 1                   -- Класс 1 для роста < 190
        WHEN height >= 190 AND height < 200 THEN 2 -- Класс 2 для роста >= 190 И роста < 200
        ELSE 3                                     -- Класс 3 для роста >= 200 (остальные случаи)
    END AS height_class,
    COUNT(*) AS amount_players                     -- Количество игроков в каждом классе
FROM
    player
GROUP BY
    CASE
        WHEN height < 190 THEN 1
        WHEN height >= 190 AND height < 200 THEN 2
        ELSE 3
    END
ORDER BY
    1 ;                                           -- Сортировка по классу роста