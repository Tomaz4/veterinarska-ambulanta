% rebase('base.tpl', title='Page Title')

<form action = '/uredi_lastnika/', method = 'GET'>
<p class = 'nasloviOken'>Vnesi priimek lastnika</p><input name = 'lastnik' type = 'text'/>
<div class = "prestavi">
<button type = 'submit' class = 'gumbOranzen'>POIŠČI</button>
</div>
</form>

<table>
<tr><th>IME</th><th>PRIIMEK</th><th>NASLOV</th><th>TELEFON</th><th>EMAIL</th></tr>
%for pod in podatki:
<tr>
<td>{{pod['ime']}}</td><td>{{pod['priimek']}}</td> <td> {{pod['naslov']}} </td> <td> {{pod['telefon']}} </td> <td> {{pod['email']}} </td> <td><a href = '/uredi_lastnika/{{pod['id']}}/'>Uredi</a></td>
</tr>
%end
</table>