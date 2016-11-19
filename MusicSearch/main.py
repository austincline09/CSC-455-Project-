"""
Created by Jeremy Timothy Brown
Version 3.0.2
Last Update 11/19/2016 10:11AM EST


This python runs all flask which is used to render the .html files, create cookies
via user input, and connect to the python files that are used to pull information from
our database hosted on UNCW's servers.
"""

# import statements
from flask import Flask, request, render_template, redirect, current_app
import search_bar_db
import login_db
import song_info_db
import CheckCS
import userSaves
import admin as a
# import spotifyRequests
# end import statements

# creates the application
app = Flask(__name__)

first_select = ' ' ##allows to pass this value that changes when clicked to another function


@app.route('/')
def home():
    return render_template('home.html')


# This function routes the to the base url, hosted by the local server.
# When called, it renders the main page which allows the user to select if they
# want to choose to search for a song or an album.
@app.route('/start')
def search_one():
    clear = search_bar_db.CallDataBase("Song", "By Name", "one")
    clear.clearCurrentSearch()
    return render_template('searchFirst.html')


# This function routes the to the about url, hosted by the local server.
# When called, it renders the about page.
@app.route('/about/')
def about():
    return render_template('about.html')


# This function routes the to the user url, hosted by the local server.
# When called, it runs through a few different if statements before it renders
# the user page.
@app.route('/user/')
def user():
    # if the user has already logged it, this will pass through the username and password
    # if the user is the admin, it will also pass that cookie through
    # before it renders the
    if request.cookies.get('username') and request.cookies.get('password'):
        un = request.cookies.get('username')
        pw = request.cookies.get('password')
        admin_logged = request.cookies.get('admin_logged_in')
        return render_template('user.html', username=un, password=pw, admin=admin_logged)
    else:
        msg = request.cookies.get('msg')
        return render_template('user.html', msg=msg)


# This function redirects the to the user url, hosted by the local server.
# When called, it checks to see if the user exists in the database before it
# renders the user page.
@app.route('/check_user', methods=['POST', 'GET'])
def set_user():
    # if the login button is pressed on the user page, get the username and
    # password entered by the user
    if request.method == 'POST':
        user_name = request.form['userName']
        password = request.form['password']
    redirect_to_user = redirect('/user/')
    log = login_db.CallDataBase(user_name, password)
    user_check = log.getUser()
    try:
        if user_check[0][0] == user_name and user_check [0][1] == password:
            login_response = current_app.make_response(redirect_to_user)
            if user_check[0][0] == 'admin':
                login_response.set_cookie('admin_logged_in', 'admin')
            elif user_check[0][0] != 'admin':
                login_response.set_cookie('admin_logged_in', '')
            login_response.set_cookie('username', user_name)
            login_response.set_cookie('password', password)
            return login_response
        else:
            login_response = current_app.make_response(redirect_to_user)
            login_response.set_cookie('msg', 'User name not found :(', max_age=30)
            return login_response
    except IndexError:
        login_response = current_app.make_response(redirect_to_user)
        login_response.set_cookie('msg', 'User name not found :(', max_age=30)
        return login_response


# still need to implement delete
@app.route('/delete_user', methods=['POST', 'GET'])
def delete_user():
    redirect_to_login = redirect('/user/')
    delete_response = current_app.make_response(redirect_to_login)
    delete_response.set_cookie('userName', '', expires=0)
    delete_response.set_cookie('password', '', expires=0)
    return delete_response


# this function renders the register page
@app.route('/register/', methods=['POST', 'GET'])
def register():
    if request.cookies.get('msg'):
        msg = request.cookies.get('msg')
        # print msg
        return render_template('register.html', msg=msg)
    else:
        return render_template('register.html')


# still need to implement checking to see if user exists and adding the user
@app.route('/new_user', methods=['POST', 'GET'])
def register_user():
    if request.method == 'POST':
        new_user_name = request.form['newUserName']
        new_password = request.form['newPassword']
    redirect_to_login = redirect('/user/')
    redirect_to_register = redirect('/register/')
    check = login_db.CallDataBase(new_user_name, new_password)
    getNewUser = check.check_user()
    print getNewUser
    try:
        if getNewUser[0][0] == new_user_name:
            register_response = current_app.make_response(redirect_to_register)
            register_response.set_cookie('msg', 'Bummer dude, this username is already taken.', max_age=30)
            return register_response
    except IndexError:
        check.addUser()
        register_response = current_app.make_response(redirect_to_login)
        register_response.set_cookie('msg', 'Radical, you created a new user', max_age=30)
        return register_response


