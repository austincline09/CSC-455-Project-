import MySQLdb


class CallDataBase:
    def __init__(self):
        self.b = MySQLdb.connect(host='152.20.234.248',
                                 user='jtb9611',
                                 passwd='5BWYH6fXO',
                                 db='jtb9611')

    def get_album_info(self, album_id):
        album = self.b.cursor()
        query = "select Album_Name, Album_Length, Released from albums where Album_ID='"+album_id+"'"
        album.execute(query)
        album_info = album.fetchall()
        return album_info

    def get_album_songs(self, album_id):
        song = self.b.cursor()
        query = "select Song_Name from songs where Album_ID='" + album_id + "'"
        song.execute(query)
        songs = song.fetchall()
        return songs

    def get_artist(self, album_id):
        album = self.b.cursor()
        query = "select Artist_Name from albums natural join artists where Album_ID='" + album_id + "'"
        album.execute(query)
        artist = album.fetchall()
        return artist[0][0]

    def get_genre(self, album_id):
        album = self.b.cursor()
        query = "select Genre_Name from albums natural join genres where Album_ID='" + album_id + "'"
        album.execute(query)
        genre = album.fetchall()
        return genre[0][0]