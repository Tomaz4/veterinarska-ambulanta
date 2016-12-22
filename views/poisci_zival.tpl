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

pre {
	border-style: solid;
    border-width: 2px 10px 4px 50px;
	border-color: #999999;	
	}

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

%if not podatki:
Ni živali
%end
<ul>
%for zival in podatki:
<li>{{zival['ime']}} je rojena {{zival['datum_rojstva']}}
		<a href = "" style = "text-decoration:none">{{dict(zival)}}</a> </li>
%end
</ul>
</body>
</html>