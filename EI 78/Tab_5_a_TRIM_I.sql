DECLARE

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
    REGEXP_REPLACE(DF.NUME_ROW,'(^[[:space:]]*|[[:space:]]*$)') AS NUME_ROW,
    DF.COL1,
    DF.COL2,
    DF.COL3,
    DF.COL4
  --  DF.COL5
 --   DF.COL6
    
    FROM 
(

SELECT 
 
    :pPERIOADA AS PERIOADA,
    :pFORM AS FORM,
    :pFORM_VERS AS FORM_VERS,
    :pID_MDTABLE AS ID_MDTABLE,
    :pCOD_CUATM AS COD_CUATM,
     NR_SECTIE   AS NR_SECTIE,
     NUME_SECTIE AS NUME_SECTIE, 
    '0' AS NR_SECTIE1,
    '0' AS NUME_SECTIE1,
    '0' AS NR_SECTIE2,
    '0' AS NUME_SECTIE2, 
 A.CUIIO||'~'||ROWNUM NR_ROW,
 ROWNUM  AS ORDINE,
 '0000' AS DECIMAL_POS,
  TRIM(A.DENUMIRE) NUME_ROW,
    A.COL1   COL1,
    A.COL2   COL2,
    A.COL3   COL3,
    ROUND(A.COL4,0)  COL4
 
  
    ---------------------
    --ROUND(A.COL4,0)   COL5
--   (SELECT
--            SUM(D.COL1) AS COL1            
--                  FROM DATA_ALL D
--                          INNER  JOIN CIS2.MD_RIND MR ON D.ID_MD = MR.ID_MD
--                      
--                        WHERE
--                             (D.PERIOADA =:pPERIOADA) AND               
--                              D.FORM IN (101)
--                              AND D.CUIIO IN (5)
--                              AND MR.CAPITOL IN (10002)
--                              AND MR.RIND IN ('01'))  AS  COL6 
    
    --------------------
    
    
    
FROM 
(
SELECT 

    CODUL AS NR_SECTIE,
    CODUL ||'-'||DENUMIRE_CUATM AS NUME_SECTIE,
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
    CODUL,
    FULL_CODE,
    DENUMIRE_CUATM,
    CUIIO,
    DENUMIRE_CUIIO, 
    RIND,
    DENUMIRE,
    '2' AS ORDINE, 
    SUM(COL1) AS COL1,
    SUM(COL2) AS COL2,
    SUM(COL3) AS COL3,
    SUM(COL4) AS COL4,
    NULL AS COL5,
    NULL AS COL6,
    NULL AS COL7

FROM
(

SELECT 
    D.PERIOADA,
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    MR.DENUMIRE,
    NULL AS  COL1,
    NULL AS  COL2,
   ------------------------- 
    
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) COL3,
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) / CR.COL1 COL4,
    NULL AS COL5,
    ------------------------------
    NULL AS COL6,
    NULL AS COL7

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        INNER  JOIN VW_CL_CUATM CT ON R.CUATM = CT.CODUL
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        
        
        -------------------------------------------------------------------------------
        LEFT JOIN (
         SELECT
             D.PERIOADA,
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN CIS2.MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                            (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND                 
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01') 
                              GROUP BY 
                               D.PERIOADA
                              
                              ) CR ON (D.PERIOADA=CR.PERIOADA)
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND     
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44) AND
  MR.CAPITOL IN (407)
  AND MR.RIND  IN ('1')
  -------------------------------------------------
  GROUP BY 
  D.PERIOADA,
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  MR.DENUMIRE,
  CR.COL1 
  
   )
  
   group by 
    CODUL,
    FULL_CODE,
    DENUMIRE_CUATM,
    CUIIO,
    DENUMIRE_CUIIO, 
    RIND,
    DENUMIRE
  
  
  UNION 
  
