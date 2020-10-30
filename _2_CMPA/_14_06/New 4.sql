









            SELECT 
            COUNT(DISTINCT D.UNIT_CODE ) AS CNT
            
            
             
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
  AND D.RIND IN('060', '070', '080' , '090') 