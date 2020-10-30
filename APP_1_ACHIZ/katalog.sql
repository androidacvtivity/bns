    
SELECT 
        D.CUIIO,
        D.CUIIO_VERS
       
        
        FROM
     (
     SELECT 
        D.CUIIO,
        D.CUIIO_VERS
       
        
        FROM USER_BANCU.VW_KATALOG_2_ACHIZ_2017 D
        
        
        WHERE 
        1=1
        
         AND D.CUATM LIKE '62%' 
         
         AND 
         D.CUIIO   IN ( 
         
         
      5693870, 
      40532729,          
      40496206,        
      1008604001051,
      1008604001062, 
      1008604003778                          
                         
    
  
         
         
         )

  
--AND D.CUIIO_VERS <> 2006
        
        
        ORDER BY 
        D.CUIIO
        
     ) D
     
     WHERE 
     1=1
--    AND D.CUIIO_VERS = 2006