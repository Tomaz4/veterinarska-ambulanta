<!doctype>
<html>
<head>
</head>

<body>
<form action='/storitve/dodaj_zdravilo/' method = 'POST'>
Ime zdravila: <input name = "ime_zdr" type = "text"/>
<br/>
Cena zdravila: <input name = "cena_zdr" type = "text"/>
<br/>
Minimalna zaloga: <input name = "minimalna_zaloga" type = "text"/>
<br/>
Trenutna zaloga: <input name = "trenutna_zaloga" type = "text"/>
<br/>
<select name = "recept">
<option value= "DA">DA</option>
<option value= "NE">NE</option>
</select>
Recept: 
<br/>
<button type = "submit">POTRDI</button>
</form>
</body>
</html>