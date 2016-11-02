import MySQLdb


class register:
    def __init__(self, user_name, password):
        print here
        self.b = MySQLdb.connect(host='152.20.234.248',
                                 user='jtb9611',
                                 passwd='5BWYH6fXO',
                                 db='jtb9611')

        reg = self.b.cursor()
        check = self.b.cursor()

        check.execute("Select User_Name, Password from members where User_Name = '" + user_name + "' and Password= '" + password + "'")
        self.new_user = check.fetchall()

    def getNewUser(self):
        return self.new_user
