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
<p class = "nasloviOken">IME: </p> <input type = "text" name = 'ime' value = '{{podatek['ime']}}'/>
<p class = "nasloviOken">PRIIMEK </P><input type = "text" name = 'priimek' value = '{{podatek['priimek']}}'/>
<p class = "nasloviOken">telefon </p><input type = "text" name = 'telefon' value = '{{podatek['telefon']}}'/>
<p class = "nasloviOken">email </p><input type = "text" name = 'email' value = '{{podatek['email']}}'/>
<p class = "nasloviOken"> Datum rojstva </p><input type = "text" name = 'datum_rojstva' value = '{{podatek['datum_rojstva']}}'/>
<p class = "nasloviOken">naslov </p><input type = "text" name = 'naslov' value = '{{podatek['naslov']}}'/>
<p class = "nasloviOken">Zaposlen:</p> <select name = "zaposlen" class = "uredi_select">
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