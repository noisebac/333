 1. CREATE TABLE book (
        book_id INT PRIMARY KEY AUTO_INCREMENT, 
        title VARCHAR(50), 
        author VARCHAR(30), 
        price DECIMAL(8,2), 
        amount INT);  

 2. INSERT INTO book VALUES (NULL, 'Мастер и Маргарита', 'Булгаков М.А.', 670.99,3);

 3. INSERT INTO book (title, author, price, amount) VALUES
('Белая гвардия', 'Булгаков М.А.', 540.50 , 5),
('Идиот', 'Достоевский Ф.М.', 460, 10),
('Братья Карамазовы', 'Достоевский Ф.М.', 799.01, 2);

 4. SELECT author, title, price
FROM book; 

 5. SELECT title Название, author Автор            
FROM book;

 6. SELECT title, amount, amount * 1.65 AS pack
FROM book;

 7. SELECT title, author, amount, ROUND(price * 0.7, 2) AS new_price
FROM book;

 8. SELECT author, title,
    ROUND(IF(author = 'Булгаков М.А.', price * 1.1, IF(author = 'Есенин С.А.', price * 1.05, price )), 2) AS new_price
FROM book;

 9. SELECT author, title, price 
FROM book
WHERE amount < 10;

 10. SELECT title, author, price, amount  
FROM book
WHERE (price < 500 OR price > 600) 
AND (price * amount) >= 5000;

 11. SELECT title, author
FROM book
WHERE price >= 540.5 
AND price <= 800
AND amount IN (2,3,5,7);

 12. SELECT author,title
FROM book
WHERE amount>= 2 
AND amount<= 14
ORDER BY author DESC,title;

 13. SELECT author, title
FROM book
WHERE amount BETWEEN 2 AND 14
ORDER BY author DESC, title ASC;

 14. SELECT title,author       
FROM book 
WHERE title LIKE '_% _%'
AND(author LIKE "% С._." OR author LIKE "% _.С.")
ORDER BY title;

 15. SELECT *
FROM book
ORDER BY book_id DESC;

 16. SELECT amount
FROM book
GROUP BY amount;

 17. SELECT author AS 'Автор',
COUNT(*) AS 'Различных_книг',
SUM(amount) AS 'Количество_экземпляров'
FROM book
GROUP BY author;

 18. SELECT author,
    MIN(price) AS 'Минимальная_цена', 
    MAX(price) AS 'Максимальная_цена',
    AVG(price) AS 'Средняя_цена'
FROM book
GROUP BY author;

 19. SELECT author, 
    SUM(price*amount) AS Стоимость, 
    ROUND(SUM(price*amount)*0.18 / 1.18, 2) AS НДС,
    ROUND(SUM(price*amount) / 1.18,2) AS Стоимость_без_НДС
FROM book
GROUP BY author;

 20. SELECT MIN(price) AS 'Минимальная_цена', 
    MAX(price) AS 'Максимальная_цена', 
    ROUND(AVG(price),2) AS 'Средняя_цена'
FROM book;

 21. SELECT ROUND(AVG(price),2) AS Средняя_цена,
ROUND(SUM(price * amount),2) AS Стоимость
FROM book
WHERE amount BETWEEN 5 AND 14;

 22. SELECT author, 
SUM(price * amount) as Стоимость 
FROM book 
WHERE title <> 'Идиот' and title <> 'Белая гвардия' 
GROUP BY author 
HAVING SUM(price*amount) > 5000 
ORDER BY Стоимость DESC;

 23. SELECT book_id AS Порядковыйномер, author AS Автор, ROUND(AVG(price)) AS Средняяцена
FROM book
GROUP BY book_id, author;

 24. SELECT author, title, price
FROM book
WHERE price <= (
    SELECT AVG(price)
    FROM book
    )
ORDER BY price DESC;

 25. SELECT author, title, price
FROM book 
WHERE 
    price - (SELECT MIN(price)
             FROM book) <= 150
ORDER BY price;

 26. SELECT author, title, amount
FROM book
WHERE amount IN (
        SELECT amount
        FROM book 
        GROUP BY amount
        HAVING COUNT(amount) = 1
      );

 27. SELECT author, title, price
FROM book
WHERE price < any (
    SELECT min(price)
    FROM book
    GROUP BY author
);

 28. SELECT title, author, amount,
(SELECT ABS(amount - (SELECT MAX(amount) FROM book ))) AS 'Заказ'
FROM book
WHERE amount < (SELECT MAX(amount) FROM book);

 29. SELECT author, title, amount 
