﻿
SELECT 
--
--    CODUL AS NR_SECTIE,
--    CODUL ||'-'||DENUMIRE_CUATM AS NUME_SECTIE,
    CUIIO,
    DENUMIRE_CUIIO,
    DENUMIRE,
    ORDINE,
    COL1,
    COL2,
    SUM(COL3)  COL3,
    SUM(COL4)  COL4,
    SUM(COL5)  COL5,
    MAX(COL6)  COL6,
    MAX(COL7)  COL7
FROM
(
SELECT
--    CC.CODUL,
--    CC.FULL_CODE,
--    CC.DENUMIRE DENUMIRE_CUATM, 
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    R.DENUMIRE DENUMIRE,
    '1' AS ORDINE, 
    NULL   AS  COL1,
    NULL   AS  COL2,
    NULL   AS  COL3,
    NULL   AS  COL4,
    NULL   AS  COL5,
    D.CUIIO   AS  COL6,
    MAX(CASE WHEN  D.CAPITOL IN (1) AND MR.RIND IN ('01') AND   D.COL1 = 1 THEN  1  
             WHEN  D.CAPITOL IN (1) AND MR.RIND IN ('02') AND   D.COL1 = 1 THEN  2
             WHEN  D.CAPITOL IN (1) AND MR.RIND IN ('03') AND   D.COL1 = 1 THEN  3
             WHEN  D.CAPITOL IN (1) AND MR.RIND IN ('04') AND   D.COL1 = 1 THEN  4
             WHEN  D.CAPITOL IN (1) AND MR.RIND IN ('05') AND   D.COL1 = 1 THEN  5
             WHEN  D.CAPITOL IN (1) AND MR.RIND IN ('06') AND   D.COL1 = 1 THEN  6
             WHEN  D.CAPITOL IN (1) AND MR.RIND IN ('07') AND   D.COL1 = 1 THEN  7  
    
    END) COL7
     
     
     FROM CIS2.VW_DATA_ALL D 
           INNER JOIN  CIS2.MD_RIND MR ON (MR.ID_MD =  D.ID_MD)
           INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
 
         
   
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND
 -- (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND    
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND
  D.CAPITOL IN (1)
  AND MR.RIND NOT  IN ('0')
  
  --AND D.CUIIO IN (227548)
  
  GROUP BY 
--  CC.CODUL,
--  CC.FULL_CODE,
--  CC.DENUMIRE, 
  D.CUIIO,
  R.DENUMIRE,
  MR.DENUMIRE,
  MR.RIND,
  MR.DENUMIRE,
  D.RIND
  
  
  UNION 
  
  SELECT 
--    CC.CODUL,
--    CC.FULL_CODE,
--    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    MR.DENUMIRE,
    '2' AS ORDINE, 
    NULL AS  COL1,
    NULL AS  COL2,
   ------------------------- 
    
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) COL3,
    SUM(CASE WHEN D.COL5 IS NOT NULL THEN D.COL5 END) COL4,
    NULL AS COL5,
    ------------------------------
    NULL AS COL6,
    NULL AS COL7
     
     
     FROM CIS2.VW_DATA_ALL D 
           INNER JOIN  CIS2.MD_RIND MR ON (MR.ID_MD =  D.ID_MD)
           INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
      
   
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND
 -- (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND    
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
  R.DENUMIRE,
  MR.DENUMIRE,
  MR.RIND,
  MR.DENUMIRE,
  D.RIND
  
  
  UNION 
  
SELECT 
--    CC.CODUL,
--    CC.FULL_CODE,
--    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    MR.DENUMIRE,
    '3' AS ORDINE, 
    NULL AS  COL1,
    NULL AS  COL2,
    --------------------------
   
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) COL3,
    SUM(CASE WHEN D.COL5 IS NOT NULL THEN D.COL5 END) COL4,
    NULL AS COL5,
    
    ----------------------
    NULL AS COL6,
    NULL AS COL7
     
     
     FROM CIS2.VW_DATA_ALL D 
          INNER JOIN  CIS2.MD_RIND MR ON (MR.ID_MD =  D.ID_MD)
          INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
     

         
   
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  --(D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND   
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
--  CC.CODUL,
--  CC.FULL_CODE,
--  CC.DENUMIRE, 
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  MR.DENUMIRE,
  D.RIND
  
  UNION 
--------------------------------------------------------------------------------  

SELECT 
--CODUL,
--FULL_CODE,
--DENUMIRE_CUATM,
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
NULL COL6,
NULL AS COL7
FROM 
(
SELECT
--  CODUL,
--  FULL_CODE,
--  DENUMIRE_CUATM,
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
--    CC.CODUL,
--    CC.FULL_CODE,
--    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    SS.DENUMIRE,
    4||'_'||D.COL1 AS ORDINE, 
    D.COL1 AS COL1,
    NULL AS COL2,
    
    
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) COL3,
    SUM(CASE WHEN D.COL5 IS NOT NULL THEN D.COL5 END) COL4,
    NULL AS COL5,
    
    
    NULL AS COL6,
    NULL AS COL7
     
     
     FROM CIS2.VW_DATA_ALL D 
          INNER JOIN  CIS2.MD_RIND MR ON (MR.ID_MD =  D.ID_MD)
          
            INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
          
          INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
  


   
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 

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
--  CC.CODUL,
--  CC.FULL_CODE,
--  CC.DENUMIRE, 
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  SS.DENUMIRE,
  D.RIND,
  D.COL1,
  D.COL3
  
  UNION 
  
  SELECT 
--    CC.CODUL,
--    CC.FULL_CODE,
--    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    TT.DENUMIRE,
    4||'_'||D.COL1||'_'||D.COL3 AS ORDINE, 
    NULL             COL1,
    --SUM(D.COL3)      COL2,
    D.COL3 AS  COL2,
    
   
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) COL3,
    SUM(CASE WHEN D.COL5 IS NOT NULL THEN D.COL5 END) COL4,
    NULL AS COL5,
    
    
    NULL AS COL6,
    NULL AS COL7
     
     
     FROM CIS2.VW_DATA_ALL D 
          INNER JOIN  CIS2.MD_RIND MR ON (MR.ID_MD =  D.ID_MD)
          INNER JOIN   CIS2.VW_CL_TARI TT  ON (TT.CODUL=D.COL3)
          INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
          
    

   
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
 
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
--  CC.CODUL,
--  CC.FULL_CODE,
--  CC.DENUMIRE, 
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  TT.DENUMIRE,
  D.RIND,
  D.COL1,
  D.COL3
  
  
  
)
GROUP BY
--  CODUL,
--  FULL_CODE,
--  DENUMIRE_CUATM,
  CUIIO,
  DENUMIRE,
  ORDINE,
  COL1,
  COL2
