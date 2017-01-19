% rebase('base.tpl', title='Page Title')

<style>
.pozicija {
	position:relative;
	bottom: 200px;
	left:270px;
	}
</style>
<form action = '/dodaj_zival/{{id_lastnika}}/' method = 'POST'>
<p class = "nasloviOken">Ime živali</p> <input type = "text" name = "ime_zivali" value = "{{ime}}"/> </br>
<p class = "nasloviOken">Barva živali</p> <input type = "text" name = "barva_zivali" value = "{{barva}}"/> </br>
<p class = "nasloviOken">Pasma živali</p> <input type = "text" name = "pasma_zivali" value = "{{pasma}}"/> </br>
<p class = "nasloviOken">Spol</p> <select name = "spol" class = 'uredi_select'>
<option value = 'Male'>Samec</option>
<option value = 'Female'>Samica</option>
</select> </br>
<p class = "nasloviOken">Datum rojstva</p> <input type = "text" name = "datum_rojstva" value = "{{datum_roj}}"/> </br>
<p class = "nasloviOken">Opombe</p> <input type = "text" name = "opombe" value = "{{opombe}}"/> </br>
<button type = 'submit' class = 'gumbOranzen'>POTRDI</button>
%if napaka:
Napačen vnos podatkov
%end
</form>