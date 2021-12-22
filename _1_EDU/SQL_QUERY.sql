



            SELECT 
                D.CUIIO,
                D.RIND,
                SUM(D.COL2) AS COL1,
                SUM(D.COL3) AS COL2
                
                FROM CIS2.VW_DATA_ALL D
                
                WHERE
                D.FORM = 40 AND 
                D.PERIOADA = 2010
                AND D.CAPITOL = 1024
                AND D.RIND IN ('06')
                
                
                GROUP BY
                
                D.CUIIO,
                D.RIND
                
                HAVING 
                NVAL(SUM(D.COL2)) <> 0 
                
                AND 
                
                (
                NVAL(SUM(D.COL3)) = 0
                
                OR 
                
                NVAL(SUM(D.COL3)) <  NVAL(SUM(D.COL2))
                )