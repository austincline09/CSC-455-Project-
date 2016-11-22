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

    def set_things(self, un, album):
        print "ran that shit"
        print un
        print album
        s = self.b.cursor()
        j = self.b.cursor()
        s.execute("SET @username := '" + un + "'")
        j.execute("SET @album := '" + album + "'")

    def save_album(self, un, album):
        try:
            add = self.b.cursor()
            # self.set_things(un, album)
            add.execute("SET @username := '" + un + "'")
            add.execute("SET @album := '" + album + "'")
            add.execute("""INSERT INTO savedalbums VALUES (%s,%s)""", (un, album))
            self.b.commit()
            add.close()
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

    def get_song_count(self, un):
        count = self.b.cursor()
        query = "select count(User_Name) from savedsongs where User_Name = '"+un+"'"
        count.execute(query)
        song_count = count.fetchall()
        return song_count[0][0]

    def get_album_count(self, un):
        count = self.b.cursor()
        query = "select count(User_Name) from savedalbums where User_Name = '" + un + "'"
        count.execute(query)
        album_count = count.fetchall()
        return album_count[0][0]

    def total_saved(self, un):
        cursor = self.b.cursor()
        cursor.execute(
            "select * from savedsongs WHERE User_Name='" + un + "' union select * from savedalbums where User_Name='" + un + "'")
        users_with_saves = cursor.fetchall()
        return users_with_saves
