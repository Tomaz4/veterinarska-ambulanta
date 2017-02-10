% rebase('base.tpl', title='Page Title')

<style>
.pozicija {
	position:relative;
	bottom: 100px;
	left:130px;
	}
input[type = text] {
	height: 20px;
	width: 20%;
	position: relative;
	left: 50px;
}
.poz {
	position: relative;
	bottom: 150px;
	left: 150px;
}
</style>
%for pod in pod_zival:
%	ime_zivali = pod[0]
% 	barva_zivali = pod[5]
% 	pasma_zivali = pod[6]
%	spol = pod[4]
% if(spol == "Female"):
%	spol = "Samica"
% else:
%	spol = "samec"
%end 
%end
<div class = "poz">
<h2 style = "color: orange;">IME ŽIVALI: {{ime_zivali}} </h2>
<h2 style = "color: orange;">BARVA: {{barva_zivali}} </h2>
<h2 style = "color: orange;">PASMA: {{pasma_zivali}} </h2>
<h2 style = "color: orange;">SPOL: {{spol}} </h2>
</div>
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
