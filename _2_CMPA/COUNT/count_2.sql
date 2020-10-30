SELECT 

    D.UNIT_CODE
       
            
    FROM CIS2.VW_DATA_ALL_GC D
    
    
    WHERE 
    
    D.FORM = 58
    
    
    AND D.PERIOADA = 1040
    
    AND 
    
    D.CAPITOL IN (419,416,418)
    
    
    GROUP BY 
    D.UNIT_CODE
    
    HAVING
    
    SUM (CASE WHEN  D.CAPITOL IN (419)  AND NVAL(D.COL1) > 0 THEN NVAL(D.COL1) ELSE 0 END) > 0
    
    
--    
--    AND 
--
--    (SUM (CASE WHEN  D.CAPITOL IN (417)  AND NVAL(D.COL1) = 0 THEN NVAL(D.COL1) ELSE 0 END)
--    
--   + SUM (CASE WHEN  D.CAPITOL IN (419)  AND NVAL(D.COL1) = 0 THEN NVAL(D.COL1) ELSE 0 END)) = 0
--     
    
    