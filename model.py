import sqlite3

con = sqlite3.connect('Sql/veterinarska_ambulanta.sqlite')
con.row_factory = sqlite3.Row


def vrni_obiske(idZivali):
    ''' vrne vse obiske dane živali. '''
    sql = '''Select obisk.id,obisk.datum, obisk.ura,obisk.teza, obisk.id_zivali, obisk.opombe, obisk.cena from obisk join zivali on obisk.id_zivali = zivali.id where id_zivali = ?'''
    return list(con.execute(sql,[idZivali]))

def izpisi_vsa_imena(imeZivali):
    ''' Funkcija vrne imena živali s podanim imenom ter pripadajoce lastnikove podatke. '''
    sql = '''SELECT * FROM zivali JOIN lastniki ON zivali.id_lastnika = lastniki.id WHERE zivali.ime = ?'''
    return list(con.execute(sql, [imeZivali]))

def vrni_vse_veterinarje2(id_stor):
    ''' vrne veterinarje, ki doloèene storitve še nimajo. '''
    sql = ''' select * from veterinarji where id not in (select veterinar_storitev.id_veterinarja from veterinar_storitev join veterinarji on veterinar_storitev.id_veterinarja = veterinarji.id where veterinar_storitev.id_storitve = ?) and zaposlen = 'DA' '''
    return list(con.execute(sql,[id_stor]))

def vrni_vse_veterinarje():
    ''' vrne vse veterinarje '''
    sql = ''' select * from veterinarji'''
    return list(con.execute(sql))

def vrni_veterinar_storitev(idVeterinarja):
    sql = '''select storitve.ime from veterinar_storitev join storitve on veterinar_storitev.id_storitve = storitve.id where id_veterinarja = ?'''
    return list(con.execute(sql,[idVeterinarja]))

def vrni_storitve():
    sql = ''' select * from storitve'''
    return sorted(list(con.execute(sql)), key=lambda x: x[2])
   
def dodaj_veterinarja(ime,priimek,telefon,email,datum_rojstva,naslov,zaposlen):
    ''' funkcija doda novega veterinarja, pri tem pa pazi na pravilnost vnosa podatkov. '''
    sql = '''INSERT INTO veterinarji (ime,priimek,telefon,email,datum_rojstva,naslov,zaposlen) VALUES (?,?,?,?,?,?,?)'''
    if ime == '':
        raise Exception('napaka')
    if priimek == '':
        raise Exception('napaka')
    if telefon == '':
        raise Exception('napaka')

    con.execute(sql,[ime,priimek,telefon,email,datum_rojstva,naslov,zaposlen])
    con.commit()

def vrni_doloceno_storitev(idS):
    sql = '''select * from storitve where id = ?'''
    return list(con.execute(sql,[idS]))

def posodobi_storitev(idS,novaCena,novoIme):
    ''' funkcija posodobi storitev, pri tem pa pazi na pravilnost vnešenih podatkov. '''
    sql = '''update storitve set cena = ?, ime = ? where id = ?'''
    try:
        novaCena = int(novaCena)
    except:
        raise Exception('napaka')
    if novoIme == '':
        raise Exception('napaka')
    con.execute(sql,[novaCena, novoIme,idS])
    con.commit()

def dodaj_vet_stor(id_stor,id_veterinarjev):
    sql = '''insert into veterinar_storitev (id_veterinarja,id_storitve) values (?,?)'''
    for vet in id_veterinarjev:
        con.execute(sql,[vet,id_stor])
    con.commit()

def vrni_veterinarja_ime(idVet):
    sql = ''' select ime, priimek from veterinarji where id = ? '''
    x = con.execute(sql,[idVet]).fetchone()
    return x

def vrni_imena_zdravil(sezZdravil):
    sezImena = []
    sql = ''' select ime from zdravila where id = ?'''
    for el in sezZdravil:
        el = int(el)
        sezImena.append(list(con.execute(sql,[el])))
    return sezImena

def pridobi_podatke_zdravilo(id_zdr):
    sql = ''' select trenutna_zaloga,minimalna_zaloga,cena from zdravila where id = ? '''
    return list(con.execute(sql,[id_zdr]).fetchone())

def posodobi_kolicino(id_zdr,koliko):
    sql = ''' update zdravila set trenutna_zaloga = ? where id = ?'''
    con.execute(sql,[koliko,id_zdr])
    con.commit()

def pridobi_podatke_storitev(idStor):
    sql = '''select cena,ime from storitve where id = ?'''
    return list(con.execute(sql,[idStor]).fetchone())

def ime_zdravila(id_zdr):
    sql = '''select ime from zdravila where id = ?'''
    return list(con.execute(sql,[id_zdr]).fetchone())[0]

