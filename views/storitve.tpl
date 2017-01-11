% rebase('base.tpl', title='Page Title')
<form action = '/storitve/dodaj_storitev/'>
<button type = "submit">DODAJ STORITEV</button>
</form>
<table>
<tr>
<th>IME</th>
<th>CENE</th>
<th>UREDI</th>
<th>POGLEJ VETERINARJE</th>
</tr>

%for storitev in storitve:
<tr>
<td>{{storitev['ime']}}</td>
<td>{{storitev['cena']}}</td>
<td><a href = "/storitve/storitev_uredi/{{storitev['id']}}/">uredi</a></rd>
<td><a href = "#">Poglej veterinarje</a></td>
</tr>
%end
</table>
<form action = '/storitve/dodaj_zdravilo/'>
<button type = "submit"> DODAJ ZDRAVILO</button>
</form>
<table>
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
%	dovolj = 'NE, dokupi vsaj'+ str(int(zdravilo['minimalna_zaloga']) - int(zdravilo['trenutna_zaloga'])) + ' enot'
%end
<td>{{dovolj}}</td>
<td><a href = '/storitve/zdravilo_uredi/{{zdravilo['id']}}/'>uredi</a></td>
</tr>
%end
</table>