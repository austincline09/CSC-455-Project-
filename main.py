from flask import Flask, request, render_template, redirect, current_app
import callDatabase as cd
app = Flask(__name__)

@app.route('/')
def searchone():
    return render_template('searchFirst.html')

@app.route('/setsearchone', methods = ['POST', 'GET'])
def setsearchone():
    if request.method == 'POST':
        first_select = request.form['first']
    redirect_to_second = redirect('/searchtwo')
    response = current_app.make_response(redirect_to_second)
    response.set_cookie('first_cookie', first_select)
    return response

@app.route('/searchtwo')
def searchtwo():
    first = request.cookies.get('first_cookie')
    return render_template('searchSecond.html', first=first)


@app.route('/setsearchtwo', methods = ['POST', 'GET'])
def setsearchtwo():
    if request.method == 'POST':
        second_select = request.form['second']
    redirect_to_search_bar = redirect('/search_bar')
    responsetwo = current_app.make_response(redirect_to_search_bar)
    responsetwo.set_cookie('second_cookie', second_select)
    return responsetwo

@app.route('/search_bar')
def search_bar():
    first = request.cookies.get('first_cookie')
    second = request.cookies.get('second_cookie')
    return render_template('search.html', first=first, second=second)

@app.route('/setresults', methods = ['POST', 'GET'])
def set_results():
    if request.method == 'POST':
        search_bar_text = request.form['searchtext']
    redirect_to_results = redirect('/results')
    search_text = current_app.make_response(redirect_to_results)
    search_text.set_cookie('third_cookie', search_bar_text)
    return search_text

@app.route('/results')
def results():
    s = ""
    first = request.cookies.get('first_cookie')
    second = request.cookies.get('second_cookie')
    third = request.cookies.get('third_cookie')
    cdd = cd.callDB(first, second, third)
    l = cdd.getResult()
    for i in range(len(l)):
        s += l[i][0] + "<br>"
    return render_template('results.html', search=s)

if __name__ == "__main__":
    app.run()