def ustvari_obisk(datum,ura,trajanje,ambulanta,opombe,cena,teza,id_zivali):
    ''' funkcija v bazi ustvari nov obisk - potrebujemo jo v funkciji zakljuci_racun'''
    sql = '''insert into obisk (cena,datum,teza,ambulanta,trajanje,id_zivali,opombe,ura) values (?,?,?,?,?,?,?,?)'''
    cursor = con.cursor()
    cursor.execute(sql,[cena,datum,teza,ambulanta,trajanje,id_zivali,opombe,ura])
    return cursor.lastrowid

def vrni_id_vet_stor(id_stor,id_vet):
    ''' funkcija vrne id dvojca veterinar - storitev '''
    sql = '''select id from veterinar_storitev where id_veterinarja = ? and id_storitve = ?'''
    return list(con.execute(sql,[id_vet,id_stor]).fetchone())

def ustvari_vet_storitev_obisk(id_obiska,id_veterinarja, seznam_storitev_id):
    ''' funkcija v obisk_veterinar_storitev vstavi pare veterinar - storitev. Potrebujemo jo pri funkciji zakljuci_racun '''
    sql = '''insert into obisk_veterinar_storitev (id_obiska,id_vet_storitev) values (?,?)'''
    for el in seznam_storitev_id:
        el = int(el)
        id_vet_stor = int(vrni_id_vet_stor(el,id_veterinarja)[0])
        con.execute(sql,[id_obiska,id_vet_stor])

def ustvari_obisk_zdravilo(id_obiska,seznam_zdravil_id):
    ''' funkcija v zdravilo_obisk vstavi potrebne pare. Potrebujemo jo pri funkciji zakljuci_racun '''
    sql = ''' insert into zdravilo_obisk (id_obiska,id_zdravila) values (?,?)'''
    for el in seznam_zdravil_id:
        el = int(el)
        con.execute(sql,[id_obiska,el])

def zakljuci_racun(datum,ura,trajanje,ambulanta,opombe,seznam_zdravil_id,veterinar_id,sezKolicinZdravil,seznamStoritev,teza,id_zivali):
    ''' Funkcija zakljuci racun in pri tem pazi na zalogo zdravil. '''
    # Najprej preverimo ali imamo res dovolj veliko zalogo vseh zdravil, sicer kar takoj javimo napako:
    for i in range(len(seznam_zdravil_id)):
        element = int(seznam_zdravil_id[i])
        zdravilo_podatki = pridobi_podatke_zdravilo(element)
        trenutna_zaloga = zdravilo_podatki[0]
        zeljena_kolicina = int(sezKolicinZdravil[i])
        if zeljena_kolicina > trenutna_zaloga:
            raise Exception("{0}".format(element))
    # zdravil je dovolj, torej lahko racun zakljucimo, vse potrebno moramo shraniti v bazo ter paziti na to,
    # da se vsi podatki spravijo na pravilna mesta
    cena = 0
    for i in range(len(seznam_zdravil_id)):
        element = int(seznam_zdravil_id[i])
        zdravilo_podatki = pridobi_podatke_zdravilo(element)
        trenutna_zaloga = zdravilo_podatki[0]
        cena_izd = zdravilo_podatki[2]
        zeljena_kolicina = int(sezKolicinZdravil[i])
        if zeljena_kolicina <= trenutna_zaloga:
            cena += zeljena_kolicina*cena_izd
            nova_kolicina = trenutna_zaloga - zeljena_kolicina
            posodobi_kolicino(element, nova_kolicina) # ko neko zdravilo 'prodamo' moramo kolicino seveda zmanjšati
    for stor in seznamStoritev:
        stor = int(stor)
        podatki_storitve = pridobi_podatke_storitev(stor)
        cena_stor = podatki_storitve[0]
        cena += cena_stor
    id_obiska = ustvari_obisk(datum,ura,trajanje,ambulanta,opombe,cena,teza,id_zivali) # ustvarimo obisk
    ustvari_vet_storitev_obisk(id_obiska,int(veterinar_id), seznamStoritev) # dodamo pare v veterinar_storitev
    ustvari_obisk_zdravilo(id_obiska,seznam_zdravil_id) # dodamo pare v zdravilo_obisk
    con.commit()
    return cena

def vrni_vet_storitev_vse(id_vet):
    sql = '''select storitve.id,storitve.ime,storitve.cena from veterinar_storitev join storitve on veterinar_storitev.id_storitve = storitve.id where id_veterinarja = ?'''
    return list(con.execute(sql,[id_vet]))

