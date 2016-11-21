import MySQLdb


class CallDataBase:
    def __init__(self):
        self.b = MySQLdb.connect(host='152.20.234.248',
                                 user='jtb9611',
                                 passwd='5BWYH6fXO',
                                 db='jtb9611')

    def get_lyric(self, song_id):
        try:
            song = self.b.cursor()
            query = "select Lyrics from lyrics where Song_ID='" + song_id + "'"
            song.execute(query)
            lrc = song.fetchall()
            return lrc[0]
        except IndexError:
            return "false"

    def get_song_info(self, song_id):
        song = self.b.cursor()
        query = "select Song_Name, Song_Length, released from songs where Song_ID='"+song_id+"'"
        song.execute(query)
        song_info = song.fetchall()
        return song_info

    def get_album(self, song_id):
        song = self.b.cursor()
        query = "select Album_Name from songs natural join albums where Song_ID='" + song_id + "'"
        song.execute(query)
        album = song.fetchall()
        return album[0][0]

    def get_artist(self, song_id):
        song = self.b.cursor()
        query = "select Artist_Name from songs natural join artists where Song_ID='" + song_id + "'"
        song.execute(query)
        artist = song.fetchall()
        return artist[0][0]

    def get_genre(self, song_id):
        song = self.b.cursor()
        query = "select Genre_Name from songs natural join genres where Song_ID='" + song_id + "'"
        song.execute(query)
        genre = song.fetchall()
        return genre[0][0]

    def get_old_or_new(self, song_id):
        cursor = self.b.cursor()
        query = "select oldOrnew(released) from songs where Song_ID='" + song_id + "'"
        cursor.execute(query)
        old_or_new = cursor.fetchall()
        return old_or_new[0][0]