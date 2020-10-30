




  SELECT 
            
            
                CUIIO,           
                COUNT (*) AS  CNT
            
                FROM CIS2.VW_DATA_ALL
                
                
                WHERE 
                
                
                FORM IN (:pFORM)
                
                AND PERIOADA IN (:pPERIOADA)
                
                
                GROUP BY 
                CUIIO
            
  
  
                HAVING 
                
                    COUNT (*) = 10
              
                ORDER BY 
                COUNT (*) DESC    
                    
                 
            
                
            
            
            