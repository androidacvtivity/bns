SELECT 
D.UNIT_CODE,
D.FORM,
 D.CAPITOL,
--         CASE 
--         
--              WHEN D.CAPITOL = 1115 THEN 'CAP1'
--              WHEN D.CAPITOL = 1116 THEN 'CAP2'
--              WHEN D.CAPITOL = 1117 THEN 'CAP3'
--              WHEN D.CAPITOL = 1118 THEN 'Cap. SR'
--         END 
--          AS CAPITOL,
         D.RIND, 
D.COL1 AS COL1,
D.COL2 AS COL2, 
D.COL3 AS COL3,  
D.COL4 AS COL4, 
D.COL5 AS COL5,  
D.COL6 AS COL6,    
D.COL7 AS COL7,
D.COL8 AS COL8, 
D.COL9 AS COL9, 
D.COL10 AS COL10,  
D.COL11 AS COL11, 
D.COL12 AS COL12, 
D.COL13 AS COL13

FROM
  VW_DATA_ALL_GC  D


WHERE 

--------------------------------------
 (D.PERIOADA = 1047)  AND   
--  (D.FORM = 62) AND
  (D.FORM_VERS =1004) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND 
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
--  D.FORM IN (62)  
  
 -- AND D.CAPITOL IN (1115,1116,1118,1117) 
  




-----------------------------------


REGEXP_LIKE (D.COL1, '[[:alpha:]]')

OR 
REGEXP_LIKE (D.COL2, '[[:alpha:]]')
OR 
REGEXP_LIKE (D.COL3, '[[:alpha:]]')
OR 
REGEXP_LIKE (D.COL4, '[[:alpha:]]')
OR 
REGEXP_LIKE (D.COL5, '[[:alpha:]]')
OR 
REGEXP_LIKE (D.COL6, '[[:alpha:]]')

OR 
REGEXP_LIKE (D.COL7, '[[:alpha:]]')
OR 
REGEXP_LIKE (D.COL8, '[[:alpha:]]')

OR 
REGEXP_LIKE (D.COL9, '[[:alpha:]]')


OR 
REGEXP_LIKE (D.COL10, '[[:alpha:]]')

OR 
REGEXP_LIKE (D.COL11, '[[:alpha:]]')

OR 
REGEXP_LIKE (D.COL12, '[[:alpha:]]')

OR 
REGEXP_LIKE (D.COL13, '[[:alpha:]]')





 GROUP BY 
   D.UNIT_CODE,

   D.CAPITOL,
   D.FORM,
   D.RIND,

   D.COL1,
   D.COL2,
   D.COL3,
   D.COL4,
   D.COL5,
   D.COL6,
   D.COL7,
   D.COL8,
   D.COL9,
   D.COL10,
   D.COL11,
   D.COL12,
   D.COL13
            
  
    ORDER BY 
   D.CAPITOL,
   D.RIND