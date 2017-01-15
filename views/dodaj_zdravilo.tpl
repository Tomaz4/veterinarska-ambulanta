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
<p class = "nasloviOken">Ime zdravila:</p> <input name = "ime_zdr" type = "text"/>
<br/>
<p class = "nasloviOken">Cena zdravila:</p> <input name = "cena_zdr" type = "text"/>
<br/>
<p class = "nasloviOken">Minimalna zaloga:</p> <input name = "minimalna_zaloga" type = "text"/>
<br/>
<p class = "nasloviOken">Trenutna zaloga:</p> <input name = "trenutna_zaloga" type = "text"/>
<br/>
<p class = "nasloviOken">Recept:</p> <select name = "recept" class ="uredi_select">
<option value= "DA">DA</option>
<option value= "NE">NE</option>
</select>
<br/>
<button type = "submit" class = "gumbOranzen">POTRDI</button>

{{napaka}}
</form>
</div>