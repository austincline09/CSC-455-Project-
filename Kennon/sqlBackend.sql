DELIMITER $$
CREATE PROCEDURE genreSortSong()
BEGIN
	select ID from currentSearch where ID in (select Song_ID from songs, genres where genres.Genre_ID = songs.Genre_ID and genres.Genre_Name = @genre);
END $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE renderSortSong()
BEGIN
	select Song_Name, Artist_Name,  from songs,currentSearch,artists where songs.Song_ID = currentSearch.ID and songs.Artist_ID = artists.Artist_ID;
END $$
DELIMITER ;

##################################################################################
#renderSortSong() displays html page after appropiate quieries have 
##################################################################################

DELIMITER $$
CREATE PROCEDURE awardSortSong()
BEGIN
	select ID from currentSearch, songAwards, awards where awards.Award_ID = songAwards.Award_ID and songAwards.Song_ID = currentSearch.ID and awards.Award_Name = @award;
END $$
DELIMITER ;

##################################################################################

DELIMITER $$
CREATE PROCEDURE phraseSortSong()
BEGIN
	select currentSearch.ID from currentSearch, lyrics where lyrics.Song_ID = currentSearch.ID and lyrics.Lyrics like concat('%',@phraseInput,'%');
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE timeSortSong()
BEGIN
	select ID from currentSearch where ID in (select Song_ID from songs where STR_TO_DATE(Song_Length, '%H:%i:%s') <= @length);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE relAfterSortSong()
BEGIN
	select ID from currentSearch where ID in (select Song_ID from songs where released >= @after);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE relBeforeSortSong()
BEGIN
	select ID from currentSearch where ID in (select Song_ID from songs where released < @before);
END $$
DELIMITER ;

#########################################
#end of song quieres, start of album quieres
###########################################

DELIMITER $$
CREATE PROCEDURE genreSortAlbum()
BEGIN
	select ID from currentSearch where ID in (select Album_ID from albums, genres where genres.Genre_ID = albums.Genre_ID and genres.Genre_Name = @genre);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE awardSortAlbum()
BEGIN
	select ID from currentSearch, albumAwards, awards where awards.Award_ID = albumAwards.Award_ID and albumAwards.Album_ID = currentSearch.ID and awards.Award_Name = @award;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE renderSortAlbum()
BEGIN
	select Album_Name, Artist_Name from albums,currentSearch,artists where albums.Album_ID = currentSearch.ID and albums.Artist_ID = artists.Artist_ID;	
END $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE timeSortAlbum()
BEGIN
	select ID from currentSearch where ID in (select Album_ID from albums where STR_TO_DATE(Album_Length, '%H:%i:%s') <= @length);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE relAfterSortAlbum()
BEGIN
	select ID from currentSearch where ID in (select Album_ID from albums where released >= @AFTER);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE relBeforeSortAlbum()
BEGIN
	select ID from currentSearch where ID in (select Album_ID from albums where released < @before);
END $$
DELIMITER ;


#######################################
#extra quieries 
#######################################
DELIMITER $$
CREATE FUNCTION oldOrnew (year smallint(11)) returns varchar(20)

BEGIN
	declare oldNew varchar(20);

	IF year > '2000-01-01' THEN
		SET oldNew = 'Modern';
	ELSE
		SET oldNew = 'Classic';
	END IF;
  RETURN (oldNew);
END $$
DELIMITER ;

select Song_Name, oldOrnew(released) from songs;


DELIMITER ///
CREATE TRIGGER insertSavedSongs AFTER INSERT ON savedalbums 
FOR EACH ROW
BEGIN
	insert into savedsongs select User_Name, Song_ID from songs natural join members where User_Name = @username and Album_ID = @album;

END;///
DELIMITER ;



