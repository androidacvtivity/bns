            SELECT 
               
                D.CUIIO,
              
                D.CUIIO_VERS

                    
                FROM CIS.VW_DATA_ALL D
                
                WHERE 
                
                D.PERIOADA = :pPERIOADA 
                
                AND  D.FORM = 3
                
                
                GROUP BY 
                 D.CUIIO,
              
                D.CUIIO_VERS

                ORDER BY 
                D.CUIIO,
                D.CUIIO_VERS