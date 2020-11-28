CREATE TABLE mentors (
  id       SERIAL PRIMARY KEY,
  name     VARCHAR(30) NOT NULL,
  years    VARCHAR(20) NOT NULL,
  address  VARCHAR(120),
  language VARCHAR(40)
);

CREATE TABLE students (
  id       SERIAL PRIMARY KEY,
  name     VARCHAR(30) NOT NULL,
  address  VARCHAR(120),
  graduated VARCHAR(10)
);



INSERT INTO mentors (name, years, address, language) VALUES ('David','5' ,'11 New Road','Python');
INSERT INTO mentors (name, years, address, language) VALUES ('Bos','3' ,'11 Street','C++');
INSERT INTO mentors (name, years, address, language) VALUES ('Raichel','2' ,'5 Avenue','Python');
INSERT INTO mentors (name, years, address, language) VALUES ('Marina','4' ,'Flower Street 15','Javascript');
INSERT INTO mentors (name, years, address, language) VALUES ('Christian','5' ,'7 Avenue','Kotlin');

INSERT INTO students (name, address, graduated) VALUES ('Kristie White','11 New Road' , 'yes');
INSERT INTO students (name, address, graduated) VALUES ('Baran Skinner','3276  Hall Place' , 'no');
INSERT INTO students (name, address, graduated) VALUES ('Mariah Kidd','788 St Louis St.Lewiston' , 'yes');
INSERT INTO students (name, address, graduated) VALUES ('Nichola Norris','70 Beacon Drive West Deptford' , 'no');
INSERT INTO students (name, address, graduated) VALUES ('Euan Varga','9936 Beach St.Menasha' , 'yes');
INSERT INTO students (name, address, graduated) VALUES ('Kendra Blankenship','53 Lookout Drive Coraopolis' , 'yes');
INSERT INTO students (name, address, graduated) VALUES ('Katarina Holt','88 Market Ave.Yonkers' , 'yes');
INSERT INTO students (name, address, graduated) VALUES ('Mathias Bradley','669 53rd St.Hanover' , 'yes');
INSERT INTO students (name, address, graduated) VALUES ('Alice Barron','144 Cedar Drive Niles' , 'yes');
INSERT INTO students (name, address, graduated) VALUES ('Niall Evans','4 Homestead St.Southampton' , 'no');

select * from mentors;
select * from students;

drop table classes cascade;
CREATE TABLE classes (
  id            SERIAL PRIMARY KEY,
  mentors_id   INT REFERENCES mentors(id),
  students_id   INT REFERENCES students(id),
  topic       VARCHAR(40) NOT NULL,
  class_date  DATE NOT NULL,
  location    VARCHAR(40) NOT NULL
);

drop table extra_classes cascade;
CREATE TABLE extra_classes (
  id            SERIAL PRIMARY KEY,
  group_name    VARCHAR(30) NOT NULL,
  mentors_id    INT REFERENCES mentors(id),
  students_id   INT REFERENCES students(id),
  class_date    DATE NOT NULL,
  location      VARCHAR(40) NOT NULL
);

INSERT INTO classes (mentors_id, students_id, topic, class_date, location) VALUES (5, 2, 'Javascript', '2020-10-01', 'online-ZOOM');
INSERT INTO classes (mentors_id, students_id, topic, class_date, location) VALUES (3, 6, ' NodeJS', '2020-10-03', 'OCC');
INSERT INTO classes (mentors_id, students_id, topic, class_date, location) VALUES (4, 7, 'React', '2020-10-04', 'Migracode building');
INSERT INTO classes (mentors_id, students_id, topic, class_date, location) VALUES (4, 8, 'Javascript', '2020-10-01', 'Migracode building');
INSERT INTO classes (mentors_id, students_id, topic, class_date, location) VALUES (4, 9, 'Javascript', '2020-10-01', 'Migracode building');

INSERT INTO extra_classes (group_name, mentors_id, students_id, class_date, location) VALUES ('Apple-Group', 2, 5, '2020-10-01', 'online');
INSERT INTO extra_classes (group_name, mentors_id, students_id, class_date, location) VALUES ('Apple-Group',2, 1, '2020-10-01', 'online');

INSERT INTO extra_classes (group_name, mentors_id, students_id, class_date, location) VALUES ('Banana-Group', 1, 3, '2020-10-03', 'OCC');
INSERT INTO extra_classes (group_name, mentors_id, students_id, class_date, location) VALUES ('Banana-Group', 1, 4, '2020-10-03', 'OCC');

select * from classes;
select * from extra_classes;

SELECT * FROM mentors WHERE years = '5';
SELECT * FROM mentors where language = 'Javascript';

SELECT * FROM students where graduated = 'yes';

SELECT * FROM classes where class_date < '2020-06-01';
SELECT students_id FROM classes where topic = 'Javascript';
