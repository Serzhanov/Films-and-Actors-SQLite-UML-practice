DROP VIEW IF EXISTS Actors_view;
DROP VIEW IF EXISTS RecapFilms_view;
DROP TABLE IF EXISTS ActorHas;
DROP TABLE IF EXISTS DirectorHas;
DROP TABLE IF EXISTS HasGenre;
DROP TABLE IF EXISTS Genres;
DROP TABLE IF EXISTS Roles;
DROP TABLE IF EXISTS Birth;
DROP TABLE IF EXISTS CreatedBy;
DROP TABLE IF EXISTS WasFilmed;
DROP TABLE IF EXISTS HasGenre;
DROP TABLE IF EXISTS Achievements;
DROP TABLE IF EXISTS Actors;
DROP TABLE IF EXISTS Films;
DROP TABLE IF EXISTS Directors;
DROP TABLE IF EXISTS Country;


PRAGMA FOREIGN_KEYS=ON;


CREATE TABLE Actors (
	actor_first_name TEXT NOT NULL,
	actor_last_name TEXT NOT NULL,
	birth_date DATE NOT NULL,
CONSTRAINT pk1_actors PRIMARY KEY (actor_first_name, actor_last_name)
);

CREATE TABLE Films (
	film_name TEXT NOT NULL,
	rating FLOAT NOT NULL,
	profit INTEGER NOT NULL,
CONSTRAINT pk1_films PRIMARY KEY (film_name)
);

CREATE TABLE Directors (
	director_first_name TEXT NOT NULL,
	director_last_name TEXT NOT NULL,
CONSTRAINT pk1_directors PRIMARY KEY 
(director_first_name, director_last_name)
);



CREATE TABLE Country(
country_name TEXT NOT NULL,
CONSTRAINT pk1_country PRIMARY KEY (country_name)
);

CREATE TABLE Genres (
	genre_name TEXT NOT NULL,
	rating FLOAT,
CONSTRAINT pk1_genres PRIMARY KEY (genre_name)
);

CREATE TABLE Roles(
	actor_first_name TEXT NOT NULL,
actor_last_name TEXT NOT NULL,
film_name TEXT NOT NULL,
role_name TEXT NOT NULL,
CONSTRAINT pk1_roles PRIMARY KEY 
(actor_first_name, actor_last_name, film_name)
CONSTRAINT fk1_roles FOREIGN KEY (actor_first_name,actor_last_name) 
REFERENCES Actors(actor_first_name,actor_last_name)
	CONSTRAINT fk2_roles FOREIGN KEY (film_name) 
REFERENCES Films(film_name)
);

CREATE TABLE Birth(
	actor_first_name TEXT NOT NULL,
actor_last_name TEXT NOT NULL,
country_name TEXT NOT NULL,
CONSTRAINT pk1_birth PRIMARY KEY 
(actor_first_name, actor_last_name, country_name)
CONSTRAINT fk1_birth FOREIGN KEY (actor_first_name,actor_last_name) 
REFERENCES Actors(actor_first_name,actor_last_name),
	CONSTRAINT fk2_birth FOREIGN KEY (country_name) 
REFERENCES Country(country_name)
);

CREATE TABLE ActorHas(
	actor_first_name TEXT NOT NULL,
actor_last_name TEXT NOT NULL,
ach_name TEXT NOT NULL,
CONSTRAINT pk1_actorhas PRIMARY KEY 
(actor_first_name, actor_last_name, ach_name),
CONSTRAINT fk1_actorhas FOREIGN KEY (actor_first_name,actor_last_name) 
REFERENCES Actors(actor_first_name,actor_last_name),
	CONSTRAINT fk2_actorhas FOREIGN KEY (ach_name) 
REFERENCES Achievements(ach_name)
);

CREATE TABLE DirectorHas(
	director_first_name TEXT NOT NULL,
director_last_name TEXT NOT NULL,
ach_name TEXT NOT NULL,
CONSTRAINT pk1_directorhas PRIMARY KEY 
(director_first_name, director_last_name, ach_name)
CONSTRAINT fk1_directorhas FOREIGN KEY (director_first_name,director_last_name) 
REFERENCES Directors(director_first_name,director_last_name),
	CONSTRAINT fk2_directorhas FOREIGN KEY (ach_name) 
REFERENCES Achievements(ach_name)
);

CREATE TABLE CreatedBy(
	film_name TEXT NOT NULL,
	director_first_name TEXT NOT NULL,
director_last_name TEXT NOT NULL,
CONSTRAINT pk1_createdby PRIMARY KEY 
(film_name),
	CONSTRAINT fk1_createdby FOREIGN KEY (film_name) 
REFERENCES Films(film_name),
CONSTRAINT fk2_createdby FOREIGN KEY (director_first_name,director_last_name) 
REFERENCES Directors(director_first_name,director_last_name)
);

CREATE TABLE WasFilmed(
	film_name TEXT NOT NULL,
	country_name TEXT NOT NULL,
CONSTRAINT pk1_createdby PRIMARY KEY 
(film_name, country_name)
	CONSTRAINT fk1_wasfilmed FOREIGN KEY (film_name) 
REFERENCES Films(film_name)
CONSTRAINT fk2_wasfilmed FOREIGN KEY (country_name) 
REFERENCES Country(country_name)
);

CREATE TABLE HasGenre(
	film_name TEXT NOT NULL,
	genre_name TEXT NOT NULL,
CONSTRAINT pk1_hasgenre PRIMARY KEY 
(film_name,genre_name),
	CONSTRAINT fk1_hasgenre FOREIGN KEY (film_name) 
REFERENCES Films(film_name),
CONSTRAINT fk2_hasgenre FOREIGN KEY (genre_name) 
REFERENCES Genres(genre_name));

CREATE TABLE Achievements(
	ach_name TEXT NOT NULL,
	CONSTRAINT pk1_achievement PRIMARY KEY (ach_name)
);


CREATE VIEW [Actors_view] AS
	SELECT actor_first_name,actor_last_name,film_name,role_name,ach_name,country_name,strftime('%Y','now')- strftime('%Y',birth_date) AS age
	FROM Roles JOIN Birth USING(actor_first_name,actor_last_name) JOIN Actors USING(actor_first_name,actor_last_name) JOIN ActorHas USING (actor_first_name,actor_last_name);

CREATE VIEW [RecapFilms_view] AS
	SELECT film_name,profit,rating,genre_name,director_first_name,director_last_name,country_name
	FROM Films JOIN HasGenre USING(film_name) JOIN CreatedBy USING(film_name) JOIN WasFilmed USING (film_name);	 
