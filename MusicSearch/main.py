"""
Created by Jeremy Timothy Brown
Version 1.0
Last Update 11/02/2016 12:23PM EST


This python runs all flask which is used to render the .html files, create cookies
via user input, and connect to the python files that are used to pull information from
our database hosted on UNCW's servers.
"""

# import statements
from flask import Flask, request, render_template, redirect, current_app
import callDatabase as cd
import login
import register
# end import statements

# creates the application
app = Flask(__name__)


# the first route, this function renders that main page
@app.route('/')
def search_one():
    return render_template('searchFirst.html')


# this function renders the about page
@app.route('/about/')
def about():
    return render_template('about.html')


# this function renders the user page
# if a user has already logged in, the function passes the needed information to the user page
@app.route('/user/')
def user():
    if request.cookies.get('username') and request.cookies.get('password'):
        un = request.cookies.get('username')
        pw = request.cookies.get('password')
        return render_template('user.html', username=un, password=pw)
    else:
        return  render_template('user.html')


# this function checks to see if the user exists and then redirects back to the user page
# if the user does exist this function returns the information to log the user in
@app.route('/check_user', methods=['POST', 'GET'])
def set_user():
    if request.method == 'POST':
        user_name = request.form['userName']
        password = request.form['password']
    redirect_to_user = redirect('/user/')
    log = login.login(user_name, password)
    user_check = log.getUser()
    try:
        if user_check[0][0] == user_name and user_check [0][1] == password:
            login_response = current_app.make_response(redirect_to_user)
            login_response.set_cookie('username', user_name)
            login_response.set_cookie('password', password)
            return login_response
        else:
            login_response = current_app.make_response(redirect_to_user)
            return login_response
    except IndexError:
        login_response = current_app.make_response(redirect_to_user)
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
    return render_template('register.html')


# still need to implement checking to see if user exists and adding the user
@app.route('/new_user', methods=['POST', 'GET'])
def register_user():
    if request.method == 'POST':
        new_user_name = request.form['newUserName']
        new_password = request.form['newPassword']
    redirect_to_login = redirect('/user/')
    reg = register.register(new_user_name, new_password)
    getNewUser = reg.new_user()
    try:
        if getNewUser[0][0] == new_user_name and getNewUser[0][1] == new_password:
            pass
            # do something to let user know they are logged in
    except IndexError:
        register_response = current_app.make_response(redirect_to_login)
        register_response.set_cookie('newUserName', '', expires=0)
        register_response.set_cookie('newPassword', '', expires=0)
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
@app.route('/results')
def results():
    first = request.cookies.get('first_cookie')
    second = request.cookies.get('second_cookie')
    third = request.cookies.get('third_cookie')
    db = cd.callDB(first, second, third)
    search_result = db.getResult()
    genres = db.getGenres()
    award_names = db.getAwards()
    return render_template('results.html', genres=genres, awards=award_names, first=first, second=second, third=third, search=search_result)

# if the app exists, run that junk
if __name__ == "__main__":
    app.run()
