import sqlite3

con = sqlite3.connect('Sql/veterinarska_ambulanta.sqlite')
con.row_factory = sqlite3.Row

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
    
def vstavi_zival_pomozna(ime, datum_rojstva, spol, barva, pasma, idosebe):
    ''' Funkcija prejme ime živali, datum rojstva, spol kot Male oziroma
        Female, barvo, pasmo ter lastnika, ki je že v bazi podatkov.'''
    sql_id_pasme = '''SELECT id from pasma where pasme = ?'''
    for idpasma in con.execute(sql_id_pasme,[pasma]):
        idpasma = idpasma[0]
    sql_id_barve = '''SELECT id from barva_zivali where barva = ?'''
    for idbarva in con.execute(sql_id_barve,[barva]):
        idbarva = idbarva[0]
    sql = '''INSERT INTO zivali (ime, datum_rojstva, spol, id_lastnika, pasma, barva) VALUES
             (?,?,?,?,?,?)'''
    con.execute(sql,[ime,datum_rojstva,spol,idosebe,idbarva,idpasma])
    con.commit()

def vstavi_zival(ime, datum_rojstva, spol, barva, pasma, id_lastnika):
    ime = ime.strip()
    if spol == 'samec':
        spol = 'Male'
    else:
        spol = 'Female'
    barva = barva.strip()
    vstavi_zival_pomozna(ime,datum_rojstva,spol,barva,pasma,id_lastnika)

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
        cur = con.execute(sql, [ime, cena])        
    else:
        raise Exception("Zdravilo že imate")
    con.commit()
    return cur.lastrowid

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

def vstavi_barvo(barvaPodaj):
    sql = ''' INSERT INTO barva_zivali (barva) VALUES (?)'''
    preberiBarva = '''SELECT barva FROM barva_zivali WHERE barva = ?'''
    cur = con.execute(preberiBarva, [barvaPodaj])
    rezultat = cur.fetchone()
    if rezultat != None:
        raise Exception('Barva je že notri!')
    con.execute(sql, [barvaPodaj])
    con.commit()

def posodobi_barvo(id_barva, novaBarva):
    sql = '''UPDATE barva_zivali SET barva = ? WHERE barva_zivali.id = ?'''
    con.execute(sql, [novaBarva, id_barva])
    con.commit()

def lastnik_vstavi(imeVstavi, priimekVstavi, telefonVstavi, naslovVstavi = None, emailVstavi = None):
    sql = '''INSERT INTO lastniki (ime, priimek, email, naslov, telefon)
           VALUES (?,?,?,?,?)'''
    cur = con.execute(sql, [imeVstavi, priimekVstavi, emailVstavi, naslovVstavi, telefonVstavi])
    con.commit()
    return cur.lastrowid

def zdravilo_spremeni_ime(id_zdravila, novoIme):
    sql = '''UPDATE zdravila SET ime = ? WHERE zdravilo.id = ?'''
    con.execute(sql, [novoIme, id_zdravila])
    con.commit()

def zdravilo_spremeni_trenutnoZalogo(id_zdravila, novaZaloga):
    sql = '''UPDATE zdravila SET trenutna_zaloga = ? WHERE zdravilo.id = ?'''
    con.execute(sql, [novaZaloga, id_zdravila])
    con.commit()

def zdravilo_spremeni_ceno(id_zdravila, novaCena):
    sql = '''UPDATE zdravila SET cena = ? WHERE zdravilo.id = ?'''
    con.execute(sql, [novaCena, id_zdravila])
    con.commit()

def zdravilo_spremeni_minZaloga(id_zdravila, novaMinZaloga):
    sql = '''UPDATE zdravila SET minimalna_zaloga = ? WHERE zdravilo.id = ?'''
    con.execute(sql, [novaMinZaloga, id_zdravila])
    con.commit()

def zival_spremeni_opombe(id_zivali, opombaNova):
    sql = '''UPDATE zivali SET opombe = ? WHERE zivali.id = ?'''
    con.execute(sql, [opombaNova, id_zdravila])
    con.commit()

def veterinar_posodobi_naslov(id_veterinar, novNaslov):
    sql = '''UPDATE veterinarji SET naslov = ? WHERE id = ?'''
    con.execute(sql, [novNaslov, id_veterinar])
    con.commit()

def veterinar_posodobi_telefon(id_veterinar, novTelefon):
    sql = '''UPDATE veterinarji SET telefon = ? WHERE id = ?'''
    con.execute(sql, [novTelefon, id_veterinar])
    con.commit()
    
def veterinar_posodobi_email(id_veterinar, novEmail):
    sql = '''UPDATE veterinarji SET email = ? WHERE id = ?'''
    con.execute(sql, [novEmail, id_veterinar])
    con.commit()

def pridobi_pasmo(id_pasme):
    sql = '''SELECT pasme FROM pasma WHERE id = ?'''
    for pasma in con.execute(sql, [id_pasme]):
        return pasma[0]
def pridobi_barvo(id_barve):
    sql = '''SELECT barva FROM barva_zivali WHERE id = ?'''
    for barva in con.execute(sql, [id_barve]):
        return barva[0]

def izpisi_vsa_imena(imeZivali):
    sql = '''SELECT * FROM zivali JOIN lastniki ON zivali.id_lastnika = lastniki.id WHERE zivali.ime = ?'''

    cur = con.execute(sql, [imeZivali])
    rez = cur.fetchone()
    niz = ""
    if rez == None:
        return('Živali s tem imenom ni v bazi!')
    for el in con.execute(sql, [imeZivali]):
        niz+=str(el[1] + " " + el[2] + "\n")
    return niz

def vrni_obiske(idZivali):
    ''' vrne vse obiske dane živali. '''
    sql = '''Select obisk.id,obisk.datum, obisk.ura,obisk.teza, obisk.id_zivali, obisk.opombe, obisk.cena from obisk join zivali on obisk.id_zivali = zivali.id where id_zivali = ?'''
    return list(con.execute(sql,[idZivali]))

def vrni_vse_podatke_o_obisku(idObiska):
    sql = ''' select * from obisk join obisk_veterinar_storitev on obisk.id = obisk_veterinar_storitev.id_obiska join veterinar_storitev on obisk_veterinar_storitev.id_vet_storitev = veterinar_storitev.id join veterinarji on veterinar_storitev.id_veterinarja = veterinarji.id join storitve on veterinar_storitev.id_storitve = storitve.id where obisk.id = ?'''
    return list(con.execute(sql,[idObiska]))



def izpisi_vsa_imena(imeZivali):
    sql = '''SELECT * FROM zivali JOIN lastniki ON zivali.id_lastnika = lastniki.id WHERE zivali.ime = ?'''
    return list(con.execute(sql, [imeZivali]))
##    rez = cur.fetchone()
##    niz = ""
##    if imeZivali!="":
##        if rez == None:
##            return []
##        seznamVsehImen = []
##        for el in con.execute(sql, [imeZivali]):
##            imeZiv = el[1]
##            datum_roj = el[2]
##            if el[5] == "Female":
##                spol = "samica"
##            else:
##                spol = "samec"
##            seznamVsehImen.append(str(imeZiv + " " + datum_roj + " " + spol + " " + pridobi_pasmo(el[7]) + " " + pridobi_barvo(el[8])+ " " + el[10] + " " + el[11] + " " + str(el[14]) + "\n"))
##        return seznamVsehImen


