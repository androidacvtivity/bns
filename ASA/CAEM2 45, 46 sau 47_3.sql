SELECT 

L.CUIIO, 
L.COL31

FROM 

(
 SELECT DISTINCT CUIIO, COL31
    FROM (
    
    SELECT CUIIO, 
     COL31
            FROM CIS2.VW_DATA_ALL
           WHERE     FORM = 64
                 AND PERIOADA = 2010
                 AND CAPITOL = 1129 
                 AND RIND = '8'
                 
                 )

GROUP BY CUIIO, COL31
HAVING 
COL31 IS NOT NULL
  

ORDER BY COL31 ) L