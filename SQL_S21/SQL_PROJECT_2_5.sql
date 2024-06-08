CREATE TABLE patient --Пациент
(
	patient_id SERIAL PRIMARY KEY,
	first_name varchar NOT NULL,
	last_name varchar NOT NULL,
	birthday date NOT NULL,
	gender varchar NOT NULL,
	address varchar NOT NULL,
	phone varchar NOT NULL,
	№_policy varchar NOT NULL,
	№_passport varchar NOT null,
	CONSTRAINT пол_check CHECK (gender in ('М', 'Ж')),
	CONSTRAINT unique_name_policy UNIQUE (№_policy),
	CONSTRAINT unique_name_passport UNIQUE (№_passport)
);
	
CREATE TABLE post -- Должность врача-специалиста
(
	post_id SERIAL PRIMARY KEY,
	name varchar NOT NULL,
	description varchar,
	CONSTRAINT unique_name_post UNIQUE (name)
);
	
CREATE TABLE doctors --Врачи-специалисты 
(
	doctor_id SERIAL PRIMARY KEY,
	first_name varchar NOT NULL,
	last_name varchar NOT NULL,
	post_id SERIAL NOT NULL,
	schedule varchar NOT null DEFAULT 'Пн; Вт; Ср; Чт; Пт; Сб; Вс',
	CONSTRAINT post_fk FOREIGN KEY (post_id) REFERENCES post(post_id)
);
	
CREATE TABLE medical_services --Медицинские услуги
(
	service_id SERIAL PRIMARY KEY,
	nameS varchar NOT NULL,
	description varchar NOT NULL,
	status varchar NOT null DEFAULT 'включено',
	price numeric NOT NULL DEFAULT 0,
	CONSTRAINT status_check CHECK (status in ('исключено', 'включено')),
	CONSTRAINT unique_name_nameS UNIQUE (nameS)
);
 
CREATE TABLE appointment --Запись на прием к врачу-специалисту
(
	appointment_id SERIAL PRIMARY KEY,
	doctor_id int NOT NULL,
	pacient_id int NOT NULL,
	appointment_date timestamp NOT NULL DEFAULT date_trunc('hour', now()),
	status varchar NOT null DEFAULT 'Запланировано',	
	CONSTRAINT status_check CHECK (status in ('Запланировано', 'Проведено', 'Отменено')),
	CONSTRAINT appointment_un UNIQUE (doctor_id, pacient_id, appointment_date),
	CONSTRAINT appointment_un1 UNIQUE (doctor_id, appointment_date),
	CONSTRAINT appointment_un2 UNIQUE (pacient_id, appointment_date),
	CONSTRAINT appointment_fk FOREIGN KEY (pacient_id) REFERENCES patient(patient_id),
	CONSTRAINT appointment_fk1 FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
	CONSTRAINT appointment_fk2 FOREIGN KEY (pacient_id) REFERENCES patient(patient_id)
);

CREATE TABLE appointment_services --Указанные медицинские услуги в рамках записи на прием к врачу-специалисту
(
	appointmentservices_id SERIAL PRIMARY KEY,
	appointment_id int NOT NULL,
	services_id int NOT NULL,
	status varchar NOT null DEFAULT 'Запланировано',
	CONSTRAINT status_check CHECK (status in ('Запланировано', 'Проведено', 'Отменено')),
	CONSTRAINT appointmentservices_fk FOREIGN KEY (services_id) REFERENCES medical_services(service_id),
	CONSTRAINT appointmentservices_fk1 FOREIGN KEY (appointment_id) REFERENCES appointment(appointment_id),
	UNIQUE (appointment_id, services_id)
);
	
CREATE TABLE medical_records --Заключения врачей-специалистов
(
	record_id SERIAL PRIMARY key,
	appointment_id int NOT NULL,
	doctor_id int NOT NULL,
	pacient_id int NOT NULL,
	record_date timestamp NOT NULL DEFAULT date_trunc('hour', now()),
	diagnosis text NOT null,	
	recommendations text NOT NULL,
	CONSTRAINT medicalrecords_fk FOREIGN KEY (appointment_id) REFERENCES appointment(appointment_id),
	CONSTRAINT medicalrecords_fk1 FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
	CONSTRAINT medicalrecords_fk2 FOREIGN KEY (pacient_id) REFERENCES patient(patient_id),
	CONSTRAINT unique_name_record_id UNIQUE (record_id)
);

INSERT INTO post (name, description) 
VALUES 
	('Терапевт', 'Диагностика и лечение общих заболеваний взрослых'),
	('Стоматолог', 'Диагностика и лечение заболеваний зубов и полости рта'),
	('Кардиолог', 'Диагностика и лечение сердечно-сосудистых заболеваний'),
	('Отоларинголог', 'Диагностика и лечение заболеваний уха, горла, носа'),
	('Педиатр', 'Диагностика и лечение детских заболеваний');

