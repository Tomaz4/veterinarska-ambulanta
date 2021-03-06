from bottle import route, run, template,static_file, get, post, request, redirect
import model
import time

@route('/views/<filename>')
def server_static(filename):
    return static_file(filename, root='views/')

@route('/')
def domaca_stran():
    slika_ime1 = 'Cat_And_Dog.png'
    slika_ime2 = 'kriz.png'
    return template('domaca_stran')

@route('/poisci_zival/', method = 'GET')
def poisci_zival():
    ime_zivali = request.query.ime_zivali
    return template('poisci_zival', podatki = model.izpisi_vsa_imena(ime_zivali))

@route('/poisci_zival/informacije/<id_zivali>', method = "GET")
def informacije(id_zivali):
    return template('informacije',zival = id_zivali, podatki = model.vrni_obiske(id_zivali), info = model.vrni_vse_o_zivali(id_zivali))

@route('/poisci_zival/informacije/<id_zivali>/datum_smrti_opombe/', method = 'GET')
def datum_smrti_opombe(id_zivali):
    return template('datum_smrti_opombe', id_zivali = id_zivali, opombe_pod= model.pridobi_opombe(id_zivali))

@route('/poisci_zival/informacije/<id_zivali>/datum_smrti_opombe/', method = 'POST')
def datum_smrti_opombe_post(id_zivali):
    # preberi podatke in posodobi bazo
    opombe = request.forms.opomba
    datum = request.forms.datum_smrti
    model.posodobi_datum_smrti_opombe(id_zivali,opombe,datum)
    redirect('/')

@route('/poisci_zival/informacije/<id_zivali>/dodaj_obisk/', method = "GET")
def dodaj_obisk(id_zivali):
    return template('dodaj_obisk',zival = id_zivali, zdravila = model.vrni_zdravila(), veterinarji = model.vrni_vse_veterinarje(), pod_zival = model.vrni_vse_o_zivali(id_zivali))
    
@route('/poisci_zival/informacije/<id_zivali>/dodaj_obisk/racun/', method = "GET")
def dokoncaj_racun(id_zivali):
    napaka = ''
    if request.query.napaka != '':
        napaka = 'Premalo zdravila {0} imaš na zalogi!'.format(model.ime_zdravila(int(request.query.napaka)))
        trajanje1 = request.query.trajanje
        ambulanta1 = request.query.ambulanta
        opombe1 = request.query.opombe
        teza1 = request.query.teza
        seznam_zdravil1 = request.query.getall('zdravila_form')
        veterinar_id1 = int(request.query.vet)
    else:
        datum1 = request.query.datum
        ura1 = request.query.ura
        trajanje1 = request.query.trajanje
        ambulanta1 = request.query.ambulanta
        opombe1 = request.query.opombe
        teza1 = request.query.teza
        seznam_zdravil1 = request.query.getall('zdravila_form')
        veterinar_id1 = int(request.query.vet)
    return template('racun.tpl', teza = teza1, trajanje = trajanje1,
                    ambulanta = ambulanta1, opombe = opombe1, seznam_zdravil = seznam_zdravil1,
                    sezImenaZdravil = model.vrni_imena_zdravil(seznam_zdravil1),
                    veterinar_id = veterinar_id1, vet_ime = model.vrni_veterinarja_ime(veterinar_id1),
                    id_zivali = id_zivali,seznam_storitev = model.vrni_vet_storitev_vse(veterinar_id1), napaka = napaka)

@route('/poisci_zival/informacije/<id_zivali>/dodaj_obisk/racun/dokoncaj_racun/', method = "POST")
def dokoncaj_racun_post(id_zivali):
    sezKolicinZdravil = request.forms.getall('okenca')
    seznamStoritev = request.forms.getall('storitve')
    datum = time.strftime("%d.%m.%Y") # datum in uro pridobimo kar od racunalnika
    ura = time.strftime("%H:%M:%S")
    trajanje = request.forms.trajanje
    ambulanta = request.forms.ambulanta
    opombe = request.forms.opombe
    teza = request.forms.teza
    veterinar_id = int(request.forms.veterinar)
    seznam_zdravil_id = request.forms.getall('sez_zdravil_id')
    ime_lastnika = model.pridobi_lastnika(id_zivali)
    try:
        cena = model.zakljuci_racun(datum,ura,trajanje,ambulanta,opombe,seznam_zdravil_id,veterinar_id,sezKolicinZdravil,seznamStoritev,teza,id_zivali)
    except Exception as e:
        niz = ''
        for el in seznam_zdravil_id:
            niz+= '&zdravila_form='+str(el)
        redirect('/poisci_zival/informacije/{0}/dodaj_obisk/racun/?napaka={1}&datum={2}&ura={3}&teza={4}&ambulanta={5}&trajanje={6}&opombe={7}&{8}&vet={9}'
                 .format(id_zivali,e,datum,ura,teza,ambulanta,trajanje,opombe,niz,veterinar_id))
    return template('dokoncaj_racun', datum = datum, ura = ura, cena = cena, ime_lastnika = ime_lastnika, seznam_kolicin_zdravil = sezKolicinZdravil, seznam_zdravil_ime = model.vrni_imena_zdravil(seznam_zdravil_id),
                        ime_zivali = model.pridobi_ime_zivali(id_zivali), ime_vet = model.pridobi_ime_veterinarja(veterinar_id), seznam_storitev_ime_cena = model.pridobi_imena_cene_storitev_seznam(seznamStoritev),
                    cene_zdravil = model.pridobi_cene_zdravil(seznam_zdravil_id))

