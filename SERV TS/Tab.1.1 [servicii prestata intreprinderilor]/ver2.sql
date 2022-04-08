--SELECT
--  :pPERIOADA AS PERIOADA,                                                    
--  :pFORM AS FORM,                                                            
--  :pFORM_VERS AS FORM_VERS,                                                  
--  :pID_MDTABLE AS ID_MDTABLE,                                                
--  :pCOD_CUATM AS COD_CUATM,                                                  
--  '0' AS NR_SECTIE,                                                         
--  '0' AS NUME_SECTIE,                                                        
--  '0' AS NR_SECTIE1,
--  '0' AS NUME_SECTIE1,
--  '0' AS NR_SECTIE2,
--  '0' AS NUME_SECTIE2,
--   NR_ROW AS NR_ROW,  
--   NR_ROW ORDINE,
--  '00000' AS DECIMAL_POS,
--   DENUMIRE NUME_ROW,
--   ROUND(COL1,1) AS COL1, ROUND(COL2,1) AS COL2, ROUND(COL3,1) AS COL3, ROUND(COL4,1) AS COL4, ROUND(COL5,1) AS COL5
--FROM (

SELECT
   0 NR_ROW,

  'Cifra de afeceri (venitul din vinzari) - total:'DENUMIRE,
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
  OR 
  C.CODUL LIKE 'H50%'
  OR 
  C.CODUL LIKE 'H51%'
  OR 
  C.CODUL LIKE 'H52%'
  OR 
  C.CODUL LIKE 'H53%'
  OR 
  C.CODUL LIKE 'J58%'
   OR 
  C.CODUL LIKE 'J61%'
  OR 
  C.CODUL LIKE 'J62%'
  OR 
  C.CODUL LIKE 'J63%'
  OR 
  C.CODUL LIKE 'L68%'
  OR 
  C.CODUL LIKE 'M69%'
  OR 
  C.CODUL LIKE 'M70%'
  OR 
  C.CODUL LIKE 'M71%'
    OR 
  C.CODUL LIKE 'M72%'
     OR 
  C.CODUL LIKE 'M73%'
       OR 
  C.CODUL LIKE 'M74%'
         OR 
  C.CODUL LIKE 'N77%'
           OR 
  C.CODUL LIKE 'N78%'
             OR 
  C.CODUL LIKE 'N80%'
  OR 
  C.CODUL LIKE 'N82%'
  ----------------------------
  
  
  OR 
  C.CODUL LIKE  'N811%'
  
   OR 
  C.CODUL LIKE   'N812%'
  
     OR 
  C.CODUL LIKE  'N813%'
  
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
     --  )