SELECT 
    DISTINCT  
    
     
     D.CUIIO,
     D.CAPITOL,
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
D.COL13 AS COL13,
D.COL14 AS COL14,   
D.COL15 AS COL15,     
D.COL16 AS COL16,
D.COL17 AS COL17,
D.COL18 AS COL18,
D.COL19 AS COL19    

     
 FROM CIS2.VW_DATA_ALL_FR D 
      -- INNER JOIN  RENIM R ON R.CUIIO = R.CUIIO AND R.CUIIO_VERS = R.CUIIO_VERS  
 
 
 WHERE 
 
 D.PERIOADA IN (:pPERIOADA)
 AND D.FORM  IN  (:pFORM)
 
 AND (
 -----------------------------------
REGEXP_LIKE (D.COL1, '[[:alpha:]]')
OR 
REGEXP_LIKE (D.COL16, '[[:alpha:]]')
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


OR 
REGEXP_LIKE (D.COL14, '[[:alpha:]]')

OR 
REGEXP_LIKE (D.COL15, '[[:alpha:]]')

OR 
REGEXP_LIKE (D.COL16, '[[:alpha:]]')

OR 
REGEXP_LIKE (D.COL17, '[[:alpha:]]')


OR 
REGEXP_LIKE (D.COL18, '[[:alpha:]]')

OR 
REGEXP_LIKE (D.COL19, '[[:alpha:]]')
)

GROUP BY 
   D.CUIIO,
   D.CAPITOL,
   D.RIND,
   D.COL16,
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
   D.COL13,
   D.COL14,
   D.COL15,
   D.COL16,
   D.COL17,
   D.COL18,
   D.COL19