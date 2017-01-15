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
<p class = "nasloviOken">TEŽA: </p> <input type = "text" name = "teza"/> <br/>
<p class = "nasloviOken">AMBULANTA:</p> <input type = "text" name = "ambulanta"/> <br/>
<p class = "nasloviOken">TRAJANJE:</p> <input type = "text" name = "trajanje"/> <br/>
<p class = "nasloviOken">OPOMBE:</p> <input type = "text" name = "opombe"/> <br/>
<p class = "nasloviOken">SEZNAM ZDRAVIL:</p> <br/>
<select name="zdravila_form" multiple class = "urediOkno">
%for zdr in zdravila:
%    id_zdr = zdr['id']
%    ime_zdr = zdr['ime']
<option value="{{id_zdr}}">{{ime_zdr}}</option>
%end
</select>
<br/>
<p class = "nasloviOken">VETERINAR:</p>
<br/>
<select name="vet" class = "urediOkno">
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
<br/>
<button type = "submit" class = "gumbOranzen">Naprej</button>

</form>
</div>
