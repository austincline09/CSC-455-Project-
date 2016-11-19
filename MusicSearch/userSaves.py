import MySQLdb


class CallDataBase:
    def __init__(self):
        self.b = MySQLdb.connect(host='152.20.234.248',
                                 user='jtb9611',
                                 passwd='5BWYH6fXO',
                                 db='jtb9611')

    def save_song(self, un, song):
        try:
            add = self.b.cursor()
            add.execute("""INSERT INTO savedsongs VALUES (%s,%s)""", (un, song))
            self.b.commit()
        except MySQLdb.Error:
            self.b.rollback()

    def save_album(self, un, album):
        try:
            add = self.b.cursor()
            add.execute("""INSERT INTO savedalbums VALUES (%s,%s)""", (un, album))
            self.b.commit()
        except MySQLdb.Error:
            self.b.rollback()

    def get_user_songs(self, un):
        get = self.b.cursor()
        get.execute(
            "Select Song_Name, Artist_Name, Song_ID from songs natural join artists where Song_ID in (Select Song_ID from savedsongs where User_Name='"+un+"')")
        saved_songs = get.fetchall()
        return saved_songs

    def get_user_albums(self, un):
        get = self.b.cursor()
        get.execute(
            "Select Album_Name, Artist_Name, Album_ID from albums natural join artists where Album_ID in (Select Album_ID from savedalbums where User_Name='" + un + "')")
        saved_albums = get.fetchall()
        return saved_albums

    def remove_album(self, un, album_id):
        remove = self.b.cursor()
        query = "DELETE FROM savedalbums WHERE Album_ID=%s and User_Name=%s"
        remove.execute(query, (album_id, un))
        self.b.commit()

    def remove_song(self, un, song_id):
        remove = self.b.cursor()
        query = "DELETE FROM savedsongs WHERE Song_ID=%s and User_Name=%s"
        remove.execute(query, (song_id, un))
        self.b.commit()

    def remove_all_songs(self, un):
        try:
            remove = self.b.cursor()
            query = ("DELETE FROM savedsongs WHERE User_Name='" + un + "'")
            remove.execute(query)
            self.b.commit()
        except MySQLdb.error:
            self.b.rollback()
            print "user has no saved songs to delete"

    def remove_all_albums(self, un):
        try:
            remove = self.b.cursor()
            query = ("DELETE FROM savedalbums WHERE User_Name='"+un+"'")
            remove.execute(query)
            self.b.commit()
        except MySQLdb.error:
            self.b.rollback()
            print "user has no saved albums to delete"
