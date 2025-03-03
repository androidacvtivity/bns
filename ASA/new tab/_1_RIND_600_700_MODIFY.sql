SELECT
-- PERIOADA,  
-- FORM,   
-- FORM_VERS,  
-- ID_MDTABLE, 
-- COD_CUATM,  
-- 
 NR_SECTIE,  NUME_SECTIE, NR_SECTIE1,
 NUME_SECTIE1,  NR_SECTIE2,  NUME_SECTIE2, NR_ROW, ORDINE,  DECIMAL_POS, NUME_ROW, 
 ROUND(COL1,1) AS COL1, 
 ROUND(COL2,1) AS COL2, 
 ROUND(COL2_MOD,1) AS COL2_MOD
 
--   ROUND(COL2_CASE,1) AS COL2_CASE
   
   --,
 
-- ROUND(COL3,1) AS COL3, ROUND(COL4,1) AS COL4, ROUND(COL5,1) AS COL5, ROUND(COL6,1) AS COL6
FROM(
SELECT 
  :pPERIOADA AS PERIOADA,
  :pFORM AS FORM,
  :pFORM_VERS AS FORM_VERS,
  :pID_MDTABLE AS ID_MDTABLE,
  :pCOD_CUATM AS COD_CUATM,
  
   RR.NR_ROW AS NR_SECTIE,         
   RR.NUME_ROW AS NUME_SECTIE,
   
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,
  
  R.NR_ROW||'.'||RR.NR_ROW AS NR_ROW,
  TO_NUMBER(R.NR_ROW||'.'||RR.NR_ROW) AS ORDINE,
  '100000' AS DECIMAL_POS,
  R.NUME_ROW,
 CASE WHEN RR.NR_ROW NOT IN ('04') THEN
  ROUND(SUM( CASE WHEN (D.PERS BETWEEN RR.PERS_FROM AND RR.PERS_TO OR D.PERS IS NULL)  THEN DECODE(R.NR_ROW, 
   '600',D.COL1,
   '700',D.COL2) END),1)   
  ELSE
  ROUND(SUM( CASE WHEN (D.PERS BETWEEN RR.PERS_FROM AND RR.PERS_TO) THEN DECODE(R.NR_ROW, 
   '600',D.COL1,
   '700',D.COL2) END),1) END AS COL1,
   
   
  
  CASE WHEN RR.NR_ROW NOT IN ('04')THEN
  ROUND(SUM( CASE WHEN 1=1
  
 -- (D.PERS BETWEEN RR.PERS_FROM AND RR.PERS_TO OR D.PERS IS NULL ) 
  
  
  AND D.CFP IN ('11','12','13') THEN DECODE(R.NR_ROW, 
   '600',D.COL1,
   '700',D.COL2) END),1)   

   
   END AS COL2,
   
   
    CASE WHEN RR.NR_ROW NOT IN ('04')THEN
  ROUND(SUM( CASE WHEN 1=1
  
 -- (D.PERS BETWEEN RR.PERS_FROM AND RR.PERS_TO OR D.PERS IS NULL ) 
  
  
  AND D.CFP IN ('11','12','13') THEN DECODE(R.NR_ROW, 
   '600',D.COL1) END),1)   

   
   END AS COL2_MOD
   
--   
--    CASE WHEN RR.NR_ROW NOT IN ('04')  AND D.CFP IN ('11','12','13')THEN
--  ROUND(SUM( CASE WHEN 1=1
--  
-- -- (D.PERS BETWEEN RR.PERS_FROM AND RR.PERS_TO OR D.PERS IS NULL ) 
--  
--  
--   THEN (CASE WHEN R.NR_ROW = '600' THEN D.COL1 END  ) END),1)   
--
--   
--   END AS COL2_CASE
   
--     CASE WHEN RR.NR_ROW NOT IN ('04'  )THEN
--  ROUND(SUM( CASE WHEN 1=1
--  
-- -- (D.PERS BETWEEN RR.PERS_FROM AND RR.PERS_TO OR D.PERS IS NULL ) 
--  
--  
--  AND D.CFP IN ('11','12','13') THEN DECODE(R.NR_ROW, 
--   '700',D.COL2) END),1)   
--
--   
--   END AS COL2_700
   
   
   
   
--     CASE WHEN RR.NR_ROW NOT IN ('04') THEN
--  ROUND(SUM( CASE WHEN (D.PERS BETWEEN RR.PERS_FROM AND RR.PERS_TO OR D.PERS IS NULL) AND D.CFP IN  ('14','15','16','17','18','19') THEN DECODE(R.NR_ROW, 
--   '600',D.COL1,
--   '700',D.COL2) END),1)   
--  ELSE
--  ROUND(SUM( CASE WHEN (D.PERS BETWEEN RR.PERS_FROM AND RR.PERS_TO)AND D.CFP IN  ('14','15','16','17','18','19') THEN DECODE(R.NR_ROW, 
--   '600',D.COL1,
--   '700',D.COL2) END),1) END AS COL3,
--   
--   
-- CASE WHEN RR.NR_ROW NOT IN ('04') THEN
--  ROUND(SUM( CASE WHEN (D.PERS BETWEEN RR.PERS_FROM AND RR.PERS_TO OR D.PERS IS NULL) AND D.CFP IN  ('20','21') THEN DECODE(R.NR_ROW, 
--   '600',D.COL1,
--   '700',D.COL2) END),1)   
--  ELSE
--  ROUND(SUM( CASE WHEN (D.PERS BETWEEN RR.PERS_FROM AND RR.PERS_TO)AND D.CFP IN  ('20','21') THEN DECODE(R.NR_ROW, 
--   '600',D.COL1,
--   '700',D.COL2) END),1) END AS COL4,
--   
--   
-- CASE WHEN RR.NR_ROW NOT IN ('04') THEN
--  ROUND(SUM( CASE WHEN (D.PERS BETWEEN RR.PERS_FROM AND RR.PERS_TO OR D.PERS IS NULL) AND D.CFP IN  ('22','23','24','25','26','27') THEN DECODE(R.NR_ROW, 
--   '600',D.COL1,
--   '700',D.COL2) END),1)   
--  ELSE
--  ROUND(SUM( CASE WHEN (D.PERS BETWEEN RR.PERS_FROM AND RR.PERS_TO)AND D.CFP IN  ('22','23','24','25','26','27') THEN DECODE(R.NR_ROW, 
--   '600',D.COL1,
--   '700',D.COL2) END),1) END AS COL5,
--   
--   
--  CASE WHEN RR.NR_ROW NOT IN ('04') THEN
--  ROUND(SUM( CASE WHEN (D.PERS BETWEEN RR.PERS_FROM AND RR.PERS_TO OR D.PERS IS NULL) AND D.CFP IN  ('28') THEN DECODE(R.NR_ROW, 
--   '600',D.COL1,
--   '700',D.COL2) END),1)   
--  ELSE
--  ROUND(SUM( CASE WHEN (D.PERS BETWEEN RR.PERS_FROM AND RR.PERS_TO)AND D.CFP IN ('28') THEN DECODE(R.NR_ROW, 
--   '600',D.COL1,
--   '700',D.COL2) END),1) END AS COL6  

   
FROM  (

SELECT 
DISTINCT D.CUIIO,D. CUATM, 

--CASE WHEN D.CFP_AJUSTAT IS NULL THEN D.CFP ELSE D.CFP_AJUSTAT END AS CFP,
D.CFP,
D.COL1, D.COL2,D.PERS
 FROM (
SELECT 
 DISTINCT D.CUIIO,D.CUATM,
 D.CFP AS CFP,
 --MAX(CASE WHEN D.CAPITOL IN (1129) AND D.RIND IN ('5') THEN D.COL31 ELSE NULL END) AS CFP_AJUSTAT,
 
CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('150','160','170') THEN  CIS2.NVAL(D.COL1) END))- 
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('200') THEN CIS2.NVAL(D.COL1) END))+
(CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1126) AND D.RIND IN ('330') THEN CIS2.NVAL(D.COL2) END))-
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1126) AND D.RIND IN ('330') THEN CIS2.NVAL(D.COL1) END)))+
 
(CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1126) AND D.RIND IN ('340') THEN CIS2.NVAL(D.COL2) END))-
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1126) AND D.RIND IN ('340') THEN CIS2.NVAL(D.COL1) END)))  AS COL1,
  
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('150','160','170') THEN  CIS2.NVAL(D.COL1) END))- 
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('200') THEN CIS2.NVAL(D.COL1) END))+
(CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1126) AND D.RIND IN ('330') THEN CIS2.NVAL(D.COL2) END))-
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1126) AND D.RIND IN ('330') THEN CIS2.NVAL(D.COL1) END)))+
 
(CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1126) AND D.RIND IN ('340') THEN CIS2.NVAL(D.COL2) END))-
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1126) AND D.RIND IN ('340') THEN CIS2.NVAL(D.COL1) END)))-
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('220') THEN CIS2.NVAL(D.COL1) END))-
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('240') THEN CIS2.NVAL(D.COL1) END))-
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('290') THEN CIS2.NVAL(D.COL1) END))+
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('294') THEN CIS2.NVAL(D.COL1) END))+
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('180') THEN CIS2.NVAL(D.COL1) END))   AS COL2,

SUM(CASE WHEN D.CAPITOL IN (100)  AND D.RIND IN ('CD') THEN  D.COL1 ELSE 0 END)  AS CD,
(SELECT  CASE WHEN DD.COL4 IS NOT NULL THEN DD.COL4 ELSE 0 END 

 FROM
   CIS2.DATA_ALL DD
 WHERE
   DD.PERIOADA IN (D.PERIOADA) AND
   DD.FORM=D.FORM AND
   DD.ID_MD IN (58791) AND
   DD.CUIIO IN (D.CUIIO)) AS PERS                                                       

