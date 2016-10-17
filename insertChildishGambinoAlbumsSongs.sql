/*  
	Created by Jeremy Timothy Brown
	Version 1.0
	Last Update 10/13/2016 3:57PM EST
*/


/* Inserting into the album table */
/* (Album_ID, albumName, albumLength HHH:MM:SS, released YYYY-MM-DD, genreID, artistID) */

/* Childish Gambino Albums */
insert into albums values
	(3001, 'Kauai', '000:28:03', '2014-10-03', 1, 3000);
	
insert into albums values
	(3002, 'Because the Internet', '000:57:52', '2013-12-10', 1, 3000);
	
insert into albums values
	(3003, 'Camp', '000:56:06', '2011-11-15', 1, 3000);


/* Inserting into the albumAward table */
/* (Award_ID, albumID) */
insert into albumAwards values
	(4, 3001);	

insert into albumAwards values
	(4, 3002);	

insert into albumAwards values
	(4, 3003);	



/* Inserting into the songs table  */
/* (Song_ID, songName, songLength HHH:MM:SS, released YYYY-MM-DD, genreID, artistID, albumID, Orig_By) */

	
/* all songs on Kunai albumn by childish gambino */
insert into songs values
	(3001, 'Sober', '000:05:00', '2014-09-14', 1, 3000, 3001, 3000);
insert into songs values
	(3002, 'Pop Thieves (Make It Feel Good)', '000:04:12', '2014-10-03', 1, 3000, 3001, 3000);
insert into songs values
	(3003, 'Retro [ROUGH]', '000:03:23', '2014-10-03', 1, 3000, 3001, 3000);
insert into songs values
	(3004, 'The Palisades', '000:03:11', '2014-10-03', 1, 3000, 3001, 3000);
insert into songs values
	(3005, 'Poke', '000:03:56', '2014-10-03', 1, 3000, 3001, 3000);
insert into songs values
	(3006, 'Late Night in Kauai', '000:04:45', '2014-10-03', 1, 3000, 3001, 3000);
insert into songs values
	(3007, 'V. 3005 - Beach Picnic Version', '000:03:55', '2013-10-22', 1, 3000, 3001, 3000);
	
	
/* all songs on the Because the Internet albumn by childish gambino */
insert into songs values
	(3008, 'The Library (Intro)', '000:00:04', '2013-12-10', 1, 3000, 3002, 3000);
insert into songs values
	(3009, 'I. Crawl', '000:03:29', '2013-12-10', 1, 3000, 3002, 3000);
insert into songs values
	(3010, 'II. Worldstar', '000:04:04', '2013-12-10', 1, 3000, 3002, 3000);
insert into songs values
	(3011, 'Dial Up', '000:00:45', '2013-12-10', 1, 3000, 3002, 3000);
insert into songs values
	(3012, 'I. The Worst Guys', '000:03:39', '2013-12-10', 1, 3000, 3002, 3000);
insert into songs values
	(3013, 'II. Shadows', '000:03:51', '2013-12-10', 1, 3000, 3002, 3000);
insert into songs values
	(3014, 'III. Telegraph Ave.', '000:03:30', '2013-12-10', 1, 3000, 3002, 3000);
insert into songs values
	(3015, 'IV. Sweatpants', '000:03:00', '2013-12-10', 1, 3000, 3002, 3000);
insert into songs values
	(3016, 'V. 3005', '000:03:30', '2013-10-22', 1, 3000, 3002, 3000);
insert into songs values
	(3017, 'Playing Around Before the Party Starts', '000:00:54', '2013-12-10', 1, 3000, 3002, 3000);
insert into songs values
	(3018, 'I. The Party', '000:01:31', '2013-12-10', 1, 3000, 3002, 3000);
insert into songs values
	(3019, 'II. No Exit', '000:02:51', '2013-12-10', 1, 3000, 3002, 3000);
insert into songs values
	(3020, 'Death by Numbers', '000:00:43', '2013-12-10', 1, 3000, 3002, 3000);
insert into songs values
	(3021, 'I. Flight of the Navigator', '000:05:44', '2013-12-10', 1, 3000, 3002, 3000);
insert into songs values
	(3022, 'II. Zealots of Stockholm', '000:04:50', '2013-12-10', 1, 3000, 3002, 3000);
insert into songs values
	(3023, 'III. Urn', '000:01:13', '2013-12-10', 1, 3000, 3002, 3000);
insert into songs values
	(3024, 'I. Pink Toes', '000:03:27', '2013-12-10', 1, 3000, 3002, 3000);
insert into songs values
	(3025, 'II. Earth: The Oldest Computer', '000:04:42', '2013-12-10', 1, 3000, 3002, 3000);
insert into songs values
	(3026, 'III. Life: The Biggest Troll', '000:05:42', '2013-12-10', 1, 3000, 3002, 3000);
	
/* all songs on the camp albumn by childish gambino */
insert into songs values
	(3027, 'Outside', '000:04:30', '2011-11-15', 1, 3000, 3003, 3000);
insert into songs values
	(3028, 'Fire Fly', '000:03:24', '2011-11-15', 1, 3000, 3003, 3000);
insert into songs values
	(3029, 'Bonfire', '000:03:13', '2011-11-15', 1, 3000, 3003, 3000);
insert into songs values
	(3030, 'All the Shine', '000:05:46', '2011-11-15', 1, 3000, 3003, 3000);
insert into songs values
	(3031, 'Letter Home', '000:01:44', '2011-11-15', 1, 3000, 3003, 3000);
insert into songs values
	(3032, 'Heartbeat', '000:04:31', '2011-11-15', 1, 3000, 3003, 3000);
insert into songs values
	(3033, 'Backpackers', '000:03:16', '2011-11-15', 1, 3000, 3003, 3000);
insert into songs values
	(3034, 'L.E.S', '000:05:19', '2011-11-15', 1, 3000, 3003, 3000);
insert into songs values
	(3035, 'Hold You Down', '000:04:53', '2011-11-15', 1, 3000, 3003, 3000);
insert into songs values
	(3036, 'Kids (Keep Up)', '000:04:31', '2011-11-15', 1, 3000, 3003, 3000);
insert into songs values
	(3037, 'You See Me', '000:03:11', '2011-11-15', 1, 3000, 3003, 3000);
insert into songs values
	(3038, 'Sunrise', '000:03:40', '2011-11-15', 1, 3000, 3003, 3000);
insert into songs values
	(3039, 'That Power', '000:07:38', '2011-11-15', 1, 3000, 3003, 3000);
	

/* Inserting into the songAward table */
/* (Award_ID, album_ID) */
insert into songAwards values
	(2, 3001);
insert into songAwards values
	(1, 3007);
insert into songAwards values
	(6, 3009);	
insert into songAwards values
	(6, 3016);	
