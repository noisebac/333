-- Друзья, Создайте физические таблицы с набором столбцов и соответствующих типов данных 
-- в реляционном дизайне, которые должны включать следующие логические сущности и правила 
-- формирования данных.

-- поставщики
-- - наименование поставщика (не пустое поле)
-- - ИНН поставщика (не пустое и уникальное поле)
-- - email поставщика (не пустое поле)
-- - юридический адрес поставщика (не пустое поле)
-- - телефон поставщика (не пустое поле)

-- Создаем таблицу suppliers

CREATE TABLE suppliers 
(
    supplier_id SERIAL PRIMARY KEY,  -- Уникальный идентификатор поставщика
    supplier_name VARCHAR NOT NULL,  -- Наименование поставщика (не пустое поле)
    INN VARCHAR NOT NULL UNIQUE,     -- ИНН поставщика (не пустое и уникальное поле)
    email VARCHAR NOT NULL,          -- Email поставщика (не пустое поле)
    legal_address VARCHAR NOT NULL,  -- Юридический адрес поставщика (не пустое поле)
    phone_number VARCHAR NOT NULL    -- Телефон поставщика (не пустое поле)
);

    
/**лекарства**
    -	наименование лекарственного препарата (не пустое и уникальное поле)
    -	категория лекарственного препарата (не пустое поле). Например: гормоны,  диагностические средства и т.д.
    -	внутренний код лекарственного препарата (не пустое и уникальное поле)
    -	описание как принимать лекарственный препарат (не пустое поле)
    -	тип лекарственного препарата (не пустое поле).  Например: 
    		таблетки, порошки, капсулы, драже, мази, кремы, пасты, гели, растворы, 
    		настойки, суспензии, эмульсии, капли, сиропы, микстуры, аэрозоли и т.д.
    -	единица измерения (не пустое поле). Например мг, мл и т.д.
*/

CREATE TABLE medicines
(
    medicine_id SERIAL PRIMARY KEY,          -- Уникальный идентификатор лекарства
    medicine_name VARCHAR NOT NULL UNIQUE,   -- Наименование лекарственного препарата (не пустое и уникальное поле)
    category_id INT NOT NULL,                -- Идентификатор категории лекарственного препарата (не пустое поле)
    medicine_code VARCHAR NOT NULL UNIQUE,   -- Внутренний код лекарственного препарата (не пустое и уникальное поле)
    description VARCHAR NOT NULL,            -- Описание как принимать лекарственный препарат (не пустое поле)
    medicine_type_id INT NOT NULL,           -- Идентификатор типа лекарственного препарата (не пустое поле)
    units_of_measurement_id INT NOT NULL     -- Идентификатор единицы измерения (не пустое поле)
); 

-- Реализуемые лекарства поставщиками
-- - Поставщик
-- - Лекарственный препарат
-- - Стоимость за единицу (не пустое поле). Может быть цена с плавающей точкой
-- Уникальность записи должна быть гарантирована по поставщику и лекарственному препарату.

CREATE TABLE medicines_by_suppliers
(
    id SERIAL PRIMARY KEY,             -- Уникальный идентификатор записи
    supplier_id INT,                   -- Идентификатор поставщика
    medicines_id INT,                  -- Идентификатор лекарственного препарата
    cost_per_unit NUMERIC NOT NULL,    -- Стоимость за единицу (не пустое поле). Может быть цена с плавающей точкой
    UNIQUE (supplier_id, medicines_id) -- Гарантирует уникальность записи по поставщику и лекарственному препарату
);

/*- **заявка медицинского учреждения**
    - внутренний номер заявки (не пустое и уникальное поле)
    - дата заявки (не пустое поле). Значение по умолчанию - текущая дата с точностью до часа
    - специалист, который заполнил заявку (не пустое поле)
    - поставщик, который выполнит заявку (не пустое поле) */

