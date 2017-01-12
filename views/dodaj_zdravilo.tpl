% rebase('base.tpl', title='Page Title')
<style>
.pozicija {
	position:relative;
	bottom: 80px;
	left:170px;
	}
</style>
<div class = "pozicija">
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

{{napaka}}
</form>
</div>