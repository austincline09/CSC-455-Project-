import MySQLdb

class callDB:
    def __init__(self, f, s, t):
        b = MySQLdb.connect(host='152.20.234.248',
                            user='jtb9611',
                            passwd='5BWYH6fXO',
                            db='jtb9611')

        cur = b.cursor()
        if f == "Song":
            if s == "By Name":
                cur.execute("Select Song_Name from songs where Song_Name like '%"+t+"%'")
            elif s == "By Artist":
                cur.execute("Select Song_Name from songs natural join artists where Artist_Name like '%"+t+"%'")
        elif f == "Album":
            if s == "By Name":
                cur.execute("Select Album_Name from albums where Album_Name like '%" + t + "%'")
            elif s == "By Artist":
                cur.execute("Select Album_Name from albums natural join artists where Artist_Name like '%" + t + "%'")


        #cur.execute("Select Artist_Name from artists where Artist_Name like '%"+t+"%'")
        self.result = cur.fetchall()
        print(self.result)

    def getResult(self):
        return self.result