ORDER BY
--  CODUL,
--  FULL_CODE,
--  DENUMIRE_CUATM,
  CUIIO,
  ORDINE,
  COL1
  
  
  
  )
  
  
  
--------------------------------------------------------------------------------  
    UNION 
  
  SELECT 
  
--    CC.CODUL,
--    CC.FULL_CODE,
--    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    MR.DENUMIRE,
    '6' AS ORDINE, 
    NULL AS  COL1,
    NULL AS  COL2,
    
    
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) COL3,
    SUM(CASE WHEN D.COL5 IS NOT NULL THEN D.COL5 END) COL4,
    NULL AS COL5,
    
    NULL AS COL6,
    NULL AS COL7
     
     
     FROM CIS2.VW_DATA_ALL D 
           INNER JOIN  CIS2.MD_RIND MR ON (MR.ID_MD =  D.ID_MD)
           INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
   
           
   
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
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
  R.DENUMIRE,
  MR.DENUMIRE,
  MR.RIND,
  MR.DENUMIRE,
  D.RIND
  
  
  ----------------------------------------------------------------------------------------------
  
  UNION 
  
  -------------------------------------------------------------------------------  
SELECT 

--CODUL,
--FULL_CODE,
--DENUMIRE_CUATM,

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
NULL COL6,
NULL AS COL7
FROM 
(
SELECT
--  CODUL,
--  FULL_CODE,
--  DENUMIRE_CUATM,
  CUIIO,
  NULL DENUMIRE_CUIIO,
  NULL RIND,
  DENUMIRE,
  
  ORDINE,
  COL1,
  COL2,
  SUM(COL3) COL3,
  SUM(COL4) COL4,
  SUM(COL5) COL5
FROM
(
SELECT 
--    CC.CODUL,
--    CC.FULL_CODE,
--    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    SS.DENUMIRE,
    7||'_'||D.COL1 AS ORDINE, 
    D.COL1 AS COL1,
    NULL AS COL2,
  
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) COL3,
    SUM(CASE WHEN D.COL5 IS NOT NULL THEN D.COL5 END) COL4,
    NULL AS COL5,
    
    NULL AS COL6
     
     
     FROM CIS2.VW_DATA_ALL D 
          INNER JOIN  CIS2.MD_RIND MR ON (MR.ID_MD =  D.ID_MD)
          
            INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
          
          INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
          
        
   
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
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
  R.DENUMIRE,
  MR.RIND,
  SS.DENUMIRE,
  D.RIND,
  D.COL1,
  D.COL3
  
  UNION 
  
  SELECT 
--    CC.CODUL,
--    CC.FULL_CODE,
--    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    TT.DENUMIRE,
    7||'_'||D.COL1||'_'||D.COL3 AS ORDINE, 
    NULL             COL1,
  
    D.COL3 AS  COL2,
    
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) COL3,
    SUM(CASE WHEN D.COL5 IS NOT NULL THEN D.COL5 END) COL4,
    NULL AS COL5,
    NULL AS COL6

     
     
     FROM CIS2.VW_DATA_ALL D 
          INNER JOIN  CIS2.MD_RIND MR ON (MR.ID_MD =  D.ID_MD)
          INNER JOIN   CIS2.VW_CL_TARI TT  ON (TT.CODUL=D.COL3)
          INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
          
        
   
   
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
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
--  CC.CODUL,
--  CC.FULL_CODE,
--  CC.DENUMIRE, 
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  TT.DENUMIRE,
  D.RIND,
  D.COL1,
  D.COL3
  
  
  
)
GROUP BY
--  CODUL,
--  FULL_CODE,
--  DENUMIRE_CUATM,
  CUIIO,
  DENUMIRE,
  ORDINE,
  COL1,
  COL2
