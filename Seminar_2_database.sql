-- create a table
CREATE TABLE general_list (
  id INTEGER PRIMARY KEY,
  FIO VARCHAR(30) NOT NULL,
  Data_B CHAR(10) NOT NULL,
  St_atus VARCHAR(30) NOT NULL,
  Tel VARCHAR(15) NOT NULL,
  Comm_it VARCHAR(30) NOT NULL,
  Address VARCHAR(30) NOT NULL,
  Gr VARCHAR(30) NOT NULL
);

-- insert some values
INSERT INTO general_list VALUES (1, 'Иванов И. И.', '12.02.1990',	'женат', 126 ,	'интернет',	'Можга', 'Работа');
INSERT INTO general_list VALUES (2, 'Иванов И. И.', '12.02.1990',	'женат', 127 ,	'старый',	'Можга', 'Работа');
INSERT INTO general_list VALUES (3, 'Иванов И. И.', '18.09.2001',	'холост', 527 ,	'личный', 'Санкт-Петербург', 'Школа');
INSERT INTO general_list VALUES (4, 'Петров П. П.', '4/23/1983', 'женат', 234, 'личный', 'Москва', 'Родня');
INSERT INTO general_list VALUES (5, 'Петров П. П.', '4/24/1983', 'женат', 235, 'рабочий', 'Москва', 'Родня');
INSERT INTO general_list VALUES (6, 'Васильев В. В.', '5/21/1998', 'холост', 456, 'личный', 'Белгород', 'Друзья');
INSERT INTO general_list VALUES (7, 'Сидоров С.С.', '7/13/2007', 'холост', 643, 'личный', 'Киров', 'Родня');
INSERT INTO general_list VALUES (8, 'Сидоров С.С.', '7/13/2007', 'холост', 654, 'старый', 'Киров', 'Родня');
INSERT INTO general_list VALUES (9, 'Александров А.А.','3/5/1987','женат',412,'рабочий','Уфа', 'Друзья');
INSERT INTO general_list VALUES (10, 'Борисов Б.Б', '8/16/1989', 'холост', 723, 'рабочий', 'Москва',	'Работа');
INSERT INTO general_list VALUES (11, 'Михайлов М.М.', '1/8/1997', 'женат', 876, 'личный', 'Сочи', 'Университет');
INSERT INTO general_list VALUES (12, 'Михайлов М.М.', '1/8/1997', 'женат', 875, 'рабочий', 'Сочи', 'Университет');
INSERT INTO general_list VALUES (13, 'Кириллов К.К.', '12/3/1996',	'холост', 933,	'личный', 'Киров', 'Работа');

-- SELECT * FROM general_list;

-- Чему будет равна выборка:

-- SELECT ФИО, Д/р, Адрес FROM Общий список
SELECT FIO, Data_B, Address FROM general_list

-- SELECT ФИО, Статус FROM Общий список WHERE Адрес = «Можга»
SELECT FIO, St_atus FROM general_list WHERE Address = 'Можга';

-- SELECT ФИО FROM Общий список WHERE Адрес = «Москва» AND Группа = «Работа»
SELECT FIO FROM general_list WHERE Address = 'Москва' AND Gr = 'Работа';

-- SELECT Д/р FROM Общий список WHERE Адрес = «Москва» OR Группа = «Работа»
SELECT Data_B FROM general_list WHERE Address = 'Москва' OR Gr = 'Работа';


CREATE TABLE people (
  person_id INT PRIMARY KEY,
  FIO VARCHAR(30) NOT NULL,
  Data_B CHAR(10) NOT NULL,
  St_atus VARCHAR(30) NOT NULL
);

CREATE TABLE addresses (
    address_id INT PRIMARY KEY,
    person_id INT,
    adres VARCHAR(30),
    comm VARCHAR(30)
);

INSERT INTO people (person_id, FIO, Data_B,St_atus)
VALUES (1, 'Иванов И. И.' , '12.02.1990', 'женат') , (2, 'Иванов И. И.', '18.09.2001', 'холост'), (3, 'Петров П. П.', '4/24/1983', 'женат') ,(4, 'Васильев В. В.', '5/21/1998', 'холост'), (25, 'Кузьмин К. К.', '21.05.2020', 'холост') ;

INSERT INTO addresses (address_id, person_id, adres, comm)
VALUES (1, 1, 'Можга', 'Место рождения'), (2, 1, 'Казань', 'По прописке'), (3, 1, 'Москва', 'Рабочий'), (4, 2, 'Санкт-Петербург', 'По прописке'), (5, 3, 'Москва', 'По прописке'), (6, 4, 'Белгород', 'По прописке'), (7, 5, 'Уфа', 'По прописке'), (8, 6, 'Сочи', 'По прописке'), (9, 7, 'Киров', 'Рабочий'), (10, 8, 'Владивосток', 'Место рождения'), (11, 9, 'Рязань', 'Рабочий'), (12, 10, 'Хабаровск', 'Место рождения');

-- SELECT * from people;
-- SELECT * from addresses;

-- Что будет результатом следующих JOIN’ов:

-- INNER JOIN Люди, Адреса ON id = Чей адрес
SELECT * From  people INNER JOIN addresses ON people.person_id = addresses.person_id; 

-- LEFT JOIN Люди, Адреса ON id = Чей адрес
SELECT * From  people LEFT JOIN addresses ON people.person_id = addresses.person_id; 

-- RIGHT JOIN Люди, Адреса ON id = Чей адрес
SELECT * From  people RIGHT JOIN addresses ON people.person_id = addresses.person_id; 

-- FULL JOIN Люди, Адреса ON id = Чей адрес
SELECT * From  people LEFT JOIN addresses ON people.person_id = addresses.person_id
UNION 
SELECT * From  people RIGHT JOIN addresses ON people.person_id = addresses.person_id; 


-- Что будет результатом выборки:

-- SELECT ФИО, Адрес, Комментарий FROM Люди RIGHT JOIN Адреса ON id = Чей Адрес
SELECT FIO, adres, comm From  people RIGHT JOIN addresses ON people.person_id = addresses.person_id; 

