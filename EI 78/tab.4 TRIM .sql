﻿DECLARE

  CURSOR C IS

SELECT 
    DF.PERIOADA,
    DF.FORM,
    DF.FORM_VERS,
    DF.ID_MDTABLE,
    DF.COD_CUATM,
    DF.NR_SECTIE,
    DF.NUME_SECTIE,
    DF.NR_SECTIE1,
    DF.NUME_SECTIE1,
    DF.NR_SECTIE2,
    DF.NUME_SECTIE2,
    DF.NR_ROW NR_ROW,
    DF.ORDINE,
    DF.DECIMAL_POS,
    DF.NUME_ROW,
    DF.COL1,
    DF.COL2,
    DF.COL3,
    DF.COL4,
    DF.COL5
    
  

   
FROM 
(


SELECT 
 
    :pPERIOADA AS PERIOADA,
    :pFORM AS FORM,
    :pFORM_VERS AS FORM_VERS,
    :pID_MDTABLE AS ID_MDTABLE,
    :pCOD_CUATM AS COD_CUATM,
    '0'  AS NR_SECTIE,
    '0' AS NUME_SECTIE, 
    '0' AS NR_SECTIE1,
    '0' AS NUME_SECTIE1,
    '0' AS NR_SECTIE2,
    '0' AS NUME_SECTIE2, 
 A.CUIIO||'~'||ROWNUM/0.12332178 NR_ROW,
 ROWNUM  AS ORDINE,
 '00001' AS DECIMAL_POS,
  A.DENUMIRE NUME_ROW,
    A.COL1   COL1,
    A.COL2   COL2,
    ROUND(A.COL3,1)   COL3,
    ROUND(A.COL4,1)   COL4,
    ROUND(A.COL3/A.COL4,1)   COL5 
FROM 
(
SELECT 
    CUIIO,
    DENUMIRE_CUIIO,
    DENUMIRE,
    ORDINE,
    COL1,
    COL2,
    SUM(COL3)  COL3,
    SUM(COL4)  COL4,
    SUM(COL5)  COL5,
    MAX(COL6)  COL6
    
FROM
(
SELECT 
    D.CUIIO,
    MAX(R.DENUMIRE) DENUMIRE_CUIIO, 
    MR.RIND,
    MR.DENUMIRE DENUMIRE,
    '1' AS ORDINE, 
    NULL   AS  COL1,
    NULL   AS  COL2,
    NULL   AS  COL3,
    NULL   AS  COL4,
    NULL   AS  COL5,
    D.CUIIO   AS  COL6
     
     
     FROM CIS2.VW_DATA_ALL D 
           INNER JOIN  CIS2.MD_RIND MR ON (MR.ID_MD =  D.ID_MD)
           INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
          -- INNER JOIN CIS2.MD_RIND RD ON (RD.CAPITOL=D.CAPITOL AND RD.CAPITOL_VERS=D.CAPITOL_VERS AND RD.RIND=D.RIND)
   
   WHERE 
   --(D.PERIOADA =:pPERIOADA) AND 
  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND    
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND
  D.CAPITOL IN (405)
  AND MR.RIND  IN ('1')
 
  
  GROUP BY 
  D.CUIIO,
  --R.DENUMIRE,
  MR.DENUMIRE,
  MR.RIND
--  MR.DENUMIRE,
--  D.RIND
  
  
  UNION 
  
  SELECT 
    D.CUIIO,
   MAX(R.DENUMIRE) DENUMIRE_CUIIO, 
    MR.RIND,
    MR.DENUMIRE,
    '2' AS ORDINE, 
    NULL AS  COL1,
    NULL AS  COL2,
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 ELSE 0  END) COL3,
    SUM(CASE WHEN D.COL5 IS NOT NULL THEN D.COL5 ELSE 0 END) COL4,
   -- ROUND(SUM(DISTINCT CASE  WHEN   D.CUIIO = D.CUIIO  AND  D.CAPITOL IN (405) AND (D.COL4 IS NOT NULL AND D.COL5 IS NOT NULL)  THEN CIS2.NOZERO(CIS2.NVAL(D.COL4))/CIS2.NVAL(D.COL5) ELSE NULL END),1)   
    NULL AS COL5,
    NULL AS COL6
     
     
     FROM CIS2.VW_DATA_ALL D 
           INNER JOIN  CIS2.MD_RIND MR ON (MR.ID_MD =  D.ID_MD)
           INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
         --  INNER JOIN CIS2.MD_RIND RD ON (RD.CAPITOL=D.CAPITOL AND RD.CAPITOL_VERS=D.CAPITOL_VERS AND RD.RIND=D.RIND)
   
   WHERE 
  --(D.PERIOADA =:pPERIOADA) AND
  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND    
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND
  D.CAPITOL IN (405)
  AND MR.RIND  IN ('1')
 -- AND D.CUIIO IN (227548)
  
  GROUP BY 
  D.CUIIO,
  --R.DENUMIRE,
  MR.DENUMIRE,
  MR.RIND
--  MR.DENUMIRE,
--  D.RIND
--  
  
  UNION 
  
SELECT 
    D.CUIIO,
    MAX(R.DENUMIRE) DENUMIRE_CUIIO, 
    MR.RIND,
    MR.DENUMIRE,
    '3' AS ORDINE, 
    NULL AS  COL1,
    NULL AS  COL2,
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END) COL3,
    SUM(CASE WHEN D.COL5 IS NOT NULL THEN D.COL5 ELSE 0 END) COL4,
    --ROUND(SUM(DISTINCT CASE  WHEN   D.CUIIO = D.CUIIO  AND D.CAPITOL IN (405) AND (D.COL4 IS NOT NULL AND D.COL5 IS NOT NULL)   THEN CIS2.NOZERO(CIS2.NVAL(D.COL4))/CIS2.NVAL(D.COL5) ELSE NULL END),1)    AS COL5,
    NULL COL5,
    NULL AS COL6
     
     
     FROM CIS2.VW_DATA_ALL D 
          INNER JOIN  CIS2.MD_RIND MR ON (MR.ID_MD =  D.ID_MD)
          INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        --  INNER JOIN CIS2.MD_RIND RD ON (RD.CAPITOL=D.CAPITOL AND RD.CAPITOL_VERS=D.CAPITOL_VERS AND RD.RIND=D.RIND)
   
   WHERE 
  --(D.PERIOADA =:pPERIOADA) AND 
  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND
  D.CAPITOL IN (405)
  AND MR.RIND  IN ('2')
 -- AND D.CUIIO IN (227548)
  
  GROUP BY 
  D.CUIIO,
  --R.DENUMIRE,
  MR.RIND,
  MR.DENUMIRE
  --D.RIND
  
  UNION 
--------------------------------------------------------------------------------  
SELECT 

CUIIO,
DENUMIRE_CUIIO,
RIND,
DENUMIRE,
4||'_'||TO_CHAR(ROWNUM,'000') ORDINE,
COL1,
COL2,
COL3,
COL4,
COL5,
NULL COL6
FROM 
(
SELECT
  CUIIO,
  NULL DENUMIRE_CUIIO,
  NULL RIND,
  DENUMIRE,
  --SUBSTR(ORDINE,1,1)  
  ORDINE,
  COL1,
  COL2,
  SUM(COL3) COL3,
  SUM(COL4) COL4,
  SUM(COL5) COL5
FROM
(
SELECT 
    D.CUIIO,
    MAX(R.DENUMIRE) DENUMIRE_CUIIO, 
    MR.RIND,
    SS.DENUMIRE,
    4||'_'||D.COL1 AS ORDINE, 
    D.COL1 AS COL1,
    NULL AS COL2,
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END) COL3,
    SUM(CASE WHEN D.COL5 IS NOT NULL THEN D.COL5 ELSE 0 END) COL4,
    --ROUND(SUM(DISTINCT CASE  WHEN   D.CUIIO = D.CUIIO  AND D.CAPITOL IN (405) AND (D.COL4 IS NOT NULL AND D.COL5 IS NOT NULL)   THEN CIS2.NOZERO(CIS2.NVAL(D.COL4))/CIS2.NVAL(D.COL5) ELSE NULL END),1)    AS COL5,
    NULL COL5,
    NULL AS COL6
     
     
     FROM CIS2.VW_DATA_ALL D 
          INNER JOIN  CIS2.MD_RIND MR ON (MR.ID_MD =  D.ID_MD)
          
          --INNER JOIN   CIS2.VW_CL_SERVICII SS ON ((REPLACE (SS.CODUL,'0') )=D.COL1)
          INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 ) 
          
          INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
         -- INNER JOIN CIS2.MD_RIND RD ON (RD.CAPITOL=D.CAPITOL AND RD.CAPITOL_VERS=D.CAPITOL_VERS AND RD.RIND=D.RIND)
   
   WHERE 
--  (D.PERIOADA =:pPERIOADA) AND 
  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND
  D.CAPITOL IN (405)
  AND MR.RIND NOT IN ('1','2')
 -- AND D.CUIIO IN (227548)
  
  GROUP BY 
  D.CUIIO,
  --R.DENUMIRE,
  MR.RIND,
  SS.DENUMIRE,
  --D.RIND,
  D.COL1,
  D.COL3
  
  UNION 
  
  SELECT 
    D.CUIIO,
    MAX(R.DENUMIRE) DENUMIRE_CUIIO, 
    MR.RIND,
    TT.DENUMIRE,
    4||'_'||D.COL1||'_'||D.COL3 AS ORDINE, 
    NULL             COL1,
    --SUM(D.COL3)      COL2,
    D.COL3 AS  COL2,
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 ELSE 0  END) COL3,
    SUM(CASE WHEN D.COL5 IS NOT NULL THEN D.COL5 ELSE 0  END) COL4,
    --ROUND(SUM(DISTINCT CASE  WHEN   D.CUIIO = D.CUIIO  AND D.CAPITOL IN (405) AND (D.COL4 IS NOT NULL AND D.COL5 IS NOT NULL)   THEN CIS2.NOZERO(CIS2.NVAL(D.COL4))/CIS2.NVAL(D.COL5) ELSE NULL END),1)    AS COL5,
    NULL COL5,
    NULL AS COL6
     
     
     FROM CIS2.VW_DATA_ALL D 
          INNER JOIN  CIS2.MD_RIND MR ON (MR.ID_MD =  D.ID_MD)
          INNER JOIN   CIS2.VW_CL_TARI TT  ON (TT.CODUL=D.COL3)
          INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
       --   INNER JOIN CIS2.MD_RIND RD ON (RD.CAPITOL=D.CAPITOL AND RD.CAPITOL_VERS=D.CAPITOL_VERS AND RD.RIND=D.RIND)
   
   WHERE 
  --(D.PERIOADA =:pPERIOADA) AND 
  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND
  D.CAPITOL IN (405)
  AND MR.RIND NOT IN ('1','2')
 -- AND D.CUIIO IN (227548)
  
  GROUP BY 
  D.CUIIO,
  --R.DENUMIRE,
  MR.RIND,
  TT.DENUMIRE,
  --D.RIND,
  D.COL1,
  D.COL3
  
  
  
)
GROUP BY
  CUIIO,
  DENUMIRE,
  ORDINE,
  COL1,
  COL2
