<!doctype html>
<html>
<head>
<style>
#okvir_tabela{display: inline-block;
				position: relative;
				top:100px;}

th, td {
	padding-left: 20px;
	padding-right: 20px;
	padding-top: 20px;
}	


table {
	border-collapse:collapse;
}	

th {background-color:#ff8000;
	color:white;}			

tr:nth-child(even){background-color: #f2f2f2}

</style>
</head>
<body>

<table id = "tabela">
<tr>
	<th><b>IME</b></th>
	<th><b>PRIIMEK</b></th>
	<th><b>TELEFON</b></th>
	<th><b>EMAIL</b></th>
	<th><b>DATUM ROJSTVA</b></th>
	<th><b>NASLOV</b></th>
	<th><b>STORITVE</b></th>

</tr>
%for veterinar in vet:
<tr>
	<td>{{veterinar['ime']}}</td>
	<td>{{veterinar['priimek']}}</td>
	<td>{{veterinar['telefon']}}</td>
	<td>{{veterinar['email']}}</td>
	<td>{{veterinar['datum_rojstva']}}</td>
	<td>{{veterinar['naslov']}}</td>
	<td><a href = "/veterinarji/{{veterinar['id']}}">Poglej storitve</a></td>
</tr>
%end
</table>

</body>
</html>