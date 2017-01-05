<!doctype html>
<html>
<head>

<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
ul, li
{
list-style-type: none;
}

ul li:hover::before
{
font-family: FontAwesome;
content: "\f0a4";
}

</style>
</head>

<body>
<ul>
%for el in podatki:
<li>
<a href = "/poisci_zival/informacije/{{el['id_zivali']}}/{{el['id']}}" >Datum obiska: {{el['datum']}}, ura obiska: {{el['ura']}}, teža živali: {{el['teza']}}
</a>
</li>
%end

</ul>
<form action = "/poisci_zival/informacije/{{el['id_zivali']}}/dodaj_obisk/" method = "GET"> 
<button type = "submit">Dodaj obisk</button>
</form>
 
</body>
</html>