# this function deals with logging the user out
# when called it removes the current user and their password from the cookies ;)
@app.route('/logout', methods=['POST', 'GET'])
def logout():
    redirect_to_login = redirect('/user/')
    logout_response = current_app.make_response(redirect_to_login)
    logout_response.set_cookie('userName', '', expires=0)
    logout_response.set_cookie('password', '', expires=0)
    return logout_response


# this function deals with the user selecting to search for a song or album
# when called it redirects to the second search option
@app.route('/set_search_one', methods=['POST', 'GET'])
def set_search_one():
    if request.method == 'POST':
        global first_select ##allows to pass this value to another function
        first_select = request.form['first']
    redirect_to_second = redirect('/search_two')
    response = current_app.make_response(redirect_to_second)
    response.set_cookie('first_cookie', first_select)
    return response


# this function grabs the cookie that lets us know if the user wanted to search for a song or album
# It then renders that second search page
@app.route('/search_two')
def search_two():
    first = request.cookies.get('first_cookie')
    return render_template('searchSecond.html', first=first)


# this function deals with the user selecting to search by name or by artist
# when called it redirects to the search bar
@app.route('/set_search_two', methods=['POST', 'GET'])
def set_search_two():
    if request.method == 'POST':
        second_select = request.form['second']
    redirect_to_search_bar = redirect('/search_bar')
    response_two = current_app.make_response(redirect_to_search_bar)
    response_two.set_cookie('second_cookie', second_select)
    return response_two


# this function grabs the cookies that lets us know if the user wanted to search for a song or album
# as well as the one that allows us to know if the user is searching by name or by artist
# It then renders the search bar page
@app.route('/search_bar')
def search_bar():
    first = request.cookies.get('first_cookie')
    second = request.cookies.get('second_cookie')
    return render_template('search.html', first=first, second=second)


# this function deals with the user's search input
# when called it grabs the correct cookie, and then redirects to the results page
@app.route('/set_results', methods=['POST', 'GET'])
def set_results():
    if request.method == 'POST':
        search_bar_text = request.form['search_text']
    redirect_to_results = redirect('/results')
    search_text = current_app.make_response(redirect_to_results)
    search_text.set_cookie('third_cookie', search_bar_text)
    return search_text


# need to implement the routes for the filters
@app.route('/results', methods=['POST', 'GET'])
def results(show="false", album_id=0):
    print album_id
    albumsongs = ''
    first = request.cookies.get('first_cookie')
    second = request.cookies.get('second_cookie')
    third = request.cookies.get('third_cookie')
    # spotifyRequests.search_artist(third)
    db = search_bar_db.CallDataBase(first, second, third)
    search_result = db.getResult()
    idSong = db.getidResult()
    db.clearCurrentSearch()
    db.inCurrentSearch(idSong)
    genres = db.getGenres()
    award_names = db.getAwards()
    if album_id != 0:
        albumsongs = db.get_album_songs(album_id)
    if request.cookies.get('username'):
        return render_template('results.html', albumsongs=albumsongs, show=show, genres=genres, awards=award_names, first=first, second=second, third=third, search=search_result, log="true")
    else:
        return render_template('results.html', albumsongs=albumsongs,show=show, genres=genres, awards=award_names, first=first, second=second,
                               third=third, search=search_result)


@app.route('/show_songs/<album_id>', methods=['POST', 'GET'])
def show_album_songs(album_id):
    redirect_to_results = redirect('/results')
    search_text = current_app.make_response(redirect_to_results)
    search_text.set_cookie('show', album_id)
    return results("true", album_id)


# used for getting all songs or albums
@app.route('/set_all', methods=['POST', 'GET'])
def set_all():
    choice = request.form['all']
    redirect_to_results = redirect('/results')
    search_text = current_app.make_response(redirect_to_results)
    if choice == 'All Songs':
        first = 'Song'
        second = 'By Name'
        third = ''
        search_text.set_cookie('first_cookie', first)
        search_text.set_cookie('second_cookie', second)
        search_text.set_cookie('third_cookie', third)
        return search_text
    else:
        first = 'Album'
        second = 'By Name'
        third = ''
        search_text.set_cookie('first_cookie', first)
        search_text.set_cookie('second_cookie', second)
        search_text.set_cookie('third_cookie', third)
        return search_text


@app.route('/admin_page')
def admin():
    get = a.CallDataBase()
    all_users = get.get_users()
    print all_users
    return render_template('admin.html', users=all_users)


@app.route('/remove_user/<username>')
def remove_user(username):
    remove = a.CallDataBase()
    remove.delete_user(username)
    return admin()


