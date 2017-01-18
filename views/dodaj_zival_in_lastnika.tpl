% rebase('base.tpl', title='Page Title')

<style>
.pozicija {
	position:relative;
	bottom: 200px;
	left:270px;
	}
</style>

<form action = '/dodaj_zival_in_lastnika/' method = 'POST'>
<p class = "nasloviOken">Ime lastnika</p> <input type = "text" name = "ime"/> </br>
<p class = "nasloviOken">Priimek lastnika</p> <input type = "text" name = "priimek"/> </br>
<p class = "nasloviOken">Naslov</p> <input type = "text" name = "naslov"/> </br>
<p class = "nasloviOken">Telefon</p> <input type = "text" name = "telefon"/> </br>
<p class = "nasloviOken">Email</p> <input type = "text" name = "email"/> </br>
<button type = 'submit' class = 'gumbOranzen'>POTRDI</button>
</form>