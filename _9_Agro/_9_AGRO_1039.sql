


SELECT *


    FROM USER_BANCU.VW_MAX_RENIM_TRIM_CIS2 R

      WHERE 
      
      R.CUIIO IN 
        

  (
    SELECT 
        
          
         R.CUIIO   
    
        
        
        FROM USER_BANCU.VW_KATALOG_9_AGRO_2007  R 
        
                            INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        
        
        WHERE
        
        
        
        C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%' 
        
        
        AND R.CUIIO_VERS IN (2007)
        )
        
        
        AND R.CUIIO_VERS IN (1039)
        --;
        