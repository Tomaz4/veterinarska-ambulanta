% rebase('base.tpl', title='Page Title')
<style>
.pozicija {
	position:relative;
	bottom: 150px;
	left:270px;
	}
</style>
<div style = "border: orange 2px solid; width:600px; overlow: auto;" >
<table>
<tr>
<th>Datum:</th> <td>{{datum}} </td>
<tr>
<th>Ura:</th> <td>{{ura}} </td>
</tr>
<tr>
<th>Ime in priimek veterinarja:</th><td>{{ime_vet[0]}}, {{ime_vet[1]}}</td>
</tr>
<tr>
<th>končna cena:</th> <td>{{cena}}</td>
</tr>
<tr>
<th>ime lastnika:</th><td>{{ime_lastnika[0]}}, {{ime_lastnika[1]}}</td>
</tr>
<tr>
<th>ime živali:</th><td> {{ime_zivali[0]}}</td>
</tr>
</table>
</div>
<div>
<p class = "podnaslov1">TABELA UPORABLJENIH ZDRAVILA</p>
<table>
<tr>
<th>IME</th>
<th>KOLIČINA</th>
<th>CENA</th>
</tr>

% for i in range(len(seznam_zdravil_ime)):
<tr>
<td>{{seznam_zdravil_ime[i][0]['ime']}}</td> <td>{{seznam_kolicin_zdravil[i]}}</td><td>{{cene_zdravil[i][0]}} </td>
</tr>
%end
</table>
<p class = "podnaslov1"> TABELA UPORABLJENIH STORITEV </p>
<table>
<tr>
<th>IME</th>
<th>CENA</th>
</tr>
%for el in seznam_storitev_ime_cena:
<tr>
<td>{{el[0]}}</td><td>{{el[1]}}</td>
</tr>
%end
</table>
</div>