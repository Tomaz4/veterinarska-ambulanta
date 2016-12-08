import sqlite3

con = sqlite3.connect('veterinarska_ambulanta.sqlite')

# test ali dela
def barve():
    sql = '''select * from barva_zivali'''
    for barva in con.execute(sql):
        print(barva)

# cena obiska (torej veterinarske storitve + zdravilo
def skupna_cena(obisk):
    ''' Funkcija prejme id-obiska in izračuna skupno ceno
        obiska - torej cena vseh veterinarskih storitev in
        uporabljenih zdravil. '''
    sql_zdravilo = '''SELECT sum(zdravila.cena) FROM zdravila JOIN zdravilo_obisk
                    on zdravila.id = zdravilo_obisk.id_zdravila JOIN
                    obisk on obisk.id = zdravilo_obisk.id_obiska WHERE
                    obisk.id = ? '''
    sql_storitev = '''SELECT sum(storitve.cena) FROM storitve join
                      veterinar_storitev on storitve.id = veterinar_storitev.id_storitve
                      join obisk_veterinar_storitev on obisk_veterinar_storitev.id_vet_storitev =
                      veterinar_storitev.id join obisk on obisk_veterinar_storitev.id_obiska =
                      obisk.id WHERE obisk.id = ? '''
    seznam = []
    for cena in con.execute(sql_zdravilo,[obisk]):
        seznam.append(cena[0])
    for cena in con.execute(sql_storitev,[obisk]):
        seznam.append(cena[0])
    return sum(seznam)

# vstavljanje živali:
##def vstavi_zival(ime, datum_rojstva, spol, barva, pasma, lastnik):
##    ''' Funkcija prejme ime živali, datum rojstva, spol kot Male oziroma
##        Female, barvo, pasmo ter lastnika, ki je že v bazi podatkov. '''
##    sql_id_lastnika = '''SELECT id FROM lastniki WHERE ime = ? and priimek = ?'''
##    pass
    
def vstavi_zival_pomozna(ime, datum_rojstva, spol, barva, pasma, lastnik, telefon_lastnika):
    ''' Funkcija prejme ime živali, datum rojstva, spol kot Male oziroma
        Female, barvo, pasmo ter lastnika, ki je že v bazi podatkov.'''
    sql_id_lastnika = '''SELECT id FROM lastniki WHERE ime = ? and priimek = ? and telefon = ?'''
    seznam = []
    imeL = lastnik.split()[0]
    priimekL = lastnik.split()[1]
    for idos in con.execute(sql_id_lastnika,[imeL,priimekL,telefon_lastnika]):
        seznam.append(idos)
    idosebe = seznam[0][0]
    sql_id_pasme = '''SELECT id from pasma where pasme = ?'''
    for idpasma in con.execute(sql_id_pasme,[pasma]):
        idpasma = idpasma[0]
    sql_id_barve = '''SELECT id from barva_zivali where barva = ?'''
    for idbarva in con.execute(sql_id_barve,[barva]):
        idbarva = idbarva[0]
    sql = '''INSERT INTO zivali (ime, datum_rojstva, spol, id_lastnika, pasma, barva) VALUES
             (?,?,?,?,?,?)'''
    con.execute(sql,[ime,datum_rojstva,spol,idbarva,idpasma,idosebe])
    # con.commit()

def vstavi_zival(ime, datum_rojstva, spol, barva, pasma, lastnik, telefon_lastnika):
    ime = ime.strip()
    if spol == 'samec':
        spol = 'Male'
    else:
        spol = 'Female'
    barva = barva.strip()
    latnik = lastnik.strip()
    vstavi_zival_pomozna(ime,datum_rojstva,spol,barva,pasma,lastnik, telefon_lastnika)

def dodaj_veterinarja(ime,priimek):
    ''' Funkcija doda veterinarja v tabelo veterinarji. '''
    sql = ''' INSERT INTO veterinarji (ime,priimek) VALUES (?,?) '''
    con.execute(sql,[ime,priimek])
    con.commit()

def zival_umre(id_zivali,datum_smrti):
    ''' Funkcija poskrbi da spremeni, da je žival umrla. '''
    sql = ''' UPDATE zivali SET datum_smrti = ? where id = ?'''
    con.execute(sql,[datum_smrti,id_zivali])
    con.commit()






def vstavi_zdravilo(imeZdravila, recept, zaloga, minZaloga, cena):
    imeZdravila = imeZdravila.strip()
    sql = '''INSERT INTO zdravila (recept, cena, trenutna_zaloga, ime, minimalna_zaloga)
    VALUES (?,?,?,?,?)'''
    con.execute(sql, [recept, cena, zaloga, imeZdravila, minZaloga])
    con.commit()

def vstavi_storitev(ime, cena):
    sql = ''' INSERT INTO storitve (ime, cena) VALUES (?,?)'''
    pridobiImena = '''SELECT ime FROM storitve'''
    if ime not in list(con.execute(pridobiImena,[ime,cena])):
        con.execute(sql, [ime, cena])
    else:
        raise Exception("Zdravilo že imate")

def spremeni_ceno_stortve(idStor, cena):
    sql = '''UPDATE storitve SET cena = ? WHERE storitve.ime = ?'''
    con.execute(sql, [cena, idStor])
    con.commit()

def vstavi_pasmo(pasmaZ):
    ''' Funkcija vstavi pasmo v bazo. '''
    sql = ''' INSERT INtO pasma (pasme) VALUES (?) '''
    alisoNotri = ''' SELECT pasme FROM pasma where pasme = ? '''
    cur = con.execute(alisoNotri,[pasmaZ])
    rez = cur.fetchone()
    if rez is None:
        con.execute(sql,[pasmaZ])
    else:
        raise Exception('Pasma je že v bazi. ')
    con.commit()

def posodobi_pasmo(id_pasme,nova_pasma):
    ''' Funkcija posodobi pasmo (èe se nekdo zmoti pri tipkanju
        in to želi popraviti. '''
    sql = ''' UPDATE pasma SET pasme = ? where id = ? '''
    con.execute(sql,[nova_pasma,id_pasme])
    con.commit()

def posodi_lastnika_priimek(id_lastnika,nov_priimek):
    sql = ''' UPDATE lastniki SET priimek = ? where id = ? '''
    con.execute(sql,[nov_priimek, id_lastnika])
    con.commit()

def posodobi_lastnika_email(id_lastnika,nov_mail):
    sql = ''' UPDATE lastniki SET email = ? where id = ? '''
    con.execute(sql,[nov_mail,id_lastnika])
    con.commit()

def posodobi_lastnika_naslov(id_lastnika,nov_naslov):
    sql = ''' UPDATE lastniki SET naslov = ? where id = ? '''
    con.execute(sql,[nov_naslov,id_lastnika])
    con.commit()

def posodobi_lastnika_telefon(id_lastnika,nov_telefon):
    sql = ''' UPDATE lastniki SET telefon = ? where id = ? '''
    con.execute(sql,[nov_telefon,id_lastnika])
    con.commit()

def popravi_storitev_ime(id_storitve,novo_ime):
    sql = ''' UPDATE storitve SET ime = ? where id = ? '''
    con.execute(sql,[novo_ime,id_storitve])
    con.commit()
def popravi_storitev_cena(id_storitve,nova_cena):
    sql = ''' UPDATE storitve SET cena = ? where id = ? '''
    con.execute(sql,[nova_cena,id_storitve])
    con.commit()




    

    
