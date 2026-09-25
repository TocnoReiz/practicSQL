CREATE TABLE departments(
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100)
);

INSERT INTO departments (department_name)
VALUES
    ('Разработка'),
    ('Бухгалтерия'),
    ('HR');

SELECT * FROM departments;
-- посмотреть что добавили в departments

CREATE TABLE test(
    id SERIAL PRIMARY KEY ,
    lastname VARCHAR(100),
    name VARCHAR(50),
    title VARCHAR(100),
    salary DECIMAL(9,2),
    date_of_birth DATE,
    settled_in DATE
);
INSERT INTO test (
    lastname,
    name,
    title,
    salary,
    date_of_birth,
    settled_in
)
VALUES (
           'Иванов',
           'Иван',
           'Программист',
           150000,
           '2005-07-15',
           '2026-09-01'
       );
-- закинули сотрудника в тест


ALTER TABLE test
    ADD COLUMN department_id INT,
    ADD FOREIGN KEY (department_id) REFERENCES departments(department_id);

UPDATE test
SET department_id = 1
where name = 'Иван';

SELECT * from test