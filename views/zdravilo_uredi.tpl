% rebase('base.tpl', title='Page Title')
<style>
.pozicija {
	position:relative;
	bottom: 150px;
	left:270px;
	}
</style>
% podatki = podatki[0]
<form action = '/storitve/zdravilo_uredi/{{podatki['id']}}/' method = 'POST'>
<p class = "nasloviOken">Ime zdravila:</p> <input type = 'text' name = 'ime' value = "{{podatki['ime']}}"> <br/>
<p class = "nasloviOken">cena zdravila:</p> <input type = 'text' name = 'cena' value = "{{podatki['cena']}}"> <br/>
<p class = "nasloviOken">trenutna zaloga:</p> <input type = 'text' name = 'trenutna_zaloga' value = "{{podatki['trenutna_zaloga']}}"> <br/>
<p class = "nasloviOken">minimalna zaloga:</p> <input type = 'text' name = 'minimalna_zaloga' value = "{{podatki['minimalna_zaloga']}}"> <br/>
<button type = 'submit' class = "gumbOranzen">POTRDI</button>
</form>
