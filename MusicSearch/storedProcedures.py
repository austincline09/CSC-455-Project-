import MySQLdb

class StoredPro:

    def checkCS(self,whichFil,userChoice,sonOrAlmb):
        self.b = MySQLdb.connect(host='152.20.234.248',
                                 user='jtb9611',
                                 passwd='5BWYH6fXO',
                                 db='jtb9611')

        another = self.b.cursor()
        if sonOrAlmb == "Song":
            if whichFil == "lyric":
                another.execute("SET @phraseInput := '" + userChoice + "'")
                another.execute("call phraseSortSong()")
                anDisplay = another.fetchall()
                return anDisplay
            if whichFil == "award":
                another.execute("SET @award := '"+userChoice+"'")
                another.execute("call awardSortSong()")
                anDisplay = another.fetchall()
                return anDisplay
            if whichFil == "genre":
                another.execute("SET @genre := '" + userChoice + "'")
                another.execute("call genreSortSong()")
                anDisplay = another.fetchall()
                return anDisplay
        else:
            if whichFil == "award":
                another.execute("SET @award := '" + userChoice + "'")
                another.execute("call awardSortAlbum()")
                anDisplay = another.fetchall()
                print(anDisplay)
                return anDisplay
            if whichFil == "genre":
                another.execute("SET @genre := '" + userChoice + "'")
                another.execute("call genreSortAlbum()")
                anDisplay = another.fetchall()
                print(anDisplay)
                return anDisplay




