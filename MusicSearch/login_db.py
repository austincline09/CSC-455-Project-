import MySQLdb


class CallDataBase:
    def __init__(self, user_name, password):
        self.b = MySQLdb.connect(host='152.20.234.248',
                                 user='jtb9611',
                                 passwd='5BWYH6fXO',
                                 db='jtb9611')

        self.un = user_name
        self.pw = password

        user = self.b.cursor()
        self.add = self.b.cursor()

        user.execute("Select User_Name, Password from members where User_Name = '"+user_name+"' and Password= '"+password+"'")
        self.user_confirm = user.fetchall()

    def getUser(self):
        return self.user_confirm

    def check_user(self):
        check = self.b.cursor()
        check.execute("Select User_Name from members where User_Name = '"+self.un+"'")
        check_un = check.fetchall()
        return check_un

    def addUser(self):
        self.add.execute("""INSERT INTO members VALUES (%s,%s)""", (self.un, self.pw))
        self.b.commit()
