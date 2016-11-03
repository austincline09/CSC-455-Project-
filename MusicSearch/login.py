import MySQLdb


class login:
    def __init__(self, user_name, password):
        self.b = MySQLdb.connect(host='152.20.234.248',
                                 user='jtb9611',
                                 passwd='5BWYH6fXO',
                                 db='jtb9611')

        user = self.b.cursor()

        user.execute("Select User_Name, Password from members where User_Name = '"+user_name+"' and Password= '"+password+"'")
        self.user_confirm = user.fetchall()

    def getUser(self):
        return self.user_confirm
