












                        SELECT 
                         CC.CODUL,
                         CC.DENUMIRE, 
                         COUNT (DISTINCT D.CUIIO ) AS CNT
                         
                         FROM CIS2.VW_DATA_ALL D
                                           INNER JOIN CIS2.VW_CL_CUATM C ON (TRIM(D.CUATM) = C.CODUL)
                                           INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')      
                        
                         WHERE
                         
                         D.FORM IN (27)
                         AND D.PERIOADA IN (:pPERIOADA)
                         AND D.CAPITOL IN (371) AND 
                         
                         D.RIND IN ('89') AND 
                         (CIS2.NVAL(D.COL1) <> 0) 
                         
                         
                         GROUP BY 
                         CC.CODUL,
                         CC.DENUMIRE,
                         CC.FULL_CODE
                         
                         ORDER BY 
                         CC.FULL_CODE
                          