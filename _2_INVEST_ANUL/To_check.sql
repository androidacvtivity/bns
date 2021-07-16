           SELECT 
            D.CUIIO,
            D.RIND,
            SUM(D.COL1) AS COL1, 
            SUM(D.COL2) AS COL2
            
                FROM    CIS.VW_DATA_ALL D
                
                WHERE 
                
                D.capitol = 31 AND D.capitol_vers=1040
                AND D.PERIOADA IN (1044,1045,1046,1047)
                AND D.RIND IN ('100')
                
                GROUP BY 
                D.CUIIO,
                D.RIND 
                
           HAVING       
                SUM(NVAL(D.COL1) + NVAL(D.COL2)) > 0