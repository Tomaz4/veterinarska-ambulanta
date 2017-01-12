% rebase('base.tpl', title='Page Title')
<style>
.pozicija {
	position:relative;
	bottom: 150px;
	left:270px;
	}
</style>
<form action='/storitve/dodaj_storitev/' method = 'POST'>
Ime storitve: <input name = "ime_stor" type = "text"/>
<br/>
Cena storitve: <input name = "cena_stor" type = "text"/>
<br/>
<button type = "submit" class = "gumbOranzen">POTRDI</button>
</form>