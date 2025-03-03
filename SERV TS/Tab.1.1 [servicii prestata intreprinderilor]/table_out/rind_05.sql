SELECT
   35 NR_ROW,
   35 ORDINE,

  'INFORMATII SI TELECOMUNICATII (CU EXCEPTIA ACTIVITATII DE PRODUCTIE CINEMATOGRAFICA, VIDEO SI DE PROGRAME DE TELEVIZIUNE; ĪNREGISTRARI AUDIO SI ACTIVITATII DE EDITARE MUZICALA, ACTIVITATI DE DIFUZARE SI TRANSMITERE DE PROGRAME)(58+61+62+63)'DENUMIRE,
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
  C.CODUL LIKE 'J58%'
  OR 
  C.CODUL LIKE 'J61%'
  
  OR 
  C.CODUL LIKE 'J62%'
  
  OR 
  C.CODUL LIKE 'J63%'
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