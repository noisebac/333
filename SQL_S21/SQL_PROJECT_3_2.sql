-- Упражнение 1:
-- Выводим информацию о датах игр на каждом стадионе, 
-- включая те, где игры не проводились, сортируем по названию стадиона и дате игры:

SELECT
    arena.name AS arena_name,  -- Название арены
    COALESCE(g.game_date::varchar, 'игра не проводилась') AS game_date  -- Дата игры или текст "игра не проводилась"
FROM
    arena
LEFT JOIN
    game g ON arena.id = g.arena_id
ORDER BY
    1, 2;  -- Сортировка по названию арены (первичная) и дате игры (вторичная)
    
-- Упражнение 2:
-- Создаем новую команду в таблице team:
    
INSERT INTO team (id, city, name, coach_name, arena_id)
VALUES (60, 'Москва', 'СКА', 'Петр Иванов', 30);

-- Получаем имена команд из одного города:

SELECT
    t1.name AS team_name,
    t1.city
FROM
    team AS t1
INNER JOIN
    team AS t2 ON t1.id != t2.id AND t1.city = t2.city
ORDER BY
    1;  -- Сортируем по названию команды
    
-- Упражнение 3:
-- Выбираем названия стадионов, которые были использованы как арены для проведения игр
    
SELECT
    name
FROM
    arena
WHERE
    id IN (
        -- Выбираем уникальные идентификаторы стадионов
        SELECT
            DISTINCT arena_id
        FROM
            game
    )
ORDER BY
    1;  -- Сортируем по названию стадиона

-- Упражнение 4:
-- Выводим названия стадионов, которые были использованы как арены для проведения игр
    
SELECT
    name
FROM
    arena
WHERE
    EXISTS (
        -- Проверяем наличие игр, связанных со стадионом
        SELECT
            arena_id
        FROM
            game
        WHERE
            arena_id = arena.id
    )
ORDER BY
    1;  -- Сортируем по названию стадиона
    
-- Упражнение 5:
-- Временная таблица с информацией о командах и аренах

WITH _T AS (
    SELECT
        team.city AS city_name,
        team.name AS team_name,
        a.name AS arena_name
    FROM
        team
    INNER JOIN
        arena AS a ON a.id = team.arena_id
    WHERE
        a.size > 10000 --вместимость арены строго больше, чем 10000 мест
)
SELECT * -- Выводим результаты из временной таблицы
FROM
    _T
ORDER BY
    1 DESC,  -- Сортируем по названию города в убывающем порядке
    2,       -- Затем по названию команды
    3;       -- И по названию арены