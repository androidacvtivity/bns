
---I check if exists duplicates.

SELECT 
  CUIIO,
  COUNT (CUIIO) AS CNT
  
        
        FROM USER_BANCU.KAT_1_INF
        
        GROUP BY 
        CUIIO
        
        
        HAVING 
        COUNT (CUIIO)<>   1