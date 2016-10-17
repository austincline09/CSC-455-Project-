/*  
	Created by Jeremy Timothy Brown
	Version 0.5
	Last Update 10/15/2016 10:45AM EST
*/


/* Inserting into the album table */
/* (Album_ID, albumName, albumLength HHH:MM:SS, released YYYY-MM-DD, genreID, artistID) */

/* Watsky Albums */
insert into albums values
	(3007, 'Under Pressure', '000:56:23', '2014-10-21', 1, 3002);
insert into albums values
	(3008, 'The Incredible True Story', '001:01:52', '2015-11-13', 1, 3002);

/* Inserting into the albumAward table */
/* (Award_ID, albumID) */



/* Inserting into the songs table  */
/* (Song_ID, songName, songLength HHH:MM:SS, released YYYY-MM-DD, genreID, artistID, albumID, Orig_By) */

/* all songs from Logic's Under Pressure */
insert into songs values
	(3088, 'Intro', '000:03:02', '2014-10-21', 1, 3002,  3007, 3002);
insert into songs values
	(3089, 'Soul Food', '000:04:52', '2014-10-21', 1, 3002,  3007, 3002);
insert into songs values
	(3090, 'Im Gone', '000:04:42', '2014-10-21', 1, 3002,  3007, 3002);
insert into songs values
	(3091, 'Gang Related', '000:02:47', '2014-10-21', 1, 3002,  3007, 3002);
insert into songs values
	(3092, 'Buried Alive', '000:05:37', '2014-10-21', 1, 3002,  3007, 3002);
insert into songs values
	(3093, 'Bounce', '000:04:04', '2014-10-21', 1, 3002,  3007, 3002);
insert into songs values
	(3094, 'Growing Paint III', '000:04:06', '2014-10-21', 1, 3002,  3007, 3002);
insert into songs values
	(3095, 'Never Enough', '000:04:22', '2014-10-21', 1, 3002,  3007, 3002);
insert into songs values
	(3096, 'Metropolis', '000:04:55', '2014-10-21', 1, 3002,  3007, 3002);
insert into songs values
	(3097, 'Under Pressure', '000:09:19', '2014-10-21', 1, 3002,  3007, 3002);
insert into songs values
	(3098, 'Till the End', '000:05:14', '2014-10-21', 1, 3002,  3007, 3002);

	
/* all songs from Logic's The Incredible True Story */
	
insert into songs values
	(3099, 'Contact', '000:02:43', '2015-11-13', 1, 3002,  3008, 3002);
insert into songs values
	(3100, 'Fade Away', '000:04:47', '2015-11-13', 1, 3002,  3008, 3002);
insert into songs values
	(3101, 'Upgrade', '000:02:53', '2015-11-13', 1, 3002,  3008, 3002);
insert into songs values
	(3102, 'White People', '000:01:39', '2015-11-13', 1, 3002,  3008, 3002);
insert into songs values
	(3103, 'Like Woah', '000:03:52', '2015-11-13', 1, 3002,  3008, 3002);
insert into songs values
	(3104, 'Young Jesus', '000:03:35', '2015-11-13', 1, 3002,  3008, 3002);
insert into songs values
	(3105, 'Innermisson', '000:04:00', '2015-11-13', 1, 3002,  3008, 3002);
insert into songs values
	(3106, 'I Am the Greatest', '000:03:22', '2015-11-13', 1, 3002,  3008, 3002);
insert into songs values
	(3107, 'The Cube', '000:00:27', '2015-11-13', 1, 3002,  3008, 3002);
insert into songs values
	(3108, 'Lord Willin', '000:03:28', '2015-11-13', 1, 3002,  3008, 3002);
insert into songs values
	(3109, 'City of Stars', '000:06:16', '2015-11-13', 1, 3002,  3008, 3002);
insert into songs values
	(3110, 'Stainless', '000:03:19', '2015-11-13', 1, 3002,  3008, 3002);
insert into songs values
	(3111, 'Babel', '000:01:11', '2015-11-13', 1, 3002,  3008, 3002);
insert into songs values
	(3112, 'Paradise', '000:04:42', '2015-11-13', 1, 3002,  3008, 3002);
insert into songs values
	(3113, 'Never Been', '000:04:07', '2015-11-13', 1, 3002,  3008, 3002);
insert into songs values
	(3114, 'Run It', '000:03:20', '2015-11-13', 1, 3002,  3008, 3002);
insert into songs values
	(3115, 'Lucidity', '000:00:55', '2015-11-13', 1, 3002,  3008, 3002);
insert into songs values
	(3116, 'The Incredible True Story', '000:03:02', '2015-11-13', 1, 3002,  3008, 3002);


	
/* Inserting into the songAward table */
/* (Award_ID, albumID) */
	
