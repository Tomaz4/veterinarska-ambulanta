% rebase('base.tpl', title='Page Title')

<style>
.pozicija {
	position:relative;
	bottom: 200px;
	left:270px;
	}
</style>

<form action = '/dodaj_zival_in_lastnika/' method = 'POST'>
Ime lastnika <input type = "text" name = "ime"/> </br>
Priimek lastnika <input type = "text" name = "priimek"/> </br>
Naslov <input type = "text" name = "naslov"/> </br>
Telefon <input type = "text" name = "telefon"/> </br>
Email <input type = "text" name = "email"/> </br>
<button type = 'submit' class = 'gumbOranzen'>POTRDI</button>
</form>