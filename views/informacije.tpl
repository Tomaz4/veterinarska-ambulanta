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
%info = info[0]
<tr><th>IME</th> <td>{{info['ime']}}</td> </tr>
<tr><th>DATUM ROJSTVA</th> <td>{{info['datum_rojstva']}}</td> </tr>
<tr><th>SPOL</th> <td>{{info['spol']}}</td> </tr>
<tr><th>PASMA</th> <td>{{info['pasme']}}</td> </tr>
<tr><th>BARVA</th> <td>{{info['barva']}}</td> </tr>
<tr><th>OPOMBE</th> <td>{{info['opombe']}}</td> </tr>
<tr><th>DATUM SMRTI</th> <td>{{info['datum_smrti']}}</td> </tr>
</table>

<form action = "/poisci_zival/informacije/{{id_zivali}}/datum_smrti_opombe/" method = 'GET'>
<button type = "submit" class = "gumbOranzen">Določi datum smrti/uredi opombe</button>
</form>

<table style = "clear:both">
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