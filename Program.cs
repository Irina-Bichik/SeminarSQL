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
INSERT INTO general_list VALUES (2, 'Кириллов К.К.', '12/3/1996',	'холост', 933,	'личный', 'Киров', 'Работа');
INSERT INTO general_list VALUES (3, 'Иванов И. И.', '9/18/2001', 'холост', 527,	'личный', 'Санкт-Петербург', 'Школа');
INSERT INTO general_list VALUES (4, 'Петров П. П.', '4/23/1983', 'женат', 234, 'личный', 'Москва', 'Родня');
INSERT INTO general_list VALUES (5, 'Михайлов М.М.', '1/8/1997', 'женат', 876, 'личный', 'Сочи', 'Университет');
INSERT INTO general_list VALUES (6, 'Васильев В. В.', '5/21/1998', 'холост', 456, 'личный', 'Белгород', 'Друзья');
INSERT INTO general_list VALUES (7, 'Сидоров С.С.', '7/13/2007', 'холост', 643, 'личный', 'Киров', 'Родня');
INSERT INTO general_list VALUES (8, 'Борисов Б.Б', '8/16/1989', 'холост', 723, 'рабочий', 'Москва',	'Работа');
INSERT INTO general_list VALUES (9, 'Александров А.А.','3/5/1987','женат',412,'рабочий','Уфа', 'Друзья');

-- fetch some values

-- SELECT * FROM general_list;


-- SELECT FIO, Tel, Comm_it FROM general_list

-- SELECT FIO, Tel, Comm_it FROM general_list WHERE Gr = 'Родня';

-- SELECT Tel FROM general_list WHERE Gr = 'Друзья' AND St_atus = 'холост';

-- SELECT Data_B FROM general_list WHERE Gr = 'Университет' OR St_atus = 'холост';

-- SELECT FIO, Tel, Comm_it FROM general_list WHERE Tel > 700;


CREATE TABLE people (
  person_id INT PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE phones (
  phone_id INT PRIMARY KEY,
  person_id INT,
  number VARCHAR(20),
  FOREIGN KEY (person_id) REFERENCES people(person_id)
);

CREATE TABLE addresses (
  address_id INT PRIMARY KEY,
  person_id INT,
  street VARCHAR(50),
  city VARCHAR(50),
  FOREIGN KEY (person_id) REFERENCES people(person_id)
);

INSERT INTO people (person_id, name)
VALUES (1, 'John'), (2, 'Jane'), (3, 'Bob') ,(4, 'Sara');

INSERT INTO phones (phone_id, person_id, number)
VALUES (1, 1, '123-456-7890'), (2, 2, '987-654-3210'), (3, 3, '555-555-5555'),(4,1,'895-8654-545');

INSERT INTO addresses (address_id, person_id, street, city)
VALUES (1, 1, '123 Lenina', 'Moscow'), (2, 2, '456 Pyshkina', 'Rostov'), (3, 3, '789 Turgenevskaya', 'Sankt Peterburg');

-- SELECT * from phones

-- SELECT * From  people INNER JOIN phones ON people.person_id = phones.person_id; -- INNER JOIN Люди, Телефоны ON id = Чей телефон

-- SELECT * From  people LEFT JOIN phones ON people.person_id = phones.person_id; -- LEFT JOIN Люди, Телефоны ON id = Чей телефон

-- SELECT * From  people RIGHT JOIN phones ON people.person_id = phones.person_id; -- RIGHT JOIN Люди, Телефоны ON id = Чей телефон

-- SELECT * From  people FULL JOIN phones ON people.person_id = phones.person_id; --  sql не знает такой запрос, замена на строке ниже

-- SELECT * From  people RIGHT JOIN phones ON people.person_id = phones.person_id; -- FULL JOIN Люди, Телефоны ON id = Чей телефон

-- SELECT * FROM people inner join  phones on people.person_id = phones.person_id;

-- select * from people,phones; -- из двух таблиц вывести все 
