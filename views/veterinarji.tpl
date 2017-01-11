% rebase('base.tpl', title='Page Title')
<form action = '/veterinarji/dodaj_vet/'>
<button type = "submit">DODAJ VETERINARJA</button>
</form>

<table id = "tabela">
<tr>
	<th><b>IME</b></th>
	<th><b>PRIIMEK</b></th>
	<th><b>TELEFON</b></th>
	<th><b>EMAIL</b></th>
	<th><b>DATUM ROJSTVA</b></th>
	<th><b>NASLOV</b></th>
	<th><b>STORITVE</b></th>

</tr>
%for veterinar in vet:
<tr>
	<td>{{veterinar['ime']}}</td>
	<td>{{veterinar['priimek']}}</td>
	<td>{{veterinar['telefon']}}</td>
	<td>{{veterinar['email']}}</td>
	<td>{{veterinar['datum_rojstva']}}</td>
	<td>{{veterinar['naslov']}}</td>
	<td>
%   if veterinar['zaposlen'] == 'DA':	
	<a href = "/veterinarji/{{veterinar['id']}}">Poglej storitve</a>
%   else:
    ni zaposlen
%   end
	</td>
	<td><a href = "/veterinarji/uredi_vet/{{veterinar['id']}}/">Uredi</a></td>
</tr>
%end
</table>
</div>
</body>
</html>