% rebase('base.tpl', title='Page Title')
<ul>
%for storitev in storitve:
<li>
{{storitev['ime']}}<br/>
{{storitev['cena']}}
</li>	
%end
</ul>