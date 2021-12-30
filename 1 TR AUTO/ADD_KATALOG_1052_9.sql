--INSERT INTO CIS2.RENIM (
--
--  CUIIO,
--  CUIIO_VERS,
--  DENUMIRE,
--  EDIT_USER,
--  STATUT, 
--  CUATM,
--  CFP,
--  CAEM2
--
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
  L.CAEM2


FROM USER_BANCU.TUR_1_V2 L  


            LEFT JOIN CIS2.RENIM R  ON R.CUIIO = L.CUIIO AND R.CUIIO_VERS = L.CUIIO_VERS  
            
            
            WHERE 
            
            R.CUIIO IS  NOT NULL 