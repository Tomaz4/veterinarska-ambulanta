% rebase('base.tpl', title='Page Title')

<style>
.pozicija {
	position:relative;
	bottom: 80px;
	left:170px;
	}
</style>

<div class = "pozicija">
<table>
<tr>
<th>DATUM OBISKA</th>
<th>URA OBISKA</th>
<th>TEŽA ŽIVALI</th>
<th>POGLEJ</th>
</tr>
<tr>
%for el in podatki:
<tr>
<td>{{el['datum']}}</td>
<td>ura obiska: {{el['ura']}}</td>
<td>teža živali: {{el['teza']}}</td>
<td>
<a href = "/poisci_zival/informacije/{{el['id_zivali']}}/{{el['id']}}" >poglej</a>
</td>
</tr>
%end
</table>
<form action = "/poisci_zival/informacije/{{zival}}/dodaj_obisk/" method = "GET"> 
<br/>
<button type = "submit" class = "gumbOranzen">Dodaj obisk</button>
</form>
</div>