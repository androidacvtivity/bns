





                
                SELECT 
                
                A.*
                
                
                --    COUNT (A.CUIIO) AS CNT 
--                    MAX(A.CUIIO),
--                    MAX(A.CUIIO_VERS
--                
                FROM USER_BANCU.VW_KATALOG_EI_78_1036 A
                
                            LEFT JOIN  USER_BANCU.VW_KATALOG_EI_78_1039 B ON  (A.CUIIO = B.CUIIO)-- AND A.CUIIO_VERS  = B.CUIIO_VERS)    
                             -- INNER JOIN  USER_BANCU.VW_KATALOG_EI_78_1037 C ON  (A.CUIIO = C.CUIIO AND A.CUIIO_VERS  = C.CUIIO_VERS)



                 WHERE
                 B.CUIIO IS NOT NULL 
                 
              --   AND B.CUIIO IN (41109236)
                                                         
                             
                                   