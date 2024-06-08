-- Упражнение 1:

SELECT
    team.city AS city_name,
    team.name AS team_name,
    a.name AS arena_name
FROM
    team
INNER JOIN
    arena AS a ON a.id = team.arena_id
WHERE
    a.size > 10000
ORDER BY
    city_name DESC;

-- Упражнение 2:
   
SELECT
    owner.name AS owner_team,
    guest.name AS guest_team,
    winner.name AS winner_team,
    owner_score || ':' || guest_score AS score,
    a.name AS arena_name
FROM
    game AS g
INNER JOIN
    team AS guest ON g.guest_team_id = guest.id
INNER JOIN
    team AS owner ON g.owner_team_id = owner.id
INNER JOIN
    team AS winner ON g.winner_team_id = winner.id
INNER JOIN
    arena AS a ON a.id = g.arena_id
ORDER BY
    owner_team, guest_team;
   
-- Упражнение 3:

-- Создание таблицы для защитников:

CREATE TABLE player_defender AS
SELECT *
FROM player
WHERE POSITION = 'защитник';

-- Выборка данных из таблицы защитников с сортировкой по первому столбцу:

SELECT *
FROM player_defender
ORDER BY 1;

-- Упражнение 4:

-- Обновление зарплаты защитников:

UPDATE player_defender
SET salary = salary - player_defender.salary * 0.13;

-- Выборка данных из таблицы защитников с сортировкой по первому столбцу:

SELECT id, name, salary
FROM player_defender
ORDER BY 1;

-- Упражнение 5:

-- Удаление защитников с зарплатой меньше 100000 и весом равным 85:

DELETE FROM player_defender
WHERE salary < 100000 AND weight = 85;

-- Вывод информации о защитниках после удаления:

SELECT id, name, salary
FROM player_defender
ORDER BY 1;