ORDER BY
  CUIIO,
  ORDINE,
  COL1
  
  
  
  )
  
  
  
--------------------------------------------------------------------------------  
    UNION 
  
  SELECT 
    D.CUIIO,
    MAX(R.DENUMIRE) DENUMIRE_CUIIO, 
    MR.RIND,
    MR.DENUMIRE,
    '6' AS ORDINE, 
    NULL AS  COL1,
    NULL AS  COL2,
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 ELSE 0  END) COL3,
    SUM(CASE WHEN D.COL5 IS NOT NULL THEN D.COL5 ELSE 0  END) COL4,
    --ROUND(SUM(DISTINCT CASE  WHEN   D.CUIIO = D.CUIIO  AND D.CAPITOL IN (406) AND (D.COL4 IS NOT NULL AND D.COL5 IS NOT NULL)   THEN CIS2.NOZERO(CIS2.NVAL(D.COL4))/CIS2.NVAL(D.COL5) ELSE NULL END),1)    AS COL5,
    NULL COL5,
    NULL AS COL6
     
     
     FROM CIS2.VW_DATA_ALL D 
           INNER JOIN  CIS2.MD_RIND MR ON (MR.ID_MD =  D.ID_MD)
           INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
       --    INNER JOIN CIS2.MD_RIND RD ON (RD.CAPITOL=D.CAPITOL AND RD.CAPITOL_VERS=D.CAPITOL_VERS AND RD.RIND=D.RIND)
   
   WHERE 
  --(D.PERIOADA =:pPERIOADA) AND 
  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND
  D.CAPITOL IN (406)
  AND MR.RIND  IN ('1')

  
  GROUP BY 
  D.CUIIO,
  --R.DENUMIRE,
  MR.DENUMIRE,
  MR.RIND,
  MR.DENUMIRE
  --D.RIND
  
  
  ----------------------------------------------------------------------------------------------
  
  UNION 
  
  -------------------------------------------------------------------------------  
