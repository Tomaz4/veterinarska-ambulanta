% rebase('base.tpl', title='Page Title')
<style>
.pozicija {
	position:relative;
	bottom: 150px;
	left:270px;
	}
</style>
<table>
<tr>
<th>IME STORITVE</th>
<th>CENA</th>
</tr>
%for storitev in storitve:
<tr>

<td>{{storitev['ime']}}</td>
<td>{{storitev['cena']}}</td>	
</tr>
%end
</table>