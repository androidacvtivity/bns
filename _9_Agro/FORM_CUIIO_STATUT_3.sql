  select
           DISTINCT CUIIO
          
     FROM    USER_BANCU.VW_KATALOG_9_AGRO
     
     WHERE
     
      CUIIO NOT  IN (
      
      SELECT 
        CUIIO
        
        
        FROM VW_KATALOG_29_AGRO_TRIM_4
      
      )