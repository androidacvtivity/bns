    SELECT  
        
          DISTINCT CUIIO,
          CUIIO_VERS
          
          FROM CIS2.VW_DATA_ALL 
          
          WHERE 
          
          PERIOADA IN (:pPERIOADA) 
          AND FORM IN (:pFORM)
        
        