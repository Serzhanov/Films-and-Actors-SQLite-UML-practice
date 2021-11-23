#!/usr/bin/python3

from utils import db


def donner_taille(cur):#number of colonnes
    lines=cur.fetchall()
    return len(lines[0])

def affichage(cur):
    lines=cur.fetchall()#creating tuples of name colonnes
    for line in lines:
        print(line)



def modifie_de_donnee(conn):
    cur=conn.cursor()
    t=input("Donnez la table pour modifier\n")
    cur.execute(f'SELECT * FROM {t};')
    field = [i[0] for i in cur.description]
    print(field)
    affichage(cur)
    col=input("Donnez le nom de la colonne a modifier qui est au dessus\n")
    col2=input("Donnez le nom de la colonne pour orienation\n")
    colum=input("Donnez le nom d'attribut a trouvé pour orientation\n")
    colum2=input("Donnez le nom d'attribut a modifier\n")
    try:
        cur.execute(f'UPDATE {t} SET {col}="{colum2}" WHERE {col2}="{colum}";')
        cur.execute(f'SELECT * FROM {t};')
        affichage(cur)
    except:
        print("ERROR\n")
    #example t->Country,colum2->country_name=Russia,colum->country_name=France

def add_column(conn):
    cur=conn.cursor()
    t=input("Donnez la base a modiifer\n")
    column=input("Donnez le nom de la colonne a ajouter\n")
    typ=input("Donne le nouveau type de donnes de cette colonne\n")
    cur.execute(f'ALTER TABLE {t} ADD COLUMN {column} {typ};')
    cur.execute(f'SELECT * FROM {t};')
    field = [i[0] for i in cur.description]
    print(field)
    affichage(cur)

def name_of_actor_same_as_director(conn):
    cur=conn.cursor()
    cur.execute('SELECT DISTINCT actor_first_name,actor_last_name,film_name FROM Actors JOIN CreatedBy WHERE actor_first_name=director_first_name AND actor_last_name=director_last_name;')
    affichage(cur)

def name_of_actors_who_was_born_in(conn):#SELECTION ET PROJECTION
    table=input("Donnez le nom de pays pour afficher les acteurs qui sont nés dans ce pays\n")
    cur = conn.cursor()
    cur.execute(f'SELECT actor_first_name,actor_last_name FROM Birth WHERE country_name=?',(table,))
    affichage(cur)

def name_of_people_who_has_achiv(conn):#OPERATEURS ENSEMBELITE
    cur=conn.cursor()
    cur.execute("SELECT actor_last_name,ach_name FROM ActorHas UNION SELECT director_last_name,ach_name FROM DirectorHas;")
    affichage(cur)

def actors_view(conn):
    cur=conn.cursor()
    cur.execute('SELECT * FROM Actors_view')
    affichage(cur)

def films_view(conn):
    cur=conn.cursor()
    cur.execute('SELECT * FROM RecapFilms_view')
    affichage(cur)

def more_profit_film(conn):#joinure
    cur=conn.cursor()
    cur.execute("SELECT film_name,actor_first_name,actor_last_name,MAX(profit) FROM Films JOIN Roles USING (film_name)")
    affichage(cur)

def select_tous_les_actors(conn):
    """
    Affiche la liste de tous les acteurs.

    :param conn: Connexion à la base de données
    """
    cur = conn.cursor()
    cur.execute("SELECT * FROM Actors")

    affichage(cur)

def select_tous_les_directors(conn):
    cur=conn.cursor()
    cur.execute("SELECT * FROM Directors")
    affichage(cur)
    conn.close()

def select_tous_les_roles(conn):
    cur=conn.cursor()
    cur.execute("SELECT * FROM Roles")
    affichage(cur)


def select_tous_les_films(conn):
    cur=conn.cursor()
    cur.execute("SELECT * FROM Films")
    affichage(cur)

def select_tous_les_genres(conn):
    cur=conn.cursor()
    cur.execute("SELECT * FROM Genres")
    affichage(cur)

def select_tous_les_countries(conn):
    db_file = "data/Project2_INF403.db"

    # Créer une connexion a la BD
    cur=conn.cursor()
    cur.execute("SELECT * FROM Country")
    affichage(cur)

def aff(conn):
    cur=conn.cursor()
    s=input("Tapez base quelle vous voulez afficher \n")
    cur.execute(f'SELECT * FROM {s}')
    affichage(cur)

def select_tous_les_reussites_actors(conn):
    cur=conn.cursor()
    cur.execute("SELECT * FROM ActorHas")
    affichage(cur)


def select_tous_les_reussites_directors(conn):
    cur = conn.cursor()
    cur.execute("SELECT * FROM DirectorHas")
    affichage(cur)

def ajouter_list(donnees,taille):
    for i in range(taille):
        s=input("")
        donnees.append(s)
    return donnees

def free_requette(conn):
    cur=conn.cursor()
    s=input("Donnez votre requett\n")
    cur.execute(s)
    affichage(cur)

