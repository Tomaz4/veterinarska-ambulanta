% rebase('base.tpl', title='Page Title')
<form action='/storitve/dodaj_storitev/' method = 'POST'>
Ime storitve: <input name = "ime_stor" type = "text"/>
<br/>
Cena storitve: <input name = "cena_stor" type = "text"/>
<br/>
<button type = "submit">POTRDI</button>
</form>