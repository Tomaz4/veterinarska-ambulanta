% rebase('base.tpl', title='Page Title')
<style>
.pozicija {
	position:relative;
	bottom: 150px;
	left:270px;
	}
</style>
%opombe_pod = opombe_pod[0]
<form action = "/poisci_zival/informacije/{{id_zivali}}/datum_smrti_opombe/", method = 'POST'>
<p class = "nasloviOken"> OPOMBA </p><input name = "opomba" type = "text" value = {{opombe_pod['opombe']}}/>
<p class = "nasloviOken">Datum smrti</p><input name = "datum_smrti" type = "text" />
<button type = "submit" class = "gumbOranzen">POTRDI</button>
</form>