-- Упражнение 1:
-- Создаем виртуальное представление (VIEW) с именем v_arena_more_9000, которое возвращает наименование стадионов, вместимость которых строго больше 9000

CREATE VIEW v_arena_more_9000 AS
SELECT
    name
FROM
    arena
WHERE
    size > 9000
ORDER BY
    name;

-- Выводим все данные из созданного представления, отсортированные по имени арены
   
SELECT
    *
FROM
    v_arena_more_9000
ORDER BY
    1;
   
-- Упражнение 2:
-- Создаем представление, объединяющее имена арен и команд
   
CREATE VIEW v_arena_team AS
SELECT
    name
FROM
    arena
UNION
SELECT
    name
FROM
    team
ORDER BY
    1 DESC;

-- Выводим все данные из созданного представления, отсортированные по имени
   
SELECT
    *
FROM
    v_arena_team
ORDER BY
    1;
   
-- Упражнение 3:
-- Создаем материализованное представление, объединяющее информацию о командах
   
CREATE MATERIALIZED VIEW mv_formula_team AS
SELECT
    'город: ' || city || '; команда: ' || name || '; тренер: ' || team.coach_name AS "полная информация"
FROM
    team
ORDER BY
    1;

-- Выводим все данные из созданного материализованного представления, отсортированные по полной информации
   
SELECT
    *
FROM
    mv_formula_team
ORDER BY
    1;
   
-- Упражнение 4:
-- Создаем материализованное представление, объединяющее статистику по игрокам
   
CREATE MATERIALIZED VIEW mv_formula_player AS
SELECT
    AVG(height) AS avg_height,
    MIN(height) AS min_height,
    MAX(height) AS max_height,
    SUM(salary) AS total_salary
FROM
    player;

-- Выводим все данные из созданного материализованного представления
   
SELECT
    *
FROM
    mv_formula_player;

-- Упражнение 5:
-- Создаем таблицу для отслеживания изменений в данных о игроках
   
CREATE TABLE player_audit(
modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
modified_type VARCHAR NOT NULL ,
id BIGINT,
name VARCHAR,
position VARCHAR,
height VARCHAR,
weight VARCHAR,
salary VARCHAR,
team_id VARCHAR
);

-- Создаем функцию триггера для отслеживания изменений в данных об игроках

CREATE OR REPLACE FUNCTION fnc_trg_player_changed()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO player_audit (
            modified_date,
            modified_type,
            id,
            name,
            position,
            height,
            weight,
            salary,
            team_id
        ) VALUES (
            NOW(),
            TG_OP,
            NEW.id,
            NEW.name,
            NEW.position,
            NEW.height,
            NEW.weight,
            NEW.salary,
            NEW.team_id
        );
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO player_audit (
            modified_date,
            modified_type,
            id,
            name,
            position,
            height,
            weight,
            salary,
            team_id
        ) VALUES (
            NOW(),
            TG_OP,
            OLD.id,
            OLD.name,
            OLD.position,
            OLD.height,
            OLD.weight,
            OLD.salary,
            OLD.team_id
        );
    ELSE
        INSERT INTO player_audit (
            modified_date,
            modified_type,
            id,
            name,
            position,
            height,
            weight,
            salary,
            team_id
        ) VALUES (
            NOW(),
            TG_OP,
            OLD.id,
            OLD.name,
            OLD.position,
            OLD.height,
            OLD.weight,
            OLD.salary,
            OLD.team_id
        );
    END IF;

    RETURN NULL;
END
$$ LANGUAGE plpgsql;

-- Создаем триггер для отслеживания изменений в данных об игроках

CREATE TRIGGER trg_player_changed
AFTER INSERT OR UPDATE OR DELETE ON player
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_player_changed();

-- Вставляем данные об игроке

INSERT INTO player (id, name, position, height, weight, salary, team_id)
VALUES (1, 'иван иванов', 'защитник', 190, 82, 100000, 10);


-- Обновляем зарплату игрока с ID 1

UPDATE player
SET salary = 200000
WHERE id = 1;

-- Удаляем игрока с ID 1

DELETE FROM player
WHERE id = 1;

-- Выводим все записи из таблицы player_audit, упорядоченные по дате изменения в порядке возрастания

SELECT *
FROM player_audit
ORDER BY modified_date ASC;