% rebase('base.tpl', title='Page Title')
<style>
.pozicija {
	position:relative;
	bottom: 170px;
	left:270px;
	}
table {width:60%;}
</style>
<table id = "tabela">
<tr>
	<th><b>IME</b></th>
	<th><b>PRIIMEK</b></th>
	<th><b>TELEFON</b></th>
	<th><b>EMAIL</b></th>
	<th><b>DATUM ROJSTVA</b></th>
	<th><b>NASLOV</b></th>
	<th><b>STORITVE</b></th>
	<th><b>UREDI</b></th>

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
<form action = '/veterinarji/dodaj_vet/'>
<div class = "prestavi">
<button type = "submit" class = "gumbOranzen">DODAJ VETERINARJA</button>
</div>
</form>
</div>