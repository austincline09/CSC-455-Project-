/*  
	Created by Jeremy Timothy Brown
	Version 0.5
	Last Update 10/13/2016 2:07PM EST
*/


/* Inserting into the album table */
/* (Album_ID, albumName, albumLength HHH:MM:SS, released YYYY-MM-DD, genreID, artistID) */

/* Watsky Albums */
insert into albums values
	(3004, 'Cardboard Castles', '001:02:11', '2013-03-12', 6, 3001);

insert into albums values
	(3005, 'All You Can Do', '000:57:43', '2014-11-12', 6, 3001);
	
insert into albums values
	(3006, 'X Infinity', '001:05:30', '2016-08-19', 6, 3001);

/* Inserting into the albumAward table */
/* (Award_ID, albumName) */

insert into albumAwards values
	(6, 3005);
insert into albumAwards values
	(6, 3006);



/* Inserting into the songs table  */
/* (Song_ID, songName, songLength HHH:MM:SS, released YYYY-MM-DD, genreID, artistID, albumID, Orig_By) */

/* all songs from Watsky's Cardboard Castle */
insert into songs values
	(3040, 'Fireworks', '000:02:32', '2013-03-12', 6, 3001, 3004, 3001);
insert into songs values
	(3041, 'Strong as an Oak', '000:04:19', '2013-01-22', 6, 3001, 3004, 3001);
insert into songs values
	(3042, 'Moral of the Story', '000:04:01', '2013-02-5', 6, 3001, 3004, 3001);
insert into songs values
	(3043, 'Ugly Faces', '000:02:55', '2013-03-12', 6, 3001, 3004, 3001);
insert into songs values
	(3044, 'Skit #1', '000:00:37', '2013-03-12', 6, 3001, 3004, 3001);
insert into songs values
	(3045, 'Kill a Hipster', '000:04:25', '2013-03-12', 6, 3001, 3004, 3001);
insert into songs values
	(3046, 'Hey, Asshole', '000:04:08', '2013-02-18', 6, 3001, 3004, 3001);
insert into songs values
	(3047, 'All I Need Is One', '000:03:46', '2013-03-12', 6, 3001, 3004, 3001);
insert into songs values
	(3048, 'Tiny Glowing Screens, Part 1', '000:04:55', '2013-03-12', 6, 3001, 3004, 3001);
insert into songs values
	(3049, 'Tiny Glowing Screens, Part 2', '000:02:44', '2013-03-12', 6, 3001, 3004, 3001);
insert into songs values
	(3050, 'Sloppy Seconds', '000:40:67', '2013-03-12', 6, 3001, 3004, 3001);
insert into songs values
	(9051, 'Dedicated to Chritina Li', '000:05:35', '2013-03-12', 6, 3001, 3004, 3001);
insert into songs values
	(3051, 'Dedicated to Chritina Li', '000:05:35', '2013-03-12', 6, 3001, 3004, 3001);
insert into songs values
	(3052, 'Skit #2', '000:01:14', '2013-03-12', 6, 3001, 3004, 3001);
insert into songs values
	(3053, 'The Legend of Hardhead Ned', '000:03:48', '2013-03-12', 6, 3001, 3004, 3001);
insert into songs values
	(3054, 'Cardboard Castles', '000:04:08', '2013-03-12', 6, 3001, 3004, 3001);
insert into songs values
	(3055, 'Send in the Sun', '000:04:21', '2013-03-12', 6, 3001, 3004, 3001);
	

/* all songs from Watsky's All You Can Do */

insert into songs values
	(3056, 'All You Can Do', '000:04:06', '2014-08-05', 6, 3001, 3005, 3001);
insert into songs values
	(9056, 'Stand for Something', '000:02:30', '2014-11-12', 6, 3001, 3005, 3001);
insert into songs values
	(3057, 'Bet Against Me', '000:03:09', '2014-11-12', 6, 3001, 3005, 3001);
insert into songs values
	(3058, 'Whoa Whoa Whoa', '000:03:07', '2014-06-10', 6, 3001, 3005, 3001);
