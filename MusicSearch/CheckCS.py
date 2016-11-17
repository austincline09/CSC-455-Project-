import MySQLdb

class check:

    def displayCS(self,aOrs):
        self.b = MySQLdb.connect(host='152.20.234.248',
                                 user='jtb9611',
                                 passwd='5BWYH6fXO',
                                 db='jtb9611')
        results = self.b.cursor()

        if aOrs == "Song":
            results.execute("call renderSortSong()")
            display = results.fetchall()
            return display
        else:
            results.execute("call renderSortAlbum()")
            display = results.fetchall()
            return display

