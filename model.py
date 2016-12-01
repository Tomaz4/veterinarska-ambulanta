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
    
def vstavi_zival_pomozna(ime, datum_rojstva, spol, barva, pasma, lastnik):
    ''' Funkcija prejme ime živali, datum rojstva, spol kot Male oziroma
        Female, barvo, pasmo ter lastnika, ki je že v bazi podatkov.'''
    sql_id_lastnika = '''SELECT id FROM lastniki WHERE ime = ? and priimek = ?'''
    seznam = []
    imeL = lastnik.split()[0]
    priimekL = lastnik.split()[1]
    for idos in con.execute(sql_id_lastnika,[imeL,priimekL]):
        seznam.append(idos)
    if len(seznam) > 1:
        raise Exception("Obstajata dva lastnika z istim imenom! Preveri ID")
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

def vstavi_zival(ime, datum_rojstva, spol, barva, pasma, lastnik):
    ime = ime.strip()
    if spol == 'samec':
        spol = 'Male'
    else:
        spol = 'Female'
    barva = barva.strip()
    latnik = lastnik.strip()
    vstavi_zival_pomozna(ime,datum_rojstva,spol,barva,pasma,lastnik)


    