# used for the filters on the results page
@app.route('/filter', methods=['POST', 'GET'])
def filter_result():
    trial = CheckCS.check()
    albumOrsong = first_select  ##value song or album, passed from set_search_one
    first = request.cookies.get('first_cookie')
    second = request.cookies.get('second_cookie')
    third = request.cookies.get('third_cookie')
    db = search_bar_db.CallDataBase(first, second, third)
    genres = db.getGenres()
    award_names = db.getAwards()

    # filter for genre
    if request.form.getlist('optgenre'):
        genre = request.form.getlist('optgenre')
        label = 'genre'
        value = genre[0]
        db.filter(label, value, albumOrsong)

    # filter for award
    if request.form.getlist('optaward'):
        print("Didnt hit awawrd")
        award = request.form.getlist('optaward')
        label = 'award'
        value = award[0]
        print value
        db.filter(label, value,albumOrsong)

    if request.form.getlist('hours'):
        hours = request.form.getlist('hours')
        if request.form.getlist('minutes'):
            minutes = request.form.getlist('minutes')
        if request.form.getlist('seconds'):
            seconds = request.form.getlist('seconds')
            length = hours[0]+":"+minutes[0]+":"+seconds[0]
            print length

    if request.form.getlist('songLyric'):
        songLyric = request.form.getlist('songLyric')
        label = 'lyric'
        value = songLyric[0]
        if value == "":
            print("lyric filter is empty")
        else:
            # print("Im not empty")
            db.filter(label,value,albumOrsong)

    display = trial.displayCS(albumOrsong)
    # print(display)
    if request.cookies.get('username'):
        return render_template('results.html', genres=genres, awards=award_names, first=first, second=second,
                               third=third, search=display, log="true", filter="true")
    else:
        return render_template('results.html', genres=genres, awards=award_names, first=first, second=second,
                               third=third, search=display, filter='true')


# prints some lyrics when called
@app.route('/song_info/<song_id>/')
def song_info(song_id):
    song = song_info_db.CallDataBase()
    song_infos = song.get_song_info(song_id)
    album = song.get_album(song_id)
    artist = song.get_artist(song_id)
    genre = song.get_genre(song_id)
    hours, remainder = divmod(song_infos[0][1].seconds, 3600)
    minutes, seconds = divmod(remainder, 60)
    name = song_infos[0][0]
    if minutes < 10:
        length = str(hours)+":0"+str(minutes)+":"+str(seconds)
    else:
        length = str(hours) + ":" + str(minutes) + ":" + str(seconds)
    released = song_infos[0][2]
    lyric = song.get_lyric(song_id)
    if lyric == "false":
        return render_template('song_info.html', artist=artist, genre=genre, name=name, length=length,
                               released=released, album=album)
    else:
        lyric = lyric[0].split('\n')
        return render_template('song_info.html', lyric=lyric, artist=artist, genre=genre, name=name, length=length, released=released, album=album)

@app.route('/save/<artist_id>/')
def save_artist(artist_id):
    id_type = request.cookies.get('first_cookie')
    un = request.cookies.get('username')
    save = userSaves.CallDataBase()
    if id_type == "Song":
        save.save_song(un, artist_id)
    elif id_type == "Album":
        save.save_album(un, artist_id)
    else:
        print "save failed"
    return results()


@app.route('/savef/<artist_id>/')
def savef_artist(artist_id):
    id_type = request.cookies.get('first_cookie')
    un = request.cookies.get('username')
    save = userSaves.CallDataBase()
    if id_type == "Song":
        save.save_song(un, artist_id)
    elif id_type == "Album":
        save.save_album(un, artist_id)
    else:
        print "save failed"
    return filter_result()


@app.route('/remove_album/<album_ID>')
def remove_saved_album(album_ID):
    username = request.cookies.get('username')
    remove = userSaves.CallDataBase()
    remove.remove_album(username, album_ID)
    return saved()

@app.route('/remove_song/<song_ID>')
def remove_saved_song(song_ID):
    username = request.cookies.get('username')
    remove = userSaves.CallDataBase()
    remove.remove_song(username, song_ID)
    return saved()


# route for rendering a user's saved songs and albums
@app.route('/saved', methods=['POST', 'GET'])
def saved():
    username = request.cookies.get('username')
    save = userSaves.CallDataBase()
    songs = save.get_user_songs(username)
    albums = save.get_user_albums(username)
    return render_template("saved.html", songs=songs, albums=albums)

# if the app exists, run that junk
if __name__ == "__main__":
    app.run()
