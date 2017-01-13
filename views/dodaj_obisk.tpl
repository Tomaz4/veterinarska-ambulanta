% rebase('base.tpl', title='Page Title')

<style>
.pozicija {
	position:relative;
	bottom: 70px;
	left:170px;
	}
input[type = text] {
	height: 20px;
	width: 20%;
	position: relative;
	left: 50px;
}
</style>
<div class = "pozicija">
<form action = "/poisci_zival/informacije/{{zival}}/dodaj_obisk/racun/" method = "GET">
TEŽA: <input type = "text" name = "teza"/> <br/>
AMBULANTA: <input type = "text" name = "ambulanta"/> <br/>
TRAJANJE: <input type = "text" name = "trajanje"/> <br/>
OPOMBE: <input type = "text" name = "opombe"/> <br/>
SEZNAM ZDRAVIL: <br/>
<select name="zdravila_form" multiple>
%for zdr in zdravila:
%    id_zdr = zdr['id']
%    ime_zdr = zdr['ime']
<option value="{{id_zdr}}">{{ime_zdr}}</option>
%end
</select>
<br/>
VETERINAR:
<select name="vet">
%for veter in veterinarji:
%   if veter['zaposlen'] == 'DA':
%		id_veter = veter['id']
%		ime_veter = veter['ime']
%		priimek_veter = veter['priimek']
%		telefon_veter = veter['telefon']
<option value="{{id_veter}}">{{ime_veter}} {{priimek_veter}} {{telefon_veter}}</option>
%   end
%end
</select>
<button type = "submit">Naprej</button>

</form>
</div>
