<!doctype html>
<html>
<body>
<ul>
%for el in podatki:
<li>
<a href = "/poisci_zival/informacije/{{el['id_zivali']}}/{{el['id']}}" >Datum obiska: {{el['datum']}}, ura obiska: {{el['ura']}}, teža živali: {{el['teza']}}, opombe: {{el['opombe']}}
</a>
</li>
%end
</ul>
</body>
</html>