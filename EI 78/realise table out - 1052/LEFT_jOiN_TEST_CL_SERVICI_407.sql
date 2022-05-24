SELECT 
L.CUIIO,
L.RIND,
L.COL31,
SUM(L.COL4) COL4
FROM

(

 
SELECT 
 ROWNUM ORDINE,
 CUIIO,
 RIND,
 COL31,
ROUND((SUM(COL4)/1000),1) AS COL4

--2445045527


FROM 
(

SELECT   
D.CUIIO,
D.RIND,
D.COL31,
SUM(D.COL4) AS COL4

FROM
  CIS2.VW_DATA_ALL D  
 

WHERE
  (D.PERIOADA=:PERIOADA          ) AND
 -- (D.CUIIO=:CUIIO                ) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               ) AND
  (D.FORM_VERS=:FORM_VERS  ) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
  D.FORM IN (44)  AND
  D.RIND NOT IN ('1','--') AND 
  D.CAPITOL IN (407) 
  
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
D.COL31 

)

GROUP BY 
 ROWNUM,
 CUIIO,
 RIND,
 COL31
 
 ORDER BY
 ORDINE

 ) L  LEFT JOIN (
 
 
 
 SELECT 
 ROWNUM ORDINE,
 CUIIO,
 RIND,
 COL31,
ROUND((SUM(COL4)/1000),1) AS COL4

--2445045527


FROM 
(

SELECT   
D.CUIIO,
D.RIND,
D.COL31,
SUM(D.COL4) AS COL4

FROM
  CIS2.VW_DATA_ALL D  
 INNER JOIN (
         
         SELECT
                  CI.ITEM_CODE,
                  CI.ITEM_PATH,
                  CI.NAME,
                  CI.SHOW_ORDER,
                  MAX(CI.ITEM_CODE_VERS) AS ITEM_CODE_VERS
                FROM
                  VW_CLS_CLASS_ITEM CI
                WHERE
                  CI.CLASS_CODE IN ('CSPM2') 
    
                GROUP BY
                  CI.ITEM_CODE,
                  CI.ITEM_PATH,
                  CI.NAME,
                  CI.SHOW_ORDER
                  
             ) CI ON (TRIM(D.COL31)=TRIM(CI.ITEM_CODE))

WHERE

  
  D.FORM IN (44)  AND
  D.RIND NOT IN ('1','--') AND 
  D.CAPITOL IN (407) 
  
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
D.COL31 

)


GROUP BY 
 ROWNUM,
 CUIIO,
 RIND,
 COL31
 
 ORDER BY
 ORDINE
 
 ) R ON R.CUIIO = L.CUIIO 
 
-- WHERE 
-- R. IS NULL
 
 GROUP BY
 L.CUIIO,
L.RIND,
L.COL31