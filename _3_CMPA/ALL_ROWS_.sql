SELECT 
         D.PERIOADA,
         D.UNIT_CODE,
         D.CUATM,
         CASE 
         
              WHEN D.CAPITOL = 1115 THEN 'Tabelul 1'
              WHEN D.CAPITOL = 1116 THEN 'Tabelul 2'
              WHEN D.CAPITOL = 1117 THEN 'Tabelul 3'
              WHEN D.CAPITOL = 1118 THEN 'Cap. SR'
         END 
          AS CAPITOL,
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
         SUM(D.COL13) AS COL13,
         SUM(D.COL14) AS COL14,
         SUM(D.COL15) AS COL15,
         SUM(D.COL16) AS COL16,
         SUM(D.COL17) AS COL17,
         SUM(D.COL18) AS COL18,
         SUM(D.COL19) AS COL19
       
        
        
FROM
  CIS2.VW_DATA_ALL_GC  D
  
  
  
WHERE
 -- (D.PERIOADA IN (1040,1041,1042,1043))  AND   
  (D.PERIOADA IN (1049))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND 
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (62) 
  
 AND
  D.CAPITOL IN (1115,1116,1117,1118)
  

  
  GROUP BY 
   D.PERIOADA,
   D.UNIT_CODE,
   D.CUATM,
   D.CAPITOL,
   D.RIND  
  
    ORDER BY 
   D.UNIT_CODE,
   D.CAPITOL,
   D.RIND