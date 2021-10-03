












                        SELECT 
                         CC.CODUL,
                         CC.DENUMIRE, 
                         COUNT (DISTINCT D.CUIIO ) AS CNT
                         
                         FROM CIS2.VW_DATA_ALL D
                                           INNER JOIN CIS2.VW_CL_CUATM C ON (TRIM(D.CUATM) = C.CODUL)
                                           INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%') 
                                           INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS    
                        
                         WHERE
                         
                         D.FORM IN (27)
                         AND D.PERIOADA IN (:pPERIOADA)
                         AND D.CAPITOL IN (371) 
                         AND R.CFOJ  IN ('420','450','684','685','686')
                         
                        AND  D.RIND IN ('89') AND 
                         (CIS2.NVAL(D.COL6) <> 0) 
                         
                         
                         GROUP BY 
                         CC.CODUL,
                         CC.DENUMIRE,
                         CC.FULL_CODE
                         
                         ORDER BY 
                         CC.FULL_CODE
                          