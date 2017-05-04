
CREATE TABLE PERSON ( 
	id INTEGER GENERATED BY DEFAULT AS IDENTITY (start with 1), 
	lastName varchar(50), 
	firstName varchar(50), 
	personType varchar(30),
	primary key (id) 
);

CREATE table ARTICLE (
	idArticle INTEGER GENERATED BY DEFAULT AS IDENTITY (start with 1), 
	price DECIMAL(10,2), 
	description varchar(20), 
	primary key (idArticle)
);

CREATE TABLE BOOK (
	idArticle INTEGER, 
	title varchar(50), 
	ISBN varchar(30), 
	primary key (idArticle), 
	FOREIGN KEY (idArticle) REFERENCES ARTICLE(idArticle)
);

CREATE table ARTIST (
	id INTEGER GENERATED BY DEFAULT AS IDENTITY (start with 1), 
	name varchar(50), 
	primary key (id)
);

CREATE table DISK (
	idArticle INTEGER, 
	idArtist INTEGER, 
	style varchar(50), 
	primary key (idArticle),
	FOREIGN KEY (idArticle) REFERENCES ARTICLE(idArticle), 
	FOREIGN KEY (idArtist) REFERENCES ARTIST(id)
);

CREATE table DVD (
	idArticle INTEGER, 
	category varchar(50), 
	idRealisateur INTEGER, 
	primary key (idArticle),
	FOREIGN KEY (idArticle) REFERENCES ARTICLE(idArticle),
	FOREIGN KEY (idRealisateur) REFERENCES PERSON(id)
);

CREATE table PLAYED_IN_DVD_PERSON(
	idDvd INTEGER,
	idVedette INTEGER,
	primary key (idDvd, idVedette),
	foreign key (idDvd) REFERENCES DVD(idArticle),
	foreign key (idVedette) REFERENCES PERSON(id)
);

CREATE TABLE WROTE_BY_AUTHOR_BOOK (
	idBook INTEGER, 
	idAuthor INTEGER, 
	PRIMARY KEY (idBook, idAuthor), 
	FOREIGN KEY (idBook) REFERENCES BOOK(idArticle), 
	FOREIGN KEY (idAuthor) REFERENCES PERSON(id)
);

-- un article peut etre un livre, un disque ou un dvd
-- un livre a un ou plusieurs auteurs
-- un cd peut etre realis� par un artiste ou un groupe
-- un cd appartient a un style musical
-- un dvd a une categorie , un realisateur et une ou plusieures vedettes


-- je veux pouvoir recuperer la totalit� des oeuvre d'un artiste
-- je veux pouvoir connaitre la somme (prix) des ventes effectu�e par categorie d'articles
-- je veux savoir quel style musical connait les meilleures ventes
-- je veux resister � l'injection sql
-- je veux pouvoir mettre � jour le prix des articles
-- les op�rations CRUD doivent etre disponible pour chaque table
