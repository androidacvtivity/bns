
SELECT D.*
FROM USER_BANCU.KAT_2010_1_INVEST  D
                        LEFT JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
                        
                        
                        WHERE 
                        C.CODUL is NULL;