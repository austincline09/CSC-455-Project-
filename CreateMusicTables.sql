/*  
	Created by Jeremy Timothy Brown
	Version 2.5
	Last Update 11/02/2016 12:23PM EST
*/


/*If the following tables exist, remove them from the database*/
DROP TABLE IF EXISTS savedsongs;
DROP TABLE IF EXISTS savedalbums;
DROP TABLE IF EXISTS currentSearch;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS lyrics;
DROP TABLE IF EXISTS albumAwards;
DROP TABLE IF EXISTS songAwards;
DROP TABLE IF EXISTS songs;
DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;
DROP TABLE IF EXISTS awards;
DROP TABLE IF EXISTS genres;


/* This table will hold member data after a user has entered a user name and a password if desired.
This table's children are savedsongs and savedalbums, which hold the songs andd albums that a specific user saved */
CREATE TABLE members(
	User_Name				VARCHAR(50) NOT NULL,						/* Primary Key. can be up to 50 characters.  cannot be null. */
	Password				VARCHAR(50) NOT NULL DEFAULT 'password',	/* can be up to 50 characters.  cannot be null, although is set to 'password' when it is deleted */
	PRIMARY KEY (User_Name)										
	)ENGINE = INNODB;

/* This table will hold every song saved by a specific user.
This table is a child to songs and members */
CREATE TABLE savedsongs(
	User_Name				VARCHAR(50) NOT NULL,						/* Foreign Key. can be up to 50 characters.  cannot be null. */
	Song_ID					SMALLINT UNSIGNED NOT NULL,					/* Foreign Key. can be any integer >= 0, but less than 65535. can not be null.*/
	PRIMARY KEY (User_Name, Song_ID),
	FOREIGN KEY (User_Name) REFERENCES members (User_Name)				/* Checks if the User_Name is in the members table */
		ON DELETE CASCADE												/* If removed in parent table, remove in this table.  every proceeding ON DELETE CASCADE does the same thing  */
		ON UPDATE CASCADE,
	FOREIGN KEY (Song_ID) REFERENCES songs (SONG_ID)					/* Checks if the song ID is in the songs table */
		ON DELETE CASCADE												/* If removed in parent table, remove in this table.  every proceeding ON DELETE CASCADE does the same thing  */
		ON UPDATE CASCADE
	)ENGINE=INNODB;

/* This table will hold every album saved by a specific user.
This table is a child to albums and members */
CREATE TABLE savedalbums(
	User_Name				VARCHAR(50) NOT NULL,						/* Foreign Key. can be up to 50 characters.  cannot be null. */
	Album_ID				SMALLINT UNSIGNED NOT NULL,					/* Foreign Key. can be any integer >= 0, but less than 65535. can not be null.*/
	PRIMARY KEY (User_Name, Album_ID),
	FOREIGN KEY (User_Name) REFERENCES members (User_Name)				/* Checks if the User_Name is in the members table */
		ON DELETE CASCADE												/* If removed in parent table, remove in this table.  every proceeding ON DELETE CASCADE does the same thing  */
		ON UPDATE CASCADE,
	FOREIGN KEY (Album_ID) REFERENCES album (Album_ID)					/* Checks if the album ID is in the album table */
		ON DELETE CASCADE												/* If removed in parent table, remove in this table.  every proceeding ON DELETE CASCADE does the same thing  */
		ON UPDATE CASCADE
	)ENGINE=INNODB;
	

CREATE TABLE currentSearch(
	ID						SMALLINT UNSIGNED NOT NULL,
	PRIMARY KEY (ID)
	)ENGINE=INNODB;

	
/* This table holds every genre name that is associated with an album or a song.
Genre_ID is to be assigned as a foreign key in the album and song tables.
The actual name of the genre can then be retrieved from here. 
This table's children are song and album. */
CREATE TABLE genres(
	Genre_ID				SMALLINT UNSIGNED NOT NULL,					/* Primary Key. can be any integer >= 0, but less than 65535. can not null. */ 
	Genre_Name				VARCHAR(50) NOT NULL,						/* Primary Key. can be up to 50 characters.  cannot be null.*/
	PRIMARY KEY (Genre_ID)
	)ENGINE = INNODB;

