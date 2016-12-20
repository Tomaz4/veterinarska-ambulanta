<!doctype html>
<html>
<head>
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

input[type=submit] {
    width: 30%;
    background-color: #ff8000;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #ffa64d;
}

input[type=text]:active {
    border: 1px solid #663300;
}
</style>
</head>

<body>
<center>
<form action='/poisci_zival/'>
Vnesi ime živali:
<br/>
<input type='text' name = 'ime-zivali'/>
<br/>
Vnesi priimek lastnika:
<br/>
<input type = 'text' name='priimek-lastnika'/>
<br/>
<input type = 'submit'/>
</form>
</center>
</body>
</html>