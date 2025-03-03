

SELECT 
DISTINCT 
D.CUIIO,
D.CUATM, 
D.CAEM2,
D.CUATM_FULL,
D.FORM,D.FORM_VERS,
D.COL1, D.COL2, D.COL3, D.COL4,D.PERS, D.CD
 FROM

(
SELECT 
DISTINCT D.CUIIO,
D.PERIOADA,
D.CUATM_FULL,
D.FORM,D.FORM_VERS,
D.CUATM, 

CASE WHEN D.CAEM2_ACTUALIZAT IS NULL THEN D.CAEM2 ELSE D.CAEM2_ACTUALIZAT END AS CAEM2,
D.COL1, D.COL2, D.COL3, D.COL4,D.PERS, D.CD
 FROM
 
 (
(

SELECT 
 
 DISTINCT D.CUIIO, 
 MAX( CASE WHEN  D.RIND IN ('8') AND D.CAPITOL IN (1129) THEN D.COL31 END )  AS CAEM2_ACTUALIZAT,
 MAX(SUBSTR(D.CAEM2,2,4))  AS CAEM2,
 D.CUIIO_VERS, D.CUATM, D.FORM,D.FORM_VERS,D.CUATM_FULL,D.PERIOADA,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (100)  AND D.RIND IN ('CD') AND D.COL1 IS NOT NULL THEN  D.COL1 ELSE 0 END))  AS COL0,
 
 -
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('400') THEN  CIS2.NVAL(D.COL4) END))  AS COL1,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('150') THEN  CIS2.NVAL(D.COL1) END))  AS COL2,
  
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('150','160','170') THEN  CIS2.NVAL(D.COL1) END))- 
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('200') THEN CIS2.NVAL(D.COL1) END))+
(CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1126) AND D.RIND IN ('330') THEN CIS2.NVAL(D.COL2) END))-
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1126) AND D.RIND IN ('330') THEN CIS2.NVAL(D.COL1) END)))+
 
(CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1126) AND D.RIND IN ('340') THEN CIS2.NVAL(D.COL2) END))-
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1126) AND D.RIND IN ('340') THEN CIS2.NVAL(D.COL1) END)))  AS COL3,
  
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
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('180') THEN CIS2.NVAL(D.COL1) END))   AS COL4,
 
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (100)  AND D.RIND IN ('CD') THEN  D.COL1 ELSE 0 END))  AS CD,
 
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
  D.CAPITOL IN (100,1123,1124,1125,1126,1127,1128,1129) 
--  AND D.CUIIO IN (40996334,41058201,37386492)

 GROUP BY D.CUIIO, D.CUIIO_VERS, D.CUATM, D.FORM,D.FORM_VERS,D.CUATM_FULL,D.PERIOADA
 

 
 
  HAVING
 SUM(CASE WHEN D.CAPITOL IN (100)  AND D.RIND IN ('CD') THEN  D.COL1 ELSE 0 END)>0
 ))
 D
 )
 
 DD
 
 INNER JOIN CIS2.VW_CL_CAEM2 C ON SUBSTR(C.CODUL,2,4)  = DD.CAEM2
 
 