







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
            1=1 
            
            AND R.CUIIO IS    NULL
            
       --     AND R.CUIIO NOT IN (40645126)
            
            
            ;