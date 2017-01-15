% rebase('base.tpl', title='Page Title')
<style>
.pozicija {
	position:relative;
	bottom: 170px;
	left:270px;
	}
</style>
%pod = podatki[0]
<div>
<form action = "/storitve/storitev_uredi/{{pod['id']}}/" method = "POST">
<p class = "nasloviOken">Ime storitve:</p> <input type = "text" name = "ime_storitve" value = '{{pod['ime']}}'/>
<br/>
<p class = "nasloviOken">cena storitve:</p> <input type = "text" name = "cena_storitve" value = '{{pod['cena']}}'/>
<br/>
<p class = "nasloviOken">veterinarji </p>
<select name="vet" multiple class = "urediOkno">
%for vet in veterinarji:
%	id_veter = vet['id']
%	ime_veter = vet['ime']
%	priimek_veter = vet['priimek']
%	telefon_veter = vet['telefon']
<option value="{{id_veter}}">{{ime_veter}} {{priimek_veter}} {{telefon_veter}}</option>
%end
</select>
<br/>
<button type = "submit" class = "gumbOranzen">SHRANI</button>
</form>
</div>

</body>
</html>