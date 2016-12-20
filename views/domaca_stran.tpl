<!DOCTYPE html>
<html>
<head>
<style>
body {
background-image: url("views/{{slika}}");
background-repeat:no-repeat;
background-attachment:fixed;
background-position: 80% 80%;
background-size: 450px 300px;}

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
	
</style>
</head>

<body>
<div class = "naslov">
<h1 style = "float:left; width:auto;"> VETERINARSKA AMBULANTA </h1>
<img id = "#slikaK" width = "50" height = "50" src = "views/{{slikaKriz}}"/>
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
</div>
</body>
</html>