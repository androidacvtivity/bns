SELECT 
D.UNIT_CODE,
D.CUATM,
D.RIND,
D.COL1,
D.COL2

FROM
  VW_DATA_ALL_GC  D

WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND 
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (61)  AND
  D.CAPITOL IN (1112)
  AND D.RIND IN ('010') 
  
  AND 
  
  (D.COL1 IS NOT NULL OR D.COL2 IS NOT NULL)    
  
  
  AND 
  (
     D.CUATM LIKE '25%' OR D.CUATM LIKE '57%'  
    -- OR D.CUATM LIKE '27%' 
     --OR  D.CUATM LIKE '10%'
--     OR D.CUATM LIKE '25%' OR  D.CUATM LIKE '31%'
--     OR D.CUATM LIKE '53%' OR  D.CUATM LIKE '67%'
--     OR D.CUATM LIKE '80%' OR  D.CUATM LIKE '89%'
--     OR D.CUATM LIKE '21%' OR  D.CUATM LIKE '29%'
     
  )
                                             
  
  
  
  
    