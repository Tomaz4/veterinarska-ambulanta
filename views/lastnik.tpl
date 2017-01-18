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
<p class = "nasloviOken">Ime:</p> <input type = "text" name = "ime" value = "{{pod['ime']}}"/>
<br/>
<p class = "nasloviOken">Priimek:</p> <input type = "text" name = "priimek" value = "{{pod['priimek']}}"/>
<br/>
<p class = "nasloviOken">Naslov:</p> <input type = "text" name = "naslov" value = "{{pod['naslov']}}"/>
<br/>
<p class = "nasloviOken">Email:</p> <input type = "text" name = "email" value = "{{pod['email']}}"/>
<br/>
<p class = "nasloviOken">Telefon:</p> <input type = "text" name = "telefon" value = "{{pod['telefon']}}"/>
<br/>
<button type = "submit" class = "gumbOranzen">SHRANI</button>{{napaka}}
</form>





