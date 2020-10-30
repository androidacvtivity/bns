



SELECT 
               CUIIO, 
               COUNT (CUIIO ) AS CNT
               
               
               --CAPITOL
               
               FROM  
(

    SELECT 
            
              DISTINCT  CUIIO,
               CAPITOL       
          
            
                
                FROM CIS2.VW_DATA_ALL
                
                
                WHERE 
                
                FORM IN (:pFORM)
                
                AND PERIOADA IN (:pPERIOADA)
                
                
                
                ORDER BY 
                 CUIIO
                
          )                


             GROUP BY 
             CUIIO 
             
             
             ORDER BY 
             COUNT (CUIIO) DESC




;

-----------------------------------------------------------
             SELECT 
            
            
                CUIIO,           
                COUNT (*) AS  CNT
            
                FROM CIS2.VW_DATA_ALL
                
                
                WHERE 
                
                FORM IN (:pFORM)
                
                AND PERIOADA IN (:pPERIOADA)
                
                
                GROUP BY 
                CUIIO
            
              
                ORDER BY 
                COUNT (*) DESC   