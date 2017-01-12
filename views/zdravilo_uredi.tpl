% rebase('base.tpl', title='Page Title')
% podatki = podatki[0]
<form action = '/storitve/zdravilo_uredi/{{podatki['id']}}/' method = 'POST'>
Ime zdravila: <input type = 'text' name = 'ime' value = {{podatki['ime']}}> <br/>
cena zdravila: <input type = 'text' name = 'cena' value = {{podatki['cena']}}> <br/>
trenutna zaloga: <input type = 'text' name = 'trenutna_zaloga' value = {{podatki['trenutna_zaloga']}}> <br/>
minimalna zaloga: <input type = 'text' name = 'minimalna_zaloga' value = {{podatki['minimalna_zaloga']}}> <br/>
<button type = 'submit'>POTRDI</button>
</form>
