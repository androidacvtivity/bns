--INSERT INTO TABLE_OUT 
--(
--  PERIOADA,
--  FORM,
--  FORM_VERS,
--  ID_MDTABLE,
--  COD_CUATM,
--  NR_SECTIE,
--  NUME_SECTIE,
--  NR_SECTIE1,
--  NUME_SECTIE1,
--  NR_SECTIE2,
--  NUME_SECTIE2,
--  NR_ROW,
--  ORDINE,
--  DECIMAL_POS,
--  NUME_ROW,
--  
--  COL1, COL2, COL3, COL4
--)
--------------------------------------------------------------------------------
SELECT
  :pPERIOADA AS PERIOADA,
  :pFORM AS FORM,
  :pFORM_VERS AS FORM_VERS,
  :pID_MDTABLE AS ID_MDTABLE,
  :pCOD_CUATM AS COD_CUATM,
  
         
  '0' AS NR_SECTIE,
  '0' AS NUME_SECTIE,
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,
  A.NR_ROW,
  A.ORDINE,
  '1111' AS DECIMAL_POS,
  A.NUME_ROW,
  CASE WHEN A.NR_ROW IN (101) THEN 0 ELSE (A.COL1) END AS COL1,
  CASE WHEN A.NR_ROW IN (101) THEN 0 ELSE (A.COL2) END AS COL2,
  CASE WHEN A.NR_ROW IN (101) THEN 0 ELSE (((CIS2.NVAL(A.COL1)/CIS2.NOZERO(B.COL1)*100)/CIS2.NOZERO(A.COL2))*100) END AS COL3,
  CASE WHEN A.NR_ROW IN (100) THEN 100 ELSE ((CASE WHEN A.NR_ROW IN (101) THEN 0 ELSE (CIS2.NVAL(A.COL1)/CIS2.NOZERO(A.COL1_01)*100) END))  END AS COL4
FROM
(SELECT 
   R.RIND AS NR_ROW,
   TO_NUMBER(R.RIND) AS ORDINE,
  '11' AS DECIMAL_POS,
   R.DENUMIRE AS NUME_ROW,
   SUM(CASE WHEN R.ID_MD = D.ID_MD AND D.PERIOADA IN :pPERIOADA   THEN D.COL1 ELSE 0 END) AS COL1,  
   SUM(CASE WHEN R.ID_MD = D.ID_MD AND D.PERIOADA IN :pPERIOADA-1 THEN D.COL1 ELSE 0 END) AS COL2,
   
   CASE WHEN R.RIND NOT IN ('100','101') THEN (
                                                SELECT      
                                                  SUM(CASE WHEN R.RIND IN (100) THEN D.COL1 END) AS COL1
--                                                  SUM(CASE WHEN R.RIND IN (100) THEN D.COL2 END) AS COL2
                                                FROM 
                                                  CIS2.MD_RIND R 
                                                  LEFT JOIN CIS2.VW_DATA_ALL D ON (R.ID_MD=D.ID_MD AND D.CUATM_FULL LIKE  '%'||:pCOD_CUATM||';%' AND D.PERIOADA = :pPERIOADA )
                                                WHERE
                                                  R.FORM IN (21)              AND 
                                                  R.FORM_VERS = :PFORM_VERS  AND    
                                                  R.CAPITOL IN (357,358) AND
                                                  R.RIND_VERS >= 2007 AND
                                                  R.STATUT = 1 
                                                  HAVING MAX(D.RIND_VERS) >=2007
  ) ELSE 0 END AS COL1_01
  
  
FROM 
  VW_DATA_ALL D
  CROSS JOIN (

SELECT DISTINCT
  DENUMIRE,
  RIND,
  ID_MD


FROM
  MD_RIND R
  
  
WHERE
  CAPITOL IN (357, 358) AND
  RIND_VERS >= 2007 AND
  STATUT = 1 ) R
  
  
WHERE
  D.CAPITOL IN (357,358) AND
  D.FORM = 21 AND
  D.CUATM_FULL LIKE  '%'||:pCOD_CUATM||';%' AND
  D.FORM_VERS = :PFORM_VERS AND
  D.PERIOADA IN (:pPERIOADA, :pPERIOADA-1) AND
  R.ID_MD = D.ID_MD
  
GROUP BY
  R.DENUMIRE,
  R.RIND) A
   
CROSS JOIN

(SELECT 
       
   D.COL1 AS COL1        
  
  
FROM  
  VW_DATA_ALL D 
WHERE
--  D.CUATM_FULL LIKE  '%'||:pCOD_CUATM||';%' AND
  D.PERIOADA = :pPERIOADA AND
  D.FORM IN (100)              AND 
  D.FORM_VERS = :PFORM_VERS  AND    
  D.CAPITOL IN (359)
  
) B