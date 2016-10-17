/*  
	Created by Jeremy Timothy Brown
	Version 0.6
	Last Update 10/13/2016 03:58PM EST
*/

/*
	This file adds members, songs, awards, and genres.
	It also deletes anything in the seven tables used for this project.
*/


/* If the following tables contain data, remove that data */
DELETE FROM members;
DELETE FROM songs;
DELETE FROM albums;
DELETE FROM lyrics;
DELETE FROM albumAwards;
DELETE FROM songAwards;
DELETE FROM awards;
DELETE FROM genres;
DELETE FROM artists;


/* Inserting into the members table */
/* When a user is entered into this table, a new table must be created to save the user's song favorites. */
/* (User_name, password) */

insert into members values
	('jeremy', 'p@ssword');


	
/* Inserting into the genres table */
/* (Genre_ID, genreName) */

insert into genres values
	(1, 'Hip-Hop');
insert into genres values
	(2,'Rock');
insert into genres values
	(3, 'Folk');
insert into genres values
	(4, 'Techno');
insert into genres values
	(5, 'Metal');
insert into genres values
	(6, 'Alternate Hip-Hop');

/* Inserting into the award table */
/* (Award_ID, awardName) */

insert into awards values
	(1, "Grammy");
insert into awards values
	(2, "MTV");
insert into awards values
	(3, "AMA");
insert into awards values
	(4, "Billboard's Top 200");
insert into awards values
	(5, "CMAs");
insert into awards values
	(6, "Billboard's Hot 100");

/* Inserting into the artists table */
/* (Artist_ID, artistName) */

insert into artists values 
	(2000, 'Metallica');
insert into artists values
	(2001, 'August Burns Red'); 
insert into artists values
	(2002, 'Killswitch Engage');
insert into artists values
	(3000, 'Childish Gambino');
insert into artists values
	(3001, 'Watsky');
insert into artists values
	(3002, 'Logic');
insert into artists values
	(3003, 'G-Eazy');
insert into artists values
	(3004, 'Casey Veggies');