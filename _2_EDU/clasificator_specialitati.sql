SELECT 
                                
                                
                                TO_CHAR(c1.COD_SPEC)|| ';'
                         AS full_code
                         

                         
                         
                FROM CL_SPEC_2EDU c1
                     INNER JOIN CL_SPEC_2EDU c2
                         ON (c1.GRUPA_SPEC = c2.COD_SPEC)