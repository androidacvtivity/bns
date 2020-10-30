









        SELECT 
        
        
                D.CUIIO,
                SUM(D.COL1) AS COL1
        
        
        
            FROM CIS2.VW_DATA_ALL D 
            
            WHERE 

            D.FORM IN (1)
        
        AND D.PERIOADA IN (2007)
        
        AND D.CAPITOL IN (103)
        
        AND D.RIND IN ('290')
        
        
        
        GROUP BY 
        
        D.CUIIO
        
        ORDER BY 
        
        SUM(D.COL1) DESC