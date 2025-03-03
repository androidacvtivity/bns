﻿SELECT 
DISTINCT D.CUIIO,D. CUATM, CASE WHEN D.CFP_AJUSTAT IS NULL THEN D.CFP ELSE D.CFP_AJUSTAT END AS CFP,
D.COL1, D.COL2,D.PERS
 FROM (
SELECT 
 DISTINCT D.CUIIO,D.CUATM,
 MAX(D.CFP) AS CFP,
 MAX(CASE WHEN D.CAPITOL IN (1129) AND D.RIND IN ('5') THEN D.COL31 ELSE NULL END) AS CFP_AJUSTAT,
 
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
WHERE
  D.FORM IN (64)             AND 
  D.FORM_VERS = :PFORM_VERS  AND      
  D.PERIOADA =:pPERIOADA AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%'   AND
   D.CAPITOL IN (100,1123,1124,1125,1126,1127,128,1129)
--    AND D.CUIIO = 227548
 
 GROUP BY D.CUIIO,D.CUATM, D.CFP,D.PERIOADA,D.FORM
 
 HAVING
 SUM(CASE WHEN D.CAPITOL IN (100)  AND D.RIND IN ('CD') THEN  D.COL1 ELSE 0 END)>0
 
 )D
