% rebase('base.tpl', title='Page Title')
<div class = "pozicija">
<table>
%for el in podatki:
<tr>
<td>
<a href = "/poisci_zival/informacije/{{el['id_zivali']}}/{{el['id']}}" >Datum obiska: {{el['datum']}}, ura obiska: {{el['ura']}}, teža živali: {{el['teza']}}
</a>
</td>
</tr>
%end
</table>
<form action = "/poisci_zival/informacije/{{zival}}/dodaj_obisk/" method = "GET"> 
<button type = "submit">Dodaj obisk</button>
</form>
</div>