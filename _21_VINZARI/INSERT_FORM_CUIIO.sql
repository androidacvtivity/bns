﻿INSERT INTO  CIS2.FORM_CUIIO

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
  26 FORM,
  1004 FORM_VERS,
  '1'STATUT    

    FROM CIS2.RENIM
    
    WHERE


    CUIIO IN (
37514679,
38923026,
40795937
)

   AND CUIIO_VERS IN (1039)