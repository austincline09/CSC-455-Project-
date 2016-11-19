/* Created By JEremy */ 

/* Inserting into the album table */
/* (Album_ID, albumName, albumLength HHH:MM:SS, released YYYY-MM-DD, genreID, artistID) */ 

insert into albums values
	(3018, 'Abbey Road', '000:30:00', '1969-09-26', 2, 3006);
insert into albums values
	(3019, 'Yellow Submarine', '000:40:12' , '1969-01-13', 2, 3006);
insert into albums values
	(3020, 'Magical Mystery Tour', '000:36:35', '1967-11-27', 2, 3006);
insert into albums values
	(3021, 'Sgt. Peppers Lonely Hearts Club Band', '000:39:52', '1967-06-01', 2, 3006);

 /* Inserting into the albumAwards table */ 
 /* (Award_ID, albumID) */ 


 /* Inserting into the songs table  */ 
 /* (Song_ID, songName, songLength HHH:MM:SS, released YYYY-MM-DD, genreID, artistID, albumID, Orig_By) */ 
insert into songs values
	(3236, 'Come Together', '000:04:20', '1969-09-26', 2, 3006,  3018, 3006);
insert into songs values
	(3237, 'Something', '000:03:02', '1969-09-26', 2, 3006,  3018, 3006);
insert into songs values
	(3238, 'Maxwells Silver Hammer', '000:03:28', '1969-09-26', 2, 3006,  3018, 3006);
insert into songs values
	(3239, 'Oh! Darling', '000:03:27', '1969-09-26', 2, 3006,  3018, 3006);
insert into songs values
	(3240, 'Octopus Garden', '000:02:51', '1969-09-26', 2, 3006,  3018, 3006);
insert into songs values
	(3241, 'I Want You (Shes So Heavy)', '000:07:57', '1969-09-26', 2, 3006,  3018, 3006);
insert into songs values
	(3242, 'Here Comes The Sun', '000:03:06', '1969-09-26', 2, 3006,  3018, 3006);
insert into songs values
	(3243, 'Because', '000:02:46', '1969-09-26', 2, 3006,  3018, 3006);
insert into songs values
	(3244, 'You Never Give Me Your Money', '000:04:03', '1969-09-26', 2, 3006,  3018, 3006);
insert into songs values
	(3245, 'Sun King', '000:02:26', '1969-09-26', 2, 3006,  3018, 3006);
insert into songs values
	(3246, 'Mean Mr Mustard', '000:01:07', '1969-09-26', 2, 3006,  3018, 3006);
insert into songs values
	(3247, 'Polythene Pam', '000:01:13', '1969-09-26', 2, 3006,  3018, 3006);
insert into songs values
	(3248, 'She Came In Through The Bathroom Window', '000:01:59', '1969-09-26', 2, 3006,  3018, 3006);
insert into songs values
	(3249, 'Golden Slumbers', '000:01:32', '1969-09-26', 2, 3006,  3018, 3006);
insert into songs values
	(3250, 'Carry That Weight', '000:01:36', '1969-09-26', 2, 3006,  3018, 3006);
insert into songs values
	(3251, 'The End', '000:02:22', '1969-09-26', 2, 3006,  3018, 3006);
insert into songs values
	(3252, 'Her Majesty', '000:00:26', '1969-09-26', 2, 3006,  3018, 3006);
insert into songs values
	(3253, 'Yellow Submarine', '000:02:40', '1969-01-13', 2, 3006,  3019, 3006);
insert into songs values
	(3254, 'Only A Northern Song', '000:03:24', '1969-01-13', 2, 3006,  3019, 3006);
insert into songs values
	(3255, 'All Together Now', '000:02:11', '1969-01-13', 2, 3006,  3019, 3006);
insert into songs values
	(3256, 'Hey Bulldog', '000:03:11', '1969-01-13', 2, 3006,  3019, 3006);
insert into songs values
	(3257, 'Its All Too Much', '000:06:25', '1969-01-13', 2, 3006,  3019, 3006);
insert into songs values
	(3258, 'All You Need Is Love', '000:03:51', '1969-01-13', 2, 3006,  3019, 3006);
insert into songs values
	(3259, 'Pepperland', '000:02:21', '1969-01-13', 2, 3006,  3019, 3006);
