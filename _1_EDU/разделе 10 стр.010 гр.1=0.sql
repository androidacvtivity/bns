


        SELECT 
              DISTINCT   D.CUIIO
        
        FROM CIS2.VW_DATA_ALL D
        
        WHERE 
        D.PERIOADA  = 2008 
        AND D.FORM   =  40 
        AND D.CAPITOL = 1032
        AND D.RIND IN ('010')
        AND D.COL1 IS  NULL