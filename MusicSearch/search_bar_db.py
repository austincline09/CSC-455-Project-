import MySQLdb
import come
import storedProcedures


class CallDataBase:
    def __init__(self, song_or_album, by_name_or_artist, user_search):
        self.b = MySQLdb.connect(host='152.20.234.248',
                            user='kly2888',
                            passwd='FaehAKUMP',
                            db='kly2888')

        results = self.b.cursor()
        idResults = self.b.cursor()
        genres = self.b.cursor()
        awards = self.b.cursor()
        self.songs = self.b.cursor()
        self.albums = self.b.cursor()

        if user_search != '':
            if song_or_album == "Song":
                if by_name_or_artist == "By Name":
                    results.execute("Select Song_Name, Artist_Name from songs natural join artists where Song_Name like '%"+user_search+"%'")
                    idResults.execute("Select Song_ID from songs where Song_Name like '%" + user_search + "%'")
                elif by_name_or_artist == "By Artist":
                    results.execute("Select Song_Name, Artist_Name from songs natural join artists where Artist_Name like '%"+user_search+"%'")
                    idResults.execute("Select Song_ID from songs natural join artists where Artist_Name like '%" + user_search + "%'")
            elif song_or_album == "Album":
                if by_name_or_artist == "By Name":
                    results.execute("Select Album_Name, Artist_Name from albums natural join artists where Album_Name like '%"+user_search+"%'")
                    idResults.execute("Select Album_ID from albums where Album_Name like '%" + user_search + "%'")
                elif by_name_or_artist == "By Artist":
                    results.execute("Select Album_Name, Artist_Name from albums natural join artists where Artist_Name like '%"+user_search+"%'")
                    idResults.execute("Select Album_ID from albums natural join artists where Artist_Name like '%" + user_search + "%'")
            self.result = results.fetchall()
        elif song_or_album == "Song":
            self.songs.execute("Select * from all_songs")
            self.result = self.songs.fetchall()
            idResults.execute("Select Song_ID from songs where Song_Name like '%" + user_search + "%'")
        elif song_or_album == "Album":
            self.songs.execute("Select * from all_albums")
            self.result = self.songs.fetchall()
            idResults.execute("Select Album_ID from albums natural join artists where Artist_Name like '%" + user_search + "%'")

        self.idResults = idResults.fetchall()

        genres.execute("Select Genre_Name from genres")
        self.genre_names = genres.fetchall()

        awards.execute("Select Award_Name from awards")
        self.award_names = awards.fetchall()

    def getResult(self):
        return self.result

    def getGenres(self):
        return self.genre_names

    def getAwards(self):
        return self.award_names


    def getidResult(self):
        return self.idResults

    def inCurrentSearch(self, listList):##insert original search into currentSearch
        insertNew = self.b.cursor()
        for i in range(len(listList)):
            idvalue = str(listList[i][0])
            try:
                insertNew.execute("insert into currentSearch values (" + idvalue + ")")
                self.b.commit()
            except:
                self.b.rollback()
            i += 1

    def clearCurrentSearch(self):
        delTable = self.b.cursor()
        delTable.execute("TRUNCATE TABLE currentSearch")



    def filter(self,whichFilter,valueFilter,sngOralbm):
        something = storedProcedures.StoredPro()
        # filterTable = self.b.cursor()
        # varible = self.b.cursor()
        # filterfilter = self.b.cursor()
        # trial = self.b.cursor()
        #
        # if whichFilter == "genre":
        #     print(sngOralbm)
        #     newest = something.checkCS(whichFilter,valueFilter,sngOralbm)
        #     print(newest)
        #     self.stripValues(newest)
        # if whichFilter == "award":
        #     newest = something.checkCS(whichFilter, valueFilter,sngOralbm)
        #     print(newest)
        #     self.stripValues(newest)
        # if whichFilter == "lyric":
        #     print("hitting lyrics")
        #     newest = something.checkCS(whichFilter,valueFilter,sngOralbm)
        #     print(newest)
        #     self.stripValues(newest)

        newest = something.checkCS(whichFilter,valueFilter,sngOralbm)
        print(newest)
        self.stripValues(newest)





    def stripValues(self, quereyList):
        list = []
        #self.clearCurrentSearch()
        insertcurrentSearch = self.b.cursor()
        for i in range(len(quereyList)):
            toInsert = str(quereyList[i][0])
            list.append(toInsert)
            i += 1
        #print list
        newInsert = come.insertDatabase()
        newInsert.insertValue(list)








