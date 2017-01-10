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