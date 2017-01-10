<!doctype html>
<html>
<head>
</head>
%podatek = podatek[0]
<body>
<form action = '/veterinarji/uredi_vet/{{podatek['id']}}/' method = 'POST'>
<input type = "text" name = 'ime' value = '{{podatek['ime']}}'/>
<input type = "text" name = 'priimek' value = '{{podatek['priimek']}}'/>
<input type = "text" name = 'telefon' value = '{{podatek['telefon']}}'/>
<input type = "text" name = 'email' value = '{{podatek['email']}}'/>
<input type = "text" name = 'datum_rojstva' value = '{{podatek['datum_rojstva']}}'/>
<input type = "text" name = 'naslov' value = '{{podatek['naslov']}}'/>
<button type = "submit">POTRDI</button>
</form>
</body>
</html>