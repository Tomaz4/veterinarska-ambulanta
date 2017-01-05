% rebase('base.tpl', title='Page Title')
%pod = podatki[0]
<div>
<form action = "/storitve/storitev_uredi/{{pod['id']}}/" method = "POST">
Ime storitve: <input type = "text" name = "ime_storitve" value = '{{pod['ime']}}'/>
<br/>
cena storitve: <input type = "text" name = "cena_storitve" value = '{{pod['cena']}}'/>
<br/>
<select name="vet" multiple>
%for vet in veterinarji:
%	id_veter = vet['id']
%	ime_veter = vet['ime']
%	priimek_veter = vet['priimek']
%	telefon_veter = vet['telefon']
<option value="{{id_veter}}">{{ime_veter}} {{priimek_veter}} {{telefon_veter}}</option>
%end
</select>
<button type = "submit">SHRANI</button>
</form>
</div>

</body>
</html>