from bottle import route, run, template,static_file
import model


@route('/views/<filename>')
def server_static(filename):
    return static_file(filename, root='views/')

@route('/')
def domaca_stran():
    slika_ime1 = 'Cat_And_Dog.png'
    slika_ime2 = 'kriz.png'
    return template('domaca_stran', slika = slika_ime1, slikaKriz = slika_ime2)

@route('/poisci_zival/')
def poisci_zival():
    return template('poisci_zival')

@route('/veterinarji/')
def veterinarji():
    return template('veterinarji')

@route('/dodaj_zival/')
def dodaj_zival():
    return template('dodaj_zival')

@route('/dodaj_zival_in_lastnika/')
def dodaj_zival_in_lastnika():
    return template('dodaj_zival_in_lastnika')

@route('/storitve/')
def storitve():
    return template('storitve')

run(debug = True)
