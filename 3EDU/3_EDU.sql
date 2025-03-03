----    INSERT INTO    CIS2.TABLE_OUT
----    (
----      
----  PERIOADA,
----  FORM,
----  FORM_VERS,
----  ID_MDTABLE,
----  COD_CUATM,
----  NR_SECTIE,
----  NUME_SECTIE,
----  NR_SECTIE1,
----  NUME_SECTIE1,
----  NR_SECTIE2,
----  NUME_SECTIE2,
----  NR_ROW,
----  ORDINE,
----  DECIMAL_POS,
----  NUME_ROW,  
----  COL1,COL2, COL3, COL4, COL5, COL6, COL7, COL8, COL9, COL10, COL11
----  
----    )
--
--SELECT 
----  :pPERIOADA AS PERIOADA,
----  :pFORM AS FORM,
----  :pFORM_VERS AS FORM_VERS,
----  :pID_MDTABLE AS ID_MDTABLE,
----  :pCOD_CUATM AS COD_CUATM,         
----  '0' AS NR_SECTIE,
----  '0' AS NUME_SECTIE,
----  '0' AS NR_SECTIE1,
----  '0' AS NUME_SECTIE1,
----  '0' AS NR_SECTIE2,
----  '0' AS NUME_SECTIE2,
--   CODUL||'~'||ROWNUM AS NR_ROW,
--   ROWNUM  AS ORDINE,
--  '00000000001' AS DECIMAL_POS, 
--   DENUMIRE AS NUME_ROW,
--   CASE WHEN  COL1 = 0 THEN NULL ELSE COL1 END   AS COL1,
--   CASE WHEN  COL2 = 0 THEN NULL ELSE COL2 END   AS COL2,
--   CASE WHEN  COL3 = 0 THEN NULL ELSE COL3 END   AS COL3,
--   CASE WHEN  COL4 = 0 THEN NULL ELSE COL4 END   AS COL4,
--   CASE WHEN  COL5 = 0 THEN NULL ELSE COL5 END   AS COL5,
--   CASE WHEN  COL6 = 0 THEN NULL ELSE COL6 END   AS COL6,
--   CASE WHEN  COL7 = 0 THEN NULL ELSE COL7 END   AS COL7,
--   CASE WHEN  COL8 = 0 THEN NULL ELSE COL8 END   AS COL8,
--   CASE WHEN  COL9 = 0 THEN NULL ELSE COL9 END   AS COL9,
--   CASE WHEN  COL10 = 0 THEN NULL ELSE COL10 END   AS COL10,
--   CASE WHEN  COL11 = 0 THEN NULL ELSE COL11 END   AS COL11
--   
--  
--
--FROM
--(
    
    SELECT
    CC.CODUL,
    CC.DENUMIRE,
    COUNT (DISTINCT D.CUIIO) AS COL1,
    SUM(CASE WHEN D.RIND IN ('100') AND D.CAPITOL IN (1079) THEN D.COL4 ELSE NULL END ) AS COL2,
    SUM(CASE WHEN D.RIND IN ('100') AND D.CAPITOL IN (1079) THEN D.COL5 ELSE NULL END ) AS COL3,
    COUNT ( DISTINCT CASE WHEN D.RIND IN ('100') AND D.CAPITOL IN (1079) AND  CIS2.NVAL(D.COL1) = 1 THEN D.CUIIO ELSE 0 END  ) AS COL4,   
    COUNT (DISTINCT CASE WHEN D.RIND IN ('100') AND D.CAPITOL IN (1079) AND  CIS2.NVAL(D.COL1) = 2 THEN D.CUIIO ELSE 0 END  ) AS COL5,
    COUNT (DISTINCT CASE WHEN D.RIND IN ('100') AND D.CAPITOL IN (1079) AND  CIS2.NVAL(D.COL1) = 3 THEN D.CUIIO ELSE 0 END  ) AS COL6,
    COUNT (DISTINCT CASE WHEN D.RIND IN ('100') AND D.CAPITOL IN (1079) AND  CIS2.NVAL(D.COL2) = 1 THEN D.CUIIO ELSE 0 END  ) AS COL7,
    COUNT (DISTINCT CASE WHEN D.RIND IN ('100') AND D.CAPITOL IN (1079) AND  CIS2.NVAL(D.COL2) = 2 THEN D.CUIIO ELSE 0 END  ) AS COL8,
    COUNT (DISTINCT CASE WHEN D.RIND IN ('100') AND D.CAPITOL IN (1079) AND  CIS2.NVAL(D.COL3) = 1 THEN D.CUIIO ELSE 0 END  ) AS COL9,
    COUNT (DISTINCT CASE WHEN D.RIND IN ('100') AND D.CAPITOL IN (1079) AND  CIS2.NVAL(D.COL3) = 2 THEN D.CUIIO ELSE 0 END  ) AS COL10,
    ROUND(SUM(CASE WHEN D.RIND IN ('100') AND D.CAPITOL IN (1079) THEN  D.COL6 ELSE NULL END ),1) AS COL11
   
   
   FROM   CIS2.VW_DATA_ALL D 

                INNER JOIN CIS2.RENIM R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS)
                INNER JOIN CIS2.VW_CL_CFP CC  ON (CC.CODUL = D.CFP)
                INNER JOIN CIS2.VW_CL_CFP CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')
                
                
  WHERE 
  (D.PERIOADA =:pPERIOADA) AND
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE)  AND 
  (D.CUATM_FULL LIKE '%' ||:pCOD_CUATM||';%') AND
  D.FORM = 55  AND D.CAPITOL IN (1079)
  
--  AND CC.CODUL IN ('11','15','00','20')
  
  GROUP BY 
  CC.CODUL,
  CC.DENUMIRE
 -- ) 