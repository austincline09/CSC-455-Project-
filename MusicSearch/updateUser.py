import MySQLdb

class CallDataBase:
    def __init__(self):
        self.b = MySQLdb.connect(host='152.20.234.248',
                                 user='jtb9611',
                                 passwd='5BWYH6fXO',
                                 db='jtb9611')

    def check_if_exists(self, un):
        check = self.b.cursor()
        check.execute("Select User_Name from members where User_Name = '" + un + "'")
        check_un = check.fetchall()
        return check_un

    def update_user(self, current_un, new_un):
        update = self.b.cursor()
        update.execute("UPDATE members SET User_Name = '"+new_un+"' WHERE User_Name = '"+current_un+"'")
        self.b.commit()