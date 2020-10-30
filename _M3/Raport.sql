







            SELECT 
            CC.CODUL,
            CC.DENUMIRE,
            COUNT (DISTINCT D.CUIIO) AS CNT
           
            
            
            
            FROM USER_EREPORTING.DATA_ALL_PRIMIT D
            
                                           INNER JOIN CIS2.RENIM R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS)
                                           INNER JOIN CIS2.VW_CL_CUATM C ON  C.CODUL = R.CUATM 
                                           INNER JOIN CIS2.VW_CL_CUATM CC ON C.FULL_CODE LIKE  ('%'||CC.CODUL||';%')    
            
            
            WHERE 
            D.FORM IN (:pFORM)
            AND D.PERIOADA IN (:pPERIOADA)
            AND C.FULL_CODE LIKE  ('%'||:pCOD_CUATM||';%')    
            AND CC.PRGS IN ('2')
                        
            
            GROUP BY
            CC.CODUL,
            CC.DENUMIRE,
            CC.FULL_CODE
            
            ORDER BY 
            CC.FULL_CODE
            
            