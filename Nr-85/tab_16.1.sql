










                    SELECT  D.*
                    
                        FROM CIS2.DATA_ALL D
                              
                                INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS
                                INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM
                                
                                
                                
                         WHERE 
                         
                         D.PERIOADA IN (:pPERIOADA)         
                    
                     