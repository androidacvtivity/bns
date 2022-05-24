--SELECT 
-- ROWNUM ORDINE,
-- CUIIO,
-- RIND,
-- COL31,
--ROUND((SUM(COL4)/1000),1) AS COL4
--
----2445045527
--
--
--FROM 
--(

SELECT   
D.CUIIO,
D.RIND,
D.COL31,
SUM(D.COL4) AS COL4

FROM
  CIS2.VW_DATA_ALL D  
 INNER JOIN (
         
         SELECT
                  CI.ITEM_CODE
                  
                FROM
                  CLS_CLASS_ITEM CI
                WHERE
                  CI.CLASS_CODE IN ('CSPM2') 
    
                 AND CI.ITEM_PARENT NOT IN  ('00.00.00')
                  
             ) CI ON (D.COL31 =  CI.ITEM_CODE)

WHERE

  (D.PERIOADA=:PERIOADA          ) AND
  D.FORM IN (44)  AND
  D.RIND NOT IN ('1','--') AND 
  D.CAPITOL IN (407) 
   -- AND D.CUIIO = 1129894
  AND 
  
  D.COL31  IN 
  (
 SELECT ITEM_CODE
        
        
            FROM CIS2.CLS_CLASS_ITEM 
            
            WHERE 
            1=1
            AND CLASS_CODE = 'CSPM2' 
            AND ITEM_PARENT NOT IN  ('00.00.00')
  )
  
 

GROUP BY 
  D.RIND, 
  D.COL31,
  D.CUIIO


ORDER BY
D.COL31,
D.CUIIO 

--)
--
--
--GROUP BY 
-- ROWNUM,
-- CUIIO,
-- RIND,
-- COL31
-- 
-- ORDER BY
-- ORDINE