@route('/poisci_zival/informacije/<id_zivali>/<id_obiska>')
def vse_informacije_o_obisku(id_zivali,id_obiska):
    return template('vse_informacije',podatki_zdravila = model.info_o_zdravilih(id_obiska), podatki_storitve = model.info_o_storitvah(id_obiska), podatki_obisk = model.info_o_obisku(id_obiska))

@route('/veterinarji/')
def veterinarji():
    return template('veterinarji', vet = model.vrni_vse_veterinarje())

@route('/veterinarji/uredi_vet/<id_vet>/', method = 'GET')
def uredi_vet(id_vet):
    napaka = ''
    if request.query.napaka == '1':
        napaka = 'Napačen vnos podatkov!'
    return template('uredi_vet', podatek = model.pridobi_vse_vet_podatke(id_vet),napaka = napaka)

# pri uredi želiva, da če se zmotimo, stvari ostanejo nespremenjene in se tudi vidijo v ponovnem obrazcu za urejanje
@route('/veterinarji/uredi_vet/<id_vet>/', method = 'POST')
def uredi_vet_post(id_vet):
    ime = request.forms.ime
    priimek = request.forms.priimek
    telefon = request.forms.telefon
    email = request.forms.email
    datum_rojstva = request.forms.datum_rojstva
    naslov = request.forms.naslov
    zaposlen = request.forms.zaposlen
    try:
        model.uredi_vet(ime, priimek, telefon,email, datum_rojstva, naslov, id_vet,zaposlen)
    except:
        redirect('/veterinarji/uredi_vet/{0}/?napaka=1'.format(id_vet))
    redirect('/')

@route('/veterinarji/<id_vet>')
def veterinar_storitve(id_vet):
    return template('vet_storitve', storitve = model.vrni_vet_storitev_vse(id_vet), pod_vet = model.pridobi_vse_vet_podatke(id_vet))

@route('/veterinarji/dodaj_vet/')
def dodaj_vet():
    return template('dodaj_vet', napaka = False, ime = "", priimek = "", telefon = "", email = "", datum_rojstva = "", naslov = "")

@route('/veterinarji/dodaj_vet/', method= 'POST')
def dodaj_vet_post():
    ime = request.forms.ime
    priimek = request.forms.priimek
    telefon = request.forms.telefon
    email = request.forms.email
    datum_rojstva = request.forms.datum_rojstva
    naslov = request.forms.naslov
    zaposlen = request.forms.zaposlen
    try:
        model.dodaj_veterinarja(ime, priimek, telefon,email, datum_rojstva, naslov, zaposlen)
    except:
        napaka = True
        return template('dodaj_vet', napaka = napaka, ime = ime, priimek = priimek, telefon = telefon, email = email, datum_rojstva = datum_rojstva, naslov = naslov)
    redirect('/')

@route('/storitve/')
def storitve():
    return template('storitve', storitve = model.vrni_storitve(), zdravila = model.vrni_zdravila())

@route('/storitve/zdravilo_uredi/<id_zdr>/',method = 'GET')
def zdravilo_uredi(id_zdr):
    napaka = ''
    if request.query.napaka == '1':
        napaka = 'Napačen vnos podatkov!'
    return template('zdravilo_uredi', podatki = model.vrni_doloceno_zdravilo(id_zdr),napaka = napaka)

@route('/storitve/zdravilo_uredi/<id_zdr>/',method = 'POST')
def zdravilo_uredi_post(id_zdr):
    ime = request.forms.ime
    cena = request.forms.cena
    trenutna_zaloga = request.forms.trenutna_zaloga
    minimalna_zaloga = request.forms.minimalna_zaloga
    try:
        model.posodobi_zdravilo(ime, cena, trenutna_zaloga, minimalna_zaloga, id_zdr)
    except:
        redirect('/storitve/zdravilo_uredi/{0}/?napaka=1'.format(id_zdr))
    redirect('/')

@route('/storitve/dodaj_zdravilo/', method = 'GET')
def dodaj_zdravilo(napaka = False):
    return template('dodaj_zdravilo', ime = "", cena = "", min_zaloga = "", trenutna_zaloga = "", napaka = False)

@route('/storitve/dodaj_zdravilo/', method = 'POST')
def dodaj_zdravilo_post():
    ime = request.forms.ime_zdr
    cena = request.forms.cena_zdr
    min_zaloga = request.forms.minimalna_zaloga
    recept = request.forms.recept
    trenutna_zaloga = request.forms.trenutna_zaloga
    try:
        model.dodaj_zdravilo(ime,cena,min_zaloga,recept,trenutna_zaloga)
    except Exception as e:
        napaka = True
        return template('dodaj_zdravilo', ime = ime,cena = cena,min_zaloga=min_zaloga,trenutna_zaloga=trenutna_zaloga, napaka = napaka)
    redirect('/')

