% rebase('base.tpl', title='Page Title')
<style>
.pozicija {
	position:relative;
	bottom: 230px;
	left:270px;
	}
</style>

%podatki_obisk = podatki_obisk[0]
<table>
<tr><th>CENA</th><td>{{podatki_obisk['cena']}}</td></tr>
<tr><th>DATUM</th> <td>{{podatki_obisk['datum']}}</td></tr>
<tr><th>URA</th><td>{{podatki_obisk['ura']}}</td></tr>
<tr><th>TEŽA</th><td>{{podatki_obisk['teza']}}</td></tr>
<tr><th>AMBULANTA</th><td>{{podatki_obisk['ambulanta']}}</td></tr>
<tr><th>TRAJANJE</th><td>{{podatki_obisk['trajanje']}}</td></tr>
<tr><th>OPOMBE</th><td>{{podatki_obisk['opombe']}}</td></tr>
</table>
<br/>
<table>
<tr><th>IME ZDRAVILA</th></tr>

%for pod in podatki_zdravila:
<tr>
<td>{{pod['ime']}}</td>
</tr>
%end

</table>
<br/>

<table>
<tr><th>IME STORITVE</th><th>IME VETERINARJA</th><th>PRIIMEK VETERINARJA</th></tr>
%for pod2 in podatki_storitve:
<tr>
<td>{{pod2['ime']}}</td><td>{{pod2['vet']}}</td><td>{{pod2['priimek']}}</td>
</tr>
%end
</table>