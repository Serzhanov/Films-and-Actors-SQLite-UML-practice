
INSERT INTO Achievements (ach_name)
VALUES ("Golden Horse Award"),("Emmy Award for Outstanding Historical Programming"),
		("MTV Movie Award for Best Male Performance legend"),("MTV Movie Award for Best Fight"),
		("Golden Globe Award for Best Actor"),
		
		("Taurus World Stunt Awards for Best Fire"),
		("Golden Globe Award for Best Supporting Actor"),
		("Academy Award for Best Picture"),
		
		("Saturn Award for Best Science Fiction Film"),
		("Best Actor The 6th Day (2000)"),
		
		("Women Film Critics Circle Award for Most Offensive Male Characters");

INSERT INTO Actors (actor_first_name,actor_last_name,birth_date)
VALUES ("Jackie","Chan","1954-04-07"),("Will","Smith","1968-09-25"),
		("Angelina","Jolie","1975-07-04"),("Brad","Pitt","1963-12-18"),
		("Johny","Depp","1963-07-09"),("Arnold","Schwarzenegger","1947-08-30"),
		("Sylvester","Stallone","1946-07-6"),("Jason","Statham","1967-07-26"),("Jet","Li","1963-04-26");

INSERT INTO Films (film_name,rating,profit)
VALUES("Rush Hour",8.3,244.3),
		("I'm legend",7.9,585.3),
		("Mr. & Mrs. Smith",6.4,487.3),
		("Pirates of the Caribbean: The Curse of the Black Pearl",8.3,654.4),
		("The Terminator",8.3,78.3),
		("The Expendables",7.5,93.2),
		("Rocky",9.2,225.1),
		("Crank",7.1,140.9);

INSERT INTO Country (country_name)
VALUES ("China"),("USA"),("Egypt"),("Grenada"),("England"),("France");

INSERT INTO Roles (actor_first_name,actor_last_name,film_name,role_name)
VALUES ("Jackie","Chan","Rush Hour","agent FBI"),
		("Will","Smith","I'm legend","surviver"),
		("Angelina","Jolie","Mr. & Mrs. Smith","Mrs."),
		("Brad","Pitt","Mr. & Mrs. Smith","Mr."),
		("Johny","Depp","Pirates of the Caribbean: The Curse of the Black Pearl","pirate"),
		("Sylvester","Stallone","The Expendables","special agent"),
		("Jason","Statham","The Expendables","special agent"),
		("Jet","Li","The Expendables","special agent"),
		("Arnold","Schwarzenegger","The Expendables","special agent"),
		("Jason","Statham","Crank","unhuman"),
		("Sylvester","Stallone","Rocky","boxer"),
		("Arnold","Schwarzenegger","The Terminator","robot");

INSERT INTO Genres(genre_name,rating)
VALUES("Comedy",8.4),("Action",8.9),("Drama",7.2),("Adventure",6.0),("Romance",7.2),("Fantasy",6.9),("Thrilles",9.0),("Sport",6.2);

INSERT INTO Directors("director_first_name","director_last_name")
VALUES ("Brett","Ratner"),("Francis","Lawrence"),("Doug","Liman"),("Gore","Verbinski"),("Sylvester","Stallone"),("James","Cameron"),("Mark","Neveldine");

INSERT INTO DirectorHas("director_first_name","director_last_name","ach_name")
VALUES ("Brett","Ratner","Emmy Award for Outstanding Historical Programming"),
		("Francis" ,"Lawrence","MTV Movie Award for Best Male Performance legend"),
		("Doug","Liman","MTV Movie Award for Best Fight"),
		("Sylvester","Stallone","Taurus World Stunt Awards for Best Fire"),
		("Sylvester","Stallone","Academy Award for Best Picture"),
		("James","Cameron","Saturn Award for Best Science Fiction Film");
		

INSERT INTO ActorHas (actor_first_name,actor_last_name,ach_name)
VALUES ("Jackie","Chan","Golden Horse Award"),("Johny","Depp","Golden Globe Award for Best Actor"),
		("Arnold","Schwarzenegger","Best Actor The 6th Day (2000)"),
		("Sylvester","Stallone","Golden Globe Award for Best Supporting Actor"),
		("Jason","Statham","Women Film Critics Circle Award for Most Offensive Male Characters");

INSERT INTO CreatedBy(film_name,director_first_name,director_last_name)
VALUES ("Rush Hour","Brett","Ratner"),
		("I'm legend","Francis" ,"Lawrence"),
		("Mr. & Mrs. Smith","Doug","Liman"),
		("Pirates of the Caribbean: The Curse of the Black Pearl","Gore","Verbinski"),
		("Rocky","Sylvester","Stallone"),
		("The Expendables","Sylvester","Stallone"),
		("The Terminator","James","Cameron"),
		("Crank","Mark","Neveldine");

INSERT INTO Birth ("actor_first_name","actor_last_name","country_name")
VALUES ("Jackie","Chan","China"),
		("Will","Smith","USA"),
		("Angelina","Jolie","USA"),
		("Brad","Pitt","USA"),
		("Johny","Depp","USA"),
		("Sylvester","Stallone","USA"),
		("Arnold","Schwarzenegger","USA"),
		("Jason","Statham","USA"),
		("Jet","Li","China");

INSERT INTO WasFilmed ("film_name","country_name")
VALUES ("Rush Hour","China"),
		("I'm legend","USA"),
		("Mr. & Mrs. Smith","USA"),
		("Mr. & Mrs. Smith","Egypt"),
		("Pirates of the Caribbean: The Curse of the Black Pearl","USA"),
		("Pirates of the Caribbean: The Curse of the Black Pearl","Grenada"),
		("The Terminator","USA"),
		("The Expendables","USA"),
		("The Expendables","France"),
		("The Expendables","England"),
		("Crank","USA"),
		("Rocky","USA");


INSERT INTO HasGenre ("film_name","genre_name")
VALUES ("Rush Hour","Comedy"),("Rush Hour","Action"),
		("I'm legend","Action"),("I'm legend","Fantasy"),
		("Mr. & Mrs. Smith","Action"),("Mr. & Mrs. Smith","Romance"),
		("Mr. & Mrs. Smith","Drama"),
		("Pirates of the Caribbean: The Curse of the Black Pearl","Adventure"),
		("Pirates of the Caribbean: The Curse of the Black Pearl","Fantasy"),
		("Pirates of the Caribbean: The Curse of the Black Pearl","Action"),
		("The Terminator","Action"),
		("The Terminator","Fantasy"),
		("The Expendables","Action"),
		("The Expendables","Adventure"),
		("The Expendables","Thrilles"),
		("Crank","Action"),
		("Crank","Fantasy"),
		("Rocky","Action"),
		("Rocky","Sport");
