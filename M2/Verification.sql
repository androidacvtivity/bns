--40711277,40495885,38989964,4494192,3944428
SELECT 
        L.CUIIO,
        L.CAPITOL,
        L.RIND,
        R.RIND,
        R.ID_USER   R_ID_USER,
        
        L.COL1 L_COL1,
        R.COL1 R_COL1,
        L.COL2 L_COL2,
        R.COL2 R_COL2,
        L.COL3 L_COL3, 
        R.COL3 R_COL3
FROM

(
SELECT 
        D.CUIIO,
        D.CAPITOL,
        D.RIND,
        D.COL1,
        D.COL2,
        D.COL3
        
        FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
        
        WHERE 
        D.FORM = 7 AND D.PERIOADA = 416
        AND  D.CUIIO = :pCUIIO
        
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
        
        ) L  LEFT JOIN (
        SELECT 
        D.CUIIO,
        D.CAPITOL,
        D.RIND,
        D.ID_USER,
        D.COL1,
        D.COL2,
        D.COL3
        
        FROM CIS.VW_DATA_ALL D
        
        WHERE 
        D.FORM = 7 AND D.PERIOADA = 416
        AND  D.CUIIO = :pCUIIO
        
        GROUP BY 
        D.CUIIO,
        D.CAPITOL,
        D.RIND,
        D.ID_USER,
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
        
        ) R ON R.CUIIO = L.CUIIO 
        
          AND R.CAPITOL = L.CAPITOL 
          AND R.RIND = L.RIND 
        
         -- AND L.COL1 = R.COL1 
         -- AND L.COL2 = R.COL2 
         -- AND L.COL3 = R.COL3
        
        WHERE 
        1=1
        
         AND 
         (   
         
             NVAL(L.COL1) <> NVAL(R.COL1) 
         OR  NVAL(L.COL2) <> NVAL(R.COL2) 
         OR  NVAL(L.COL3) <> NVAL(R.COL3)
         
         )