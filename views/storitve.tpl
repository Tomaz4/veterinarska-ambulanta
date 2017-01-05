% rebase('base.tpl', title='Page Title')
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