FROM book
WHERE amount = (SELECT MIN(amount) FROM book)
ORDER BY amount;

 30. CREATE TABLE supply (
    supply_id INT PRIMARY KEY AUTO_INCREMENT, 
    title VARCHAR(50),
    author VARCHAR(30),
    price DECIMAL(8, 2),
    amount INT
);

 31. INSERT INTO supply(title, author, price, amount) 
VALUES 
('Лирика','Пастернак Б.Л.',518.99,2),
('Черный человек','Есенин С.А.',570.20,6),
('Белая гвардия','Булгаков М.А.',540.50,7),
('Идиот','Достоевский Ф.М.',360.80,3);
SELECT *
FROM supply;

 32. INSERT INTO book (title, author, price, amount) 
SELECT title, author, price, amount 
FROM supply
WHERE author <> 'Булгаков М.А.' 
    AND author <> 'Достоевский Ф.М.';

 33. INSERT INTO book (title, author, price, amount) 
SELECT title, author, price, amount 
FROM supply
WHERE author NOT IN (
        SELECT author 
        FROM book
      );

 34. UPDATE book
SET price = price * 0.9
WHERE amount BETWEEN 5 AND 10;

 35. UPDATE book 
SET buy = IF(buy > amount, amount, buy),
price = IF(buy = 0 , price * 0.9, price);
SELECT * FROM book;

 36. UPDATE book, supply 
SET book.amount = book.amount + supply.amount,
book.price = (book.price + supply.price)/2
WHERE book.title = supply.title AND book.author = supply.author;
SELECT * FROM book;

 37. DELETE FROM supply 
WHERE author IN(
     SELECT author
     FROM book
     GROUP BY author
     HAVING SUM(amount) > 10
     );
SELECT * FROM supply;

 38. CREATE TABLE ordering AS
SELECT author, title, 
   (SELECT ROUND(AVG(amount)) 
    FROM book) AS amount
FROM book
WHERE amount < (SELECT AVG(amount) 
    FROM book);
SELECT * FROM ordering;

 39. DELETE FROM supply
WHERE title = 'Лирика';
SELECT * FROM supply

 40. SELECT name, city, per_diem, date_first, date_last
FROM trip
WHERE name like '%а %'
ORDER BY date_last desc;

 41. SELECT DISTINCT name
FROM trip
WHERE city = 'Москва'
ORDER BY name;

 42. SELECT city, count(city) AS 'Количество' 
FROM trip 
GROUP BY city
ORDER BY city;

 43. SELECT city, count(name) as 'Количество'
FROM trip
GROUP BY 1
ORDER BY 2 DESC
LIMIT 2;

 44. SELECT name,city,DATEDIFF(date_last,date_first)+1 as Длительность
FROM trip
WHERE city NOT IN ('Москва','Санкт-Петербург') 
ORDER BY Длительность DESC, city DESC;

 45. SELECT name, city, date_first, date_last
FROM trip
WHERE DATEDIFF(date_last, date_first) <= ALL(SELECT DATEDIFF(date_last, date_first)
FROM trip);

 46. SELECT name, city, date_first, date_last
FROM trip
WHERE MONTH(date_first) = MONTH(date_last)
ORDER BY city, name;

 47. SELECT MONTHNAME(date_first) AS Месяц, COUNT(MONTHNAME(date_first)) AS Количество
FROM trip
GROUP BY MONTHNAME(date_first)
ORDER BY Количество DESC, Месяц;

 48. SELECT name, city, date_first, per_diem*(DATEDIFF(date_last, date_first) + 1) AS Сумма
FROM trip
WHERE date_first BETWEEN '2020-02-01' AND '2020-03-31'
ORDER BY name, Сумма DESC;

 49. CREATE TABLE fine (
  fine_id INT PRIMARY KEY AUTO_INCREMENT, 
  name VARCHAR(30), 
  number_plate VARCHAR(6), 
  violation VARCHAR(30), 
  sum_fine DECIMAL(8, 2), 
  date_violation DATE, 
  date_payment DATE);

 50. INSERT INTO fine (name, number_plate, violation, date_violation)
VALUES 
('Баранов П.Е.', 'Р523ВТ', 'Превышение скорости(от 40 до 60)', 20200214),
('Абрамова К.А.', 'О111АВ', 'Проезд на запрещающий сигнал', 20200223),
('Яковлев Г.Р.', 'Т330ТТ', 'Проезд на запрещающий сигнал', 20200303);
   
 51. SELECT name, number_plate, violation
