CREATE DATABASE IF NOT EXISTS human_friends;

USE human_friends;

DROP TABLE IF EXISTS animals;
CREATE TABLE animals
(
	id INT PRIMARY KEY,
    nickname VARCHAR(50),
    birthday DATE,
    comands VARCHAR(250)
);

DROP TABLE IF EXISTS pack_animals;
CREATE TABLE pack_animals
(
	pack_id INT,
    nickname VARCHAR(50),
    birthday DATE,
    comands VARCHAR(250)
);

DROP TABLE IF EXISTS pets;
CREATE TABLE pets
(
	pet_id INT,
    nickname VARCHAR(50),
    birthday DATE,
    comands VARCHAR(250)
);

DROP TABLE IF EXISTS dogs;
CREATE TABLE dogs
(
	dog_id INT,
    nickname VARCHAR(50),
    birthday DATE,
    comands VARCHAR(250)
);

INSERT dogs (dog_id, nickname, birthday, comands)
VALUES
  (1, 'Тузик', "2023-01-01", 'лежать сидеть голос рядом'),
  (2, 'Шарик', "2022-04-01", 'лежать сидеть голос рядом'),
  (3, 'Моська', "2019-01-06", 'лежать сидеть голос рядом');
  
DROP TABLE IF EXISTS cats;
CREATE TABLE cats
(
	cat_id INT,
    nickname VARCHAR(50),
    birthday DATE,
    comands VARCHAR(250)
);

INSERT cats (cat_id, nickname, birthday, comands)
VALUES
  (100, 'Васька', "2022-12-01", 'лежать сидеть голос рядом'),
  (101, 'Мурка', "2022-06-01", 'лежать сидеть голос рядом'),
  (102, 'Тишка', "2019-02-02", 'лежать сидеть голос рядом');
  
DROP TABLE IF EXISTS hamsters;
CREATE TABLE hamsters
(
	hamster_id INT,
    nickname VARCHAR(50),
    birthday DATE,
    comands VARCHAR(250)
);

INSERT hamsters (hamster_id, nickname, birthday, comands)
VALUES
  (201, 'Хома', "2022-12-01", 'лежать сидеть голос рядом'),
  (202, 'Муфта', "2022-06-01", 'лежать сидеть голос рядом'),
  (203, 'Капля', "2019-02-02", 'лежать сидеть голос рядом');
  
DROP TABLE IF EXISTS horses;
CREATE TABLE horses
(
	horse_id INT,
    nickname VARCHAR(50),
    birthday DATE,
    comands VARCHAR(250)
);

INSERT horses (horse_id, nickname, birthday, comands)
VALUES
  (301, 'Гнедой', "2022-12-01", 'шагом рысцой галопом стой'),
  (302, 'Лапа', "2022-06-01", 'шагом рысцой галопом стой'),
  (303, 'Милка', "2019-02-02", 'шагом рысцой галопом стой');
  
DROP TABLE IF EXISTS camels;
CREATE TABLE camels
(
	camel_id INT,
    nickname VARCHAR(50),
    birthday DATE,
    comands VARCHAR(250)
);

INSERT camels (camel_id, nickname, birthday, comands)
VALUES
  (401, 'Верблюд1', "2022-12-01", 'шагом рысцой галопом стой'),
  (402, 'Верблюд2', "2022-06-01", 'шагом рысцой галопом стой'),
  (403, 'Верблюд3', "2019-02-02", 'шагом рысцой галопом стой');
  
DROP TABLE IF EXISTS donkeys;
CREATE TABLE donkeys
(
	donkey_id INT,
    nickname VARCHAR(50),
    birthday DATE,
    comands VARCHAR(250)
);

INSERT donkeys (donkey_id, nickname, birthday, comands)
VALUES
  (501, 'Осел1', "2022-12-01", 'шагом рысцой галопом стой'),
  (502, 'Осел2', "2022-06-01", 'шагом рысцой галопом стой'),
  (503, 'Осел3', "2019-02-02", 'шагом рысцой галопом стой');
  
INSERT INTO pets (SELECT * FROM dogs);
INSERT INTO pets (SELECT * FROM cats);
INSERT INTO pets (SELECT * FROM hamsters);
SELECT * FROM pets;

INSERT INTO pack_animals (SELECT * FROM horses);
INSERT INTO pack_animals (SELECT * FROM camels);
INSERT INTO pack_animals (SELECT * FROM donkeys);
SELECT * FROM pack_animals;

INSERT INTO animals (SELECT * FROM pets);
INSERT INTO animals (SELECT * FROM pack_animals);
SELECT * FROM animals;

DELETE FROM animals
WHERE animals.id IN (SELECT camel_id FROM camels);
SELECT * FROM animals;

DELETE FROM pack_animals
WHERE pack_animals.pack_id IN (SELECT camel_id FROM camels);
SELECT * FROM pack_animals;

DROP TABLE IF EXISTS yang_animals;
CREATE TABLE yang_animals
AS
SELECT * FROM animals
WHERE TIMESTAMPDIFF(YEAR, animals.birthday, CURRENT_DATE()) in (1,2,3);

SELECT 
	*,
    TIMESTAMPDIFF(MONTH, yang_animals.birthday, CURRENT_DATE()) AS age_in_months
FROM yang_animals; 
