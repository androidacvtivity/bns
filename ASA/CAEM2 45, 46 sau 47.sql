SELECT 

L.CUIIO, 
L.COL31,
R.RIND,
R.COL1

FROM 

(
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
  

ORDER BY COL31 


) L 



WHERE 

L.COL31 LIKE '45%'
OR 
L.COL31 LIKE '46%'
OR 
L.COL31 LIKE '47%'


AND L.CUIIO IN (
  SELECT 
  
    DISTINCT CUIIO

               
     
      FROM      USER_BANCU.TTTTTTT
   
   
   
) 


ORDER BY 
L.CUIIO,
L.COL31
) L  LEFT JOIN (


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
) R ON R.CUIIO = L.CUIIO 

WHERE 
R.CUIIO IS NOT NULL