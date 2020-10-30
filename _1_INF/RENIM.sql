












        SELECT  
        
        A.CUIIO,
        B.CUIIO_VERS
        
        
        
        
        FROM

         (

           SELECT 
                
                CUIO AS CUIIO 
                
                 FROM USER_BANCU.IT_PARK_CHISNAU_2018
                 ) A   LEFT JOIN (
                 
                  SELECT A.*  
          
          
          FROM   USER_BANCU.VW_MAX_RENIM_CIS2 A
                 
                 ) B ON B.CUIIO = A.CUIIO 


                WHERE 
                B.CUIIO IS NOT  NULL 


;
-------------------------------------------------------------------------------
          SELECT A.*  
          
          
          FROM   USER_BANCU.VW_MAX_RENIM_CIS2 A



                WHERE
                
                A.CUIIO NOT IN (
                
                SELECT 
                
                CUIO
                
                 FROM USER_BANCU.IT_PARK_CHISNAU_2018
                
                ) 
                
                          
          