﻿SELECT
1 ORDINE,
'060' RIND,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1040 AND D.RIND IN ('060') THEN D.UNIT_CODE ELSE NULL END ) AS COL1,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1041 AND D.RIND IN ('060') THEN D.UNIT_CODE ELSE NULL END ) AS COL2,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1042 AND D.RIND IN ('060') THEN D.UNIT_CODE ELSE NULL END ) AS COL3,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1043 AND D.RIND IN ('060') THEN D.UNIT_CODE ELSE NULL END ) AS COL4,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1044 AND D.RIND IN ('060') THEN D.UNIT_CODE ELSE NULL END ) AS COL5,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1045 AND D.RIND IN ('060') THEN D.UNIT_CODE ELSE NULL END ) AS COL6,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1046 AND D.RIND IN ('060') THEN D.UNIT_CODE ELSE NULL END ) AS COL7,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1047 AND D.RIND IN ('060') THEN D.UNIT_CODE ELSE NULL END ) AS COL8,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1048 AND D.RIND IN ('060') THEN D.UNIT_CODE ELSE NULL END ) AS COL9,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1049 AND D.RIND IN ('060') THEN D.UNIT_CODE ELSE NULL END ) AS COL10,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1050 AND D.RIND IN ('060') THEN D.UNIT_CODE ELSE NULL END ) AS COL11,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1051 AND D.RIND IN ('060') THEN D.UNIT_CODE ELSE NULL END ) AS COL12        
     
FROM
  VW_DATA_ALL_GC  D
WHERE
  (D.PERIOADA IN  (1048,1049,1047,1050,1051,1046,1045,1044,1043,1042,1041,1040))  AND   
  (D.FORM =:pFORM) AND
  
  D.FORM IN (58)  AND
  D.CAPITOL IN (416)
  AND D.RIND IN ('060')
  
   
  UNION 
  
  SELECT
2 ORDINE,
'061' RIND,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1040 AND D.RIND IN ('061') THEN D.UNIT_CODE ELSE NULL END ) AS COL1,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1041 AND D.RIND IN ('061') THEN D.UNIT_CODE ELSE NULL END ) AS COL2,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1042 AND D.RIND IN ('061') THEN D.UNIT_CODE ELSE NULL END ) AS COL3,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1043 AND D.RIND IN ('061') THEN D.UNIT_CODE ELSE NULL END ) AS COL4,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1044 AND D.RIND IN ('061') THEN D.UNIT_CODE ELSE NULL END ) AS COL5,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1045 AND D.RIND IN ('061') THEN D.UNIT_CODE ELSE NULL END ) AS COL6,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1046 AND D.RIND IN ('061') THEN D.UNIT_CODE ELSE NULL END ) AS COL7,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1047 AND D.RIND IN ('061') THEN D.UNIT_CODE ELSE NULL END ) AS COL8,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1048 AND D.RIND IN ('061') THEN D.UNIT_CODE ELSE NULL END ) AS COL9,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1049 AND D.RIND IN ('061') THEN D.UNIT_CODE ELSE NULL END ) AS COL10,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1050 AND D.RIND IN ('061') THEN D.UNIT_CODE ELSE NULL END ) AS COL11,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1051 AND D.RIND IN ('061') THEN D.UNIT_CODE ELSE NULL END ) AS COL12        
     
FROM
  VW_DATA_ALL_GC  D
WHERE
  (D.PERIOADA IN  (1048,1049,1047,1050,1051,1046,1045,1044,1043,1042,1041,1040))  AND   
  (D.FORM =:pFORM) AND
  
  D.FORM IN (58)  AND
  D.CAPITOL IN (416)
  AND D.RIND IN ('061')
  
  
  UNION 
  
  SELECT
3 ORDINE,
'070' RIND,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1040 AND D.RIND IN ('070') THEN D.UNIT_CODE ELSE NULL END ) AS COL1,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1041 AND D.RIND IN ('070') THEN D.UNIT_CODE ELSE NULL END ) AS COL2,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1042 AND D.RIND IN ('070') THEN D.UNIT_CODE ELSE NULL END ) AS COL3,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1043 AND D.RIND IN ('070') THEN D.UNIT_CODE ELSE NULL END ) AS COL4,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1044 AND D.RIND IN ('070') THEN D.UNIT_CODE ELSE NULL END ) AS COL5,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1045 AND D.RIND IN ('070') THEN D.UNIT_CODE ELSE NULL END ) AS COL6,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1046 AND D.RIND IN ('070') THEN D.UNIT_CODE ELSE NULL END ) AS COL7,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1047 AND D.RIND IN ('070') THEN D.UNIT_CODE ELSE NULL END ) AS COL8,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1048 AND D.RIND IN ('070') THEN D.UNIT_CODE ELSE NULL END ) AS COL9,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1049 AND D.RIND IN ('070') THEN D.UNIT_CODE ELSE NULL END ) AS COL10,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1050 AND D.RIND IN ('070') THEN D.UNIT_CODE ELSE NULL END ) AS COL11,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1051 AND D.RIND IN ('070') THEN D.UNIT_CODE ELSE NULL END ) AS COL12        
     
