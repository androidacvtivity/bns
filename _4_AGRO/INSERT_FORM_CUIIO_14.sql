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
    43 FORM,
    2000 FORM_VERS,
    '1'STATUT 

FROM CIS2.RENIM

WHERE 

CUIIO  IN (
       41343404,
41172960,
4060506171,
40870892,
4121136471,
41260121,
41282068,
40904830,
412699932,
41216025,
41261304,
4128217571,
41269139,
40064859,
4053961971,
41315595,
41048941,
41269926,
405114282,
24013348,
9218342

        
        
        )
        
        AND CUIIO_VERS = 2008