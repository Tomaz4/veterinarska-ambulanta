from bottle import route, run, template

@route('/')
def domaca_stran():
    return ('VETERINARSKA AMBULANTA')

run(debug = True)
