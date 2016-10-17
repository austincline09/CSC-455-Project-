/* Insert Music Data */

insert into artists values 
	(2000, 'Metallica');
insert into artists values
	(2001, 'August Burns Red'); 
insert into artists values
	(2002, 'Killswitch Engage');

/* Inserting into the album table EXAMPLE */
/* (Album_ID, albumName, albumLength HHH:MM:SS, released YYYY-MM-DD, genreID, artistID, awardID) */
insert into albums values 
	(2000, 'Kill Em All', '000:51:00', '1983-01-28', 5, 2000); 
insert into albums values
	(2001, 'Constellations', '000:47:00', '2009-07-14', 5, 2001); 
insert into albums values
	(2002, 'As Daylight Dies', '000:58:00', '2006-07-14', 5, 2002; 


/* Inserting into the song table EXAMPLE */
/* (Song_ID, songName, songLength HHH:MM:SS, released YYYY-MM-DD, genreID, artistID, albumID, Orig_By) */

/* Songs by Metallica */
insert into songs values 
	(2000, 'Hit the Lights', '000:04:15', '1983-01-28', 5, 2000, 2000, 2000);
insert into songs values 
	(2001, 'The Four Hourseman', '000:07:13', '1983-01-28', 5, 2000, 2000, 2000); 
insert into songs values
	(2002, 'Motorbreath', '000:03:08', '1983-01-28', 5, 2000, 2000, 2000); 
insert into songs values 
	(2003, 'Jump In the fire', '000:04:41', '1983-01-28', 5, 2000, 2000, 2000);
insert into songs values
	(2004, '(Anethesia)-Pulling Teeth', '000:04:15', '1983-01-28', 5, 2000, 2000, 2000);
insert into songs values
	(2005, 'Whiplash', '000:04:09', '1983-01-28', 5, 2000, 2000, 2000); 
insert into songs values
	(2006, 'Phantom Lord', '000:05:01', '1983-01-28', 5, 2000, 2000, 2000);
insert into songs values
	(2007, 'No Remorse', '000:06:27', '1983-01-28', 5, 2000, 2000, 2000); 
insert into songs values
	(2008, 'Seek & Destroy', '000:06:55', '1983-01-28', 5, 2000, 2000, 2000); 
insert into songs values
	(2009, 'Metal Militia', '000:05:12', '1983-01-28', 5, 2000, 2000, 2000);

/* Songs by August Burns Red */
insert into songs values
	(2010, 'Thirty and Seven', '000:03:19', '2009-07-14', 5, 2001, 2001, 2001); 
insert into songs values
	(2011, 'Existence', '000:03:54', '2009-07-14', 5, 2001, 2001, 2001); 
insert into songs values 
	(2012, 'Ocean of Apathy', '000:03:57', '2009-07-14', 5, 2001, 2001, 2001); 
insert into songs values
	(2013, 'White Washed', '000:03:46', '2009-07-14', 5, 2001, 2001, 2001);
insert into songs values
	(2014, 'Marianas Trench', '000:04:16', '2009-07-14', 5, 2001, 2001, 2001); 
insert into songs values 
	(2015, 'The Escape Artist', '000:03:58', '2009-07-14', 5, 2001, 2001, 2001); 
insert into songs values
	(2016, 'Indonesia', '000:03:34', '2009-07-14', 5, 2001, 2001, 2001); 
insert into songs values
	(2017, 'Paradox', '000:03:19', '2009-07-14', 5, 2001, 2001, 2001);
insert into songs values
	(2018, 'Meridian', '000:06:00', '2009-07-14', 5, 2001, 2001, 2001); 
insert into songs values
	(2019, 'Rationalist', '000:02:39', '2009-07-14', 5, 2001, 2001, 2001);
insert into songs values
	(2020, 'Meddler', '000:03:54', '2009-07-14', 5, 2001, 2001, 2001);
insert into songs values
	(2021, 'Crusades', '000:05:12', '2009-07-14', 5, 2001, 2001, 2001); 

/* Songs by Killswitch Engage */
insert into songs values
	(2022, 'Daylight Dies', '000:04:06', '2006-05-01', 5, 2002, 2002, 2002);
insert into songs values 
	(2023, 'This is Absolution', '000:03:34', '2006-05-01', 5, 2002, 2002, 2002);
insert into songs values
	(2024, 'Arms of Sorrow', '000:03:44', '2006-05-01', 5, 2002, 2002, 2002); 
insert into songs values
	(2025, 'Unbroken', '000:03:09', '2006-05-01', 5, 2002, 2002, 2002);
insert into songs values
	(2026, 'My Curse', '000:04:05', '2006-05-01', 5, 2002, 2002, 2002);
insert into songs values
	(2027, 'For You', '000:04:03', '2006-05-01', 5, 2002, 2002, 2002);
insert into songs values
	(2028, 'Still Beats Your Name', '000:03:20', '2006-05-01', 5, 2002, 2002, 2002); 
insert into songs values
	(2029, 'Eye of the Storm', '000:03:56', '2006-05-01', 5, 2002, 2002, 2002); 
insert into songs values
	(2030, 'Break the Silence', '000:04:32', '2006-05-01', 5, 2002, 2002, 2002);
insert into songs values
	(2031, 'Desperate Times', '000:04:26', '2006-05-01', 5, 2002, 2002, 2002); 
insert into songs values
	(2032, 'Reject Yourself', '000:04:45', '2006-05-01', 5, 2002, 2002, 2002);
insert into songs values
	(2033, 'Be One', '000:03:31', '2006-05-01', 5, 2002, 2002, 2002);
insert into songs values
	(2034, 'Let the Bridges Burn', '000:04:29', '2006-05-01', 5, 2002, 2002, 2002); 
insert into songs values
	(2035, 'This Fire', '000:03:10', '2006-05-01', 5, 2002, 2002, 2002); 
insert into songs values
	(2036, 'Holy Diver', '000:04:10', '2006-05-01', 5, 2002, 2002, 2002); 