CREATE TABLE applications
(
    application_id SERIAL PRIMARY KEY,             -- Уникальный идентификатор заявки
    application_number VARCHAR NOT NULL UNIQUE,    -- Внутренний номер заявки (не пустое и уникальное поле)
    application_date TIMESTAMP NOT NULL 
    	DEFAULT date_trunc('hour', NOW()),         -- Дата заявки (не пустое поле). Значение по умолчанию - текущая дата с точностью до часа
    specialist_id INT NOT NULL,                    -- Идентификатор специалиста, заполнившего заявку (не пустое поле)
    supplier_id INT NOT NULL                       -- Идентификатор поставщика, который выполнит заявку (не пустое поле)
);
/*-	**позиции в заявке**
    -	заявка медицинского учреждения  (не пустое поле)
    -	лекарственный препарат  (не пустое поле)
    -	количество единиц лекарственного препарата  (не пустое поле и должно быть строго больше 0)*/

CREATE TABLE positions
(
    position_id SERIAL PRIMARY KEY,             -- Уникальный идентификатор позиции
    application_id INTEGER NOT NULL,            -- Идентификатор заявки медицинского учреждения (не пустое поле)
    medicines_id INT NOT NULL,                  -- Идентификатор лекарственного препарата (не пустое поле)
    quantity INT NOT NULL CHECK (quantity > 0), -- Количество единиц лекарственного препарата (не пустое поле и должно быть строго больше 0)
    UNIQUE (application_id, medicines_id)       -- Уникальность записи по заявке медицинского учреждения и лекарственному препарату
);
  
/*-	**плановые и фактические показатели**
    -	лекарственный препарат (не пустое поле)
    -	год (не пустое поле)
    -	месяц (не пустое поле)
    -	плановый показатель потребления (не пустое поле и должно быть строго больше 0)
    -	фактический показатель потребления  (не пустое поле и должно быть строго больше 0)
    -	плановая стоимость лекарственного препарата  (не пустое поле и должно быть строго больше 0)
    -	фактическая стоимость лекарственного препарата  (не пустое поле и должно быть строго больше 0)
    -	специалист который заполнил показатели (не пустое поле)
    -	специалист который обновил показатели

    _Уникальность записи_ должна быть гарантирована по лекарственному препарату, году и месяцу*/

CREATE TABLE indicators
(
    indicators_id SERIAL PRIMARY KEY,                          -- Уникальный идентификатор записи
    medicines_id INT NOT NULL,                                 -- Идентификатор лекарственного препарата (не пустое поле)
    year_of_release INT NOT NULL,                              -- Год (не пустое поле)
    month_of_release INT NOT NULL,                             -- Месяц (не пустое поле)
    planned_consumption_indicator INT NOT NULL CHECK 
    	(planned_consumption_indicator > 0),                   -- Плановый показатель потребления (не пустое поле и должно быть строго больше 0)
    actual_consumption_indicator INT NOT NULL 
    	CHECK (actual_consumption_indicator > 0),              -- Фактический показатель потребления (не пустое поле и должно быть строго больше 0)
    planned_cost_of_the_drug NUMERIC NOT NULL 
    	CHECK (planned_cost_of_the_drug > 0),                  -- Плановая стоимость лекарственного препарата (не пустое поле и должно быть строго больше 0)
    actual_cost_of_the_drug NUMERIC NOT NULL 
    	CHECK (actual_cost_of_the_drug > 0),                   -- Фактическая стоимость лекарственного препарата (не пустое поле и должно быть строго больше 0)
    specialist1_id INT NOT NULL,                               -- Специалист, который заполнил показатели (не пустое поле)
    specialist2_id INT,                                        -- Специалист, который обновил показатели
    UNIQUE (medicines_id, year_of_release, month_of_release)   -- Уникальность записи по лекарственному препарату, году и месяцу
);

/*Подумайте над следующими пунктами ниже в вашей модели данных
-   категория лекарственного препарата
-   тип лекарственного препарата
-   единица измерения
-   специалист который заполнил заявку
-   специалист который заполнил показатели
-   специалист который обновил показатели

Представьте их как отдельные таблицы с ссылочной целостностью на них из перечисленных. 
Укажите какие необходимы атрибуты? Попробуйте проанализировать вашей командой и 
решить что включить в решение данной задачи.*/

