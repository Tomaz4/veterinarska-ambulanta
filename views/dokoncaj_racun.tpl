% rebase('base.tpl', title='Page Title')
Datum: {{datum}}<br/>
Ura: {{ura}} <br/>
ime veterinarja: {{ime_vet[0]}}, {{ime_vet[1]}}<br/>
končna cena: {{cena}}<br/>
ime lastnika: {{ime_lastnika[0]}}, {{ime_lastnika[1]}}</br>
ime živali: {{ime_zivali[0]}}<br/>
% for i in range(len(seznam_zdravil_ime)):
{{seznam_zdravil_ime[i][0]['ime']}}, količina: {{seznam_kolicin_zdravil[i]}}, cena: {{cene_zdravil[i][0]}} <br/>
%end
<br/>
%for el in seznam_storitev_ime_cena:
{{el[0]}}, cena: {{el[1]}}<br/>
%end