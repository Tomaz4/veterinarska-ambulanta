% rebase('base.tpl', title='Page Title')
<style>
.pozicija {
	position:relative;
	bottom: 150px;
	left:270px;
	}
</style>
<form action='/storitve/dodaj_storitev/' method = 'POST'>
<p class = "nasloviOken">Ime storitve:</p> <input name = "ime_stor" type = "text" value = "{{ime}}"/>
<br/>
<p class = "nasloviOken">Cena storitve:</p> <input name = "cena_stor" type = "text" value = "{{cena}}"/>
<br/>
<button type = "submit" class = "gumbOranzen">POTRDI</button>
%if napaka:
Napačen vnos!
%end
</form>