-- Создаем таблицу "Категория лекарственного препарата"
CREATE TABLE category
(
    id SERIAL PRIMARY KEY,      -- Уникальный идентификатор категории
    category VARCHAR NOT NULL   -- Наименование категории (не пустое поле)
);

-- Создаем таблицу "Тип лекарственного препарата"
CREATE TABLE medicine_type
(
    id SERIAL PRIMARY KEY,         -- Уникальный идентификатор типа лекарственного препарата
    medicine_type VARCHAR NOT NULL -- Наименование типа лекарственного препарата (не пустое поле)
);

-- Создаем таблицу "Единица измерения"
CREATE TABLE units_of_measurement
(
    id SERIAL PRIMARY KEY,                -- Уникальный идентификатор единицы измерения
    units_of_measurement VARCHAR NOT NULL -- Наименование единицы измерения (не пустое поле)
);

-- Создаем таблицу "Специалист"
CREATE TABLE specialist
(
    specialist_id SERIAL PRIMARY KEY,  -- Уникальный идентификатор специалиста
    first_name VARCHAR NOT NULL,       -- Имя специалиста (не пустое поле)
    last_name VARCHAR NOT NULL,        -- Фамилия специалиста (не пустое поле)
    position VARCHAR NOT NULL,         -- Должность специалиста (не пустое поле)
    phone VARCHAR NOT NULL             -- Телефон специалиста (не пустое поле)
);

/*Не забудьте добавить в ваш физический SQL скрипт следующие объекты базы данных 
(для обеспечения согласованности данных), на основании поставленных требований:
-   внешние ключи
-   уникальные ключи
-   первичные ключи
-   check constraints */

------------------------------------------------

-- Добавление внешнего ключа для applications
ALTER TABLE applications
    ADD CONSTRAINT applications_fk
    FOREIGN KEY (specialist_id)
    REFERENCES specialist(specialist_id)
    ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE applications
    ADD CONSTRAINT applications_fk1
    FOREIGN KEY (supplier_id)
    REFERENCES suppliers(supplier_id)
    ON UPDATE CASCADE ON DELETE CASCADE;

-- Добавление внешних ключей для indicators
ALTER TABLE indicators
    ADD CONSTRAINT indicators_fk
    FOREIGN KEY (medicines_id)
    REFERENCES medicines(medicine_id)
    ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE indicators
    ADD CONSTRAINT indicators_fk1
    FOREIGN KEY (specialist1_id)
    REFERENCES specialist(specialist_id)
    ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE indicators
    ADD CONSTRAINT indicators_fk2
    FOREIGN KEY (specialist2_id)
    REFERENCES specialist(specialist_id)
    ON UPDATE CASCADE ON DELETE CASCADE;

-- Добавление внешних ключей для medicines
ALTER TABLE medicines
    ADD CONSTRAINT medicines_fk
    FOREIGN KEY (medicine_type_id)
    REFERENCES medicine_type(id)
    ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE medicines
    ADD CONSTRAINT medicines_fk2
    FOREIGN KEY (category_id)
    REFERENCES category(id)
    ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE medicines
    ADD CONSTRAINT medicines_fk3
    FOREIGN KEY (units_of_measurement_id)
    REFERENCES units_of_measurement(id)
    ON UPDATE CASCADE ON DELETE CASCADE;

-- Добавление внешних ключей для medicines_by_suppliers
ALTER TABLE medicines_by_suppliers
    ADD CONSTRAINT medicines_by_suppliers_fk
    FOREIGN KEY (supplier_id)
    REFERENCES suppliers(supplier_id)
    ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE medicines_by_suppliers
    ADD CONSTRAINT medicines_by_suppliers_fk_1
    FOREIGN KEY (medicines_id)
    REFERENCES medicines(medicine_id)
    ON UPDATE CASCADE ON DELETE CASCADE;

-- Добавление внешних ключей для positions
ALTER TABLE positions
    ADD CONSTRAINT positions_fk
    FOREIGN KEY (medicines_id)
    REFERENCES medicines(medicine_id)
    ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE positions
    ADD CONSTRAINT positions_fk1
    FOREIGN KEY (application_id)
    REFERENCES applications(application_id)
    ON UPDATE CASCADE ON DELETE CASCADE;

