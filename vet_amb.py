from bottle import route, run, template,static_file, get, post, request, redirect
import model

@route('/views/<filename>')
def server_static(filename):
    return static_file(filename, root='views/')

@route('/')
def domaca_stran():
##    slika_ime1 = 'Cat_And_Dog.png'
##    slika_ime2 = 'kriz.png'
    #slika = slika_ime1, slikaKriz = slika_ime2
    return template('domaca_stran')

@route('/poisci_zival/')
def poisci_zival():
    return template('poisci_zival', podatki = "")

@route('/poisci_zival/', method = 'GET')
def poisci_zival():
    ime_zivali = request.query.ime_zivali
    return template('poisci_zival', podatki = model.izpisi_vsa_imena(ime_zivali))

@route('/poisci_zival/informacije/<id_zivali>', method = "GET")
def informacije(id_zivali):
    return template('informacije',zival = id_zivali, podatki = model.vrni_obiske(id_zivali))
@route('/poisci_zival/informacije/<id_zivali>/dodaj_obisk/', method = "GET")
def dodaj_obisk(id_zivali):
    return template('dodaj_obisk',zival = id_zivali, zdravila = model.vrni_zdravila(), veterinarji = model.vrni_vse_veterinarje())


@route('/poisci_zival/informacije/<id_zivali>/dodaj_obisk/racun/', method = "GET")
def dokoncaj_racun(id_zivali):
    datum1 = request.query.datum
    ura1 = request.query.ura
    trajanje1 = request.query.trajanje
    ambulanta1 = request.query.ambulanta
    opombe1 = request.query.opombe
    teza1 = request.query.teza
    seznam_zdravil1 = request.query.getall('zdravila_form')
    veterinar_id1 = int(request.query.vet)
    return template('racun.tpl',datum = datum1, teza = teza1, ura = ura1, trajanje = trajanje1,
                    ambulanta = ambulanta1, opombe = opombe1, seznam_zdravil = seznam_zdravil1,
                    sezImenaZdravil = model.vrni_imena_zdravil(seznam_zdravil1),
                    veterinar_id = veterinar_id1, vet_ime = model.vrni_veterinarja_ime(veterinar_id1),
                    id_zivali = id_zivali,seznam_storitev = model.vrni_vet_storitev_vse(veterinar_id1))





@route('/poisci_zival/informacije/<id_zivali>/dodaj_obisk/racun/dokoncaj_racun/', method = "POST")
def dokoncaj_racun_post(id_zivali):
    print(dict(request.forms))
    sezKolicinZdravil = request.forms.getall('okenca')
    seznamStoritev = request.forms.getall('storitve')
    datum = request.forms.datum
    ura = request.forms.ura
    trajanje = request.forms.trajanje
    ambulanta = request.forms.ambulanta
    opombe = request.forms.opombe
    teza = request.forms.teza
    veterinar_id = int(request.forms.veterinar)
    seznam_zdravil_id = request.forms.getall('sez_zdravil_id')
    for el in seznam_zdravil_id:
        print(repr(el))
#    try:
    model.zakljuci_racun(datum,ura,trajanje,ambulanta,opombe,seznam_zdravil_id,veterinar_id,sezKolicinZdravil,seznamStoritev,teza,id_zivali)
#    except:
#        return template('racun.tpl',datum = datum, teza = teza, ura = ura, trajanje = trajanje, ambulanta = ambulanta, opombe = opombe, seznam_zdravil = seznam_zdravil, sezImenaZdravil = model.vrni_imena_zdravil(seznam_zdravil),
#                        veterinar_id = veterinar_id, vet_ime = model.vrni_veterinarja_ime(veterinar_id), id_zival = id_zivali,seznam_storitev = model.vrni_vet_storitev_vse(veterinar_id))
        

            
        
        
    

@route('/poisci_zival/informacije/<id_zivali>/<id_obiska>')
def vse_informacije_o_obisku(id_zivali,id_obiska):
    return template('vse_informacije',podatki = model.vrni_vse_podatke_o_obisku(id_obiska))

@route('/veterinarji/')
def veterinarji():
    return template('veterinarji', vet = model.vrni_vse_veterinarje())

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
    return template('storitve', storitve = model.vrni_storitve())


@route('/storitve/storitev_uredi/<id_stor>/', method = 'GET')
def storitev_uredi(id_stor):
    return template('storitev_uredi', podatki = model.vrni_doloceno_storitev(id_stor), veterinarji = model.vrni_vse_veterinarje())

@route('/storitve/storitev_uredi/<id_stor>/', method = 'POST')
def storitev_uredi_post(id_stor):
    ime_stor = request.forms.ime_storitve
    cena_stor = request.forms.cena_storitve
    model.posodobi_storitev(id_stor,cena_stor,ime_stor)
    sez = request.forms.getall('vet')
    sez_int = []
    for el in sez:
        sez_int.append(int(el))
    model.dodaj_vet_stor(id_stor,sez_int)
    redirect('/')
run(debug = True)
