  SELECT 
  
    DISTINCT CUIIO,
             RIND, 
             SUM(COL1) AS COL1  
     
            FROM CIS2.VW_DATA_ALL
           WHERE     FORM = 64
                 AND PERIOADA = 2010
                 AND CAPITOL  IN (1124)
                 AND RIND IN ('150')  
                
GROUP BY 
CUIIO,
             RIND 