SELECT 

CUIIO,
DENUMIRE_CUIIO,
RIND,
DENUMIRE,
7||'_'||TO_CHAR(ROWNUM,'000') ORDINE,
COL1,
COL2,
COL3,
COL4,
COL5,
NULL COL6
FROM 
(
SELECT
  CUIIO,
  NULL DENUMIRE_CUIIO,
  NULL RIND,
  DENUMIRE,
  --SUBSTR(ORDINE,1,1)  
  ORDINE,
  COL1,
  COL2,
  SUM(COL3) COL3,
  SUM(COL4) COL4,
  SUM(COL5) COL5
FROM
(
SELECT 
    D.CUIIO,
    MAX(R.DENUMIRE) DENUMIRE_CUIIO, 
    MR.RIND,
    SS.DENUMIRE,
    7||'_'||D.COL1 AS ORDINE, 
    D.COL1 AS COL1,
    NULL AS COL2,
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 ELSE 0  END) COL3,
    SUM(CASE WHEN D.COL5 IS NOT NULL THEN D.COL5 ELSE 0  END) COL4,
    --ROUND(SUM(DISTINCT CASE  WHEN   D.CUIIO = D.CUIIO  AND D.CAPITOL IN (406) AND (D.COL4 IS NOT NULL AND D.COL5 IS NOT NULL)   THEN CIS2.NOZERO(CIS2.NVAL(D.COL4))/CIS2.NVAL(D.COL5) ELSE NULL END),1)    AS COL5,
    NULL COL5,
    NULL AS COL6
     
     
     FROM CIS2.VW_DATA_ALL D 
          INNER JOIN  CIS2.MD_RIND MR ON (MR.ID_MD =  D.ID_MD)
          --INNER JOIN   CIS2.VW_CL_SERVICII SS ON ((REPLACE (SS.CODUL,'0') )=D.COL1)
          INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 ) 
          INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        --  INNER JOIN CIS2.MD_RIND RD ON (RD.CAPITOL=D.CAPITOL AND RD.CAPITOL_VERS=D.CAPITOL_VERS AND RD.RIND=D.RIND)
   
   WHERE 
