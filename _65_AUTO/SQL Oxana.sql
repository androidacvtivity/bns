

             SELECT 
                    DISTINCT MR.RIND,
                    A.COL1,
                    A.COL2,
                    A.COL3,
                    A.COL4        

             FROM USER_EREPORTING.DATA_ALL_PRIMIT A 
             
                            INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = A.ID_MD
                    

                WHERE 
                A.CUIIO = 41100891  and 
                A.form = 5  and 
                A.perioada =  1042