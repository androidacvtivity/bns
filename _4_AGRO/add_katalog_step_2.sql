﻿--INSERT INTO USER_BANCU.KATALOG_v1
--
--(
--  CUIIO,
--  CUIIO_VERS,
--  DENUMIRE,
--  CUATM,
--  CFP,
--  CFOJ,
--  CAEM2
--
--
--)

SELECT 
    
  L.CUIIO,
  L.CUIIO_VERS,
  L.DENUMIRE,
  CASE WHEN TRIM(L.CUATM)  = '962000' THEN   L.CUATM||'0'  ELSE TRIM(L.CUATM) END CUATM,
  L.CFP,
  L.CFOJ,
  L.CAEM2
    
    
    FROM USER_BANCU.KATALOG_v1 L
    
    
    
    where 
    
    LENGTH(L.CUATM)   =  7