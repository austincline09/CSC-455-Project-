/*  
	Created by Jeremy Timothy Brown
	Version 0.2
	Last Update 10/6/2016 04:15AM EST
*/


/* If the following tables contain data, remove that data */
DELETE FROM members;
DELETE FROM songs;
DELETE FROM albums;
DELETE FROM albumAwards;
DELETE FROM songAwards;
DELETE FROM lyrics;
DELETE FROM awards;
DELETE FROM genres;
DELETE FROM artists;


/* Inserting into the members table EXAMPLE */
/* When a user is entered into this table, a new table must be created to save the user's song favorites. */
/* (User_name, password) */

insert into members values
	('admin', 'password');

	
/* Inserting into the genres table EXAMPLE */
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
	
/* Inserting into the award table EXAMPLE */
/* (Award_ID, awardName) */

insert into awards values
	(1, "Grammy");
insert into awards values
	(2, "MTV");
insert into awards values
	(3, "AMA");
insert into awards values
	(4, "Billboard Music Awards");
insert into awards values
	(5, "CMAs");

/* Inserting into the artists table EXAMPLE */
/* (Artist_ID, artistName) */

insert into artists values
	(1000, 'Jimi Hendrix');
	
insert into artists values
	(1001, 'Red Hot Chili and Some Pepper');


/* Inserting into the album table EXAMPLE */
/* (Album_ID, albumName, albumLength HHH:MM:SS, released YYYY-MM-DD, genreID, artistID) */

/* with award */
insert into albums values
	(1000, 'The Good, The Bad, and the Worst', '001:13:14', '99-12-22', 1, 1000);
	
/* without award */
insert into albums values
	(1001, 'All dem songs on a CD', '002:43:14', '1998-01-12', 1, 1000);
	
	
/* Inserting into the albumAwards table EXAMPLE */
/* (Award_ID, Album_ID) */
insert into albumAwards values
	(1, 1000);
	
insert into albumAwards values
	(3, 1001);



/* Inserting into the songs table EXAMPLE */
/* (Song_ID, songName, songLength HHH:MM:SS, released YYYY-MM-DD, genreID, artistID, albumID, Orig_By) */

/* with no album*/
insert into songs values
	(1000, 'Speaking to YOU', '000:03:54', '12-12-12', 1, 1000, null, 1000);
	
/* without album; with award and orig */
insert into songs values
	(1001, 'Speaking to ME', '000:03:54', '12-12-12', 1, 1000, null, 1000);
	
/* with album and award, cover */
insert into songs values
	(1002, 'Speaking to ME', '000:03:54', '12-12-12', 1, 1001, 1000, 1000);
	


/* Inserting into the songAwards table EXAMPLE */
/* (Award_ID, Song_ID) */
insert into songAwards values
	(1, 1001);
	
insert into songAwards values
	(1, 1002);
	

	
/* Inserting into the lyrics table EXAMPLE */
/* (Lyric_ID, Song_ID, lyrics)  */

insert into lyrics values
	(1000, 1000, 'Song Lyrics.  Singing, songs, that are about something songs.');



