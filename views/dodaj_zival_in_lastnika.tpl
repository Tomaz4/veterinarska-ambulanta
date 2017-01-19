% rebase('base.tpl', title='Page Title')

<style>
.pozicija {
	position:relative;
	bottom: 200px;
	left:270px;
	}
</style>

<form action = '/dodaj_zival_in_lastnika/' method = 'POST'>
<p class = "nasloviOken">Ime lastnika</p> <input type = "text" name = "ime" value = "{{ime}}"/> </br>
<p class = "nasloviOken">Priimek lastnika</p> <input type = "text" name = "priimek" value = "{{priimek}}"/> </br>
<p class = "nasloviOken">Naslov</p> <input type = "text" name = "naslov" value = "{{naslov}}"/> </br>
<p class = "nasloviOken">Telefon</p> <input type = "text" name = "telefon" value = "{{telefon}}"/> </br>
<p class = "nasloviOken">Email</p> <input type = "text" name = "email" value = "{{email}}"/> </br>
<button type = 'submit' class = 'gumbOranzen'>POTRDI</button>
%if napaka:
Napačen vnos podatkov
%end
</form>