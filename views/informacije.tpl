% rebase('base.tpl', title='Page Title')

<style>
.pozicija {
	position:relative;
	bottom: 80px;
	left:170px;
	}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
    $("#prikazi_tab").click(function(){
		$("#skrij_tab").show();
		$("#prikazi_tab").hide();
		$("#tabObisk").show(1000);
		
    });
	$("#skrij_tab").click(function(){
		$("#prikazi_tab").show();
		$("#skrij_tab").hide();
		$("#tabObisk").hide(1000);
		
    });
	$("#tabObisk").hide();
	$("#skrij_tab").hide();
});
</script>

<div class = "pozicija">
<table>
%info = info[0]
<tr><th>IME</th> <td>{{info['ime']}}</td> </tr>
<tr><th>DATUM ROJSTVA</th> <td>{{info['datum_rojstva']}}</td> </tr>
<tr><th>SPOL</th> <td>{{info['spol']}}</td> </tr>
<tr><th>PASMA</th> <td>{{info['pasme']}}</td> </tr>
<tr><th>BARVA</th> <td>{{info['barva']}}</td> </tr>
<tr><th>OPOMBE</th> <td>{{info['opombe']}}</td> </tr>
<tr><th>DATUM SMRTI</th> <td>{{info['datum_smrti']}}</td> </tr>
</table>

<form action = "/poisci_zival/informacije/{{zival}}/datum_smrti_opombe/" method = 'GET'>
<button type = "submit" class = "gumbOranzen">Določi datum smrti/uredi opombe</button>
</form>


<button id = "prikazi_tab" class = "gumbOranzen">PRIKAŽI INFORMACIJE</button>
<button id = "skrij_tab" class = "gumbOranzen">SKRIJ INFORMACIJE</button>

<table id = "tabObisk" style = "clear:both">
<tr>
<th>DATUM OBISKA</th>
<th>URA OBISKA</th>
<th>TEŽA ŽIVALI</th>
<th>POGLEJ</th>
</tr>
<tr>
%for el in podatki:
<tr>
<td>{{el['datum']}}</td>
<td>ura obiska: {{el['ura']}}</td>
<td>teža živali: {{el['teza']}}</td>
<td>
<a href = "/poisci_zival/informacije/{{el['id_zivali']}}/{{el['id']}}" >poglej</a>
</td>
</tr>
%end
</table>
<form action = "/poisci_zival/informacije/{{zival}}/dodaj_obisk/" method = "GET"> 
<br/>
<button type = "submit" class = "gumbOranzen">Dodaj obisk</button>
</form>
</div>