--  (D.PERIOADA =:pPERIOADA) AND 
  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND
  D.CAPITOL IN (406)
  AND MR.RIND NOT IN ('1')
 -- AND D.CUIIO IN (227548)
  
  GROUP BY 
  D.CUIIO,
  --R.DENUMIRE,
  MR.RIND,
  SS.DENUMIRE,
 -- D.RIND,
  D.COL1,
  D.COL3
  
  UNION 
  
  SELECT 
    D.CUIIO,
    MAX(R.DENUMIRE) DENUMIRE_CUIIO, 
    MR.RIND,
    TT.DENUMIRE,
    7||'_'||D.COL1||'_'||D.COL3 AS ORDINE, 
    NULL             COL1,
    --SUM(D.COL3)      COL2,
    D.COL3 AS  COL2,
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 ELSE 0  END) COL3,
    SUM(CASE WHEN D.COL5 IS NOT NULL THEN D.COL5 ELSE 0 END) COL4,
 --   ROUND(SUM(DISTINCT CASE  WHEN   D.CUIIO = D.CUIIO  AND D.CAPITOL IN (406)  THEN CIS2.NOZERO(CIS2.NVAL(D.COL4))/CIS2.NVAL(D.COL5) ELSE NULL END),1)    AS COL5,
    NULL COL5,
    NULL AS COL6
     
     
     FROM CIS2.VW_DATA_ALL D 
          INNER JOIN  CIS2.MD_RIND MR ON (MR.ID_MD =  D.ID_MD)
          INNER JOIN   CIS2.VW_CL_TARI TT  ON (TT.CODUL=D.COL3)
          INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        --  INNER JOIN CIS2.MD_RIND RD ON (RD.CAPITOL=D.CAPITOL AND RD.CAPITOL_VERS=D.CAPITOL_VERS AND RD.RIND=D.RIND)
   
   WHERE 
  --(D.PERIOADA =:pPERIOADA) AND 
  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND
  D.CAPITOL IN (406)
  AND MR.RIND NOT IN ('1')
 -- AND D.CUIIO IN (227548)
  
  GROUP BY 
  D.CUIIO,
 -- R.DENUMIRE,
  MR.RIND,
  TT.DENUMIRE,
 -- D.RIND,
  D.COL1,
  D.COL3
  
  
  
)
GROUP BY
  CUIIO,
  DENUMIRE,
  ORDINE,
  COL1,
  COL2
