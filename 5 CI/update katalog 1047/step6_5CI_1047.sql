--INSERT INTO CIS2.RENIM (
--
--  CUIIO,
--  CUIIO_VERS,
--  DENUMIRE,
--  EDIT_USER,
--  STATUT, 
--  CUATM,
--  CFP,
--  CAEM2,
--  IDNO  
--
--)



SELECT 
  L.CUIIO,
  L.CUIIO_VERS,
  L.DENUMIRE,
  1 EDIT_USER,
  '1' STATUT, 
  L.CUATM,
  L.CFP,
  L.CAEM2,
  L.IDNO  

FROM USER_BANCU.KAT_5_CI_1047 L  


            LEFT JOIN CIS.RENIM R  ON R.CUIIO = L.CUIIO AND R.CUIIO_VERS = L.CUIIO_VERS  
            
            
            WHERE 
            
            R.CUIIO IS NOT NULL 