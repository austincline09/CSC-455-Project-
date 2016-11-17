/*  
	Created by Jeremy Timothy Brown
	Version 1.0
	Last Update 11/03/2016 2:45PM EST
*/

DROP VIEW IF EXISTS all_songs;
DROP VIEW IF EXISTS all_albums;
DROP VIEW IF EXISTS all_users;


CREATE VIEW all_songs AS
	SELECT Song_Name, Artist_Name, Song_ID
	FROM songs NATURAL JOIN artists;
	
CREATE VIEW all_albums AS
	SELECT Album_Name, Artist_Name, Album_ID
	FROM albums NATURAL JOIN artists;
	
CREATE VIEW all_users AS
	SELECT User_Name
	FROM members;