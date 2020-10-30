SELECT 

COUNT (DISTINCT UNIT_CODE) AS CNT

FROM 

(

SELECT 
            DISTINCT D.UNIT_CODE,
            D.RIND,
            
            COL1, COL2, COL3,  COL4, COL5, COL6, COL7, COL8, COL9, COL10,  COL11, COL12, COL13,  COL14, COL15, COL16, COL17
            
            
             
            FROM
                   VW_DATA_ALL_GC  D
                   
                   WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (58)  AND
  D.CAPITOL IN (416)
  AND D.RIND IN('060') 
  
  
  
  UNION 
  
  SELECT 
            DISTINCT D.UNIT_CODE,
            D.RIND,
            
            COL1, COL2, COL3,  COL4, COL5, COL6, COL7, COL8, COL9, COL10,  COL11, COL12, COL13,  COL14, COL15, COL16, COL17
            
            
             
            FROM
                   VW_DATA_ALL_GC  D
                   
                   WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (58)  AND
  D.CAPITOL IN (416)
  AND D.RIND IN('070') 
  
  
  
  UNION 
  
  SELECT 
            DISTINCT D.UNIT_CODE,
            D.RIND,
            
            COL1, COL2, COL3,  COL4, COL5, COL6, COL7, COL8, COL9, COL10,  COL11, COL12, COL13,  COL14, COL15, COL16, COL17
            
            
             
            FROM
                   VW_DATA_ALL_GC  D
                   
                   WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (58)  AND
  D.CAPITOL IN (416)
  AND D.RIND IN('080') 
  
  
  
  
  UNION 
  
  SELECT 
            DISTINCT D.UNIT_CODE,
            D.RIND,
            
            COL1, COL2, COL3,  COL4, COL5, COL6, COL7, COL8, COL9, COL10,  COL11, COL12, COL13,  COL14, COL15, COL16, COL17
            
            
             
            FROM
                   VW_DATA_ALL_GC  D
                   
                   WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (58)  AND
  D.CAPITOL IN (416)
  AND D.RIND IN('090') 
  
  
  )