SELECT
    CODUL,
    FULL_CODE,
    DENUMIRE_CUATM,
    CUIIO,
    DENUMIRE_CUIIO, 
    RIND,
    DENUMIRE,
    '3' AS ORDINE, 
    SUM(COL1) AS COL1,
    SUM(COL2) AS COL2,
    SUM(COL3) AS COL3,
    SUM(COL4) AS COL4,
    NULL AS COL5,
    NULL AS COL6,
    NULL AS COL7

FROM
(
SELECT 
    D.PERIOADA,
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    MR.DENUMIRE,
  
    NULL AS  COL1,
    NULL AS  COL2,
   ------------------------- 
    
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) COL3,
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) / CR.COL1 COL4,
    NULL AS COL5,
    ------------------------------
    NULL AS COL6,
    NULL AS COL7

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        INNER  JOIN VW_CL_CUATM CT ON R.CUATM = CT.CODUL
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        
        
        -------------------------------------------------------------------------------
        LEFT JOIN (
         SELECT
            D.PERIOADA,
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN CIS2.MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND              
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01')
                              
                              GROUP BY 
                              D.PERIOADA
                              
                               ) CR ON (D.PERIOADA=CR.PERIOADA)
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND     
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44) AND
  MR.CAPITOL IN (407)
  AND MR.RIND  IN ('2')
  -------------------------------------------------
  GROUP BY 
  D.PERIOADA,
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  MR.DENUMIRE,
  CR.COL1 
  )
  
   group by 
    CODUL,
    FULL_CODE,
    DENUMIRE_CUATM,
    CUIIO,
    DENUMIRE_CUIIO, 
    RIND,
    DENUMIRE
  
  UNION 
--------------------------------------------------------------------------------  

SELECT 
CODUL,
FULL_CODE,
DENUMIRE_CUATM,
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
  CODUL,
  FULL_CODE,
  DENUMIRE_CUATM,
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
    CODUL,
    FULL_CODE,
    DENUMIRE_CUATM,
    CUIIO,
    DENUMIRE_CUIIO, 
    RIND,
    DENUMIRE,
    ORDINE, 
    COL1 AS COL1,
    SUM(COL2) AS COL2,
    SUM(COL3) AS COL3,
    SUM(COL4) AS COL4,
    NULL AS COL5,
    NULL AS COL6,
    NULL AS COL7

FROM
(
SELECT 
    D.PERIOADA, 
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    SS.DENUMIRE,
    4||'_'||D.COL1 AS ORDINE, 
    D.COL1 AS COL1,
    NULL AS COL2,
    
    
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) COL3,
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) / CR.COL1 COL4,
    NULL AS COL5,
    
    
    NULL AS COL6,
    NULL AS COL7

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        INNER  JOIN VW_CL_CUATM CT ON R.CUATM = CT.CODUL
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        
        
        -------------------------------------------------------------------------------
        LEFT JOIN (
         SELECT
             D.PERIOADA,
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN CIS2.MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                            (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND             
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01') 
                              
                              GROUP BY 
                               D.PERIOADA
                              
                              ) CR ON (D.PERIOADA=CR.PERIOADA)
        ------------------------------------------------------------------------------   
        
        INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
        
   WHERE 
  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND     
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44) AND
  MR.CAPITOL IN (407)
  AND MR.RIND NOT IN ('1','2')
  -------------------------------------------------
  GROUP BY
  D.PERIOADA, 
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  SS.DENUMIRE,
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  MR.DENUMIRE,
  CR.COL1,
   D.COL1,
  D.COL3 
  )
  
  GROUP BY 
    CODUL,
    FULL_CODE,
    DENUMIRE_CUATM,
    CUIIO,
    DENUMIRE_CUIIO, 
    RIND,
    DENUMIRE,
    ORDINE,
    COL1
  
  UNION 
  
  SELECT
    CODUL,
    FULL_CODE,
    DENUMIRE_CUATM,
    CUIIO,
    DENUMIRE_CUIIO, 
    RIND,
    DENUMIRE,
    ORDINE, 
    SUM(COL1) AS COL1,
    COL2 AS COL2,
    SUM(COL3) AS COL3,
    SUM(COL4) AS COL4,
    NULL AS COL5,
    NULL AS COL6,
    NULL AS COL7

