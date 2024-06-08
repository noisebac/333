-- Проект 2.3 Конструкция ORDER BY. Использование формул и атрибутов. Вложенные запросы в SELECT, FROM, WHERE конструкциях.

-- Exercise 01

-- Выбираем имена и позиции игроков из таблицы player
SELECT NAME, position
-- Ограничиваем результаты только теми, у кого рост в диапазоне от 188 до 200 и зарплата от 100000 до 150000
FROM player
WHERE height BETWEEN 188 AND 200 AND salary BETWEEN 100000 AND 150000
-- Сортируем результаты по имени в порядке убывания
ORDER BY NAME DESC;

-- Exercise 02

-- Выбираем строку, объединяя значения столбцов city, NAME и team.coach_name, и добавляя текстовые метки
SELECT
    'город: ' || city || '; команда: ' || NAME || '; тренер: ' || team.coach_name AS "полная информация"
-- Из таблицы team
FROM
    team
-- Сортируем результаты по первому столбцу (полная информация)
ORDER BY
    1;
   
-- Exercise 03
   
-- Выбираем столбцы NAME и size из таблицы arena
SELECT
    NAME,
    size
-- Ограничиваем выборку стадионами, у которых id равен 10, 30 или 50
FROM
    arena
WHERE
    id IN (10, 30, 50)
-- Сортируем результаты сначала по размеру (size), а затем по имени (NAME)
ORDER BY
    size,
    NAME;

-- Exercise 04
   
-- Выбираем столбцы NAME и size из таблицы arena
SELECT
    NAME,
    size
-- Ограничиваем выборку стадионами, у которых id НЕ равен 10, 30 или 50
FROM
    arena
WHERE
    id NOT IN (10, 30, 50)
-- Сортируем результаты сначала по размеру (size), а затем по имени (NAME)
ORDER BY
    size,
    NAME;
   
-- Exercise 05

-- Выбираем столбцы NAME и POSITION из таблицы player
SELECT
    NAME AS "имя игрока",
    POSITION AS "позиция на площадке"
-- Ограничиваем выборку игроками с ростом от 188 до 220 см и позицией "центровой" или "защитник"
FROM
    player
WHERE
    height BETWEEN 188 AND 220 AND POSITION IN ('центровой', 'защитник')
-- Сортируем результаты сначала по позиции в убывающем порядке (DESC), а затем по имени в убывающем порядке (DESC)
ORDER BY
    POSITION DESC,
    NAME DESC;