insert into songs values
	(3059, 'Ink Don\'t Bleed', '000:03:34', '2014-06-24', 6, 3001, 3005, 3001);
insert into songs values
	(3060, 'Right Now', '000:03:14', '2014-07-15', 6, 3001, 3005, 3001);
insert into songs values
	(3061, 'My First Stalker', '000:01:30', '2014-11-12', 6, 3001, 3005, 3001);
insert into songs values
	(3062, 'The One', '000:02:55', '2014-11-12', 6, 3001, 3005, 3001);
insert into songs values
	(3063, 'Boomerang', '000:02:51', '2014-11-12', 6, 3001, 3005, 3001);
insert into songs values
	(3064, 'Lets Get High and Watch Planet Earth', '000:03:24', '2014-11-12', 6, 3001, 3005, 3001);
insert into songs values
	(3065, 'Hand Over Hand', '000:04:38', '2014-11-12', 6, 3001, 3005, 3001);
insert into songs values
	(3066, 'Tears to Diamonds', '000:03:24', '2014-11-12', 6, 3001, 3005, 3001);
insert into songs values
	(3067, 'Grass Is Greener', '000:03:44', '2014-11-12', 6, 3001, 3005, 3001);
insert into songs values
	(3068, 'Never Let It Die', '000:05:06', '2014-11-12', 6, 3001, 3005, 3001);
insert into songs values
	(3069, 'Sarajevo', '000:03:43', '2014-11-12', 6, 3001, 3005, 3001);
insert into songs values
	(3070, 'Cannonball', '000:06:40', '2014-11-12', 6, 3001, 3005, 3001);

	
/* all songs from Watsky's X Infinity */
insert into songs values
	(3071, 'Tiny Glowing Screens, Part 3', '000:03:53', '2016-08-19', 6, 3001,  3006, 3001);
insert into songs values
	(3072, 'Talking to Myself', '000:03:41', '2016-08-19', 6, 3001,  3006, 3001);
insert into songs values
	(3073, 'Chemical Angel', '000:02:31', '2016-08-19', 6, 3001,  3006, 3001);
insert into songs values
	(3074, 'Little Slice', '000:03:24', '2016-08-19', 6, 3001,  3006, 3001);
insert into songs values
	(3075, 'Springtime in New York', '000:02:23', '2016-08-19', 6, 3001,  3006, 3001);
insert into songs values
	(3076, 'Pink Lemonade', '000:03:17', '2016-08-19', 6, 3001,  3006, 3001);
insert into songs values
	(3077, 'Don\'t Be Nice', '000:03:18', '2016-08-19', 6, 3001,  3006, 3001);
insert into songs values
	(3078, 'Yes Britannia', '000:03:37', '2016-08-19', 6, 3001,  3006, 3001);
insert into songs values
	(3079, 'Love Letters', '000:04:24', '2016-08-19', 6, 3001,  3006, 3001);
insert into songs values
	(3080, 'Stick to Your Guns', '000:04:05', '2016-08-19', 6, 3001,  3006, 3001);
insert into songs values
	(3081, 'Brave New World', '000:04:04', '2016-08-19', 6, 3001,  3006, 3001);
insert into songs values
	(3082, 'Going Down', '000:05:16', '2016-08-19', 6, 3001,  3006, 3001);
insert into songs values
	(3083, 'Midnight Heart', '000:04:37', '2016-08-19', 6, 3001,  3006, 3001);
insert into songs values
	(3084, 'Lovely Thing Suite: Conversations', '000:03:40', '2016-08-19', 6, 3001,  3006, 3001);
insert into songs values
	(3085, 'Lovely Thing Suite: Knots', '000:03:40', '2016-08-19', 6, 3001,  3006, 3001);
insert into songs values
	(3086, 'Lovely Thing Suite: Roses', '000:04:09', '2016-08-19', 6, 3001,  3006, 3001);
insert into songs values
	(3087, 'Lovely Thing Suite: Theories',  '000:06:17', '2016-08-19', 6, 3001,  3006, 3001);
	

/* Inserting into the songAward table */
/* (Award_ID, albumName) */
	
