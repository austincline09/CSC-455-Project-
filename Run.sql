/*  
	Created by Jeremy Timothy Brown
	Version 0.5
	Last Update 10/13/2016 2:13PM EST
*/

/*
	This file is used to run all of the .sql files in the correct order.
*/

/* Opens the .sql file that contains all of the code to create our tables. */
source CreateMusicTables.sql

/* Opens the .sql file that contains the code that adds
   our members, songs, awards, artists, and genres. 
   It also removes any data in that is in any of the tables. */
source insertFirst.sql

/* Opens the .sql file that adds songs and albums by childish gambino. */
source Jeremy/insertChildishGambinoAlbumsSongs.sql

/* Opens the .sql file that adds all of the lyrics for songs by childish gambino. */
source Jeremy/insertChildishGambinoLyrics.sql

/* Opens the .sql file that adds songs and albums by Watsky. */
source Jeremy/insertWatskyAlbumsSongs.sql

/* Opens the .sql file that adds songs and albums by Logic. */
source Jeremy/insertLogicAlbumsSongs.sql

/* Opens the .sql file that adds songs and albums by G-Eazy. */
source Jeremy/insertGEazyAlbumsSongs.sql

/* Opens the .sql file that adds songs and albums by Casey Veggies. */
source Jeremy/insertCaseyVeggiesAlbumsSongs.sql
