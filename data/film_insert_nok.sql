/*Error reptetition de la valeur unique*/
INSERT INTO Achievements (ach_name)
VALUES ("Golden Horse Award"),("Emmy Award for Outstanding Historical Programming"),("Golden Horse Award");
/*Error Foreign key echoue Leonardo Dicaprio n'existe pas dans Actors*/
INSERT INTO ActorHas (actor_first_name,actor_last_name,ach_name)
VALUES ("Leonardo","Dicaprio","Oskar");
/*Error Foreign key echoue Leonardo Dicaprio n'existe pas dans Directors*/
INSERT INTO DirectorsHas (director_first_name,director_last_name,ach_name)
VALUES ("Leonardo","Dicaprio","Oskar");
/*Error of not existing Country (Canada n'existe pas dans la table Country)*/

INSERT INTO Actors (actor_first_name,actor_last_name,birth_date)
VALUES ("Johny","Depp","1963-06-9");
INSERT INTO Birth (actor_first_name,actor_last_name,country_name)
VALUES ("Johny","Depp","Canada");