def vstavi_novo_storitev(cena,ime):
    ''' funkcija vstavi novo storitev ter poskrbi za pravilen vnos. '''
    sql = ''' insert into storitve (cena, ime) values (?,?)'''
    if ime == '':
        raise Exception('napaka')
    if cena == '':
        cena = 0
    else:
        try:
            cena = int(cena)
        except:
            raise Exception('napaka')
    con.execute(sql,[cena,ime])
    con.commit()

def pridobi_vse_vet_podatke(id_vet):
    sql = '''select * from veterinarji where id = ?'''
    return list(con.execute(sql, [id_vet]))

def uredi_vet(ime, priimek, telefon, email, datum_roj, naslov, id_vet, zaposlen):
    sql = '''update veterinarji set ime = ?, priimek = ?, telefon = ?,email = ?, datum_rojstva = ?, naslov = ?, zaposlen = ? where id = ?'''
    if ime == '':
        raise Exception('napaka')
    if priimek == '':
        raise Exception('napaka')
    if telefon == '':
        raise Exception('napaka')
    con.execute(sql,[ime, priimek, telefon, email, datum_roj, naslov, zaposlen,id_vet])
    con.commit()

def vrni_zdravila():
    sql = ''' select * from zdravila'''
    return list(con.execute(sql))

def vrni_doloceno_zdravilo(id_zdr):
    sql = '''select * from zdravila where id = ?'''
    return list(con.execute(sql,[id_zdr]))

def posodobi_zdravilo(ime, cena, trenutna_zaloga, minimalna_zaloga, id_zdr):
    sql = '''update zdravila set ime = ?, cena = ?, trenutna_zaloga = ?, minimalna_zaloga = ? where id = ?'''
    if ime == '':
        raise Exception('napaka!')
    if cena == '':
        cena = 0
    else:
        try:
            cena = int(cena)
        except:
            raise Exception('napaka')
    if trenutna_zaloga == '':
        trenutna_zaloga = 0
    else:
        try:
            trenutna_zaloga = int(trenutna_zaloga)
        except:
            raise Exception('napaka')
    if minimalna_zaloga == '':
        minimalna_zaloga = 0
    else:
        try:
            minimalna_zaloga = int(minimalna_zaloga)
        except:
            raise Exception('napaka')
    con.execute(sql,[ime, cena, trenutna_zaloga, minimalna_zaloga, id_zdr])
    con.commit()

def dodaj_zdravilo(ime,cena,min_zaloga,recept,trenutna_zaloga):
    sql = '''insert into zdravila (ime,cena,minimalna_zaloga,recept,trenutna_zaloga) values (?,?,?,?,?)'''
    if recept == 'DA':
        rec = 1
    else:
        rec = 0
    if min_zaloga == '':
        min_zaloga = 0
    else:
        try:
            min_zaloga = int(min_zaloga)
        except:
            raise Exception("preveri vnos1!")
    if trenutna_zaloga == '':
        trenutna_zaloga = 0
    else:
        try:
            trenutna_zaloga = int(trenutna_zaloga)
        except:
            raise Exception("preveri vnos2!")
    if cena == '':
        cena = 0
    else:
        try:
            cena = int(cena)
        except:
            raise Exception('preveri vnos3!')
    
    con.execute(sql,[ime,cena,min_zaloga,rec,trenutna_zaloga])
    con.commit()

def pridobi_lastnika(id_zivali):
    sql = ''' select lastniki.ime, lastniki.priimek from lastniki join zivali on zivali.id_lastnika = lastniki.id where zivali.id = ?'''
    return list(con.execute(sql,[id_zivali]).fetchone())

def pridobi_ime_zivali(id_zivali):
    sql = ''' select ime from zivali where id = ?'''
    return list(con.execute(sql,[id_zivali]).fetchone())

def pridobi_ime_veterinarja(id_vet):
    sql = ''' select ime, priimek from veterinarji where id = ?'''
    return list(con.execute(sql,[id_vet]).fetchone())

def ime_storitve(id_stor):
    sql = ''' select ime,cena from storitve where id = ?'''
    return list(con.execute(sql,[id_stor]).fetchone())

def pridobi_imena_cene_storitev_seznam(seznamStoritev):
    ''' funkcija vrne seznam storitev ter njihovih pripadajocih cen. '''
    sez = []
    for el in seznamStoritev:
        el = int(el)
        ime_stor = ime_storitve(el)
        sez.append([ime_stor[0],ime_stor[1]])
    return sez

def pridobi_cene_zdravil(sezzdravil):
    sql = '''select cena from zdravila where id = ? '''
    sez = []
    for el in sezzdravil:
        sez.append(list(con.execute(sql,[el]).fetchone()))
    return sez

