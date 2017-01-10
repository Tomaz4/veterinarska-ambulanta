<!doctype html>
<html>
<body>
<ul>
%for storitev in storitve:
<li>
{{storitev['ime']}}<br/>
{{storitev['cena']}}
</li>	
%end
</ul>
</body>
</html>