import MySQLdb
import userSaves


class CallDataBase:
    def __init__(self):
        self.b = MySQLdb.connect(host='152.20.234.248',
                                 user='jtb9611',
                                 passwd='5BWYH6fXO',
                                 db='jtb9611')

    def get_users(self):
        use = self.b.cursor()
        use.execute("Select * from all_users")
        all_users = use.fetchall()
        return all_users

    def delete_user(self, un):
        us = userSaves.CallDataBase()   # for removing user saves
        us.remove_all_albums(un)        # remove saved albums
        us.remove_all_songs(un)         # remove saved songs
        use = self.b.cursor()
        query = ("DELETE FROM members WHERE User_Name='"+un+"'")
        use.execute(query)
        self.b.commit()
