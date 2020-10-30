    SELECT
            
            D.PERIOADA,
            SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) THEN D.COL1 ELSE NULL  END ) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                          INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
                      
                        WHERE
                              P.PERIOADA_ANULA = :pPERIOADA AND            
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01')
            
            GROUP BY 
            D.PERIOADA                   