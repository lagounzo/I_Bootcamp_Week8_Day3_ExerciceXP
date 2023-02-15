-- XP1
-- 1. Obtenez une liste de toutes les langues du film.

-- SELECT f.title, l.name FROM film f LEFT JOIN language l on f.language_id =l.language_id;
SELECT l.name, f.title FROM film f RIGHT JOIN language l on f.language_id =l.language_id;

--2 les films joints avec leurs langues - sélectionnez les détails suivants : titre du film, description et nom de la langue.
-- 1. Obtenez tous les films, même s'ils n'ont pas de langues.
SELECT f.title, f.description,l.name FROM film f LEFT JOIN language l on f.language_id = l.language_id;

-- 2.2Obtenez toutes les langues, même s'il n'y a pas de films dans ces langues.
SELECT f.title, l.name FROM film f RIGHT JOIN language l ON f.language_id = l.language_id;

-- 3.Créez une nouvelle table nommée new_film avec les colonnes suivantes : id, name. Ajoutez quelques nouveaux films à la table.
CREATE TABLE new_film (lg_nwfid SERIAL PRIMARY KEY, str_nwfname VARCHAR(100));

INSERT INTO new_film(str_nwfname)
VALUES ('spiderman no way home'),
('invictus'),
('matix'),
('the resident'),
('squiz game');

--4 table appelée customer_review , qui contiendra les critiques de films que les clients feront.
-- Pensez à la contrainte DELETE : si un film est supprimé, sa critique devrait être automatiquement supprimée.

CREATE TABLE customer_review(lg_curid SERIAL,
							title VARCHAR(100),
							score SMALLINT,
							review_text VARCHAR,
							last_update TIMESTAMP,
							PRIMARY KEY(lg_curid),
							fk_lg_nwfid INTEGER REFERENCES new_film (lg_nwfid) ON DELETE CASCADE,
							fk_language_id INTEGER REFERENCES language(language_id) ON DELETE CASCADE
							);

--5 Ajoutez 2 critiques de films. Assurez-vous de les lier à des objets valides dans les autres tables.

INSERT INTO customer_review(title,
							score,
							review_text,
							last_update,
							fk_lg_nwfid,
							fk_language_id)
VALUES 
('statement of NZO',8,'rsa', current_timestamp,1,1),
 ('critique de lagou',9, 'good' , current_timestamp,2,2);
 
SELECT * FROM customer_review;
SELECT * FROM new_film;
DELETE FROM new_film WHERE lg_nwfid = 2;