FROM
(

SELECT 
    D.PERIOADA, 
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    TT.DENUMIRE,
    4||'_'||D.COL1||'_'||D.COL3 AS ORDINE, 
    NULL   AS  COL1,
    D.COL3 AS  COL2,
    
   
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) COL3,
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) / CR.COL1 COL4,
    NULL AS COL5,
    
    
    NULL AS COL6,
    NULL AS COL7

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
       
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        
        
        -------------------------------------------------------------------------------
        LEFT JOIN (
         SELECT
            D.PERIOADA, 
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN CIS2.MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND              
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01') 
                              
                              GROUP BY 
                               D.PERIOADA
                              ) CR ON (D.PERIOADA=CR.PERIOADA)
        ------------------------------------------------------------------------------   
        
       
        INNER JOIN   CIS2.VW_CL_TARI TT  ON (TT.CODUL=D.COL3)
        
   WHERE 

  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND     
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CC.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44) AND
  MR.CAPITOL IN (407)
  AND MR.RIND NOT IN ('1','2')
  -------------------------------------------------
  GROUP BY 
  D.PERIOADA, 
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  TT.DENUMIRE,
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  MR.DENUMIRE,
  CR.COL1,
  D.COL1,
  D.COL3 
  )
  
  
  
  GROUP BY 
    CODUL,
    FULL_CODE,
    DENUMIRE_CUATM,
    CUIIO,
    DENUMIRE_CUIIO, 
    RIND,
    DENUMIRE,
    ORDINE,
    COL2 
  
  
  
)
GROUP BY
  CODUL,
  FULL_CODE,
  DENUMIRE_CUATM,
  CUIIO,
  DENUMIRE,
  ORDINE,
  COL1,
  COL2
ORDER BY
  CODUL,
  FULL_CODE,
  DENUMIRE_CUATM,
  CUIIO,
  ORDINE,
  COL1
  
  
  
  )
  
  
  
--------------------------------------------------------------------------------  
    UNION 
  
  SELECT
    CODUL,
    FULL_CODE,
    DENUMIRE_CUATM,
    CUIIO,
    DENUMIRE_CUIIO, 
    RIND,
    DENUMIRE,
    '6' AS ORDINE, 
    SUM(COL1) AS COL1,
    SUM(COL2) AS COL2,
    SUM(COL3) AS COL3,
    SUM(COL4) AS COL4,
    NULL AS COL5,
    NULL AS COL6,
    NULL AS COL7

FROM
(
SELECT 
    D.PERIOADA,
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    MR.DENUMIRE,
   
    NULL AS  COL1,
    NULL AS  COL2,
   ------------------------- 
    
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) COL3,
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) / CR.COL1 COL4,
    NULL AS COL5,
    ------------------------------
    NULL AS COL6,
    NULL AS COL7

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        INNER  JOIN VW_CL_CUATM CT ON R.CUATM = CT.CODUL
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        
        
        -------------------------------------------------------------------------------
        LEFT JOIN (
         SELECT
            D.PERIOADA,
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN CIS2.MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND               
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01') 
                              
                              GROUP BY 
                               D.PERIOADA
                              
                              ) CR ON (D.PERIOADA=CR.PERIOADA)
        ------------------------------------------------------------------------------   
        
   WHERE 

  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND     
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44) AND
  MR.CAPITOL IN (408)
  AND MR.RIND  IN ('1')
  -------------------------------------------------
  GROUP BY 
  D.PERIOADA,
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  MR.DENUMIRE,
  CR.COL1
  
  )
  
   group by 
    CODUL,
    FULL_CODE,
    DENUMIRE_CUATM,
    CUIIO,
    DENUMIRE_CUIIO, 
    RIND,
    DENUMIRE
  
  
  ----------------------------------------------------------------------------------------------
  
  UNION 
  
  -------------------------------------------------------------------------------  
SELECT 

