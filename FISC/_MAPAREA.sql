



            

       
              SELECT  
              
                        DISTINCT D.CUIIO,
                                 R.DENUMIRE
        
        
                    FROM CIS2.VW_DATA_ALL D
                                    INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS 
                    
                    WHERE 
                    
                    D.PERIOADA IN (:pPERIOADA)
                    
                    AND D.FORM IN (:pFORM)
                    
                    AND D.CAPITOL  IN (337) 
                    
                    
                    AND 
                    (
                    
                    
                    D.RIND  = '080'  
                    
                    )