insert into songs values
	(3260, 'Sea Of Time', '000:03:00', '1969-01-13', 2, 3006,  3019, 3006);
insert into songs values
	(3261, 'Sea Of Holes', '000:02:17', '1969-01-13', 2, 3006,  3019, 3006);
insert into songs values
	(3262, 'Sea Of Monsters', '000:03:37', '1969-01-13', 2, 3006,  3019, 3006);
insert into songs values
	(3263, 'March Of The Meanies', '000:02:19', '1969-01-13', 2, 3006,  3019, 3006);
insert into songs values
	(3264, 'Pepperland Laid Waste', '000:02:13', '1969-01-13', 2, 3006,  3019, 3006);
insert into songs values
	(3265, 'Yellow Submarine In Pepperland', '000:02:14', '1969-01-13', 2, 3006,  3019, 3006);
insert into songs values
	(3266, 'Magical Mystery Tour', '000:02:50', '1967-11-27', 2, 3006,  3020, 3006);
insert into songs values
	(3267, 'The Fool On The Hill', '000:02:59' , '1967-11-27', 2, 3006,  3020, 3006);
insert into songs values
	(3268, 'Flying', '000:02:16', '1967-11-27', 2, 3006,  3020, 3006);
insert into songs values
	(3269, 'Blue Jay Way', '000:03:55', '1967-11-27', 2, 3006,  3020, 3006);
insert into songs values
	(3270, 'Your Mother Should Know', '000:02:28', '1967-11-27', 2, 3006,  3020, 3006);
insert into songs values
	(3271, 'I Am The Walrus', '000:04:36', '1967-11-27', 2, 3006,  3020, 3006);
insert into songs values
	(3272, 'Hello, Goodbye', '000:03:29', '1967-11-27', 2, 3006,  3020, 3006);
insert into songs values
	(3273, 'Strawberry Fields Forever', '000:04:07', '1967-11-27', 2, 3006,  3020, 3006);
insert into songs values
	(3274, 'Penny Lane', '000:03:01', '1967-11-27', 2, 3006,  3020, 3006);
insert into songs values
	(3275, 'Baby, Youre A Rich Man', '000:03:01', '1967-11-27', 2, 3006,  3020, 3006);
insert into songs values
	(3276, 'All You Need Is Love', '000:03:50', '1967-11-27', 2, 3006,  3020, 3006);
insert into songs values
	(3277, 'Sgt. Peppers Lonely Hearts Club Band', '000:02:03', '1967-06-01', 2, 3006,  3021, 3006);
insert into songs values
	(3278, 'With A Little Help From My Friends', '000:02:44', '1967-06-01', 2, 3006,  3021, 3006);
insert into songs values
	(3279, 'Lucy In The Sky With Diamonds', '000:03:28', '1967-06-01', 2, 3006,  3021, 3006);
insert into songs values
	(3280, 'Getting Better', '000:02:48', '1967-06-01', 2, 3006,  3021, 3006);
insert into songs values
	(3281, 'Fixing A Hole', '000:02:37', '1967-06-01', 2, 3006,  3021, 3006);
insert into songs values
	(3282, 'Shes Leaving Home', '000:03:35', '1967-06-01', 2, 3006,  3021, 3006);
insert into songs values
	(3283, 'Being For The Benefit Of Mr. Kite!', '000:02:38', '1967-06-01', 2, 3006,  3021, 3006);
insert into songs values
	(3284, 'Within You Without You', '000:05:05', '1967-06-01', 2, 3006,  3021, 3006);
insert into songs values
	(3285, 'When Im Sixty Four', '000:02:38', '1967-06-01', 2, 3006,  3021, 3006);
insert into songs values
	(3286, 'Lovely Rita', '000:02:42', '1967-06-01', 2, 3006,  3021, 3006);
insert into songs values
	(3287, 'Good Morning Good Morning', '000:02:41', '1967-06-01', 2, 3006,  3021, 3006);
insert into songs values
	(3288, 'Sgt. Peppers Lonely Hearts Club BandReprise', '000:01:19', '1967-06-01', 2, 3006,  3021, 3006);
insert into songs values
	(3289, 'A Day In The Life', '000:05:37', '1967-06-01', 2, 3006,  3021, 3006);

 /* Inserting into the songAwards table */ 
 /* (Award_ID, songID) */ 