/* This table holds the award ID and the correlating name.
This table's children are album, artist, and song. */
CREATE TABLE awards(
	Award_ID				SMALLINT UNSIGNED NOT NULL,					/* Primary Key. can be any integer >= 0, but less than 65535. can not null.*/
	Award_Name				VARCHAR(100) NOT NULL,						/* can be up to 100 characters.  cannot be null.*/
	PRIMARY KEY (Award_ID)
	)ENGINE = INNODB;
	

/* This table holds the artist ID and the correlating name.
This table's children are album and song.*/
CREATE TABLE artists(
	Artist_ID				SMALLINT UNSIGNED NOT NULL,					/* Primary Key. can be any integer >= 0, but less than 65535. can not null.*/
	Artist_Name				VARCHAR(100) NOT NULL,						/* can be up to 100 characters.  cannot be null.*/				
	PRIMARY KEY (Artist_ID)
	)ENGINE = INNODB;

	
/* This table holds the album ID, the correlating name, it's length, release date, genre, artist, and award.
This table is a child of genre, artist, and award.
It's child is song. */
CREATE TABLE albums(
	Album_ID				SMALLINT UNSIGNED NOT NULL,					/* Primary Key. can be any integer >= 0, but less than 65535. can not null.*/
	Album_Name				VARCHAR(100) NOT NULL,						/* can be up to 100 characters.  cannot be null.*/
	Album_Length			TIME DEFAULT NULL,							/* TIME format -> HHH:MM:SS.  the default can be null.*/
	Released				DATE DEFAULT NULL,							/* DATE format -> YYYY-MM-DD. can be null if not released or unknown.*/
	Genre_ID				SMALLINT UNSIGNED NOT NULL,					/* Foreign Key. can be any integer >= 0, but less than 65535. can not null.*/
	Artist_ID				SMALLINT UNSIGNED NOT NULL,					/* Foreign Key. can be any integer >= 0, but less than 65535. can not null.*/
	PRIMARY KEY	(Album_ID),
	FOREIGN KEY (Genre_ID) REFERENCES genres (Genre_ID)					/* Checks if the genre ID is in the genre table */
		ON DELETE CASCADE												/* If removed in parent table, remove in this table.  every proceeding ON DELETE CASCADE does the same thing  */
		ON UPDATE CASCADE,												/* If updated in parent table, update in this table.  every proceeding ON UPDATE CASCADE does the same thing  */
	FOREIGN KEY (Artist_ID) REFERENCES artists (Artist_ID)				/* Checks if the artist ID is in the artist table */
		ON DELETE CASCADE
		ON UPDATE CASCADE
	)ENGINE = INNODB;