FROM   
    CIS2.VW_DATA_ALL_COEF D  
    INNER JOIN CIS2.VW_CL_CFP VC ON (D.CFP = VC.CODUL)
WHERE
  D.FORM IN (64)             AND 
  D.FORM_VERS = :PFORM_VERS  AND      
  D.PERIOADA =:pPERIOADA AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%'   AND
   D.CAPITOL IN (100,1123,1124,1125,1126,1127,128,1129)
--    AND D.CUIIO = 227548
 
 GROUP BY D.CUIIO,D.CUATM, D.CFP,D.PERIOADA,D.FORM
 
 HAVING
 SUM(CASE WHEN D.CAPITOL IN (100)  AND D.RIND IN ('CD') THEN  D.COL1 ELSE 0 END)>0)D
 
 
 
 
 )D
 
   CROSS JOIN
  ( 
    SELECT '╬ntreprinderile cu numarul de salariati 0-9 persoane'              AS NUME_ROW, '01' AS NR_ROW, 0  AS PERS_FROM, 9   AS PERS_TO, NULL AS PERS FROM DUAL UNION
    SELECT '╬ntreprinderile cu numarul de salariati 0-49 persoane'             AS NUME_ROW, '02' AS NR_ROW, 0  AS PERS_FROM, 49  AS PERS_TO, NULL AS PERS FROM DUAL UNION
    SELECT '╬ntreprinderile cu numarul de salariati 0-249 persoane'            AS NUME_ROW, '03' AS NR_ROW, 0  AS PERS_FROM, 249 AS PERS_TO, NULL AS PERS FROM DUAL UNION
    SELECT '╬ntreprinderile cu numarul de salariati 250 si mai mult persoane'  AS NUME_ROW, '04' AS NR_ROW, 250 AS PERS_FROM, 99999999 AS PERS_TO, NULL AS PERS FROM DUAL UNION
    SELECT 'Total republica Moldova'                                         AS NUME_ROW, '05' AS NR_ROW, 0   AS PERS_FROM, 99999999 AS PERS_TO, NULL AS PERS FROM DUAL

        
  ) RR
  
   CROSS JOIN
  ( 
    SELECT 'Valoarea productiei: VP'  AS NUME_ROW, '600' AS NR_ROW FROM DUAL UNION     
    SELECT 'Valoarea adaugata bruta la costul factorilor: VAFC'  AS NUME_ROW, '700' AS NR_ROW FROM DUAL 
 ) R
  
  GROUP BY 
   R.NR_ROW, R.NUME_ROW, RR.NR_ROW, RR.NUME_ROW
  
  ORDER BY RR.NR_ROW||'.'||R.NR_ROW )