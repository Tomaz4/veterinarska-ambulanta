<!DOCTYPE html>
<html>
<head>
<style>
.zaviti-robovi {border-radius: 8px;}
.pozicija {
	position:relative;
	left:150px;
	bottom:100px;
}
#slikaK {
	float:right;
}

.naslov {
	margin-left:30%;
	text-align:center;
	font-family:"Lucida console";
	text-shadow: 2px 2px #ff8533;
	width: 500px;
}

ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    background-color: #ff6600;
    max-width: 150px;
	position:relative;
}

li {
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover {
    background-color: #ff8533;
}
li ul
     { 
         display:none; 
         position:absolute;
		 left: 150px;
		 top:45px;
     }

li:hover ul{
	display:block;}

hr {background-color: #ff6600;
	margin: 0; 
	border-radius:10px;
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
<div class = "naslov">
<h1 style = "float:left; width:auto;"> VETERINARSKA AMBULANTA </h1>
</div>
<div style = "clear:both">
<hr size = "25"/>
<ul class = "zaviti-robovi">
  <li><a href="/poisci_zival/">Poišči žival</a></li>
  <li><a href="#">Dodaj žival</a>
	<ul class = "zaviti-robovi">
		<li><a href = "/dodaj_zival/">Dodaj žival z obstoječim lastnikom</a></li>
		<li><a href = "/dodaj_zival_in_lastnika/">Dodaj žival in lastnika</a></li>
	</ul>
  </li>
  <li><a href="/veterinarji/">Veterinarji</a></li>
  <li><a href="/storitve/">Storitve in zdravila</a></li>
</ul>
<div class = "pozicija">
{{!base}}
</div>
</div>
</body>
</html>