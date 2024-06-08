INSERT INTO arena (ID, NAME, SIZE) VALUES (10, 'Палау Блауграна', 8250);
INSERT INTO arena (ID, NAME, SIZE) VALUES (20, 'Визинк-Центр - Паласио де Депортес', 15500);
INSERT INTO arena (ID, NAME, SIZE) VALUES (30, 'УСК ЦСКА им. А.Я. Гомельского', 5000);
INSERT INTO arena (ID, NAME, SIZE) VALUES (40, 'Пис энд Френдшип Стадиум', 12000);
INSERT INTO arena (ID, NAME, SIZE) VALUES (50, 'СИБУР Арена', 7140);

SELECT * FROM arena;

INSERT INTO team (ID, CITY, NAME, COACH_NAME, ARENA_ID) VALUES (10, 'Барселона', 'Барселона', 'Шарунас Ясикявичюс', 10);
INSERT INTO team (ID, CITY, NAME, COACH_NAME, ARENA_ID) VALUES (20, 'Мадрид', 'Реал Мадрид', 'Пабло Ласо', 20);
INSERT INTO team (ID, CITY, NAME, COACH_NAME, ARENA_ID) VALUES (30, 'Москва', 'ЦСКА', 'Димитрис Итудис', 30);
INSERT INTO team (ID, CITY, NAME, COACH_NAME, ARENA_ID) VALUES (40, 'Пирей', 'Олимпиакос', 'Георгиос Барцокас', 40);
INSERT INTO team (ID, CITY, NAME, COACH_NAME, ARENA_ID) VALUES (50, 'Санкт-Петербург', 'Зенит', 'Хавьер Паскуаль', 50);

SELECT * FROM team;

