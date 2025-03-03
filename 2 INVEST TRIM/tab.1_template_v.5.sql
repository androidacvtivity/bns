
SELECT 
PERIOADA,
CUIIO,
RIND,
COL1_1,
COL1_2,
COL11_2,
COL1_3,
COL1,
COL2

FROM 

(
SELECT 
D.PERIOADA,
 D.CUIIO,
 D.RIND,
 SUM(D.COL1) AS COL1_1,
 SUM(D.COL2) AS COL1_2,
 SUM(D.COL11) AS COL11_2,
 SUM(D.COL1+D.COL2) AS COL1_3,
 (SUM(CASE WHEN D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA  AND D.RIND IN ('100') THEN D.COL1 ELSE 0 END)+
  SUM(CASE WHEN D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA  AND D.RIND IN ('100') THEN D.COL2 ELSE 0 END)) AS COL1,
  
  
   (SUM(CASE WHEN D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA  AND D.RIND IN ('100') THEN D.COL1 + D.COL2 ELSE 0 END))
  
  
  AS COL2
  

FROM 
  CIS.VW_DATA_ALL D

 
  
WHERE
 (D.FORM=:pFORM) AND
 (D.FORM_VERS=:pFORM_VERS) AND
 (:pID_MDTABLE=:pID_MDTABLE) AND
 (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND   
 ((D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA))  AND
  D.FORM = 6 AND
  D.CAPITOL = 31
  AND D.RIND IN ('100')
 
GROUP BY 
D.PERIOADA,
D.CUIIO,
D.RIND)


GROUP BY 
PERIOADA,
CUIIO,
RIND,
COL11_2,
COL1_1,
COL1_2,
COL1_3,
COL1,
COL2


--HAVING 
--COL11_2 IS NOT NULL

ORDER BY 
COL11_2 DESC