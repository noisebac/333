1. CREATE TABLE Students
(
	StudentID INTEGER PRIMARY KEY,
	first_name VARCHAR (255) NOT NULL,
	last_name VARCHAR (255) NOT NULL,
	Country VARCHAR (255) NOT NULL,
	Language VARCHAR (255) NULL,
	Date_birth DATETIME NULL
	);

2. INSERT INTO Students
	(first_name, last_name, Country, Language, Date_birth)
VALUES
	('Ivan', 'Ivanov', 'RUS', 'RU', '1991-11-06'),
	('Aleksandr', 'Aleksandrov', 'RUS', 'RU', '1985-05-06'),
	('Olga', 'Gusko', 'UA', 'UA', '1992-10-18'),
	('Roma', 'Zaycev', 'UK', 'ENG', '1990-11-08'),
	('Ivan', 'Lomov' ,'USA', 'ENG', '1992-03-08'
);
	
3. CREATE TABLE Class_rooms
(
	ClassroomID INTEGER PRIMARY KEY,
	Faculty VARCHAR (255) NOT NULL,
	Num_students INTEGER NOT NULL
	);

4. INSERT INTO Class_rooms
	(Faculty, Num_students)
VALUES
	('Manual', 5),
	('Selenium', 5),
	('API', 5),
	('Perfomanse', 5),
	('Interview', 5
);

5. CREATE TABLE Progress
(
	ProgressID INTEGER PRIMARY KEY,
	StudentID INTEGER NOT NULL,
	ClassroomID INTEGER NOT NULL,
	Score INTEGER NOT NULL,
	FOREIGN KEY (StudentID) REFERENCES Students (StudentID),
	FOREIGN KEY (ClassroomID) REFERENCES Class_rooms (ClassroomID)
);

6. INSERT INTO Progress
	(StudentID, ClassroomID, Score)
VALUES
	(1, 1, 10),
	(1, 2, 9),
	(1, 3, 9),
	(1, 4, 9),
	(1, 5, 8),
	(2, 1, 8),
	(2, 2, 8),
	(2, 3, 9),
	(2, 4, 9),
	(2, 5, 8),
	(3, 1, 10),
	(3, 2, 10),
	(3, 3, 9),
	(3, 4, 9),
	(3, 5, 8),
	(4, 1, 8),
	(4, 2, 5),
	(4, 3, 5),
	(4, 4, 9),
	(4, 5, 10),
	(5, 1, 7),
	(5, 2, 7),
	(5, 3, 9),
	(5, 4, 9),
	(5, 5, 8
);

7. SELECT first_name, last_name
FROM Students;

8. CREATE TABLE Auto
(
	AutoID INTEGER PRIMARY KEY,
	CarBrand VARCHAR (255) NOT NULL,
	Model VARCHAR (255) NOT NULL,
	YearOfRelese INTEGER (255) NOT NULL,
	Price INTEGER (255) NOT NULL
	);
	
9. INSERT INTO Auto
	(CarBrand, Model, YearOfRelese, Price)
VALUES
	('Toyota', 'Primus', '2000', '500000'),
	('BMW', 'x5', '2010', '1000000'),
	('AUDI', 'f3', '2014', '1450000'),
	('Toyota', 'Camry', '2008', '1100000'),
	('Renault', 'Kaptur' ,'2019', '2300000'),
	('Renault', 'Arkana' ,'2021', '3860000'),
	('Renault', 'Clio' ,'2001', '95000'),
	('Renault', 'Clio III' ,'2009', '370000'),
	('BMV', 'x6' ,'2010', '1300000'),
	('Toyota', 'Raw4' ,'2021', '2060000'
);

10. SELECT *
FROM Auto
WHERE CarBrand = 'Toyota';

11. SELECT *
FROM Auto
Order BY AutoID DESC
LIMIT 3;

12. SELECT *
FROM Auto
Order BY Price DESC
LIMIT 1;

13. SELECT *
FROM Auto
Order BY YearOfRelese ASC
LIMIT 1;

14. SELECT *
FROM Auto
WHERE Price >= 1000000;

15. CREATE TABLE book(
    book_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    title CHAR(70),
    author CHAR(30),
    price DECIMAL(10, 2),
    amount INT);  

16. CREATE TABLE book(
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(55),
    author CHAR(50),
    price DECIMAL(8, 2),
    amount INT UNSIGNED); 

17. CREATE TABLE book(
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(60),
    author CHAR(40),
    price DECIMAL(8, 2),
    amount INT UNSIGNED); 

18. CREATE TABLE book(
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(70),
    author CHAR(30),
    price DECIMAL(8, 2),
    amount INT);  

19. CREATE TABLE book(
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50),
    author VARCHAR(30),
    price DECIMAL(8, 2),
    amount INT);

20. INSERT INTO book (title, author, price, amount) 
VALUE ('Пуаро ведет следствие', 'Агата Кристи', 272.50, 2);

21. INSERT INTO book (title, author, price, amount) 
VALUE ('Стихотворения и поэмы', 'Есенин С.А.', 650, 15);

22. INSERT INTO book (title, author, price,amount)
VALUES ('Идиот','Достоевский Ф.М.', 460.00, 10);

23. INSERT INTO book (title, author, price,amount)
VALUES ('Белая гвардия','Булгаков М.А.', 540.50, 5);

24. INSERT INTO book (title, author, price,amount)
VALUES ('Мастер и Маргарита','Булгаков М.А.', 670.99, 3);

25. SELECT title AS Книга, author AS Автор
FROM book
ORDER BY title DESC, author; 

26. SELECT author AS Автор, title AS Название, price AS Цена
FROM book
ORDER BY price, author; 

27. SELECT author AS Автор, title AS Название, amount AS Количество
FROM book
ORDER BY amount DESC, author; 

28. SELECT author AS Автор, title AS Название, price AS Цена
FROM book
ORDER BY price DESC, title; 

29. SELECT title AS Название, author AS Автор
FROM book
ORDER BY title , author;

30. SELECT title, author, amount, amount * 0.15 AS Итого
FROM book
ORDER BY title, Итого DESC;

31. SELECT author, SUM(amount) AS Количество
FROM book
GROUP BY author
HAVING AVG(price) > 300
ORDER BY Количество DESC;

32. SELECT title, author, price, amount
FROM book
WHERE price = (
    SELECT MIN(price)
    FROM book)
ORDER BY title;