FROM fine
GROUP BY name, number_plate, violation
HAVING count(violation) > 1
ORDER BY violation DESC;

 52. CREATE TABLE back_payment(
    SELECT name, number_plate, violation, sum_fine, date_violation
    FROM fine
    WHERE date_payment IS NULL);

 53. DELETE FROM 
  fine 
WHERE 
  date_violation < DATE(20200201) 
  AND date_payment IS NOT NULL;

 54. CREATE TABLE author (
  author_id int PRIMARY KEY AUTO_INCREMENT, 
  name_author VARCHAR(50));

 55. INSERT INTO author (name_author) 
VALUES 
  ('Булгаков М.А.'), 
  ('Достоевский Ф.М.'), 
  ('Есенин С.А.'), 
  ('Пастернак Б.Л.');

 56. INSERT INTO book(title, author_id, genre_id, price, amount) 
VALUES 
  ('Стихотворения и поэмы', 3, 2, 650.00, 15), 
  ('Черный человек', 3, 2, 570.20, 6), 
  ('Лирика', 4, 2, 518.99, 2);

 57. SELECT title, name_genre, price from book
JOIN genre USING(genre_id)
WHERE amount > 8
ORDER BY price DESC;

 58. SELECT name_genre
FROM genre LEFT JOIN book
USING (genre_id)
WHERE title is Null;

 59.  SELECT DISTINCT name_genre 
FROM genre LEFT JOIN book
     on genre.genre_id = book.genre_id
WHERE title is Null;

 60. SELECT name_city, name_author,
    DATE_ADD('2020-01-01', INTERVAL FLOOR(RAND() * 365) DAY) AS Дата 
FROM city, author
ORDER BY name_city, Дата DESC;

 61. SELECT name_genre,
       title,
       name_author
FROM genre 
    INNER JOIN book
        USING(genre_id)
    INNER JOIN author
        USING(author_id)
WHERE name_genre = "Роман"
ORDER BY title;

 62. SELECT name_author, SUM(amount) AS Количество
FROM author LEFT JOIN book USING(author_id)
GROUP BY name_author
HAVING Количество < 10 OR Количество IS NULL
ORDER BY Количество;   

 63. SELECT name_author FROM author 
WHERE author_id IN(SELECT DISTINCT author_id FROM book
                    GROUP BY author_id
                    HAVING COUNT(DISTINCT genre_id) = 1);  

 64. SELECT title as Название, name_author as Автор, book.amount + supply.amount as Количество
FROM book
INNER JOIN supply
USING (title, price)
INNER JOIN author
USING (author_id);

 65. INSERT INTO author (name_author)
SELECT author
FROM supply
WHERE author NOT IN (SELECT name_author FROM author);

 66. INSERT INTO book (title, author_id, price, amount)
SELECT title, author_id, price, amount
FROM author INNER JOIN supply
     ON author.name_author = supply.author
WHERE amount <> 0;

 67. UPDATE book
SET genre_id = 2
WHERE book_id = 10;

 68. UPDATE book
SET genre_id = 3
WHERE book_id = 11;

 69. DELETE FROM author 
WHERE author_id IN (
SELECT author_id 
FROM book 
GROUP BY author_id 
HAVING SUM(amount) < 20);

 70. DELETE FROM genre
WHERE genre_id IN (SELECT genre_id FROM book
               GROUP BY genre_id
               HAVING COUNT(genre_id) < 4);
       

 71. DELETE FROM author 
USING author JOIN book USING(author_id)
                         JOIN genre USING(genre_id)
WHERE name_genre='Поэзия';

 72. SELECT buy.buy_id, book.title, book.price, buy_book.amount
FROM client 
     JOIN buy USING(client_id)
     JOIN buy_book USING(buy_id)
     JOIN book USING(book_id)
WHERE name_client = 'Баранов Павел'
ORDER BY 1, 2;

 73. SELECT name_author, title, COUNT(buy_book.amount) AS 'Количество'
FROM author
INNER JOIN book USING(author_id)
LEFT JOIN buy_book USING (book_id)
GROUP BY name_author, title
ORDER BY name_author, title;

 74. SELECT
	name_city,
	COUNT(city_id) Количество
FROM city
	JOIN client USING(city_id)
	JOIN buy USING(client_id)
GROUP BY name_city
ORDER BY Количество
DESC, name_city;
