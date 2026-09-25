# Конспект по SQL — базовые команды

## Ограничения на значения в таблице (constraints)

| Ограничение | Что делает |
|---|---|
| `NOT NULL` | Значение в колонке не может быть пустым |
| `UNIQUE` | Значение в колонке должно быть уникальным (не повторяться) |
| `PRIMARY KEY` | Первичный ключ — уникальный идентификатор строки. Автоматически подразумевает `NOT NULL` + `UNIQUE` |
| `FOREIGN KEY` | Внешний (вторичный) ключ — ссылается на PRIMARY KEY другой таблицы, связывает таблицы между собой |
| `DEFAULT` | Значение по умолчанию, если ничего не указано |
| `CHECK` | Проверка условия (например, возраст больше 0) |

---

## Создание таблицы

```sql
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT DEFAULT 18
);
```

**Разбор:**
- `id INT PRIMARY KEY` — колонка `id`, тип целое число, первичный ключ
- `name VARCHAR(50) NOT NULL` — имя, текст до 50 символов, обязательно к заполнению
- `email VARCHAR(100) UNIQUE` — email, должен быть уникальным у каждого
- `age INT DEFAULT 18` — возраст, если не указать — подставится 18

---

## Первичный ключ (PRIMARY KEY)

Уникально определяет каждую строку в таблице. В одной таблице может быть только один PRIMARY KEY (но он может состоять из нескольких колонок — составной ключ).

```sql
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    product VARCHAR(50)
);
```

Составной первичный ключ (из двух колонок):
```sql
CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    PRIMARY KEY (order_id, product_id)
);
```

---

## Внешний ключ (FOREIGN KEY)

Связывает одну таблицу с другой — значение в колонке должно существовать как PRIMARY KEY в связанной таблице.

```sql
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES students(id)
);
```

Здесь `student_id` в таблице `orders` может содержать только те значения, которые есть в колонке `id` таблицы `students`.

---

## Добавление колонки в существующую таблицу

```sql
ALTER TABLE students
ADD email VARCHAR(100);
```

## Удаление колонки

```sql
ALTER TABLE students
DROP COLUMN age;
```

## Изменение типа колонки

```sql
ALTER TABLE students
ALTER COLUMN name VARCHAR(100);
```
*(в MySQL синтаксис немного другой: `MODIFY COLUMN name VARCHAR(100);`)*

---

## Удаление таблицы

```sql
DROP TABLE students;
```

## Очистка таблицы (удалить все строки, но оставить структуру)

```sql
TRUNCATE TABLE students;
```

---

## Базовые команды для работы с данными

### Добавить строку
```sql
INSERT INTO students (id, name, email, age)
VALUES (1, 'Дмитрий', 'dima@mail.com', 19);
```

### Посмотреть данные
```sql
SELECT * FROM students;
```

### Изменить данные
```sql
UPDATE students
SET age = 20
WHERE id = 1;
```

### Удалить строку
```sql
DELETE FROM students
WHERE id = 1;
```

---

## Заметки
- `VARCHAR(n)` — текст переменной длины, максимум n символов
- `INT` — целое число
- `WHERE` — обязательно указывать в `UPDATE`/`DELETE`, иначе изменится/удалится **вся таблица**
