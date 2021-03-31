1. Dupa incidentul cu SGBD Oracle, a aparut asa o situatie. 
2. Eu am solicitat tie sa executi procedura  pentru EI 78 - 2020.
3. S-a executat. 
4, Acum in CONTROL mi-a aparut COTROL 46-081, cu mai multe coduri CUIIO.
5. Ma duc in rapoet in CIS2 la acest CUIIO , dau verificare - apare eroarea cu codul. 
6. Eu SQL controlului 46-081 si-l execut in TOAD pentru acest CUIIO . 
7. Eroare nu apare. 
9. Ma duc in CIS2 si inserez un 0  intr-o celula goala, Salvez. Verific. 
10. Controlul  46-081, a disparut, dar a aprut alt - 46-050.
11. Eu SQL controlului 46-050 si-l execut in TOAD pentru acest CUIIO .
12. Eroare nu apare.
13. Ma duc in CIS2 in raport  si inserez un 0  intr-o celula goala, Salvez. Verific.
14. Apare tot eroarea cu  46-050. 
15. Bine. sterg valoarea din  celula care participa la 46-050, salvez, desigur sunt erori. 
16. Inserezi valoarea in celula din carea am sters-o , salvez. Verific. 

Raportul este valid 

Concluzie. Dupa incidentul cu SGBD - in Toad merge bine, corect, in web asa magie a aparut. 
De exemplu OBJECT ID din tabele. Tu doar ai creat tabele noi. Deci au alt OBJECT ID. Eu am intrebat in (stackexchange.com)
si am primit raspuns 
(https://dba.stackexchange.com/questions/288880/are-the-tables-in-the-oracle-unique?noredirect=1#comment564882_288880)

Solutia - Se recrezi materialized view din nou. 