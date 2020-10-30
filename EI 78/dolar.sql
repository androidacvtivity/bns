



    SELECT
            SUM(CASE WHEN D.PERIOADA IN (1040) THEN D.COL1 ELSE NULL END) AS COL1,
            SUM(CASE WHEN D.PERIOADA IN (1041) THEN D.COL1 ELSE NULL END) AS COL2,
            SUM(CASE WHEN D.PERIOADA IN (1042) THEN D.COL1 ELSE NULL END) AS COL3,
            SUM(CASE WHEN D.PERIOADA IN (1043) THEN D.COL1 ELSE NULL END) AS COL4            
                  FROM DATA_ALL D
                          INNER  JOIN CIS2.MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA IN (1040,1041,1042,1043)) AND               
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01')