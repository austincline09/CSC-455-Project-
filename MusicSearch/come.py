import MySQLdb
import search_bar_db



class insertDatabase:
    try:
        def insertValue(self,stripValue): ##insert ID into currentSearch after filter
            i = 0
            b = MySQLdb.connect(host='152.20.234.248',
                                user='kly2888',
                                passwd='FaehAKUMP',
                                db='kly2888')

            results = b.cursor()
            results.execute("TRUNCATE TABLE currentSearch")
            for i in range(len(stripValue)):
                realValue = "(" + stripValue[i] + ")"
                duh = ("INSERT INTO currentSearch values "+realValue)
                print("made it")
                results.execute(duh)
                b.commit()
                i += 1
    except:
        print("Cant")





