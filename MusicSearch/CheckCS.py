import MySQLdb

class check:

    def displayCS(self,aOrs):
        self.b = MySQLdb.connect(host='152.20.234.248',
                            user='kly2888',
                            passwd='FaehAKUMP',
                            db='kly2888')
        results = self.b.cursor()

        if aOrs == "Song":
            results.execute("call renderSortSong()")
            display = results.fetchall()
            return display
        else:
            results.execute("call renderSortAlbum()")
            display = results.fetchall()
            return display

