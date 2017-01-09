<!doctype html>
<html>
<head>

</head>

<body>
<form action = "/poisci_zival/informacije/{{zival}}/dodaj_obisk/racun/" method = "GET">

Datum: <input type = "text" name = "datum"/>
Ura: <input type = "text" name = "ura"/>
Teža: <input type = "text" name = "teza"/>
Ambulanta: <input type = "text" name = "ambulanta"/>
Trajanje: <input type = "text" name = "trajanje"/>
Opombe: <input type = "text" name = "opombe"/>
<select name="zdravila_form" multiple>
%for zdr in zdravila:
%    id_zdr = zdr['id']
%    ime_zdr = zdr['ime']
<option value="{{id_zdr}}">{{ime_zdr}}</option>
%end

</select>

<select name="vet">
%for veter in veterinarji:
%	id_veter = veter['id']
%	ime_veter = veter['ime']
%	priimek_veter = veter['priimek']
%	telefon_veter = veter['telefon']
<option value="{{id_veter}}">{{ime_veter}} {{priimek_veter}} {{telefon_veter}}</option>
%end
</select>
<button type = "submit">Naprej</button>

</form>
</body>
</html>