INSERT INTO doctors	(first_name, last_name, post_id, schedule)
values
	('Рамазан', 'Кадиров', 1, 'Вт; Ср'),
	('Умеджон', 'Каримов', 2, 'Пн; Вт; Ср; Чт; Пт'),
	('Аминат', 'Сурхаева', 3, 'Ср; Чт; Пт; Сб; Вс'),
	('Мохира', 'Шерматова', 4, 'Пн; Вт; Ср; Сб; Вс'),
	('Зияуттин', 'Гусейнов', 5, 'Пн; Вт; Ср; Чт; Пт; Сб; Вс');

INSERT INTO patient (first_name, last_name, birthday, gender, address, phone, №_policy, №_passport)  
VALUES  
	('Анна', 'Сидорова', '2000-05-07', 'Ж', 'ул. Центральная, 5', '1234567890', '123456789', 'AB1234567'), 
	('Петр', 'Иванов', '1991-11-01', 'М', 'пр. Солнечный, 10', '9876543210', '987654321', 'CB7654321'), 
	('Елена', 'Петрова', '2000-12-03', 'Ж', 'ул. Парковая, 2', '991234567', '567891234', 'DE3456789'), 
	('Олег', 'Николаев', '1961-07-03', 'М','пр. Садовый, 15', '776655443322', '246813579', 'CD9876543'), 
	('Ирина', 'Кузнецова', '2000-02-29', 'Ж', 'ул. Лесная, 7', '71112223344', '135792468', 'EF9876543');

INSERT INTO medical_services (names, description, status, price)  
VALUES  
	('Общий осмотр пациента', 'Полный общий осмотр и первичная диагностика', 'включено', 1500.00), 
	('УЗИ сердца', 'Ультразвуковое исследование сердца', 'включено', 2000.00), 
	('Стоматологическая чистка', 'Профессиональная чистка зубов', 'включено', 2120.00), 
	('Проведение ЭКГ', 'Электрокардиография', 'включено', 1000.00), 
	('Консультация лора', 'Лечение заболеваний уха, горла, носа', 'включено', 1800.00), 
	('Консультация стоматолога', 'Диагностика заболеваний зубов и полости рта', 'включено', 1900.00), 
	('Лечение кариеса', 'Установка пломбы зуба', 'включено', 3160.00), 
	('Профилактический осмотр детей', 'Диагностика и профилактика детских заболеваний', 'включено', 3700.00), 
	('Лабораторный анализ крови', 'Полный анализ крови','включено', 2800.00), 
	('УЗИ органов брюшной полости', 'Ультразвуковая диагностика органов брюшной полости','включено', 2200.00);

INSERT INTO appointment (doctor_id, pacient_id, appointment_date, status)  
VALUES  
	(1, 1, '2023-12-06 08:30'::timestamp, 'Запланировано'), 
	(2, 2, '2023-12-05 08:42'::timestamp, 'Запланировано'), 
	(3, 3, '2023-12-21 12:00'::timestamp, 'Запланировано'), 
	(4, 4, '2023-12-17 14:48'::timestamp, 'Запланировано'), 
	(5, 5, '2023-12-12 10:52'::timestamp, 'Запланировано'); 

INSERT INTO appointment_services (appointment_id, services_id, status)  
VALUES  
	(1, 1, 'Запланировано'), 
	(1, 3, 'Запланировано'), 
	(2, 4, 'Запланировано'), 
	(2, 9, 'Запланировано'), 
	(3, 5, 'Проведено'), 
	(3, 7, 'Проведено'), 
	(4, 2, 'Проведено'), 
	(4, 6, 'Проведено'), 
	(5, 8, 'Отменено'), 
	(5, 10, 'Отменено'); 

INSERT INTO medical_records  (appointment_id, doctor_id, pacient_id, record_date, diagnosis, recommendations)  
VALUES  
	(1, 1, 1, '2023-12-11', 'Легкий насморк', 'Принять лекарство'), 
	(2, 2, 2, '2023-12-10', 'Кариес зуба', 'Установка пломбы'), 
	(3, 3, 3, '2023-12-10', 'Гипертония', 'Диета и физические упражнения'), 
	(4, 4, 4, '2023-12-05', 'ОРВИ', 'Предоставить отпуск по больничному листу'), 
	(5, 5, 5, '2023-12-20', 'Мигрень', 'Рекомендации по режиму дня'); 

SELECT first_name AS "Имя", last_name AS "Фамилия", 'Пациент' AS "Метка"
FROM patient
WHERE EXTRACT(YEAR FROM birthday) = 2000
UNION ALL
SELECT first_name  AS "Имя", last_name AS "Фамилия", 'Врач' AS "Метка"
FROM doctors
WHERE schedule = 'Вт; Ср'
ORDER BY "Имя", "Фамилия";

