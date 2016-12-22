<!doctype html>
<html>
<head>
<meta charset = 'UTF-8'/>
<style>
input[type=text] {
    width: 50%;
    padding: 6px 10px;
    margin: 10px 0;
    display: block;
	height: 25px;
    border: 1px solid #b35900;
    border-radius: 5px;
	font-size: 18px;
}

#gumbPoisci {
    width: 30%;
    background-color: #ff8000;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
	font-size = 18px;
	height:auto;
}

#gumbPoisci:hover {
    background-color: #ffa64d;
}

input[type=text]:active {
    border: 1px solid #663300;
}

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

<center>
<form action='/poisci_zival/' method = "GET">
Vnesi ime živali:
<br/>
<input type='text' name = 'ime_zivali'/>
<br/>
<button type = 'submit' id = "gumbPoisci"> POIŠČI </button>
</form>
</center>


<center>
%if not podatki:
<p style = "font-size:20px"><b>Živali s tem imenom ni v bazi. Preverite vaš vnos!<b><p>
%elif podatki == "":
% pass
%else:
<div id = "okvir_tabela">
<table id = "tabela">
<tr>
	<th><b>IME</b></th>
	<th><b>ROJSTVO</b></th>
	<th><b>SPOL</b></th>
	<th><b>PRIIMEK</b></th>
	<th><b>TELEFON</b></th>
	<th><b>PODATKI</b></th>
</tr>
%for zival in podatki:
%	if zival['spol'] == 'Female':
%		spolZ = "samica"
%	else:
%		spolZ = "samec"
%   end
<tr>
	<td>{{zival['ime']}}</td>
	<td>{{zival['datum_rojstva']}}</td>
	<td>{{spolZ}}</td>
	<td>{{zival['priimek']}}</td>
	<td>{{zival['telefon']}}</td>
	<td><a href = "/poisci_zival/informacije/{{zival['id']}}" style = "text-decoration:none">obišči</a> </td> 
</tr>
%end
</table>
</div>
%end
</center>
</body>
</html>