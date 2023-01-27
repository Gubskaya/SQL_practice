CREATE TABLE universities
(
    id INTEGER NOT NULL  PRIMARY KEY,
    university_name VARCHAR(100) NOT NULL
);

CREATE TABLE departments
(
    id INTEGER NOT NULL  PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    id_university INTEGER REFERENCES universities(id)
);

CREATE TABLE groups
(
    id INTEGER NOT NULL  PRIMARY KEY,
    group_name VARCHAR(100) NOT NULL UNIQUE,
    department_id INTEGER REFERENCES departments(id)
);

CREATE TABLE subjects
(
    id INTEGER NOT NULL  PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL
);

CREATE TABLE marks
(
    id INTEGER NOT NULL  PRIMARY KEY,
    student_id INTEGER REFERENCES students(id),
    mark INTEGER NOT NULL,
    subject_id INTEGER REFERENCES subjects(id)
);



INSERT INTO universities VALUES (1, 'Harvard University'),
                                (2, 'Massachusetts Institute of Technology'),
                                (3, 'Stanford University');

INSERT INTO departments VALUES (1, 'Faculty of Technology', 1),
                               (2, 'Computer Science', 1),
                               (3, 'Faculty of Education', 2),
                               (4, 'Faculty of the Social Science', 3);

INSERT INTO groups VALUES  (1, 'FT-122', 1),
                           (2, 'FT-121', 1),
                           (3, 'CS-119', 2),
                           (4, 'FE-120', 3),
                           (5, 'FSS-121', 4);

INSERT INTO subjects VALUES (1, 'Introduction to Information Technology'),
                            (2, 'Fundamental Mathematics'),
                            (3, 'Fundamental of Electrical Engineering'),
                            (4, 'Structured Programming Language');

INSERT INTO students VALUES (1, 'Jean Clark', 1, '03-01-1999'),
                            (2, 'Maria Bailey', 3, '08-10-1998'),
                            (3, 'Mary Richardson', 2, '04-07-2000'),
                            (4, 'Diana Wagner', 4, '05-11-2001'),
                            (5, 'Mildred Lewis', 5, '10-10-1999');

INSERT INTO marks VALUES (1, 1, 100, 1),
                         (2, 1, 98, 2),
                         (3, 1, 95, 3),
                         (4, 1, 89, 4),
                         (5, 2, 78, 1),
                         (6, 2, 98, 2),
                         (7, 2, 91, 3),
                         (8, 2, 89, 4),
                         (9, 3, 59, 1),
                         (10, 3, 60, 2),
                         (11, 3, 65, 3),
                         (12, 3, 67, 4),
                         (13, 4, 100, 1),
                         (14, 4, 91, 2),
                         (15, 4, 95, 3),
                         (16, 4, 99, 4),
                         (17, 5, 34, 1),
                         (18, 5, 40, 2),
                         (19, 5, 25, 3),
                         (20, 5, 37, 4);

--среднее арифметическое всех оценок определенного студента
SELECT AVG(mark) FROM marks
WHERE student_id = 1;

--полная информация по студенту – ФИО, Название Группы, Название Факультета, Название Университета
SELECT first_name, group_name, department_name, university_name
FROM students JOIN groups JOIN departments JOIN universities
ON departments.id_university = universities.id ON groups.department_id = departments.id ON students.group_id = groups.id;