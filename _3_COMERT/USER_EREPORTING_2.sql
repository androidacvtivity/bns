
SELECT 
D.CUIIO,
D.CAPITOL,
D.CAPITOL_VERS,
D.ID_USER,
MAX(D.DATA_REG) DATA_REG,
SUM(D.COL1) AS COL1

FROM
  CIS2.VW_DATA_ALL D
  
  
WHERE
  (D.PERIOADA=:PERIOADA) AND
 
 
   D.FORM  IN (21)
   AND D.CAPITOL  IN (100,0)
   
   GROUP BY
   D.CUIIO, 
   D.CAPITOL,
   D.CAPITOL_VERS,
   D.ID_USER
   
   
  HAVING 
  
  D.CAPITOL  = 100  -- Change  capitol this 
                    -- 0 is with STATUT = 1
                    -- 100 is STATU T= 0
  AND D.ID_USER = 9999
  
  
  ORDER BY 
  DATA_REG DESC