﻿INSERT INTO CIS2.FORM_CUIIO

(

CUIIO,
CUIIO_VERS,
FORM,
FORM_VERS,
STATUT
)


SELECT 
CUIIO,
CUIIO_VERS,
32  FORM,
2000 FORM_VERS,
'1' STATUT

FROM CIS2.RENIM

WHERE 

    CUIIO IN (

   40086885,

40923594,
2730381,
15846576,
40396580,
313558003,
40574745,
40265027,
38685489,
15860197,
40024708,
4517504,
4742187,
300114103,
37722716,
38556409,
2045393303,
2751147,
2746436,
2166851,
2734019,
20164235,
37462592,
40870936
)

AND CUIIO_VERS IN (2006)