% rebase('base.tpl', title='Page Title')
<style>
.pozicija {
	position:relative;
	bottom: 170px;
	left:270px;
	}
</style>
<form action='/poisci_zival/' method = "GET">
<p class = "nasloviOken">Vnesi ime živali:<p>
<input type='text' name = 'ime_zivali'/>
<br/>
<div class = "prestavi">
<button type = 'submit' class = "gumbOranzen"> POIŠČI </button>
</div>
</form>

<div id = "okvir_tabela">
<table id = "tabela">
<tr>
	<th><b>IME</b></th>
	<th><b>ROJSTVO</b></th>
	<th><b>SPOL</b></th>
	<th><b>PRIIMEK</b></th>
	<th><b>TELEFON</b></th>
	<th><b>PODATKI</b></th>
</tr>
%for zival in podatki:
%	if zival['spol'] == 'Female':
%		spolZ = "samica"
%	else:
%		spolZ = "samec"
%   end
<tr>
	<td>{{zival['ime']}}</td>
	<td>{{zival['datum_rojstva']}}</td>
	<td>{{spolZ}}</td>
	<td>{{zival['priimek']}}</td>
	<td>{{zival['telefon']}}</td>
	<td><a href = "/poisci_zival/informacije/{{zival['id']}}" style = "text-decoration:none">Obišči</a> </td> 
</tr>
%end
</table>
</div>