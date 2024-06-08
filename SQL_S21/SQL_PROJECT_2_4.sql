-- Проект 2.4 Конструкции INSERT / UPDATE / DELETE. Работа с множествами: UNION, INTERSECT, EXCEPT.

-- Exercise 01
-- Выбираем столбец name из таблицы arena
SELECT name
-- Объединяем результаты с выбором столбца name из таблицы team
FROM arena
UNION
SELECT name
FROM team
-- Сортируем объединенные результаты по первому столбцу (name) в порядке убывания
ORDER BY 1 DESC;

-- Exercise 02
-- Выбираем столбцы name и дополнительное значение 'стадион' как object_type из таблицы arena
SELECT name, 'стадион' as object_type
-- Объединяем результаты с выбором столбцов name и 'команда' как object_type из таблицы team
FROM arena
UNION
SELECT name, 'команда' as object_type
FROM team
-- Сортируем объединенные результаты по второму столбцу (object_type) в порядке убывания, а затем по первому столбцу (name) в порядке возрастания
ORDER BY 2 DESC, 1 ASC;
   
-- Exercise 03
-- Выбираем столбцы NAME и salary из таблицы player
SELECT NAME, salary
FROM player
-- Сортируем результаты по значению salary, но помещаем те записи, у которых salary равен 475000, в начало
ORDER BY CASE WHEN salary = 475000 THEN 0 ELSE salary END
-- Ограничиваем результаты первыми 5 записями
LIMIT 5;

-- Exercise 04
-- Выбираем уникальные идентификаторы (id) из таблицы player, которые не присутствуют в таблице team
SELECT
    id
FROM
    player
EXCEPT
-- Исключаем из результата уникальные идентификаторы (id) из таблицы team
SELECT
    id
FROM
    team
-- Сортируем результаты по первому столбцу (id) и ограничиваем выборку первыми 10 записями
ORDER BY
    1
LIMIT 10;
   
-- Exercise 05
-- Выбираем уникальные идентификаторы (id) из таблицы arena, которые отсутствуют в таблице game
(SELECT id
FROM arena
EXCEPT
SELECT id
FROM game)
-- Объединяем результаты с уникальными идентификаторами (id) из таблицы game, которые отсутствуют в таблице arena
UNION
(SELECT id
FROM game
EXCEPT
SELECT id
FROM arena)
-- Сортируем результаты по первому столбцу (id)
ORDER BY 1;