/* This table holds the song ID, the correlating name, it's length, 
when it was released, it's genre, artist, award, album, lyrics,
and who the song was originally by.
	Since this table includes who the song was originally by, we can tell
	If this artist is the creator or covering it.
	If Artist_ID = Originally By then creator.
	else if Artist_ID != Originally_By then cover.
	It is set up like this, beacuse a cover can include a different length, release date, lyrics, genre etc.
	We can use this to find all of the coveres of a specific song.
This table is a child to genre, artist, award, album, and lyric. */
CREATE TABLE songs(
	Song_ID					SMALLINT UNSIGNED NOT NULL,					/* Primary Key. can be any integer >= 0, but less than 65535. can not null.*/
	Song_Name				VARCHAR(50) NOT NULL,						/* can be up to 50 characters.  cannot be null.*/
	Song_Length				TIME DEFAULT NULL,							/* TIME format -> HHH:MM:SS.  can be null.*/
	released				DATE DEFAULT NULL,							/* DATE format -> YYYY-MM-DD. can be null. if not released or unknown */
	Genre_ID				SMALLINT UNSIGNED NOT NULL,					/* Foreign Key. can be any integer >= 0, but less than 65535. can not be null.*/
	Artist_ID				SMALLINT UNSIGNED NOT NULL,					/* Foreign Key. can be any integer >= 0, but less than 65535. can not be null.*/
	Album_ID				SMALLINT UNSIGNED DEFAULT NULL,				/* Foreign Key. can be any integer >= 0, but less than 65535. can be null since a song can be a single.*/
	Orig_By					SMALLINT UNSIGNED NOT NULL,					/* Foreign Key. can be any integer >= 0, but less than 65535. can not be null.*/
	PRIMARY KEY	(Song_ID),
	FOREIGN KEY (Genre_ID) REFERENCES genres (Genre_ID)					/* Checks if the genre ID is in the genre table */
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (Artist_ID) REFERENCES artists (Artist_ID)				/* Checks if the artist ID is in the artist table */
		ON DELETE CASCADE
		ON UPDATE CASCADE,	
	FOREIGN KEY (Album_ID) REFERENCES albums (Album_ID)					/* Checks if the album ID is in the album table */
		ON DELETE CASCADE 
		ON UPDATE CASCADE,
	FOREIGN KEY (Orig_By) REFERENCES artists (Artist_ID)				/* Checks if the originally by ID is in the artist table */
		ON DELETE CASCADE
		ON UPDATE CASCADE
	)ENGINE=INNODB;


/* This table holds the lyric ID, the song ID, and the lyrics of a song.
This table's parent of song. */
CREATE TABLE lyrics(
	Lyric_ID				SMALLINT UNSIGNED NOT NULL,					/*Primary Key. can be any integer >= 0, but less than 65535. can not null.*/
	Song_ID					SMALLINT UNSIGNED NOT NULL,					/*Foreign Key. can be any integer >= 0, but less than 65535. can not null.*/
	Lyrics					TEXT NOT NULL,								/*The TEXT type stores data outside of the table.  This causes a little slowdown, but makes data management easier.  It can hold more than 21,000 characters. Cannot be null.*/
	PRIMARY KEY (Lyric_ID),
	FOREIGN KEY (Song_ID) REFERENCES songs (Song_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
	)ENGINE = INNODB;


/* This table holds the award ID and the song ID.
It is used to hold any song that has recieved an award
This table is a child of songs and awards. */
CREATE TABLE songAwards(
	Award_ID				SMALLINT UNSIGNED NOT NULL,					/* Foreign Key. can be any integer >= 0, but less than 65535. can not be null.*/
	Song_ID					SMALLINT UNSIGNED NOT NULL,					/* Foreign Key. can be any integer >= 0, but less than 65535. can not be null.*/
	PRIMARY KEY (Award_ID, Song_ID),
	FOREIGN KEY (Award_ID) REFERENCES awards (Award_ID)					/* Checks if the award ID is in the award table */
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (Song_ID) REFERENCES songs (Song_ID)					/* Checks if the album ID is in the album table */
		ON DELETE CASCADE
		ON UPDATE CASCADE
)ENGINE = INNODB;


/* This table holds the award ID and the song ID.
It is used to hold any album that has recieved an award
This table is a child of songs and awards. */
CREATE TABLE albumAwards(
	Award_ID				SMALLINT UNSIGNED NOT NULL,					/* Foreign Key. can be any integer >= 0, but less than 65535. can not be null.*/
	Album_ID				SMALLINT UNSIGNED NOT NULL,					/* Foreign Key. can be any integer >= 0, but less than 65535. can not be null.*/
	PRIMARY KEY (Award_ID, Album_ID),
	FOREIGN KEY (Award_ID) REFERENCES awards (Award_ID)					/* Checks if the award ID is in the award table */
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (Album_ID) REFERENCES albums (Album_ID)					/* Checks if the album ID is in the album table */
		ON DELETE CASCADE
		ON UPDATE CASCADE
)ENGINE = INNODB;
