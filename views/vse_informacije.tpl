% rebase('base.tpl', title='Page Title')
<ul>
%for el in podatki:
<li>
{{dict(el)}}
</a>
</li>
%end
</ul>