INSERT INTO player (ID, NAME, POSITION, HEIGHT, WEIGHT, SALARY, TEAM_ID)VALUES('10', 'Рафа Вильяр', 'защитник', '188', '85', '100000', 10);
INSERT INTO player (ID, NAME, POSITION, HEIGHT, WEIGHT, SALARY, TEAM_ID)VALUES('20', 'Кайл Курич', 'защитник', '193', '85', '100000', 10);
INSERT INTO player (ID, NAME, POSITION, HEIGHT, WEIGHT, SALARY, TEAM_ID)VALUES('30', 'Ибу Дьянко Баджи', 'центровой', '211', '103', '200000', 10);
INSERT INTO player (ID, NAME, POSITION, HEIGHT, WEIGHT, SALARY, TEAM_ID)VALUES('40', 'Ник Калатес', 'разыгрывающий', '198', '97', '150000', 10);
INSERT INTO player (ID, NAME, POSITION, HEIGHT, WEIGHT, SALARY, TEAM_ID)VALUES('50', 'Никола Миротич', 'форвард', '208', '107', '175000', 10);
INSERT INTO player (ID, NAME, POSITION, HEIGHT, WEIGHT, SALARY, TEAM_ID)VALUES('60', 'Джейси Кэрролл', 'защитник', '188', '82', '175000', 20);
INSERT INTO player (ID, NAME, POSITION, HEIGHT, WEIGHT, SALARY, TEAM_ID)VALUES('70', 'Эли Джон Ндиайе', 'центровой', '203', '110', '275000', 20);
INSERT INTO player (ID, NAME, POSITION, HEIGHT, WEIGHT, SALARY, TEAM_ID)VALUES('80', 'Уолтер Тавареш', 'центровой', '220', '120', '273000', 20);
INSERT INTO player (ID, NAME, POSITION, HEIGHT, WEIGHT, SALARY, TEAM_ID)VALUES('90', 'Томас Давид Эртель', 'разыгрывающий', '189', '88', '173000', 20);
INSERT INTO player (ID, NAME, POSITION, HEIGHT, WEIGHT, SALARY, TEAM_ID)VALUES('100', 'Гершон Ябуселе', 'форвард', '203', '118', '99000', 20);
INSERT INTO player (ID, NAME, POSITION, HEIGHT, WEIGHT, SALARY, TEAM_ID)VALUES('110', 'Габриэль Иффе Лундберг', 'защитник', '193', '96', '101000', 30);
INSERT INTO player (ID, NAME, POSITION, HEIGHT, WEIGHT, SALARY, TEAM_ID)VALUES('120', 'Юрий Умрихин', 'защитник', '190', '75', '251000', 30);
INSERT INTO player (ID, NAME, POSITION, HEIGHT, WEIGHT, SALARY, TEAM_ID)VALUES('130', 'Иван Анатольевич Ухов', 'разыгрывающий', '193', '77', '175000', 30);
INSERT INTO player (ID, NAME, POSITION, HEIGHT, WEIGHT, SALARY, TEAM_ID)VALUES('140', 'Александр Хоменко', 'разыгрывающий', '192', '85', '375000', 30);
INSERT INTO player (ID, NAME, POSITION, HEIGHT, WEIGHT, SALARY, TEAM_ID)VALUES('150', 'Андрей Лопатин', 'лёгкий форвард', '208', '92', '205000', 30);
INSERT INTO player (ID, NAME, POSITION, HEIGHT, WEIGHT, SALARY, TEAM_ID)VALUES('160', 'Тайлер Дорси', 'защитник', '193', '83', '205000', 40);
INSERT INTO player (ID, NAME, POSITION, HEIGHT, WEIGHT, SALARY, TEAM_ID)VALUES('170', 'Яннулис Ларенцакис', 'защитник', '196', '87', '75000', 40);
INSERT INTO player (ID, NAME, POSITION, HEIGHT, WEIGHT, SALARY, TEAM_ID)VALUES('180', 'Хассан Мартин', 'центровой', '201', '107', '375000', 40);
INSERT INTO player (ID, NAME, POSITION, HEIGHT, WEIGHT, SALARY, TEAM_ID)VALUES('190', 'Михалис Лунцис', 'разыгрывающий', '195', '90', '475000', 40);
INSERT INTO player (ID, NAME, POSITION, HEIGHT, WEIGHT, SALARY, TEAM_ID)values('200', 'Георгиос Принтезис', 'форвард', '205', '104', '105000', 40);
INSERT INTO player (ID, NAME, POSITION, HEIGHT, WEIGHT, SALARY, TEAM_ID)VALUES('210', 'Билли Джеймс Бэрон', 'защитник', '188', '88', '75000', 50);
INSERT INTO player (ID, NAME, POSITION, HEIGHT, WEIGHT, SALARY, TEAM_ID)VALUES('220', 'Артурас Гудайтис', 'центровой', '208', '99', '165000', 50);
INSERT INTO player (ID, NAME, POSITION, HEIGHT, WEIGHT, SALARY, TEAM_ID)VALUES('230', 'Денис Захаров', 'разыгрывающий', '192', '88', '163000', 50);
INSERT INTO player (ID, NAME, POSITION, HEIGHT, WEIGHT, SALARY, TEAM_ID)VALUES('240', 'Миндаугас Кузминскас', 'лёгкий форвард', '204', '93', '295000', 50);
INSERT INTO player (ID, NAME, POSITION, HEIGHT, WEIGHT, SALARY, TEAM_ID)VALUES('250', 'Алекс Пойтресс', 'форвард', '201', '108', '247000', 50);

select * from player;


INSERT INTO game (ID, OWNER_TEAM_ID, GUEST_TEAM_ID, GAME_DATE, WINNER_TEAM_ID, OWNER_SCORE, GUEST_SCORE, ARENA_ID)
VALUES
  ('10', 10, 50, '2021-10-22', 10, 84, 58, 10),
  ('20', 10, 30, '2021-11-17', 10, 81, 73, 10),
  ('30', 10, 20, '2021-10-12', 10, 93, 80, 10),
  ('40', 10, 40, '2021-10-15', 10, 83, 68, 10),
  ('50', 50, 20, '2022-12-15', 20, 68, 75, 50),
  ('60', 50, 30, '2022-01-15', 30, 67, 77, 50),
  ('70', 50, 40, '2022-10-20', 50, 84, 78, 50),
  ('80', 20, 30, '2021-10-28', 20, 71, 65, 20),
  ('90', 20, 40, '2022-02-01', 20, 75, 67, 20),
  ('100', 30, 40, '2022-02-02', 30, 79, 78, 30);

 select * from game;

SELECT NAME
FROM arena
WHERE SIZE > 9000
ORDER BY NAME;

SELECT NAME
FROM player
WHERE POSITION IN ('защитник', 'форвард')
ORDER BY NAME DESC;

SELECT NAME
FROM player
WHERE HEIGHT > 215 OR WEIGHT > 120
ORDER BY NAME;