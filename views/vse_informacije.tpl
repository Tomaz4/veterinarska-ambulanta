% rebase('base.tpl', title='Page Title')
<style>
.pozicija {
	position:relative;
	bottom: 70px;
	left:170px;
	}
</style>
%podatki = podatki[0]
%for pod in podatki:
{{pod}} </br>
%end
<table>
<tr>
</tr>
</table>