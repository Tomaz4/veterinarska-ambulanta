% rebase('base.tpl', title='Page Title')
{{datum}}
{{ura}}
{{trajanje}}
{{ambulanta}}
{{veterinar_id}}
{{el}}
{{teza}}
%for el in sezKolicinZdravil:
{{el}}
%end
%for el in seznamStoritev:
{{el}}
%end