ORDER BY
  CUIIO,
  ORDINE,
  COL1
  
  
  
  )
  
  
  
--------------------------------------------------------------------------------
UNION 


SELECT 
    
    00000000 AS CUIIO,
    NULL DENUMIRE_CUIIO, 
    NULL RIND,
    SSS.DENUMIRE DENUMIRE,
    '9' AS ORDINE, 
    NULL AS COL1,
    NULL AS COL2,
   -- SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END) COL3,
    (SUM(CASE WHEN  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL3,
    ---------------------------------------------------------------------------------------------------------------------
  --  SUM(CASE WHEN D.COL5 IS NOT NULL THEN D.COL5 ELSE 0 END) COL4,
    
    (SUM(CASE WHEN  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL5 IS NOT NULL THEN D.COL5 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL5 IS NOT NULL THEN D.COL5 ELSE 0 END ))
    AS COL4,
    
    
    NULL COL5,
    NULL AS COL6
     
     
     
          
    FROM
    
     CIS2.VW_DATA_ALL D 
     
   
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 ) 
    
    INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )
            INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
   
  WHERE 
  --(D.PERIOADA =:pPERIOADA) AND
  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND    
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND
  D.CAPITOL IN (405,406)
 AND  SSS.CODUL IN ('0000000')
 
  GROUP BY 
  SSS.DENUMIRE

  
  
)
  
  
  
  GROUP BY 
  


    CUIIO,
    DENUMIRE_CUIIO,
    DENUMIRE,
    ORDINE,
    COL1,
    COL2
  
  ORDER BY 
  
  
  CUIIO,
  
  ORDINE,
  COL1
 
  )
   A
   
   ) DF

;
   
    BEGIN

  FOR CR IN C
  
  LOOP
    INSERT INTO  -- USER_BANCU.TABLE_OUT_TEST 
    
     CIS2.TABLE_OUT
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
       
      COL1, COL2, COL3,  COL4,COL5
    )
    VALUES
    (
      CR.PERIOADA,
      CR.FORM,
      CR.FORM_VERS,
      CR.ID_MDTABLE,
      CR.COD_CUATM,
      CR.NR_SECTIE,
      CR.NUME_SECTIE,
      CR.NR_SECTIE1,
      CR.NUME_SECTIE1,
      CR.NR_SECTIE2,
      CR.NUME_SECTIE2,
      CR.NR_ROW,
      CR.ORDINE,
      CR.DECIMAL_POS,
      CR.NUME_ROW,
       
      CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5
    );
  END LOOP;
END;
  
  
   
   
   