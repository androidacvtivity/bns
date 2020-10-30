SELECT 
        D.CUIIO,
        D.CAPITOL,
        D.RIND,
        D.COL1,
        D.COL2,
        D.COL3
        
        FROM CIS.VW_DATA_ALL D
        
        WHERE 
        FORM = 7 AND PERIOADA = 416
         AND  D.CUIIO = 40711277
        
        GROUP BY 
         D.CUIIO,
        D.CAPITOL,
        D.RIND,
        D.COL1,
        D.COL2,
        D.COL3
        
        ORDER BY 
        D.CUIIO,
        D.CAPITOL,
        D.RIND,
        D.COL1,
        D.COL2,
        D.COL3