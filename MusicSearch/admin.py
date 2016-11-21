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

    def users_saved_songs(self):
        cursor = self.b.cursor()
        cursor.execute("Select User_Name from savedsongs group by User_Name")
        users_with_saves = cursor.fetchall()
        return users_with_saves

    def users_saved_albums(self):
        cursor = self.b.cursor()
        cursor.execute("Select User_Name from savedalbums group by User_Name")
        users_with_saves = cursor.fetchall()
        return users_with_saves