/*Введите следующие **тестовые данные** для вашей модели данных, используя **INSERT** выражения.  
-   Введите **10 любых медицинских препаратов** с учетом указанных атрибутов
-   Введите **5 любых поставщиков-контрагентов** с учетом указанных атрибутов
-   Создайте **3 заявки** от медицинского учреждения с **5 любыми позициями** медицинских препаратов
-   Введите плановые и фактические показатели по **5 лекарственным препаратам** за текущий месяц*/

-- Вставка данных в таблицу category
INSERT INTO category (category)
VALUES ('Вегетотропные средства'),
       ('Гематотропные средства'),
       ('Гормоны и их антагонисты'),
       ('Нейротропные средства');

-- Вставка данных в таблицу medicine_type
INSERT INTO medicine_type (medicine_type)
VALUES ('таблетки'),
       ('порошок'),
       ('капсула'),
       ('суспензия');

-- Вставка данных в таблицу units_of_measurement
INSERT INTO units_of_measurement (units_of_measurement)
VALUES ('шт'),
       ('мг'),
       ('мл');

-- Вставка данных в таблицу specialist
INSERT INTO specialist (specialist_id, first_name, last_name, position, phone)
VALUES (1, 'Иван', 'Иванов', 'специалист, который заполнил заявку', '123123'),
       (2, 'Ирина', 'Сидорова', 'специалист, который заполнил показатели', '123456'),
       (3, 'Руслан', 'Петров', 'специалист, который обновил показатели', '789654');
 
-- Введите **10 любых медицинских препаратов** с учетом указанных атрибутов    
INSERT INTO medicines 
	(medicine_name, category_id, medicine_code, description, medicine_type_id, units_of_measurement_id)
VALUES 
	('Анальгин', 1, 543, 'Обезболивающее средство', 1, 1),
    ('Аскорбиновая кислота', 2, 231, 'Витамин C', 1, 1),
    ('Нурофен', 2, 387, 'Противовоспалительное средство', 4, 3),
    ('Омепразол', 3, 64, 'Препарат для лечения желудочно-кишечного тракта', 3, 1),
    ('Корвалол', 4, 732, 'Седативное средство', 2, 2),
    ('Перикись водорода', 1, 321, 'Антисептик', 3, 2),
    ('Супрастин', 2, 121, 'Противоаллергическое средство', 1, 2),
    ('Тримедат', 3, 89, 'Противомикробное средство', 3, 1),
    ('Називин', 4, 145, 'Вазоконстрикторное средство для носа', 4, 2),
    ('Мукалтин', 2, 228, 'Противокашлевое средство', 1, 1);
      
-- Введите **5 любых поставщиков-контрагентов** с учетом указанных атрибутов      
INSERT INTO suppliers (supplier_name, INN, email, legal_address , phone_number )
VALUES 
	('ООО Весна', '1234567899', 'vesna@mail.ru', 'г. Уфа, ул. Пушкина,38', '210987' ),
	('АО Лето', '7890654321', 'leto@mail.ru', 'г. Сочи, ул. Парковая,17', '290099' ),
	('ООО Зима', '7890785412', 'zima@yandex.ru', 'г. Калининград, ул. Разина, 22', '357655' ),
	('АО Осень', '7890444324', 'osen@gmail.com', 'г. Самара, ул. Труда,30\1', '121234' ),
	('ООО Фарма', '5670098231', 'farma@gmail.ru', 'г. Сургут, ул. Мичурина,99', '908755' );

-- Создайте **3 заявки** от медицинского учреждения с **5 любыми позициями** медицинских препаратов      
-- Вставка данных в таблицу applications
INSERT INTO applications (application_number, application_date, specialist_id, supplier_id)
VALUES 
	(1, '2023-12-10 00:00:00.000', 1, 1),
    (2, '2023-10-25 00:00:00.000', 2, 2),
    (3, '2023-07-04 00:00:00.000', 3, 3);
   
