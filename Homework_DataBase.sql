-- Опишите базу данных для школьного кабинета, в рамках которой можно фиксировать, кто и в какое время сидел за той или иной партой.

-- — Место ученика — это ряд, парта, вариант.
-- — В течение одного дня у разных классов бывает несколько уроков.
-- — Создайте минимум 3 таблицы: «Кабинет», «Ученик» и сводная таблица, где отображаются парты и ученики.
-- — Используйте поля «началоурока» и «конецурока» с типом данных TimeStamp.

CREATE TABLE cabinet (
  cabinet_id INT PRIMARY KEY,
  cabinet_number VARCHAR(10)
);

CREATE TABLE pupils (
  pupil_id INT PRIMARY KEY,
  first_name VARCHAR (15),
  last_name VARCHAR (15),
  birth_date DATE
);

CREATE TABLE call_schedule (
  schedule_id INT PRIMARY KEY,
  start_lesson TIMESTAMP,
  end_lesson TIMESTAMP
);

CREATE TABLE class_call_schedule (
  class_id INT PRIMARY KEY,
  class_name VARCHAR (5),
  schedule_id INT,
  
  FOREIGN KEY (schedule_id) REFERENCES call_schedule (schedule_id)
);

CREATE TABLE contact_pupils (
  contact_id INT PRIMARY KEY,
  pupil_id INT,
  class_id INT,
  phone_number VARCHAR (15),
  home_address VARCHAR (45),
 
  FOREIGN KEY (pupil_id) REFERENCES pupils (pupil_id),
  FOREIGN KEY (class_id) REFERENCES class_call_schedule (class_id)
);

CREATE TABLE place (
  place_id INT PRIMARY KEY,
  row_num VARCHAR (15),
  desk_num VARCHAR (15),
  variant_num VARCHAR (10)
);

CREATE TABLE consolidated (
  cons_id INT PRIMARY KEY,
  pupil_id INT,
  class_id INT,
  cabinet_id INT,
  place_id INT,
  schedule_id INT,
  
  FOREIGN KEY (pupil_id) REFERENCES pupils (pupil_id),
  FOREIGN KEY (class_id) REFERENCES class_call_schedule (class_id),
  FOREIGN KEY (cabinet_id) REFERENCES cabinet (cabinet_id),
  FOREIGN KEY (place_id) REFERENCES place (place_id),
  FOREIGN KEY (schedule_id) REFERENCES call_schedule (schedule_id)
);

-- SELECT column_name, data_type, is_nullable, column_key FROM information_schema.columns WHERE table_name = 'cabinet';
-- SELECT column_name, data_type, is_nullable, column_key FROM information_schema.columns WHERE table_name = 'pupils';
-- SELECT column_name, data_type, is_nullable, column_key FROM information_schema.columns WHERE table_name = 'call_schedule';
-- SELECT column_name, data_type, is_nullable, column_key FROM information_schema.columns WHERE table_name = 'class_call_schedule';
-- SELECT column_name, data_type, is_nullable, column_key FROM information_schema.columns WHERE table_name = 'contact_pupils';
-- SELECT column_name, data_type, is_nullable, column_key FROM information_schema.columns WHERE table_name = 'place';
-- SELECT column_name, data_type, is_nullable, column_key FROM information_schema.columns WHERE table_name = 'consolidated';


