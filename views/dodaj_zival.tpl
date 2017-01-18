% rebase('base.tpl', title='Page Title')

<style>
.pozicija {
	position:relative;
	bottom: 200px;
	left:270px;
	}
</style>
<form action = '/dodaj_zival/{{id_lastnika}}/' method = 'POST'>
Ime živali <input type = "text" name = "ime_zivali"/> </br>
Barva živali <input type = "text" name = "barva_zivali"/> </br>
Pasma živali <input type = "text" name = "pasma_zivali"/> </br>
Spol: <select name = "spol" class = 'uredi_select'>
<option value = 'Male'>Samec</option>
<option value = 'Female'>Samica</option>
</select> </br>
Datum rojstva <input type = "text" name = "datum_rojstva"/> </br>
Opombe <input type = "text" name = "opombe"/> </br>
<button type = 'submit' class = 'gumbOranzen'>POTRDI</button>
</form>