-- Вставка данных в таблицу positions
INSERT INTO positions (application_id, medicines_id, quantity)
VALUES (1, 1, 3),
       (1, 2, 7),
       (1, 3, 8),
       (1, 4, 2),
       (1, 5, 4),
       (2, 6, 4),
       (2, 7, 7),
       (2, 8, 1),
       (2, 9, 2),
       (2, 10, 3),
       (3, 1, 3),
       (3, 2, 9),
       (3, 3, 1),
       (3, 4, 2),
       (3, 5, 1);


-- Введите плановые и фактические показатели по **5 лекарственным препаратам** за текущий месяц      
-- Вставка данных в таблицу indicators
INSERT INTO indicators (medicines_id, year_of_release, month_of_release, planned_consumption_indicator, actual_consumption_indicator, planned_cost_of_the_drug, actual_cost_of_the_drug, specialist1_id, specialist2_id)
VALUES (1, 2023, 12, 99, 108, 205, 300, 1, 3),
       (2, 2023, 12, 14, 17, 705, 987, 1, 1),
       (3, 2023, 12, 38, 55, 100, 154, 2, 3),
       (4, 2023, 12, 22, 24, 84, 111, 2, 1),
       (5, 2023, 12, 43, 58, 68, 80, 1, 2),
       (6, 2023, 12, 99, 108, 205, 1300, 1, 3),
       (7, 2023, 12, 14, 17, 705, 965, 1, 1),
       (8, 2023, 12, 38, 55, 100, 1054, 2, 3),
       (9, 2023, 12, 22, 24, 84, 611, 2, 1),
       (10, 2023, 12, 43, 58, 68, 280, 1, 2);;
      
-- Вставка данных в таблицу medicines_by_suppliers
INSERT INTO medicines_by_suppliers (supplier_id, medicines_id, cost_per_unit)
VALUES (1, 1, 205),
       (1, 2, 600),
       (1, 3, 127),
       (1, 4, 98),
       (1, 5, 77),
       (2, 6, 160),
       (2, 7, 90),
       (2, 8, 231),
       (2, 9, 356),
       (2, 10, 722),
       (3, 1, 123),
       (3, 2, 544),
       (3, 3, 123),
       (3, 4, 90),
       (3, 5, 92);
    
/*
Напишете **SQL запрос** который подсчитает общую сумму бюджета для закупок медицинских препаратов 
по всем 3 заявкам от медицинского учреждения, основываясь на объемах единиц заказанного препарата 
и фактической суммы от поставщика.  Пример вывода представлен ниже:

| Общая сумма |
| ------ |
| 120000 | */
      
-- Вычисляем общую сумму для закупок медицинских препаратов
SELECT SUM(COST) AS "Общая сумма"
FROM (
    -- Подзапрос для соединения данных по заявкам, позициям и показателям
    SELECT 
        i.indicators_id,                                -- Идентификатор показателей
        j.medicines_id,                                 -- Идентификатор медицинского препарата
        i.actual_cost_of_the_drug,                      -- Фактическая стоимость препарата
        j.quantity,                                     -- Количество единиц препарата в заявке
        i.actual_cost_of_the_drug * j.quantity AS COST  -- Общая стоимость для каждой позиции
    FROM indicators i
    RIGHT JOIN (
        -- Подзапрос для объединения данных по заявкам и позициям
        SELECT 
            a.application_id,   -- Идентификатор заявки
            a.supplier_id,      -- Идентификатор поставщика
            p.medicines_id,     -- Идентификатор медицинского препарата
            p.quantity          -- Количество единиц препарата в заявке
        FROM applications a
        LEFT JOIN positions p ON a.application_id = p.application_id
    ) AS j ON j.medicines_id = i.medicines_id
);

/*Результат работы пожалуйста представьте в виде набора SQL скриптов, описывающих вашу 
физическую модель данных (Data Definition Language), первичных описанных данных и 
необходимого SQL запроса (Data Manipulation Language). 
Также сгенерируйте **физическую схему вашей модели данных**, используя инструмент 
DBeaver Community (выбрав подменю в рамках дерева схемы модели данных - 
View Diagram / Нарисовать Диаграмму). */

