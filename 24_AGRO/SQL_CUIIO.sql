    




        SELECT 
        
            DISTINCT 
            D.CUIIO,
            R.DENUMIRE,
            D.CUATM
               
            
                FROM CIS2.VW_DATA_ALL D
                        INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND 
                                                    R.CUIIO_VERS = D.CUIIO_VERS
                
                WHERE 
                
                FORM  = 33
                AND PERIOADA = 1051
                AND CAPITOL = 379
                AND RIND IN  ('050')
                
                GROUP BY 
                  D.CUIIO,
                  R.DENUMIRE,
                  D.CUATM
               