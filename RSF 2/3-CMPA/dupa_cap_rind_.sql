SELECT 
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
         SUM(D.COL1) AS COL2,
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
         --         D.COL2 AS COL2,
--         D.COL3 AS COL3,
--         D.COL4 AS COL4,
--         D.COL5 AS COL5,
--         D.COL6 AS COL6,
--         D.COL7 AS COL7,
--         D.COL8 AS COL8,
--         D.COL9 AS COL9,
--         D.COL10 AS COL10,
--         D.COL11 AS COL11,
--         D.COL12 AS COL12,
--         D.COL13 AS COL13
       
        
        
FROM
  VW_DATA_ALL_GC  D
  
  
  
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM = 62) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND 
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (62)  AND
  D.CAPITOL IN (1115,1116,1117,1118)
  
  
  GROUP BY 
   D.UNIT_CODE,
   D.CAPITOL,
   D.RIND,
   D.CUATM
--    D.COL1,
--         D.COL2,
--         D.COL3,
--         D.COL4,
--         D.COL5,
--         D.COL6,
--         D.COL7,
--         D.COL8,
--         D.COL9,
--         D.COL10,
--         D.COL11,
--         D.COL12,
--         D.COL13
--  
    ORDER BY 
   D.CAPITOL,
   D.RIND