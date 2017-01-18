% rebase('base.tpl', title='Page Title')

<style>
.pozicija {
	position:relative;
	bottom: 150px;
	left:270px;
	}
</style>

<form action = '/poisci_lastnika/', method = 'GET'>
<p class = 'nasloviOken'>Vnesi priimek lastnika</p><input name = 'lastnik_okno' type = 'text'/>
<div class = "prestavi">
<button type = 'submit' class = 'gumbOranzen'>POIŠČI</button>
</div>
</form>

<table>
<tr><th>IME</th><th>PRIIMEK</th><th>NASLOV</th><th>TELEFON</th><th>EMAIL</th><th>DODAJ ŽIVAL</th></tr>
%for pod in podatki:
<tr>
<td>{{pod['ime']}}</td><td>{{pod['priimek']}}</td> <td> {{pod['naslov']}} </td> <td> {{pod['telefon']}} </td> <td> {{pod['email']}} </td> <td><a href = '/dodaj_zival/{{pod["id"]}}/'>klik</a></td>
</tr>
%end