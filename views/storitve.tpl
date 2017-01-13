% rebase('base.tpl', title='Page Title')
<style>
.pozicija {
	position:relative;
	bottom: 150px;
	left:270px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
    $("#skrijTabStor").click(function(){
        $("#tabStor").hide(1000);
		$("#skrijTabStor").hide()
		$("#prikazTabStor").show()
		
    });
    $("#prikazTabStor").click(function(){
        $("#tabStor").show(1000);
		$("#prikazTabStor").hide()
		$("#skrijTabStor").show();
    });
});

$(document).ready(function(){
    $("#skrijTabZdr").click(function(){
        $("#tabZdr").hide(1000);
		$("#skrijTabZdr").hide()
		$("#prikazTabZdr").show();
    });
    $("#prikazTabZdr").click(function(){
        $("#tabZdr").show(1000);
		$("#prikazTabZdr").hide()
		$("#skrijTabZdr").show();
    });
});
</script>
<h3 class = "podnaslov1">TABELA STORITEV</h6>
<button id = "prikazTabStor" class = "gumbOranzen">Prikaži tabelo</button>
<button id = "skrijTabStor" class = "gumbOranzen">Skrij tabelo</button>

<div id = "tabStor">
<table>
<tr>
<th>IME</th>
<th>CENE</th>
<th>UREDI</th>
</tr>

%for storitev in storitve:
<tr>
<td>{{storitev['ime']}}</td>
<td>{{storitev['cena']}}</td>
<td><a href = "/storitve/storitev_uredi/{{storitev['id']}}/">uredi</a></rd>
</tr>
%end
</table>
</div>

<br/>
<h3 class = "podnaslov1">TABELA ZDRAVIL</h3>
<button id = "prikazTabZdr" class = "gumbOranzen">Prikaži tabelo zdravil</button>
<button id = "skrijTabZdr" class = "gumbOranzen">Skrij tabelo zdravil</button>

<div id = "tabZdr">
<table style = "width:470px">
<tr>
<th>IME</th>
<th>CENA>/th>
<th>RECEPT</th>
<th>TRENUTNA ZALOGA</th>
<th>ALI JE DOVOLJ ZALOGE?</th>
<th>UREDI PODATKE</th>
</tr>
<tr>
%for zdravilo in zdravila:
<td>{{zdravilo['ime']}}</td>
<td>{{zdravilo['cena']}}</td>
%if int(zdravilo['recept']) == 0:
%	recept = 'NE'
%else:
%	recept = 'DA'
%end
<td>{{recept}}</td>
<td>{{zdravilo['trenutna_zaloga']}}</td>
%if int(zdravilo['trenutna_zaloga'])>= int(zdravilo['minimalna_zaloga']):
%	dovolj = 'DA'
%else:
%	dovolj = 'NE, dokupi vsaj '+ str(int(zdravilo['minimalna_zaloga']) - int(zdravilo['trenutna_zaloga'])) + ' enot'
%end
<td>{{dovolj}}</td>
<td><a href = '/storitve/zdravilo_uredi/{{zdravilo['id']}}/'>uredi</a></td>
</tr>
%end
</table>
</div>

</br>
<form action = '/storitve/dodaj_zdravilo/'>
<button type = "submit" class = "gumbOranzen"> DODAJ ZDRAVILO</button>
</form>
<form action = '/storitve/dodaj_storitev/'>
<button type = "submit" class = "gumbOranzen">DODAJ STORITEV</button>
</div>