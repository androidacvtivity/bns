﻿


UPDATE CIS2.FORM_CUIIO
SET STATUT = '3'




--SELECT *
--
--
--FROM CIS2.FORM_CUIIO 

WHERE 

CUIIO IN (


SELECT 
R.CUIIO
FROM USER_BANCU.VW_KATALOG_EI_78_1047 L 
      RIGHT JOIN USER_BANCU.VW_KATALOG_EI_78_2009 R ON L.CUIIO = R.CUIIO 
      
      WHERE 
      
      L.CUIIO IS  NULL )
      
      AND FORM = 46
      
      AND FORM_VERS = 2000
      
      AND STATUT = '1' 
      AND CUIIO_VERS = 2009;
      
      