FROM
  VW_DATA_ALL_GC  D
WHERE
  (D.PERIOADA IN  (1048,1049,1047,1050,1051,1046,1045,1044,1043,1042,1041,1040))  AND   
  (D.FORM =:pFORM) AND
  
  D.FORM IN (58)  AND
  D.CAPITOL IN (416)
  AND D.RIND IN ('070')
  
 UNION

 SELECT
4 ORDINE,
'080' RIND,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1040 AND D.RIND IN ('080') THEN D.UNIT_CODE ELSE NULL END ) AS COL1,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1041 AND D.RIND IN ('080') THEN D.UNIT_CODE ELSE NULL END ) AS COL2,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1042 AND D.RIND IN ('080') THEN D.UNIT_CODE ELSE NULL END ) AS COL3,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1043 AND D.RIND IN ('080') THEN D.UNIT_CODE ELSE NULL END ) AS COL4,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1044 AND D.RIND IN ('080') THEN D.UNIT_CODE ELSE NULL END ) AS COL5,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1045 AND D.RIND IN ('080') THEN D.UNIT_CODE ELSE NULL END ) AS COL6,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1046 AND D.RIND IN ('080') THEN D.UNIT_CODE ELSE NULL END ) AS COL7,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1047 AND D.RIND IN ('080') THEN D.UNIT_CODE ELSE NULL END ) AS COL8,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1048 AND D.RIND IN ('080') THEN D.UNIT_CODE ELSE NULL END ) AS COL9,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1049 AND D.RIND IN ('080') THEN D.UNIT_CODE ELSE NULL END ) AS COL10,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1050 AND D.RIND IN ('080') THEN D.UNIT_CODE ELSE NULL END ) AS COL11,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1051 AND D.RIND IN ('080') THEN D.UNIT_CODE ELSE NULL END ) AS COL12        
     
FROM
  VW_DATA_ALL_GC  D
WHERE
  (D.PERIOADA IN  (1048,1049,1047,1050,1051,1046,1045,1044,1043,1042,1041,1040))  AND   
  (D.FORM =:pFORM) AND
  
  D.FORM IN (58)  AND
  D.CAPITOL IN (416)
  AND D.RIND IN ('080')
  
  

  UNION

 SELECT
5 ORDINE,
'090' RIND,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1040 AND D.RIND IN ('090') THEN D.UNIT_CODE ELSE NULL END ) AS COL1,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1041 AND D.RIND IN ('090') THEN D.UNIT_CODE ELSE NULL END ) AS COL2,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1042 AND D.RIND IN ('090') THEN D.UNIT_CODE ELSE NULL END ) AS COL3,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1043 AND D.RIND IN ('090') THEN D.UNIT_CODE ELSE NULL END ) AS COL4,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1044 AND D.RIND IN ('090') THEN D.UNIT_CODE ELSE NULL END ) AS COL5,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1045 AND D.RIND IN ('090') THEN D.UNIT_CODE ELSE NULL END ) AS COL6,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1046 AND D.RIND IN ('090') THEN D.UNIT_CODE ELSE NULL END ) AS COL7,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1047 AND D.RIND IN ('090') THEN D.UNIT_CODE ELSE NULL END ) AS COL8,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1048 AND D.RIND IN ('090') THEN D.UNIT_CODE ELSE NULL END ) AS COL9,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1049 AND D.RIND IN ('090') THEN D.UNIT_CODE ELSE NULL END ) AS COL10,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1050 AND D.RIND IN ('090') THEN D.UNIT_CODE ELSE NULL END ) AS COL11,
COUNT (DISTINCT CASE WHEN D.PERIOADA = 1051 AND D.RIND IN ('090') THEN D.UNIT_CODE ELSE NULL END ) AS COL12        
     
FROM
  VW_DATA_ALL_GC  D
WHERE
  (D.PERIOADA IN  (1048,1049,1047,1050,1051,1046,1045,1044,1043,1042,1041,1040))  AND   
  (D.FORM =:pFORM) AND
  
  D.FORM IN (58)  AND
  D.CAPITOL IN (416)
  AND D.RIND IN ('090')