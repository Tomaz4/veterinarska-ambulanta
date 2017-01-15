% rebase('base.tpl', title='Page Title')
<style>
.pozicija {
	position:relative;
	bottom: 150px;
	left:270px;
	}
</style>

<form action = "/poisci_zival/informacije/{{id_zivali}}/dodaj_obisk/racun/dokoncaj_racun/" method = "POST">
<input type="hidden" name="trajanje" value = {{trajanje}}>
<input type="hidden" name="ambulanta" value={{ambulanta}}>
<input type="hidden" name="opombe" value={{opombe}}>
<input type="hidden" name="veterinar" value={{veterinar_id}}>
<input type="hidden" name="teza" value={{teza}}>
%for element in seznam_zdravil:
<input type="hidden" name="sez_zdravil_id" value={{element}}>
%end
%for element in sezImenaZdravil:
<br>{{element[0]['ime']}}<input type = "TEXT" name = "okenca">
%end
<select name = "storitve" multiple class = "urediOkno">
%for stor in seznam_storitev:
<option value="{{stor['id']}}">{{stor['ime']}} {{stor['cena']}}</option>
%end
</select>
<br/>
<button type = "submit" class = "gumbOranzen">POTRDI</button>
</form>