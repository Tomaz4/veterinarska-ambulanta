from bottle import route, run, template,static_file, get, post, request
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
    return template('poisci_zival', podatki = "")

@route('/poisci_zival/', method = 'GET')
def poisci_zival():
    ime_zivali = request.query.ime_zivali
    return template('poisci_zival', podatki = model.izpisi_vsa_imena(ime_zivali))

@route('/poisci_zival/informacije/<id_zivali>')
def informacije(id_zivali):
    return template('informacije',podatki = model.vrni_obiske(id_zivali))

@route('/poisci_zival/informacije/<id_zivali>/<id_obiska>')
def vse_informacije_o_obisku(id_zivali,id_obiska):
    return template('vse_informacije',podatki = model.vrni_vse_podatke_o_obisku(id_obiska))

@route('/veterinarji/')
def veterinarji():
    slika_ime1 = 'Cat_And_Dog.png'
    slika_ime2 = 'kriz.png'
    return template('veterinarji', slika = slika_ime1, slikaKriz = slika_ime2, vet = model.vrni_vse_veterinarje())

@route('/veterinarji/<id_vet>')
def veterinar_storitve(id_vet):
    return template('vet_storitve', storitve = vrni_veterinar_storitev(id_vet))

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
