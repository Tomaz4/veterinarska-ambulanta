% rebase('base.tpl', title='Page Title')
<style>
input[type = text]{
	height: 20px;
	padding:0px;
	margin:0px;
}
.poz {
position: relative;
left: 270px;
bottom:150px;
}
</style>
<div class = "poz">
<form action = '/veterinarji/dodaj_vet/' method = 'POST'>
<p class = "nasloviOken">Ime:</p> <input type = "text" name = 'ime'/> <br/>
<p class = "nasloviOken">Priimek:</p> <input type = "text" name = 'priimek'/> <br/>
<p class = "nasloviOken">Telefon:</p> <input type = "text" name = 'telefon'/> <br/>
<p class = "nasloviOken">Email:</p> <input type = "text" name = 'email'/> <br/>
<p class = "nasloviOken">Datum rojstva:</p> <input type = "text" name = 'datum_rojstva'/><br/>
<p class = "nasloviOken">Naslov:</p> <input type = "text" name = 'naslov'/><br/>
<p class = "nasloviOken">Zaposlen:</p> <select name = "zaposlen" class = "uredi_select">
<option value = "DA">DA</option>
<option value = "NE">NE</option>
</select><br/>
<button type = 'submit' class = "gumbOranzen">SHRANI</button>{{napaka}}
</div>
</form>