CODUL,
FULL_CODE,
DENUMIRE_CUATM,
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
  CODUL,
  FULL_CODE,
  DENUMIRE_CUATM,
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
    CODUL,
    FULL_CODE,
    DENUMIRE_CUATM,
    CUIIO,
    DENUMIRE_CUIIO, 
    RIND,
    DENUMIRE,
    ORDINE, 
    COL1 AS COL1,
    SUM(COL2) AS COL2,
    SUM(COL3) AS COL3,
    SUM(COL4) AS COL4,
    NULL AS COL5,
    NULL AS COL6
   

FROM
(

SELECT
    D.PERIOADA, 
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    SS.DENUMIRE,
    7||'_'||D.COL1 AS ORDINE, 
    D.COL1 AS COL1,
    NULL AS COL2,
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) COL3,
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) / CR.COL1 COL4,
    NULL AS COL5,
    
    NULL AS COL6

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        INNER  JOIN VW_CL_CUATM CT ON R.CUATM = CT.CODUL
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        
        
        -------------------------------------------------------------------------------
        LEFT JOIN (
         SELECT
            D.PERIOADA, 
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN CIS2.MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND              
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01') 
                              
                              GROUP BY
                              D.PERIOADA
                              
                              ) CR ON (D.PERIOADA=CR.PERIOADA)
        ------------------------------------------------------------------------------   
        INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
        
        
   WHERE 
 
  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND     
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44) AND
  MR.CAPITOL IN (408)
  AND MR.RIND NOT  IN ('1')
  -------------------------------------------------
  GROUP BY 
  D.PERIOADA,
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  SS.DENUMIRE,
 
  D.COL1,
  D.COL3,
  CR.COL1
  
  )
  
  GROUP BY 
    CODUL,
    FULL_CODE,
    DENUMIRE_CUATM,
    CUIIO,
    DENUMIRE_CUIIO, 
    RIND,
    DENUMIRE,
    ORDINE,
    COL1
  
  UNION 
  
  SELECT
    CODUL,
    FULL_CODE,
    DENUMIRE_CUATM,
    CUIIO,
    DENUMIRE_CUIIO, 
    RIND,
    DENUMIRE,
    ORDINE, 
    SUM(COL1) AS COL1,
     COL2 AS COL2,
    SUM(COL3) AS COL3,
    SUM(COL4) AS COL4,
    NULL AS COL5,
    NULL AS COL6
   

FROM
(

SELECT 
    D.PERIOADA,
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    TT.DENUMIRE,
    7||'_'||D.COL1||'_'||D.COL3 AS ORDINE, 
    NULL             COL1,
   
    D.COL3 AS  COL2,
    
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) COL3,
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) / CR.COL1 COL4,
    NULL AS COL5,
    NULL AS COL6

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        INNER  JOIN VW_CL_CUATM CT ON R.CUATM = CT.CODUL
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        
        
        -------------------------------------------------------------------------------
        LEFT JOIN (
         SELECT
            D.PERIOADA,
            SUM(D.COL1) AS COL1 
                       
                  FROM DATA_ALL D
                          INNER  JOIN CIS2.MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                           (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND             
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01') 
                              
                              GROUP BY 
                               D.PERIOADA
                              
                              ) CR  ON (D.PERIOADA=CR.PERIOADA)
        ------------------------------------------------------------------------------   
        INNER JOIN   CIS2.VW_CL_TARI TT  ON (TT.CODUL=D.COL3)
        
        
   WHERE 
  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44) AND
  MR.CAPITOL IN (408)
  AND MR.RIND NOT  IN ('1')
  -------------------------------------------------
  GROUP BY 
  D.PERIOADA,
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  TT.DENUMIRE,
 
  D.COL1,
  D.COL3,
  CR.COL1
  
  )
  
  GROUP BY 
    CODUL,
    FULL_CODE,
    DENUMIRE_CUATM,
    CUIIO,
    DENUMIRE_CUIIO, 
    RIND,
    DENUMIRE,
    ORDINE,
    COL2
  
  
  
)
GROUP BY
  CODUL,
  FULL_CODE,
  DENUMIRE_CUATM,
  CUIIO,
  DENUMIRE,
  ORDINE,
  COL1,
  COL2
