from bottle import route, run, template
import model

@route('/')
def domaca_stran():
    return template('domaca_stran')

@route('/poisci_zival/')
def poisci_zival():
    return template('poisci_zival')

@route('/veterinarji/')
def veterinarji():
    return template('veterinarji')

@route('/dodaj_zival/')
def dodaj_zival():
    return template('dodaj_zival')

@route('/storitve/')
def storitve():
    return template('storitve')

run(debug = True)
