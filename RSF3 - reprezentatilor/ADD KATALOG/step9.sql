﻿--INSERT INTO CIS2.FORM_CUIIO (
--
--  CUIIO,
--  CUIIO_VERS,
--  FORM,
--  FORM_VERS,
--  STATUT 
--)



SELECT 
  L.CUIIO,
  L.CUIIO_VERS,
  66 FORM,
  2000 FORM_VERS,
  '1' STATUT 
  
FROM USER_BANCU.RSF_REPR_2009_FIN L  


            LEFT JOIN CIS2.RENIM R  ON R.CUIIO = L.CUIIO AND R.CUIIO_VERS = L.CUIIO_VERS  
            
            
            WHERE 
            
            R.CUIIO IS NOT  NULL 