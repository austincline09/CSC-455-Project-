import MySQLdb

class callDB:
    def __init__(self, song_or_album, by_name_or_artist, user_search):
        self.b = MySQLdb.connect(host='152.20.234.248',
                            user='jtb9611',
                            passwd='5BWYH6fXO',
                            db='jtb9611')

        results = self.b.cursor()
        genres = self.b.cursor()
        awards = self.b.cursor()

        if song_or_album == "Song":
            if by_name_or_artist == "By Name":
                results.execute("Select Song_Name, Artist_Name from songs natural join artists where Song_Name like '%"+user_search+"%'")
            elif by_name_or_artist == "By Artist":
                results.execute("Select Song_Name, Artist_Name from songs natural join artists where Artist_Name like '%"+user_search+"%'")
        elif song_or_album == "Album":
            if by_name_or_artist == "By Name":
                results.execute("Select Album_Name, Artist_Name from albums natural join artists where Album_Name like '%"+user_search+"%'")
            elif by_name_or_artist == "By Artist":
                results.execute("Select Album_Name, Artist_Name from albums natural join artists where Artist_Name like '%"+user_search+"%'")

        self.result = results.fetchall()

        genres.execute("Select Genre_Name from genres")
        self.genre_names = genres.fetchall()

        awards.execute("Select Award_Name from awards")
        self.award_names = awards.fetchall()

    def getResult(self):
        return self.result

    def getGenres(self):
        return self.genre_names

    def getAwards(self):
        return self.award_names