ORDER BY
  CODUL,
  FULL_CODE,
  DENUMIRE_CUATM,
  CUIIO,
  ORDINE,
  COL1
  
  
  
  )
  
  
  
  
  
--------------------------------------------------------------------------------
UNION 


    SELECT
    CODUL,
    FULL_CODE,
    DENUMIRE_CUATM,
    CUIIO,
    DENUMIRE_CUIIO, 
    RIND,
    DENUMIRE,
    '9' AS ORDINE, 
SUM(COL1) AS COL1,
SUM(COL2) AS COL2,
SUM(COL3) AS COL3,
SUM(COL4) AS COL4,
 NULL AS COL5,
    NULL AS COL6,
    NULL AS COL7

FROM
(

SELECT 
    D.PERIOADA,
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    00000000 AS CUIIO,
    NULL DENUMIRE_CUIIO, 
    NULL RIND,
    SSS.DENUMIRE DENUMIRE,
   -- '9' AS ORDINE, 
    NULL AS COL1,
    NULL AS COL2,
    
   
    (SUM(CASE WHEN  MR.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (408)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL3,
    ---------------------------------------------------------------------------------------------------------------------
  
    
    (SUM(CASE WHEN  MR.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (408)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1
    AS COL4,
    
    
    NULL AS COL5,
    NULL AS COL6,
    NULL AS COL7

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        INNER  JOIN VW_CL_CUATM CT ON R.CUATM = CT.CODUL
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
    
    INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )
        
        -------------------------------------------------------------------------------
        LEFT JOIN (
         SELECT
             D.PERIOADA,
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN CIS2.MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND            
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01')
                              
                GROUP BY 
                 D.PERIOADA              
                              
                               ) CR  ON (D.PERIOADA=CR.PERIOADA)
        ------------------------------------------------------------------------------   
        
   WHERE 
 -- (D.PERIOADA =:pPERIOADA) AND
  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND     
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44) AND
  MR.CAPITOL IN (407,408)
  AND  SSS.CODUL IN ('0000000')
  -------------------------------------------------
  GROUP BY
  D.PERIOADA, 
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  SSS.DENUMIRE,
  CR.COL1
  )
  
   group by 
    CODUL,
    FULL_CODE,
    DENUMIRE_CUATM,
    CUIIO,
    DENUMIRE_CUIIO, 
    RIND,
    DENUMIRE

  
  
)
  
  
  
  GROUP BY 
  

    CODUL,
    FULL_CODE,
    DENUMIRE_CUATM,
    CUIIO,
    DENUMIRE_CUIIO,
    DENUMIRE,
    ORDINE,
    COL1,
    COL2
  
  ORDER BY 
  CODUL,
  FULL_CODE,
  DENUMIRE_CUATM,
  
  CUIIO,
  
  ORDINE,
  COL1
 
  )
   A
   
   
   WHERE 
   
   NR_SECTIE  IN (
   
   '0000000',
   --'0100000',
    '0110000',
    '0120000',
    '0130000',
    '0140000',
    '0150000',
    --'1111111'
    '3000000',
    '1400000',
    '3400000',
    '3600000',
    '4100000',
    '4300000',
    '4500000',
    '4800000',
    '6200000',
    '7100000',
    '7400000',
    '7800000',
--2222222
    '1000000',
    '2500000',
    '3100000',
    '3800000',
    '5300000',
    '5500000',
    '6000000',
    '6400000',
    '6700000',
    '8000000',
    '8300000',
    '8900000',
    '9200000',
    --3333333
    '1200000',
    '1700000',
    '2100000',
    '2700000',
    '2900000',
    '5700000',
    '8500000',
    '8700000',
    
    '9200000',
    '9601000',
    '9602000',
    '9603000'
)

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
       
      COL1, COL2, COL3,  COL4--,  COL5 --, COL6
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
       
      CR.COL1, CR.COL2, CR.COL3, CR.COL4--, CR.COL5 --, CR.COL6
    );
  END LOOP;
END;
  
  