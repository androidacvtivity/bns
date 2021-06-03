




        SELECT DISTINCT D.CUIIO,
                        D.CUIIO_VERS
        
        
                FROM CIS2.VW_DATA_ALL D
                
                        INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
                        
                        
                        WHERE 
                        D.PERIOADA = 2009
                        AND D.FORM = 3
                       
                        
                        AND  (C.FULL_CODE LIKE '%' ||:pCOD_CUATM||';%') 
                
                