/* Created By Jeremy Timothy Brown /* 

/* Inserting into the album table */
/* (Album_ID, albumName, albumLength HHH:MM:SS, released YYYY-MM-DD, genreID, artistID) */ 

insert into albums values
	(3009, 'Must Be Nice', '000:56:23', '2012-09-26', 1, 3003);
insert into albums values
	(3010, 'These Things Happen', '001:01:52', '2014-06-23', 1, 3003);
insert into albums values
	(3011, 'When Its Dark Out', '001:01:05', '2015-12-04', 1, 3003);

 /* Inserting into the albumAwards table */ 
 /* (Award_ID, albumID) */ 


 /* Inserting into the songs table  */ 
 /* (Song_ID, songName, songLength HHH:MM:SS, released YYYY-MM-DD, genreID, artistID, albumID, Orig_By) */ 
insert into songs values
	(3117, 'Hello', '000:02:37', '2012-09-26', 1, 3003,  3009, 3003);
insert into songs values
	(3118, 'Plastic Dreams', '000:03:53', '2012-09-26', 1, 3003,  3009, 3003);
insert into songs values
	(3119, 'Lady Killers', '000:04:09', '2012-09-26', 1, 3003,  3009, 3003);
insert into songs values
	(3120, 'Mad', '000:03:10', '2012-09-26', 1, 3003,  3009, 3003);
insert into songs values
	(3121, 'Interlude', '000:00:40', '2012-09-26', 1, 3003,  3009, 3003);
insert into songs values
	(3122, 'Marilyn', '000:03:18', '2012-09-26', 1, 3003,  3009, 3003);
insert into songs values
	(3123, 'Stay High', '000:03:36', '2012-09-26', 1, 3003,  3009, 3003);
insert into songs values
	(3124, 'Breathe', '000:02:51', '2012-09-26', 1, 3003,  3009, 3003);
insert into songs values
	(3125, 'Must Be Nice' '000:03:27', '2012-09-26', 1, 3003,  3009, 3003);
insert into songs values
	(3126, 'Loaded', '000:02:36', '2012-09-26', 1, 3003,  3009, 3003);
insert into songs values
	(3127, 'These Things Happen', '000:02:24', '2014-06-23', 1, 3003,  3010, 3003);
insert into songs values
	(3128, 'Far Alone', '000:04:28', '2014-06-23', 1, 3003,  3010, 3003);
insert into songs values
	(3129, 'I Mean It', '000:03:56', '2014-06-23', 1, 3003,  3010, 3003);
insert into songs values
	(3130, 'Interlude', '000:00:45', '2014-06-23', 1, 3003,  3010, 3003);
insert into songs values
	(3131, 'Opportunity Cost', '000:03:54', '2014-06-23', 1, 3003,  3010, 3003);
insert into songs values
	(3132, 'Almost Famous', '000:04:29', '2014-06-23', 1, 3003,  3010, 3003);
insert into songs values
	(3133, 'Lotta That', '000:04:49', '2014-06-23', 1, 3003,  3010, 3003);
insert into songs values
	(3134, 'Factory Girl (Skit)', '000:00:13', '2014-06-23', 1, 3003,  3010, 3003);
insert into songs values
	(3135, 'Downtown Love', '000:05:27', '2014-06-23', 1, 3003,  3010, 3003);
insert into songs values
	(3136, 'Complete', '000:03:09', '2014-06-23', 1, 3003,  3010, 3003);
insert into songs values
	(3137, 'Lets Get Lost', '000:04:01', '2014-06-23', 1, 3003,  3010, 3003);
insert into songs values
	(3138, 'Shoot Me Down', '000:03:17', '2014-06-23', 1, 3003,  3010, 3003);
insert into songs values
	(3139, 'Been On', '000:03:29', '2014-06-23', 1, 3003,  3010, 3003);
insert into songs values
	(3140, 'Remember You', '000:03:36', '2014-06-23', 1, 3003,  3010, 3003);
insert into songs values
	(3141, 'Tumblr Girls', '000:04:16', '2014-06-23', 1, 3003,  3010, 3003);
insert into songs values
	(3142, 'Just Believe', '000:04:03', '2014-06-23', 1, 3003,  3010, 3003);
insert into songs values
	(3143, 'Intro', '000:01:11', '2015-12-04', 1, 3003,  3011, 3003);
insert into songs values
	(3144, 'Random', '000:03:00', '2014-06-23', 1, 3003,  3011, 3003);
insert into songs values
	(3145, 'Me, Myself & I', '000:04:11', '2015-12-04', 1, 3003,  3011, 3003);
insert into songs values
	(3146, 'One of Them', '000:03:19', '2015-12-04', 1, 3003,  3011, 3003);
insert into songs values
	(3147, 'Drifting', '000:04:33', '2015-12-04', 1, 3003,  3011, 3003);
insert into songs values
	(3148, 'Of All Things', '000:03:33', '2015-12-04', 1, 3003,  3011, 3003);
insert into songs values
	(3149, 'Order More', '000:03:28', '2015-12-04', 1, 3003,  3011, 3003);
insert into songs values
	(3150, 'Calm Down', '000:02:07', '2015-12-04', 1, 3003,  3011, 3003);
insert into songs values
	(3151, 'Dont Let Me Go', '000:03:11', '2015-12-04', 1, 3003,  3011, 3003);
insert into songs values
	(3152, 'You Got Me', '000:03:28', '2015-12-04', 1, 3003,  3011, 3003);
insert into songs values
	(3153, 'What If', '000:04:13', '2015-12-04', 1, 3003,  3011, 3003);
insert into songs values
	(3154, 'Sad Boy', '000:03:22', '2015-12-04', 1, 3003,  3011, 3003);
insert into songs values
	(3155, 'Some Kind of Drug', '000:03:42', '2015-12-04', 1, 3003,  3011, 3003);
insert into songs values
	(3156, 'Think about You', '000:02:59', '2015-12-04', 1, 3003,  3011, 3003);
insert into songs values
	(3157, 'Everything Will Be Ok', '000:05:11', '2015-12-04', 1, 3003,  3011, 3003);
insert into songs values
	(3158, 'For This', '000:04:10', '2015-12-04', 1, 3003,  3011, 3003);
insert into songs values
	(3159, 'Nothing to Me', '000:05:29', '2015-12-04', 1, 3003,  3011, 3003);

 /* Inserting into the songAwards table */ 
 /* (Award_ID, songID) */ 