@route('/storitve/dodaj_storitev/', method = 'GET')
def dodaj_storitev():
    return template('dodaj_storitev', ime = "", cena = "", napaka = False)

@route('/storitve/dodaj_storitev/', method = 'POST')
def dodaj_storitev_post():
    cena_stor = request.forms.cena_stor
    ime_stor = request.forms.ime_stor
    try:
        model.vstavi_novo_storitev(cena_stor,ime_stor)
    except:
        napaka = True
        return template('dodaj_storitev', ime = ime_stor, cena = cena_stor, napaka = napaka)
    redirect('/')

@route('/storitve/storitev_uredi/<id_stor>/', method = 'GET')
def storitev_uredi(id_stor):
    napaka = ''
    if request.query.napaka == '1':
        napaka = 'Napačen vnos podatkov!'
    return template('storitev_uredi', podatki = model.vrni_doloceno_storitev(id_stor), veterinarji = model.vrni_vse_veterinarje2(id_stor), napaka = napaka)

@route('/storitve/storitev_uredi/<id_stor>/', method = 'POST')
def storitev_uredi_post(id_stor):
    ime_stor = request.forms.ime_storitve
    cena_stor = request.forms.cena_storitve
    try:
        model.posodobi_storitev(id_stor,cena_stor,ime_stor)
        sez = request.forms.getall('vet')
        sez_int = []
        for el in sez:
            sez_int.append(int(el))
        model.dodaj_vet_stor(id_stor,sez_int)
    except:
        redirect('/storitve/storitev_uredi/{0}/?napaka=1'.format(id_stor))
    redirect('/')
    
@route('/uredi_lastnika/', method = 'GET')
def uredi_lastnika():
    lastnik = request.query.lastnik
    return template('uredi_lastnika',podatki = model.lastnik_imena(lastnik))

@route('/uredi_lastnika/<id_lastnik>/', method = 'GET')
def uredi_lastnika_2(id_lastnik):
    napaka = ''
    if request.query.napaka == '1':
        napaka = 'Napačen vnos podatkov!'
    return template('lastnik',napaka = napaka, lastnik = id_lastnik, podatki = model.lastnik_podatki(id_lastnik))

@route('/uredi_lastnika/<id_lastnik>/', method = 'POST')
def uredi_lastnika_post(id_lastnik):
    ime = request.forms.ime
    priimek = request.forms.priimek
    naslov = request.forms.naslov
    email = request.forms.email
    telefon = request.forms.telefon
    try:
        model.posodobi_lastnika(id_lastnik,ime,priimek,naslov,email,telefon)
    except:
        redirect('/uredi_lastnika/{0}/?napaka=1'.format(id_lastnik))
    redirect('/')

@route('/poisci_lastnika/', method = 'GET')
def pridobi_lastnika():
    lastnik = request.query.lastnik_okno
    return template('poisci_lastnika', podatki = model.lastnik_imena(lastnik))

@route('/dodaj_zival/<id_lastnika>/', method = 'GET')
def dodaj_zival(id_lastnika):
    return template('dodaj_zival', lastnik_pod = model.lastnik_podatki(id_lastnika), id_lastnika = id_lastnika, ime = "", barva = "", pasma = "", datum_roj = "", opombe = "", napaka = False)

@route('/dodaj_zival/<id_lastnika>/', method = 'POST')
def dodaj_zival_post(id_lastnika):
    ime = request.forms.ime_zivali
    barva = request.forms.barva_zivali
    pasma = request.forms.pasma_zivali
    spol = request.forms.spol
    datum_roj = request.forms.datum_rojstva
    opombe = request.forms.opombe
    id_lastnika = id_lastnika
    try:
        model.dodaj_zival(ime, barva, pasma, spol, datum_roj, id_lastnika, opombe)
    except:
        return template('dodaj_zival', id_lastnika = id_lastnika, ime = ime, barva = barva, pasma = pasma, datum_roj = datum_roj, opombe = opombe, napaka = True)
    redirect('/')

@route('/dodaj_zival_in_lastnika/')
def dodaj_zival_in_lastnika():
    return template('dodaj_zival_in_lastnika', napaka = False, ime = "", priimek = "", naslov = "", telefon = "", email = "")

@route('/dodaj_zival_in_lastnika/', method = 'POST')
def dodaj_zival_in_lastnika_post():
    ime = request.forms.ime
    priimek = request.forms.priimek
    naslov = request.forms.naslov
    telefon = request.forms.telefon
    email = request.forms.email
    try:
        id_lastnika = model.dodaj_lastnika(ime, priimek, naslov, telefon, email)
    except:
        return template('dodaj_zival_in_lastnika', napaka = True, ime = ime, priimek = priimek, naslov = naslov, telefon = telefon, email = email)
    redirect('/dodaj_zival/{0}/'.format(id_lastnika))

run(debug = True)