ORDER BY
--  CODUL,
--  FULL_CODE,
--  DENUMIRE_CUATM,
  CUIIO,
  ORDINE,
  COL1
  
  
  
  )
  
  
  
--------------------------------------------------------------------------------
UNION 


SELECT 
--    CC.CODUL,
--    CC.FULL_CODE,
--    CC.DENUMIRE DENUMIRE_CUATM,
    00000000 AS CUIIO,
    NULL DENUMIRE_CUIIO, 
    NULL RIND,
    SSS.DENUMIRE DENUMIRE,
    '9' AS ORDINE, 
    NULL AS COL1,
    NULL AS COL2,
    
  
    (SUM(CASE WHEN  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL3,
    ---------------------------------------------------------------------------------------------------------------------
  
    
    (SUM(CASE WHEN  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL5 IS NOT NULL THEN D.COL5 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL5 IS NOT NULL THEN D.COL5 ELSE 0 END ))
    AS COL4,
    
    
    NULL AS COL5,
    NULL AS COL6,
    NULL AS COL7
     
     
     
          
    FROM
    
     CIS2.VW_DATA_ALL D 
     
   
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
    
    INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )
   


           
           
   
  WHERE 
  (D.PERIOADA =:pPERIOADA) AND
   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND
  D.CAPITOL IN (405,406)
 AND  SSS.CODUL IN ('0000000')
 --AND CC.CODUL IN ('0000000')
  GROUP BY 
--  CC.CODUL,
--  CC.FULL_CODE,
--  CC.DENUMIRE, 
  SSS.DENUMIRE

  
  
)
  
  
  
  GROUP BY 
  
--
--    CODUL,
--    FULL_CODE,
--    DENUMIRE_CUATM,
    CUIIO,
    DENUMIRE_CUIIO,
    DENUMIRE,
    ORDINE,
    COL1,
    COL2
  
  ORDER BY 
--  CODUL,
--  FULL_CODE,
--  DENUMIRE_CUATM,
  
  CUIIO,
  
  ORDINE,
  COL1
 
  

  