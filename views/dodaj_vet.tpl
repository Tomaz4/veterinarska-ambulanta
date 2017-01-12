% rebase('base.tpl', title='Page Title')
<style>
input[type = text]{
	height: 20px;
	padding:0px;
	margin:0px;
}
.poz {
position: relative;
bottom:70px;
overflow:auto;
}
</style>
<div class = "poz">
<form action = '/veterinarji/dodaj_vet/' method = 'POST'>
Ime: <input type = "text" name = 'ime'/> <br/>
Priimek: <input type = "text" name = 'priimek'/> <br/>
Telefon: <input type = "text" name = 'telefon'/> <br/>
Email: <input type = "text" name = 'email'/> <br/>
Datum rojstva: <input type = "text" name = 'datum_rojstva'/><br/>
Naslov: <input type = "text" name = 'naslov'/><br/>
<button type = 'submit' class = "gumbOranzen">SHRANI</button>
</div>

</form>