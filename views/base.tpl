<!DOCTYPE html>
<html>
<head>
<style>
a {
	text-decoration:none;
	color: blue;
}
.nasloviOken {
text-transform:uppercase;
font-family:"Lucida console";
text-shadow: 1px 1px #ff8533;
margin:0;

}
.urediOkno {
	border: #ffa366 2px solid;
	width: 52%;
	overflow:auto;
}
.uredi_select{
	height: 30px;
	border: #ffa366 2px solid;
}
input[type=text] {
    width: 50%;
    padding: 6px 10px;
    margin: 10px 0;
    display: block;
	height: 25px;
    border: 1px solid #b35900;
    border-radius: 5px;
	font-size: 18px;
	font-family:courier;
	font-style: normal;
}

.gumbOranzen {
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

.gumbOranzen:hover {
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



.zaviti-robovi {border-radius: 8px;}

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

.podnaslov1 {

	font-family:"Lucida console";
	text-shadow: 1px 1.5px #ff8533;}

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
				top:70px;}

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
<img src="/views/kriz.png" style = "width:60px">
<h1 style = "float:left; width:auto;"><a href = "/" style = "color: inherit;"> VETERINARSKA AMBULANTA </a></h1>
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
  <li><a href = "/uredi_lastnika/">Uredi lastnika</a></li>
</ul>
<div class = "pozicija">
{{!base}}
</div>
</div>
</body>
</html>