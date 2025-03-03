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
 COL1,COL2,COL3, COL4
)

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
   A.NR_ROW||'~'||ROWNUM AS NR_ROW,
   ROWNUM AS ORDINE, 
  '0000' AS DECIMAL_POS,
   NUME_ROW,
   SUBSTR(A.CAEM2,2,4) AS COL1,
   A.PACHET AS COL2,
   ROUND(A.COL1,1) AS COL3,
   ROUND(A.COL3,1) AS COL4
FROM
(
SELECT
   R.CUIIO AS NR_ROW,
   R.CUIIO,
   R.CUIIO AS ORDINE,
   MAX(R.DENUMIRE) AS NUME_ROW, 
   D.RIND,
  -- P.ANUL,
   D.CAEM2,
   D.PACHET,
   ROUND(SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) THEN D.RIND ELSE NULL END),1) AS COL1,
   ROUND(SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) THEN D.PACHET ELSE NULL END),1) AS COL2,
   ROUND(SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA-1) THEN D.RIND ELSE NULL END),1) AS COL3
FROM
  CIS2.VW_DATA_ALL D
  INNER JOIN CIS2.RENIM R ON (R.CUIIO= D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS)
 -- INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA)
--                INNER JOIN MD_CAPITOL C ON (D.CAPITOL=C.CAPITOL AND D.CAPITOL_VERS=C.CAPITOL_VERS)
--                INNER JOIN VW_CL_CUATM  C ON (C.CODUL = R.CUATM AND C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%')                
--                INNER JOIN MD_RIND RD ON D.RIND=RD.RIND AND D.RIND_VERS=RD.RIND_VERS  AND D.CAPITOL=RD.CAPITOL 
WHERE
  D.FORM IN (2)                              AND 
  D.FORM_VERS = :pFORM_VERS                  AND    
  D.CAPITOL IN (100)                         AND 
  D.PERIOADA IN (:pPERIOADA, :pPERIOADA-1) AND 
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%'  
--  D.RIND IN ('06','07') --AND
--  P.ANUL IN (2015)
  
--  AND D.CUIIO IN (459135)
GROUP BY
  R.CUIIO,
  D.RIND,
  D.CAEM2,
  D.PACHET
--  P.ANUL
--  R.DENUMIRE
ORDER BY
  R.CUIIO,
  D.RIND

) A