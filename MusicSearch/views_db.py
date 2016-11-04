import MySQLdb


class CallDataBase:
    def __init__(self):
        self.b = MySQLdb.connect(host='152.20.234.248',
                                 user='jtb9611',
                                 passwd='5BWYH6fXO',
                                 db='jtb9611')

    def get_all_songs(self):
        songs = self.b.cursor()
        songs.execute("Select * from All_Songs")
        return songs.fetchall()