def insert_de_donnees(conn):
    try:
        donnees=[]
        table = input("Donnez le nom de la table et les valeurs pour inserer\n")
        cur = conn.cursor()
        cur.execute(f'SELECT * FROM {table};')
        field2 = [i[0] for i in cur.description]
        print(field2)
        taille=donner_taille(cur)
        donnees=ajouter_list(donnees, taille)
        donnees2=', '.join('?' * len(donnees))
        field = [i[0] for i in cur.description]
        field=', '.join(field)
        querry=f"INSERT INTO {table} (%s) VALUES (%s);" % (field,donnees2)
        print(querry)
        cur.execute(querry,donnees)
        cur.execute(f"SELECT * FROM {table};")
        choix=input("Tapez 1 pour afficher la table apres l'insertion\n")
        if(choix=='1'):
            affichage(cur)

        #conn.close()
    except:
        print("ERROR",end='\n')


def delete_donnees(conn):
    try:
        table=input("Donnez le nom de la table \n")
        cur=conn.cursor()
        cur.execute(f"SELECT * FROM {table}")
        colonne=input("Donnez le nom de la colonne de key \n")
        attribut=input("Donnez le nom de l'attribut a supprimer \n")
        print(f'DELETE FROM {table} WHERE {colonne}="{attribut}";')
        cur.execute(f'DELETE FROM {table} WHERE {colonne}=?;',(attribut,))
        cur.execute(f"SELECT * FROM {table};")
        choix=input("Tapez 1 pour afficher la table apres supprimage\n")
        if (choix=='1'):
            affichage(cur)
    except:
        print("ERROR",end='\n')

def mod(choix,conn):
    if choix=='Update':
        modifie_de_donnee(conn)
    elif choix=='Insert':
        insert_de_donnees(conn)
    elif choix=='Delete':
        delete_donnees(conn)
    elif choix=='Add':
        add_column(conn)
    else:
        print("L'option n a pas trouvé")

def moder(conn):
    print("VOUS ETES DANS LE MENU DE MODIFICATION")
    m="Tapez 'Insert pour inserer les donnees\n" \
      "Tapez 'Update' pour modifier les donnees\n" \
      "Tapez 'Delete' pour supprimer les donnees\n" \
      "Tapez 'Add' pour ajouter a colonne\n"
    print(m)
    choix=input("")
    mod(choix,conn)

def choisir(conn,choix):
    if choix=='Actors':
        select_tous_les_actors(conn)
    elif choix=='Directors':
        select_tous_les_directors(conn)
    elif choix=='Genres':
        select_tous_les_genres(conn)
    elif  choix == 'Films':
        select_tous_les_films(conn)
    elif choix=='Actors info':
        actors_view(conn)
    elif choix=='Le plus profit':
        more_profit_film(conn)
    elif choix=='Achievements':
        name_of_people_who_has_achiv(conn)
    elif choix=='Born':
        name_of_actors_who_was_born_in(conn)
    elif choix=='Films info':
        films_view(conn)
    elif choix=='Free':
        free_requette(conn)
    elif choix=='Print':
        aff(conn)
    elif choix=='Actor same as director':
        name_of_actor_same_as_director(conn)
    elif choix=='Options':
        moder(conn)
    else:
        print("Error ,retapez correctement\n")

def main():
    # Nom de la BD à créer
    db_file = "data/Project2_INF403.db"
    conn = db.creer_connexion(db_file)
    print("C'est la premiere fois que vous lancez le programme?")
    st=input("Tapez 'yes' ou l'autre \n")
    if st=='yes':
        db.mise_a_jour_bd(conn, "data/actors_creation.sql")
        db.mise_a_jour_bd(conn, "data/film_insert_ok.sql")
    print('BONJOUR')
    selection2 = input("Tapez 'y' pour continuer ou d'autre key pour sortir\n")
    while(selection2=='y'):
    # Créer une connexion a la BD


        menu="Tapez 'Actors' pour voir tous les acteurs \n" \
             "Tapez 'Directors' pour voir tous les realisateurs \n" \
             "Tapez 'Genres' pour voir tous les genres des films\n" \
             "Tapez 'Films' pour voir tous les films \n" \
             "Tapez 'Actors info' pour voir information complete de tous les acteurs \n" \
             "Tapez 'Le plus profit' pour  voir information de le plus profit film \n" \
             "Tapez 'Achievements' pour voir tous les reussites des acterus et realisateurs \n" \
             "Tapez 'Born' pour voir le pays d'origine de l'acteur \n" \
             "Tapez 'Films info' pour voir information complete de chaque film \n" \
             "Tapez 'Free' pour donne votre propre requette \n" \
             "Tapez 'Print' pour afficher la base ce que vous allez preciser\n" \
             "Tapez 'Actor same as director' pour afficher une personne qui peut etre acteur et realisateur dans le film\n" \
             "Tapez 'Options' pour voir le menu de modifications\n"

        print(menu)
        selection = input("")
        choisir(conn,selection)
        conn.commit()
        selection2 = input("Tapez 'y' pour continuer ou d'autre key pour sortir\n")
    conn.close()

if __name__ == "__main__":
    main()
