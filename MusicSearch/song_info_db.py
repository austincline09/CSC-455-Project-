import MySQLdb


class CallDataBase:
    def __init__(self):
        self.b = MySQLdb.connect(host='152.20.234.248',
                                 user='jtb9611',
                                 passwd='5BWYH6fXO',
                                 db='jtb9611')

    def get_lyric(self):
        lrc = self.b.cursor()
        lrc.execute("Select Lyrics from lyrics where Song_ID=3001")
        lrc_return = lrc.fetchall()
        return lrc_return[0]