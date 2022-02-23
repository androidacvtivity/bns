        SELECT 
                DISTINCT 
                D.CUIIO,
                MAX(DATA_REG) DATA_REG
                
                
            FROM CIS2.VW_DATA_ALL_FR D
WHERE 
FORM = 57

AND PERIOADA = 2010


 AND ID_USER = 9999
 
 
 GROUP BY
 D.CUIIO
 
  ORDER BY
            DATA_REG  DESC   
 