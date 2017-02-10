% rebase('base.tpl', title='Page Title')
<style>
.pozicija {
	position:relative;
	bottom: 150px;
	left:270px;
	}
	
</style>
%for pod in pod_vet:
%	ime_vet = pod['ime']
% 	priimek_vet = pod['priimek']
% 	telefon = pod['telefon']
%end
<h2 style = "color: orange;">IME VETERINARJA: {{ime_vet}} </h2>
<h2 style = "color: orange;">PRIIMEK VETERINARJA: {{priimek_vet}} </h2>
<h2 style = "color: orange;">TELEFON: {{telefon}} </h2>
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