def vrni_vse_o_zivali(id_zivali):
    sql = '''select zivali.ime, zivali.datum_rojstva, zivali.datum_smrti, zivali.opombe, zivali.spol, barva_zivali.barva,
    pasma.pasme from zivali join barva_zivali on zivali.barva = barva_zivali.id join pasma on zivali.pasma = pasma.id where zivali.id = ?'''
    return list(con.execute(sql,[id_zivali]))

def pridobi_opombe(id_zivali):
    sql = '''select opombe from zivali where id = ?'''
    return list(con.execute(sql,[id_zivali]))

def posodobi_datum_smrti_opombe(id_zivali,opombe,datum):
    sql = ''' update zivali set opombe = ?, datum_smrti = ? where id = ?'''
    con.execute(sql,[opombe,datum,id_zivali])
    con.commit()

def info_o_obisku(id_obiska):
    sql = ''' select * from obisk where id = ?'''
    return list(con.execute(sql,[id_obiska]))

def info_o_zdravilih(id_obiska):
    sql = '''select zdravila.ime from zdravilo_obisk join zdravila on zdravilo_obisk.id_zdravila = zdravila.id where id_obiska = ?'''
    return list(con.execute(sql,[id_obiska]))

def info_o_storitvah(id_obiska):
    sql = '''select veterinarji.ime as vet, veterinarji.priimek, storitve.ime from obisk_veterinar_storitev join
veterinar_storitev on obisk_veterinar_storitev.id_vet_storitev = veterinar_storitev.id join
veterinarji on veterinar_storitev.id_veterinarja = veterinarji.id join storitve on veterinar_storitev.id_storitve = storitve.id where id_obiska = ?'''
    return list(con.execute(sql,[id_obiska]))

def lastnik_podatki(id_lastnika):
    sql = '''select * from lastniki where id = ?'''
    return list(con.execute(sql,[id_lastnika]))

def lastnik_imena(ime_lastnika):
    sql = '''select * from lastniki where priimek = ?'''
    return list(con.execute(sql,[ime_lastnika]))

def posodobi_lastnika(id_lastnika, ime, priimek, naslov, email, telefon):
    sql = ''' update lastniki set ime = ?, priimek = ?, naslov = ?, email = ?, telefon = ? where id = ?'''
    if ime == '' or priimek == '' or telefon == '':
        raise Exception('napaka!')
    con.execute(sql,[ime,priimek,naslov,email,telefon,id_lastnika])
    con.commit()

def pridobi_barvo(barva):
    ''' funkcija pridobi id barve živali iz baze ce ta obstaja, sicer ustvari novo barvo. '''
    sql_barva = '''select id from barva_zivali where barva = ?'''
    barva = barva.lower()
    try:
        id_barva = list(con.execute(sql_barva,[barva]).fetchone())[0]
    except:
        #barve ni notri
        sql = '''insert into barva_zivali (barva) values (?)'''
        con.execute(sql, [barva])
        id_barva = list(con.execute(sql_barva,[barva]).fetchone())[0]
        con.commit()
    return id_barva

def pridobi_pasmo(pasma):
    ''' funkcija pridobi id pasme živali ce ta obstaja, sicer ustvari novo pasmo. '''
    sql_pasma = '''select id from pasma where pasme = ?'''
    pasma2 = pasma.lower()
    pasma = pasma2[0].upper() + pasma2[1:] # poskrbimo da je ime pasme v pravilni obliki
    try:
        id_pasme = list(con.execute(sql_pasma,[pasma]).fetchone())[0]
    except:
        #pasme ni notri
        sql = '''insert into pasma (pasme) values (?)'''
        con.execute(sql, [pasma])
        id_pasme = list(con.execute(sql_pasma,[pasma]).fetchone())[0]
        con.commit()
    return id_pasme
 
def dodaj_zival(ime, barva, pasma, spol, datum_roj, id_lastnika, opombe):
    sql = '''insert into zivali (ime, datum_rojstva, opombe, spol, id_lastnika, pasma,barva)
    values (?,?,?,?,?,?,?)'''
    if ime == "" or barva == "" or pasma == "" or datum_roj == "":
        raise Exception('napaka')
    id_barve = int(pridobi_barvo(barva))
    id_pasme = int(pridobi_pasmo(pasma))
    id_lastnika = int(id_lastnika)
    con.execute(sql, [ime, datum_roj, opombe, spol, id_lastnika, id_pasme, id_barve]) 
    con.commit()

def dodaj_lastnika(ime, priimek, naslov,telefon, email):
    sql = '''insert into lastniki (ime, priimek, email, naslov,telefon)
    values (?,?,?,?,?)'''
    if ime == "" or priimek == "" or telefon == "":
        raise Exception('napaka!')
    cursor = con.cursor()
    cursor.execute(sql, [ime, priimek, email,naslov, telefon]) 
    return cursor.lastrowid
