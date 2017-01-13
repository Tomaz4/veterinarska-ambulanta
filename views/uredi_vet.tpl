% rebase('base.tpl', title='Page Title')
<style>
.pozicija {
	position:relative;
	bottom: 170px;
	left:270px;
	}
</style>
%podatek = podatek[0]
<body>
<form action = '/veterinarji/uredi_vet/{{podatek['id']}}/' method = 'POST'>
<input type = "text" name = 'ime' value = '{{podatek['ime']}}'/>
<input type = "text" name = 'priimek' value = '{{podatek['priimek']}}'/>
<input type = "text" name = 'telefon' value = '{{podatek['telefon']}}'/>
<input type = "text" name = 'email' value = '{{podatek['email']}}'/>
<input type = "text" name = 'datum_rojstva' value = '{{podatek['datum_rojstva']}}'/>
<input type = "text" name = 'naslov' value = '{{podatek['naslov']}}'/>
Zaposlen: <select name = "zaposlen">
%if podatek['zaposlen'] == 'DA':
<option value = "DA" selected>DA</option>
<option value = "NE">NE</option>
%else:
<option value = "DA">DA</option>
<option value = "NE" selected>NE</option>
%end
</select>
<br/>
<button type = "submit" class = "gumbOranzen">POTRDI</button>
</form>
</body>
</html>