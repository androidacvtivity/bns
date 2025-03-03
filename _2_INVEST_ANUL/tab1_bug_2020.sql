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
-- COL1, COL2, COL3,COL4,COL5,COL6,COL7,COL8,COL9,COL10, COL11
--)
SELECT 
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
   B.ORDINE AS NR_ROW,
   B.ORDINE AS ORDINE,
  '11111111111' AS DECIMAL_POS,
   B.DENUMIRE AS NUME_ROW,
 (SUM(CASE WHEN  D.PERIOADA IN (:pPERIOADA) AND  NR_ROW LIKE '%'|| D.CFP ||'%' AND D.RIND IN '100' THEN NVAL(D.COL1) ELSE 0 END)+
  SUM(CASE WHEN  D.PERIOADA IN (:pPERIOADA)  AND  NR_ROW LIKE '%'|| D.CFP ||'%' AND D.RIND IN '100' THEN NVAL(D.COL2) ELSE 0 END)) AS COL1,
  
 (SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA)  AND NR_ROW LIKE '%'|| D.CFP ||'%' AND D.RIND IN '810' THEN NVAL(D.COL1) ELSE 0 END)+
  SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND NR_ROW LIKE '%'|| D.CFP ||'%' AND D.RIND IN '810' THEN NVAL(D.COL2) ELSE 0 END)) AS COL2,
  
 (SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND NR_ROW LIKE '%'|| D.CFP ||'%' AND D.RIND IN '820' THEN NVAL(D.COL1) ELSE 0 END)+
  SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND NR_ROW LIKE '%'|| D.CFP ||'%' AND D.RIND IN '820' THEN NVAL(D.COL2) ELSE 0 END)) AS COL3,
  
 (SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND NR_ROW LIKE '%'|| D.CFP ||'%' AND D.RIND IN '830' THEN NVAL(D.COL1) ELSE 0 END)+
  SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND NR_ROW LIKE '%'|| D.CFP ||'%' AND D.RIND IN '830' THEN NVAL(D.COL2) ELSE 0 END)) AS COL4,
  
 (SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND NR_ROW LIKE '%'|| D.CFP ||'%' AND D.RIND IN '840' THEN NVAL(D.COL1) ELSE 0 END)+
  SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND NR_ROW LIKE '%'|| D.CFP ||'%' AND D.RIND IN '840' THEN NVAL(D.COL2) ELSE 0 END)) AS COL5,
  
 (SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND NR_ROW LIKE '%'|| D.CFP ||'%' AND D.RIND IN '850' THEN NVAL(D.COL1) ELSE 0 END)+
  SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND NR_ROW LIKE '%'|| D.CFP ||'%' AND D.RIND IN '850' THEN NVAL(D.COL2) ELSE 0 END)) AS COL6,
  
 (SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND NR_ROW LIKE '%'|| D.CFP ||'%' AND D.RIND IN '860' THEN NVAL(D.COL1) ELSE 0 END)+
  SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND NR_ROW LIKE '%'|| D.CFP ||'%' AND D.RIND IN '860' THEN NVAL(D.COL2) ELSE 0 END)) AS COL7,
  
 (SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND NR_ROW LIKE '%'|| D.CFP ||'%' AND D.RIND IN '870' THEN NVAL(D.COL1) ELSE 0 END)+
  SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND NR_ROW LIKE '%'|| D.CFP ||'%' AND D.RIND IN '870' THEN NVAL(D.COL2) ELSE 0 END)) AS COL8,
  
 (SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND NR_ROW LIKE '%'|| D.CFP ||'%' AND D.RIND IN '880' THEN NVAL(D.COL1) ELSE 0 END)+
  SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND NR_ROW LIKE '%'|| D.CFP ||'%' AND D.RIND IN '880' THEN NVAL(D.COL2) ELSE 0 END)) AS COL9,
  
 (SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND NR_ROW LIKE '%'|| D.CFP ||'%' AND D.RIND IN '890' THEN NVAL(D.COL1) ELSE 0 END)+
  SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND NR_ROW LIKE '%'|| D.CFP ||'%' AND D.RIND IN '890' THEN NVAL(D.COL2) ELSE 0 END)) AS COL10,
  
ROUND((((SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND NR_ROW LIKE '%'|| D.CFP ||'%' AND D.RIND IN '100' THEN NVAL(D.COL1) ELSE 0 END)+
   SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND NR_ROW LIKE '%'|| D.CFP ||'%' AND D.RIND IN '100' THEN NVAL(D.COL2) ELSE 0 END))/
  
 NOZERO(SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA-1) AND NR_ROW LIKE '%'|| D.CFP ||'%' AND D.RIND IN '100' THEN NVAL(D.COL1) ELSE 0 END)+
  SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA-1) AND NR_ROW LIKE '%'|| D.CFP ||'%' AND D.RIND IN '100' THEN NVAL(D.COL2) ELSE 0 END)))/
  (P.COL1))*100,1) AS COL11

FROM 
  VW_DATA_ALL D
  CROSS JOIN
    (SELECT 1 AS ORDINE, '12+13+15+16+17+18+19+20+24+26+28' AS NR_ROW, 'TOTAL imobilizari necorporale si corporale' AS DENUMIRE FROM DUAL UNION
     SELECT 2 AS ORDINE, '12+13' AS NR_ROW, 'publica' AS DENUMIRE FROM DUAL UNION
     SELECT 3 AS ORDINE, '15+16+17+18+19' AS NR_ROW, 'privata' AS DENUMIRE FROM DUAL UNION
     SELECT 4 AS ORDINE, '20' AS NR_ROW, 'mixta (publica si privata), fara participare straina' AS DENUMIRE FROM DUAL UNION
     SELECT 5 AS ORDINE, '24+26' AS NR_ROW, 'straina' AS DENUMIRE FROM DUAL UNION
     SELECT 6 AS ORDINE, '28' AS NR_ROW, 'a intreprindelor mixte' AS DENUMIRE FROM DUAL) B
     
  CROSS JOIN (
  
  SELECT DISTINCT
  COL1 
  
FROM 
  VW_DATA_ALL D
    
WHERE 
  D.FORM = 100 AND
  D.CUIIO = 2 AND
  D.PERIOADA IN :pPERIOADA AND
  D.CAPITOL = 330 AND
  D.RIND IN '01' 
  
  ) P
WHERE
 (D.FORM=:pFORM) AND
 (D.FORM_VERS=:pFORM_VERS) AND
 (:pID_MDTABLE=:pID_MDTABLE) AND
 (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND   
  
  (D.PERIOADA IN (:pPERIOADA , :pPERIOADA-1)) AND
  D.FORM = 8 AND
  D.CAPITOL = 323
  
GROUP BY
  B.DENUMIRE,
  B.ORDINE,
  P.COL1
  
  ORDER BY
  B.ORDINE 