﻿SELECT 
        D.PERIOADA,
         D.UNIT_CODE,
         D.CUATM,
         CASE WHEN D.CAPITOL = 1115 THEN 'Tabelul_1'
              WHEN D.CAPITOL = 1116 THEN 'Tabelul_2'
              WHEN D.CAPITOL = 1117 THEN 'Tabelul_3'
              WHEN D.CAPITOL = 1118 THEN 'Cap. SR'
         END 
          AS CAPITOL,
--         D.CAPITOL, 
         D.RIND,   
         SUM(D.COL1) AS COL1,
         SUM(D.COL2) AS COL2,
         SUM(D.COL3) AS COL3,
         SUM(D.COL4) AS COL4,
         SUM(D.COL5) AS COL5,
         SUM(D.COL6) AS COL6,
         SUM(D.COL7) AS COL7,
         SUM(D.COL8) AS COL8,
         SUM(D.COL9) AS COL9,
         SUM(D.COL10) AS COL10,
         SUM(D.COL11) AS COL11,
         SUM(D.COL12) AS COL12,
         SUM(D.COL13) AS COL13

       
        
        
FROM
  VW_DATA_ALL_GC  D
  
  
  
WHERE
  (D.PERIOADA IN (1044,1045,1046,1047))  AND   
  (D.FORM = 62) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND 
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (62)  AND
  D.CAPITOL IN (1115,1116,1117,1118)
 --AND D.RIND IN ('6505')  
 -- AND D.UNIT_CODE = 21830

  
  GROUP BY 
   D.PERIOADA,
   D.UNIT_CODE,
   D.CAPITOL,
   D.RIND,
   D.CUATM
   
 ORDER BY 
  D.PERIOADA,
   D.UNIT_CODE,
   D.CAPITOL,
   D.RIND,
   D.CUATM