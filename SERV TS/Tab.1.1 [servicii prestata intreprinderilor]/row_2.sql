SELECT
   2 NR_ROW,

  'Transporturi terestre si transporturi prin conducte (49=49.1+49.2+49.3+49.4+49.5):'DENUMIRE,
  CC.FULL_CODE,
  ROUND(SUM(CASE WHEN D.PERIOADA BETWEEN FLOOR(:pPERIOADA/12)*12 AND :pPERIOADA THEN COL1 END),1) AS COL1,
  ROUND(SUM(CASE WHEN D.PERIOADA BETWEEN FLOOR((:pPERIOADA-12)/12)*12 AND :pPERIOADA-12 THEN COL1 END),1) AS COL2,
  ROUND(SUM(CASE WHEN D.PERIOADA IN :pPERIOADA THEN D.COL1 ELSE 0 END),1) AS COL3,
  ROUND(SUM(CASE WHEN D.PERIOADA IN :pPERIOADA-1 THEN D.COL1 ELSE 0 END),1) AS COL4,
  ROUND(SUM(CASE WHEN D.PERIOADA IN :pPERIOADA-12 THEN D.COL1 ELSE 0 END),1) AS COL5
  
  
FROM 
  CIS.VW_DATA_ALL_COEF D
  
  INNER JOIN  CIS.VW_CL_CAEM2 C ON (C.CODUL = D.CAEM2)
  INNER JOIN CIS.VW_CL_CAEM2 CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')
  


WHERE
 (D.FORM=:pFORM) AND
 (D.FORM_VERS=:pFORM_VERS) AND
 (:pID_MDTABLE=:pID_MDTABLE) AND
 (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  FORM = 4 AND
  CAPITOL = 4 AND
  RIND = '10' AND
  (
  C.CODUL LIKE 'H49%'
  ) 
  
  AND (
  D.CAEM2 NOT LIKE 'N772%' AND
  D.CAEM2 NOT LIKE 'M742%'
  
  )
  AND 
   (D.PERIOADA BETWEEN FLOOR((:pPERIOADA-12)/12)*12 AND :pPERIOADA-12 OR 
     D.PERIOADA BETWEEN FLOOR(:pPERIOADA/12)*12 AND :pPERIOADA OR
     D.PERIOADA IN :pPERIOADA OR
     D.PERIOADA IN :pPERIOADA-1 
     OR 
     D.PERIOADA IN (:pPERIOADA-12)    
     
     )
     
    AND  CC.CODUL LIKE '%00000'
     
     GROUP BY 
       CC.CODUL,
       CC.DENUMIRE,
       CC.FULL_CODE
       
       ORDER BY 
       CC.FULL_CODE