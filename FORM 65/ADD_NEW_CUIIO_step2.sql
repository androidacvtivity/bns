UPDATE USER_BANCU.KAT_CAEM2

SET CUATM = REPLACE(CUATM,'O','0');

SELECT 
  CUIIO,
  CUIIO_VERS, 
  DENUMIRE,
  CUATM,
  CFP,        
  CFOJ,      
  CAEM2      
FROM USER_BANCU.KAT_CAEM2;

UPDATE USER_BANCU.KAT_CAEM2

SET CUIIO_VERS = 1052;

