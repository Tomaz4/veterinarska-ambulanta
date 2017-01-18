% rebase('base.tpl', title='Page Title')

<style>
.pozicija {
	position:relative;
	bottom: 200px;
	left:270px;
	}
</style>

%pod = podatki[0]
<form action = "/uredi_lastnika/{{pod['id']}}/" method = "POST">
Ime: <input type = "text" name = "ime" value = "{{pod['ime']}}"/>
<br/>
Priimek: <input type = "text" name = "priimek" value = "{{pod['priimek']}}"/>
<br/>
Naslov: <input type = "text" name = "naslov" value = "{{pod['naslov']}}"/>
<br/>
Email: <input type = "text" name = "email" value = "{{pod['email']}}"/>
<br/>
Telefon: <input type = "text" name = "telefon" value = "{{pod['telefon']}}"/>
<br/>
<button type = "submit" class = "gumbOranzen">SHRANI</button>{{napaka}}
</form>





