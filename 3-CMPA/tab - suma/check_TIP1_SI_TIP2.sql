SELECT
  D.UNIT_CODE,
         
      --   D.RIND,   
         SUM(D.COL1) AS COL1
      

FROM
  VW_DATA_ALL_GC  D
  
  
  
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM = 62) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND 
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (62)  AND
  D.CAPITOL IN (1118)
  AND D.RIND IN ('TIP2','TIP3')
  
  
  
 -- AND  D.UNIT_CODE = 822198
  GROUP BY
    D.UNIT_CODE
         
     --    D.RIND   
         
         
         HAVING
         
         SUM(NVAL(D.COL1)) = 2