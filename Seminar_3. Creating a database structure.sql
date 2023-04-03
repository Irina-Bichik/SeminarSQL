-- Описать БД для хранения книг, журналов и статей в книжном шкафу.

-- Особое внимание уделить именованию атрибутов и созданию справочников для всего и вся. Например:

-- Если у книги есть автор(ы), то авторов выносим в отдельную таблицы «Авторы».
-- Если у нас несколько типов объектов, выносим их в отдельный справочник («Книга», «Журнал», «Статья» и так далее).
-- Местоположение объекта в шкафу тоже нужно сделать справочником. Например, «Полка», «Место на полке».
-- Любые заполняемые данные стараемся вынести в отдельные таблицы, а между таблицами настраиваем связи.

CREATE TABLE content (
  content_id INT PRIMARY KEY,
  type_id INT;
  name VARCHAR(50),
  year_published VARCHAR(4),
  
  FOREIGN KEY type_id REFERENCES types (type_id)
);

CREATE TABLE author_content (
  id INT PRIMARY KEY,
  content_id INT,
  author_id INT,
  
  FOREIGN KEY (content_id) REFERENCES content (content_id),
  FOREIGN KEY (author_id) REFERENCES  authors (author_id)
);

CREATE TABLE types (
  type_id INT PRIMARY KEY,
  type_content VARCHAR(10),
);

CREATE TABLE authors (
  author_id INT PRIMARY KEY,
  full_name VARCHAR (40),
  birth_date DATE,
  country VARCHAR(20),
);

-- Описать базу данных для парковки для автомобилей.
-- есть парковка с местами на ней
-- есть автомобили разных типов
-- есть владельцы (у владельца может быть несколько авто)
-- можно для усложнения фиксировать в доп таблице время заезда и выезда.

CREATE TABLE cars (
  car_id INT PRIMARY KEY,
  model VARCHAR (20),
  state_namber VARCHAR (12),
  color VARCHAR(20)
);

CREATE TABLE people (
  people_id INT PRIMARY KEY,
  name VARCHAR (30),
  birth_date DATE,
  license VARCHAR (15),
  phone_number VARCHAR(15)
);

CREATE TABLE people_car (
  id INT PRIMARY KEY,
  car_id INT,
  people_id INT,
  
  FOREIGN KEY car_id REFERENCES cars (car_id),
  FOREIGN KEY people_id REFERENCES people (people_id)
);

CREATE TABLE park_places (
  place_id INT PRIMARY KEY,
  park_row INT,
  park_place INT,
);

CREATE TABLE parking (
  id INT PRIMARY KEY,
  car_id INT,
  people_id INT,
  place_id INT,
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  
  FOREIGN KEY car_id REFERENCES cars (car_id),
  FOREIGN KEY people_id REFERENCES people (people_id),
  FOREIGN KEY place_id REFERENCES park_places (place_id)
);

-- Описать базу данных для биржи фриланса.

-- Есть биржа, на которой заказчики размещают заказы, а исполнители берут заказы. Структура должна позволять использовать базу в таких сценариях как, например:

-- Получить сумму выполненных заказов за какой-то период по всей бирже, по заказчику, по исполнителю.
-- Сделать выборки по типу заказа (набор текста, решение контрольных и т.п.) и найти исполнителей с самым высоким рейтингом.
-- Найти исполнителей, которые в конкретный момент времени работали над заказом
-- Другие подобные задачи.

CREATE TABLE customer (
  customer_id INT PRIMARY KEY,
  name VARCHAR (30),
  birth_date DATE,
  rating REAL
);

CREATE TABLE perfomer (
  perfomer_id INT PRIMARY KEY,
  name VARCHAR (30),
  birth_date DATE,
  rating FLOAT,
  statuss VARCHAR (30)
);

CREATE TABLE type_orders (
  type_id INT PRIMARY KEY,
  type_name VARCHAR (50)
);

CREATE TABLE deals (
  deal_id INT PRIMARY KEY,
  customer_id INT,
  perfomer_id INT,
  type_id INT,
  price REAL,
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  
  FOREIGN KEY customer_id REFERENCES customer (customer_id),
  FOREIGN KEY perfomer_id REFERENCES perfomer (perfomer_id),
  FOREIGN KEY type_id REFERENCES type_orders (type_id)
);
