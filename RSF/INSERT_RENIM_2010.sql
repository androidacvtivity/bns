--INSERT INTO CIS2.FORM_CUIIO 
--(
--CUIIO,
--CUIIO_VERS,
--FORM,
--FORM_VERS,
--STATUT
--)


SELECT 
CUIIO,
CUIIO_VERS,
63 FORM,
2000 FORM_VERS,
'1' STATUT

FROM CIS2.RENIM
WHERE 

CUIIO IN (
        38748053,
40026239,
40749446,
40760732,
40801595,
40894835,
40963240,
40985773,
41154695,
41216953,
41293770,
--41427710,
41444588,
41451252,
41452168,
41477441,
41535032,
41535598,
41536053,
41536439
)
AND CUIIO_VERS >= 2010