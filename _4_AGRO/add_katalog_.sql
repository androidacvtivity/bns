












--
--INSERT INTO USER_BANCU.KATALOG_v1
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
  L.CUATM,
  L.CFP,
  L.CFOJ,
  L.CAEM2
    
    
    FROM USER_BANCU.KATALOG L  
    
    
            LEFT  JOIN CIS2.RENIM  R ON R.CUIIO = L.CUIIO AND  R.CUIIO_VERS = L.CUIIO_VERS
            
            
            
            WHERE 
            
            
            R.CUIIO IS   NULL
            
            
            
            ;
            
            
            
            
            
            
(            
            
 SELECT 
    
  L.CUIIO,
  L.CUIIO_VERS,
  L.DENUMIRE,
  CASE WHEN TRIM(L.CUATM)  = '962000' THEN   TRIM(L.CUATM)  ELSE TRIM(L.CUATM) END CUATM,
  L.CFP,
  L.CFOJ,
  L.CAEM2
    
    
    FROM USER_BANCU.KATALOG_V1 L
    
    
    )
    
    ;
    
      
    
    
    UPDATE  USER_BANCU.KATALOG
    
    
    SET CUIIO_VERS = 2008;