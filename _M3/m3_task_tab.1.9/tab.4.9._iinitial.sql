﻿INSERT INTO TABLE_OUT 
(
  PERIOADA,
  FORM,
  FORM_VERS,
  ID_MDTABLE,
  COD_CUATM,
  NR_SECTIE,
  NUME_SECTIE,
  NR_SECTIE1,
  NUME_SECTIE1,
  NR_SECTIE2,
  NUME_SECTIE2,
  NR_ROW,
  ORDINE,
  DECIMAL_POS,
  NUME_ROW,
  
  COL1, COL2, COL3,  COL4, COL5, COL6, COL7, COL8, COL9, COL10, COL11, COL12, COL13, COL14, COL15, COL16, COL17, COL18, COL19, COL20
)
----------------------------------------------------------------
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
  NR_ROW,
  ROWNUM AS ORDINE,
  '00000001111111111111' AS DECIMAL_POS,
  NUME_ROW,
  COL1,
  COL2,
  COL3,
  COL4,
  COL5,
  COL6,
  COL7,
  COL8,
  COL9,
  COL10,
  COL11,
  COL12,
  COL13,
  COL14,
  COL15,
  COL16,
  COL17,
  COL18,
  COL19,
  COL20
FROM
(SELECT
  
   CAEM2||'~'||CUIIO||'_'||FILIAL AS NR_ROW,
   DENUMIRE AS NUME_ROW, 
    CUIIO AS COL1,
    CUATM AS COL2,
    CFP AS COL3, 
    FILIAL AS COL4,
    PACHET AS COL5,
    BUGET AS COL6,
    TIP_CAEM2 AS COL7,
    ROUND(T1.COL9,1) AS COL8,
    ROUND(D.COL1,1) AS COL9,
    ROUND(D.COL2,1) AS COL10,
    ROUND(COL3,1) AS COL11,
    ROUND(D.COL4,1) AS COL12,
    ROUND(D.COL5,1) AS COL13,
    ROUND(COL6,1) AS COL14,
    ROUND(COL7,1) AS COL15,
    ROUND(D.COL8,1) AS COL16,
    ROUND(D.COL9,1) AS COL17,
    ROUND(NOZERO(D.COL1)/NOZERO(T1.COL9)*1000/12,1) AS COL18,
    ROUND(T2.COL18,1) AS COL19,
    ROUND(((NOZERO(D.COL1)/NOZERO(T1.COL9)*1000/12)/NOZERO(T2.COL18))*100,1) AS COL20
FROM
(
SELECT 
  CR.CODUL AS CAEM2,
  RN.DENUMIRE,
  D.CUIIO,
  D.CUATM,
  D.CFP,
  D.FILIAL,
  D.PACHET,
  D.BUGET,
  MAX(CASE WHEN CR.CODUL LIKE '00000' THEN 1 ELSE TIP_CAEM2 END) AS TIP_CAEM2,
  SUM(NVAL(CASE WHEN CAPITOL IN (303) AND COL=2 THEN VAL ELSE NULL END)+
      NVAL(CASE WHEN CAPITOL IN (303) AND COL=4 THEN VAL ELSE NULL END)+
      NVAL(CASE WHEN CAPITOL IN (303) AND COL=5 THEN VAL ELSE NULL END)) COL1,
  SUM(NVAL(CASE WHEN CAPITOL IN (303) AND COL=2 THEN VAL ELSE NULL END)) COL2,
  SUM(NVAL(CASE WHEN CAPITOL IN (303) AND COL=3 THEN VAL ELSE NULL END)) COL3,
  SUM(NVAL(CASE WHEN CAPITOL IN (303) AND COL=4 THEN VAL ELSE NULL END)) COL4,
  SUM(NVAL(CASE WHEN CAPITOL IN (303) AND COL=5 THEN VAL ELSE NULL END)) COL5,
  SUM(NVAL(CASE WHEN CAPITOL IN (303) AND COL=6 THEN VAL ELSE NULL END)) COL6,
  SUM(NVAL(CASE WHEN CAPITOL IN (303) AND COL=7 THEN VAL ELSE NULL END)) COL7,
  SUM(NVAL(CASE WHEN CAPITOL IN (303) AND COL=8 THEN VAL ELSE NULL END)) COL8,
  SUM(NVAL(CASE WHEN CAPITOL IN (303) AND COL=9 THEN VAL ELSE NULL END)) COL9,
  SUM(NVAL(CASE WHEN CAPITOL IN (303) AND COL=10 THEN VAL ELSE NULL END)) COL10,
  (NOZERO(SUM(NVAL(CASE WHEN CAPITOL IN(303) AND COL=1 THEN VAL ELSE NULL END)))/NOZERO(SUM(NVAL(CASE WHEN CAPITOL IN(301) AND COL=1 THEN VAL ELSE NULL END))))*1000/2 COL11,
  NULL COL12,
  NULL COL13

FROM
(
-------------------------------------------------------------------------------
SELECT DISTINCT
  D.CUIIO,
  D.CUIIO_VERS,
  D.CUATM,
  D.FILIAL,
  D.CAPITOL,
  D.CAPITOL_DEN,
  D.CUATM_FULL,
  D.CFP,
  D.PACHET,
  D.BUGET,
  C.COL-1 AS COL,
  CASE WHEN D.RIND LIKE '%T' AND S.SEX LIKE 'F' THEN SUBSTR(D.RIND,1,3)||'F' ELSE D.RIND END AS RIND, 
  MAX(CASE WHEN D.RIND LIKE '00%' THEN 0 WHEN D.RIND LIKE '01%' THEN TO_NUMBER(SUBSTR(D.CAEM2,2,5)) ELSE D.COL1 END) AS CAEM2,
  MAX(CASE WHEN D.RIND LIKE '00%' THEN 1 WHEN D.RIND LIKE '01%' THEN 2 ELSE 3 END) AS TIP_CAEM2,
  SUM(CASE WHEN D.RIND LIKE '%'||S.SEX THEN DECODE(C.COL, 1,D.COL1, 2,D.COL2, 3,D.COL3, 4,D.COL4, 5,D.COL5, 6,D.COL6, 7,D.COL7, 8,D.COL8, 9,D.COL9, 10,D.COL10, 11,D.COL11, NULL) ELSE NULL END) AS VAL
FROM 
  VW_DATA_ALL D,
  (
    SELECT  2 AS COL FROM DUAL UNION
    SELECT  3 AS COL FROM DUAL UNION
    SELECT  4 AS COL FROM DUAL UNION
    SELECT  5 AS COL FROM DUAL UNION
    SELECT  6 AS COL FROM DUAL UNION
    SELECT  7 AS COL FROM DUAL UNION
    SELECT  8 AS COL FROM DUAL UNION
    SELECT  9 AS COL FROM DUAL UNION
    SELECT 10 AS COL FROM DUAL UNION
    SELECT 11 AS COL FROM DUAL
  ) C,
  (
    SELECT 'T' AS SEX FROM DUAL UNION
    SELECT 'F' AS SEX FROM DUAL
  ) S
WHERE
  (D.PERIOADA=:pPERIOADA) AND
  (:pFORM_VERS=:pFORM_VERS) AND
  
  (:pID_MDTABLE=:pID_MDTABLE) AND
  
  D.FORM = 3 AND
  D.CAPITOL IN(303)
GROUP BY
  D.CUIIO,
  D.CUIIO_VERS,
  D.CUATM,
  D.FILIAL,
  D.CAPITOL,
  D.CAPITOL_DEN,
  D.CUATM_FULL,
  D.CFP,
  D.PACHET,
  D.BUGET,
  C.COL,
  CASE WHEN D.RIND LIKE '%T' AND S.SEX LIKE 'F' THEN SUBSTR(D.RIND,1,3)||'F' ELSE D.RIND END

-------------------------------------------------------------------------------
) D 
  INNER JOIN VW_CL_CAEM2 C  ON(D.CAEM2=C.NUM_CODE)
  INNER JOIN VW_CL_CAEM2 CR ON(C.FULL_CODE LIKE '%'||CR.CODUL||';%')
  INNER JOIN RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS = D.CUIIO_VERS)
   
WHERE 
  D.CAEM2 <> '0' AND 
--  FILIAL = '0' AND 
  (RIND LIKE '%T')  AND D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
  (CR.CODUL LIKE '00000' OR (C.CODUL=CR.CODUL))
GROUP BY
  RN.DENUMIRE,
  CR.CODUL,
  D.CUIIO,
  D.CUATM,
  D.CFP,
  D.FILIAL,
  D.PACHET,
  D.BUGET
ORDER BY
  CUIIO,
  CUATM,
  CAEM2,
  CFP
    
    ) D
    LEFT JOIN (SELECT NR_ROW, COL9, ID_MDTABLE FROM TABLE_OUT  
  
  WHERE  ID_MDTABLE =(CASE WHEN :pPERIOADA>=2002 THEN 5661 ELSE NULL END) AND
    FORM IN (3)              AND 
    FORM_VERS = :PFORM_VERS  AND    
    COD_CUATM IN (:pCOD_CUATM) AND
    PERIOADA = :pPERIOADA
  ORDER BY
    ORDINE
    ) T1
     
  ON (D.CAEM2||'~'||CUIIO||'_'||FILIAL=T1.NR_ROW)
  LEFT JOIN (
 SELECT NR_ROW, COL18, COL16, ID_MDTABLE FROM TABLE_OUT  
  
  WHERE  
    ID_MDTABLE=(CASE WHEN :pPERIOADA<=2002 THEN NULL ELSE 5708 END) AND
    PERIOADA = :pPERIOADA-1  AND
    FORM IN (3)              AND 
    FORM_VERS = :PFORM_VERS  AND    
    COD_CUATM IN (:pCOD_CUATM)
  ORDER BY
    ORDINE
    ) T2
     
  ON (D.CAEM2||'~'||CUIIO||'_'||FILIAL=T2.NR_ROW)
ORDER BY
  CUIIO,
  CUATM,
  CAEM2
)