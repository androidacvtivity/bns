-- SQL Loader Control and Data File created by TOAD
-- Variable length, terminated enclosed data formatting
-- 
-- The format for executing this file with SQL Loader is:
-- SQLLDR control=<filename> Be sure to substitute your
-- version of SQL LOADER and the filename for this file.
--
-- Note: Nested table datatypes are not supported here and
--       will be exported as nulls.
OPTIONS (DIRECT=FALSE, PARALLEL=FALSE)
LOAD DATA
INFILE *
BADFILE './MD_TABLES.BAD'
DISCARDFILE './MD_TABLES.DSC'
INSERT INTO TABLE CIS2.MD_TABLES
Fields terminated by ";" Optionally enclosed by '"'
(
  ID_MDTABLE NULLIF (ID_MDTABLE="NULL"),
  TABELE,
  TABELE_VERS NULLIF (TABELE_VERS="NULL"),
  FORM NULLIF (FORM="NULL"),
  FORM_VERS NULLIF (FORM_VERS="NULL"),
  DEN_SHORT,
  NIVELRAIONAL,
  ORDINE NULLIF (ORDINE="NULL"),
  STATUT,
  SQL_TEXT,
  SQL_TEXT1,
  LANDSCAPE,
  COL_NUM NULLIF (COL_NUM="NULL"),
  FOOTNOTE,
  UM,
  CREATING
)
BEGINDATA
9508;"1";2008;46;2000;"Tab.1";"2";1.4;"1";DECLARE

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
    DF.COL4
     
FROM 
(

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
    CASE WHEN SUBSTR(NR_ROW,1,1) = '~' THEN '0'||NR_ROW ELSE NR_ROW END NR_ROW,   
   ROWNUM AS ORDINE,
  '1111' AS DECIMAL_POS,
   NUME_ROW,
   ROUND(COL1,1) COL1,
   ROUND(COL2,1) COL2,
  ROUND(COL3,1) COL3,
  ROUND(COL4,1) COL4
FROM
(
SELECT
   --CASE WHEN REPLACE (CODUL_SERV,'0')||'~'||ROWNUM/0.123 IS NULL THEN '0' ELSE REPLACE (CODUL_SERV,'0')||'~'||ROWNUM END  AS NR_ROW,
   CASE WHEN rtrim (CODUL_SERV,'0')||'~'||ROWNUM/0.123 IS NULL THEN '0' ELSE rtrim (CODUL_SERV,'0')||'~'||ROWNUM/0.123 END  AS NR_ROW,
   
   ORDINE, 
   DENUMIRE  NUME_ROW,
  COL1,
  COL2,
  COL3,
  COL4
FROM
(

SELECT 
    1 ORDINE,
     SSS.DENUMIRE,
     SSS.CODUL    CODUL_SERV,
     SSS.FULL_CODE,
     
     ROUND((SUM(CASE WHEN  MC.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   +
     SUM(CASE WHEN  MC.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END ))/1000,1) AS COL1,
     ROUND(((SUM(CASE WHEN  MC.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) +
     SUM(CASE WHEN  MC.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)) / CR.COL1 )/1000,1) AS COL2,
     ROUND((SUM(CASE WHEN  MC.CAPITOL IN (411)  AND MR.RIND NOT IN ('1','2','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) +
     SUM(CASE WHEN  MC.CAPITOL IN (403)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END ))/1000,1) AS COL3,
     ROUND(((SUM(CASE WHEN  MC.CAPITOL IN (411)  AND MR.RIND NOT IN ('1','2','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) +
     SUM(CASE WHEN  MC.CAPITOL IN (403)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END )  ) / CR.COL1)/1000,1) AS COL4
     
      
      FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        INNER  JOIN MD_CAPITOL MC ON MR.CAPITOL = MC.CAPITOL AND MR.CAPITOL_VERS = MC.CAPITOL_VERS
        INNER JOIN   CIS2.VW_CL_SERVICII SS ON ((RTRIM(SS.CODUL,'0') )=D.COL1)     
        INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )  
      
      -------------------------------------------------------------------------------
        CROSS JOIN (
         
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              
                              ) CR
        ------------------------------------------------------------------------------      
      
   
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46)
  AND
  MR.CAPITOL IN (409,410,411,403)
  
      GROUP BY
 
       SSS.DENUMIRE,
       SSS.CODUL,
       SSS.FULL_CODE,
       CR.COL1
      
 UNION
 
 
 
 SELECT
  ORDINE_TARA,
  DENUMIRE,
  CODUL_SERV,
  FULL_CODE,
  COL1,
  COL2,
  COL3,
  COL4
FROM(
SELECT 
     2 ORDINE,
     TTT.ORDINE AS ORDINE_TARA,
     TTT.DENUMIRE,
     SSS.CODUL CODUL_SERV,
     SSS.FULL_CODE,
     
     ROUND((SUM(CASE WHEN  MC.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   +
     SUM(CASE WHEN  MC.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END ))/1000,1) AS COL1,
     ROUND(((SUM(CASE WHEN  MC.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) +
     SUM(CASE WHEN  MC.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)) / CR.COL1 )/1000,1) AS COL2,
     ROUND((SUM(CASE WHEN  MC.CAPITOL IN (411)  AND MR.RIND NOT IN ('1','2','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) +
     SUM(CASE WHEN  MC.CAPITOL IN (403)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END ))/1000,1) AS COL3,
     ROUND(((SUM(CASE WHEN  MC.CAPITOL IN (411)  AND MR.RIND NOT IN ('1','2','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) +
     SUM(CASE WHEN  MC.CAPITOL IN (403)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END )  ) / CR.COL1)/1000,1) AS COL4
     
      
      FROM CIS2.DATA_ALL D 
       
       INNER JOIN   CIS2.RENIM  R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS) 
       INNER JOIN   CIS2.VW_CL_TARI TT  ON (TT.CODUL=D.COL3)
       INNER JOIN   CIS2.VW_CL_TARI TTT ON (TT.FULL_CODE LIKE '%' ||TTT.CODUL||';%' )   
       INNER JOIN   CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
       INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
       INNER  JOIN MD_CAPITOL MC ON MR.CAPITOL = MC.CAPITOL AND MR.CAPITOL_VERS = MC.CAPITOL_VERS
       INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 ) 
       INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )   
        
       
       -------------------------------------------------------------------------------
        CROSS JOIN (
         
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              ) CR
        ------------------------------------------------------------------------------  
       
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46)
  AND
  MR.CAPITOL IN (409,410,411,403)
  AND TTT.CODUL NOT IN ('000')
  AND SSS.CODUL NOT IN ('0000000')
  
      GROUP BY
      SSS.CODUL,
      TTT.CODUL,
      TTT.FULL_CODE,
      SSS.FULL_CODE,
      TTT.ORDINE,
      TTT.DENUMIRE,
      CR.COL1
      
    ORDER BY
    TTT.ORDINE 
)
 
)
 ORDER BY
  CODUL_SERV,
  ORDINE
)
  


  ) DF
  
  ;
   
    BEGIN

  FOR CR IN C
  
  LOOP
   
    INSERT INTO  CIS2.TABLE_OUT
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
       
      COL1, COL2, COL3,  COL4
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
       
      CR.COL1, CR.COL2, CR.COL3, CR.COL4
    );
  END LOOP;
END;
  
  ;;"1";4;"";"";""
9506;"2";2008;46;2000;"Tab. 3 ";"2";3;"1";DECLARE

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
    DF.COL4
     
FROM 
(

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
     ROWNUM NR_ROW,
     AA.ORDINE  AS ORDINE,
    '1111' AS DECIMAL_POS,
     AA.NUME_ROW AS NUME_ROW,
     ROUND(AA.COL1 / 1000,1)   AS COL1,
     ROUND(AA.COL2 / 1000,1)   AS COL2,
     ROUND(AA.COL3 / 1000,1)   AS COL3,
     ROUND(AA.COL4 / 1000,1)   AS COL4

     FROM
     (

SELECT 
     CD.NR_ROW   AS NR_ROW,
     CD.NR_ROW   AS ORDINE,
     CD.NUME_ROW AS NUME_ROW,
    SUM(CASE WHEN  CT.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND  MR.CAPITOL IN (409)  AND MR.RIND IN ('1')  THEN NVAL(D.COL4) ELSE 0 END )  AS COL1,
    SUM(CASE WHEN  CT.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND  MR.CAPITOL IN (409)  AND MR.RIND IN ('1')  THEN NVAL(D.COL4) ELSE 0 END ) / CR.COL1  AS COL2,
    SUM(CASE WHEN  CT.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND  MR.CAPITOL IN (411)  AND MR.RIND IN ('1')  THEN NVAL(D.COL4) ELSE 0 END )  AS COL3,
    SUM(CASE WHEN  CT.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND  MR.CAPITOL IN (411)  AND MR.RIND IN ('1')  THEN NVAL(D.COL4) ELSE 0 END ) / CR.COL1  AS COL4
 
    FROM DATA_ALL D
          INNER JOIN RENIM RN ON D.CUIIO = RN.CUIIO AND D.CUIIO_VERS = RN.CUIIO_VERS
          INNER  JOIN VW_CL_CUATM CT ON RN.CUATM = CT.CODUL
          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
         
          CROSS JOIN  (
           SELECT DENUMIRE AS NUME_ROW, RIND AS NR_ROW,RINDOUT AS CUATM FROM CIS2.MD_RIND_OUT
             WHERE 
            ID_MDTABLE = 8096) CD  
            
            CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              ) CR 
             
 WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (409,406,411,408)
  
  GROUP BY 
    CD.NR_ROW,
    CD.NUME_ROW,
    CR.COL1
      
    ORDER BY 
    CD.NR_ROW
  
  ) AA 
  
   ORDER BY AA.ORDINE
    
    
    ) DF

;
   
    BEGIN

  FOR CR IN C
  
  LOOP
    INSERT INTO --  USER_BANCU.TABLE_OUT_TEST 
    
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
       
      COL1, COL2, COL3,  COL4
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
       
      CR.COL1, CR.COL2, CR.COL3, CR.COL4
    );
  END LOOP;
END;



  
  
  
  ;;"1";4;"";"";""
10507;"3";2008;46;2000;"Tab.4 b";"2";4.7;"1";DECLARE

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
    DF.COL4,
    DF.COL5,
    DF.COL6
    
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
 '000004' AS DECIMAL_POS,
  TRIM(A.DENUMIRE) NUME_ROW,
    A.COL7   COL1,
    A.COL1   COL2,
    A.COL2   COL3,
    A.COL3   COL4,
 
  
    ---------------------
    ROUND(A.COL4,0)   COL5,
   
   (
   
  SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
   
                              )  AS  COL6 
    
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
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    MR.DENUMIRE DENUMIRE,
    '1' AS ORDINE, 
    NULL   AS  COL1,
    NULL   AS  COL2,
    NULL   AS  COL3,
    NULL   AS  COL4,
    NULL   AS  COL5,
    D.CUIIO   AS  COL6,
    MAX(CASE WHEN  MR.CAPITOL IN (1) AND MR.RIND IN ('01') AND   CIS2.NVAL(D.COL1) = 1 THEN  1  
             WHEN  MR.CAPITOL IN (1) AND MR.RIND IN ('02') AND   CIS2.NVAL(D.COL1) = 1 THEN  2
             WHEN  MR.CAPITOL IN (1) AND MR.RIND IN ('03') AND   CIS2.NVAL(D.COL1) = 1 THEN  3
             WHEN  MR.CAPITOL IN (1) AND MR.RIND IN ('04') AND   CIS2.NVAL(D.COL1) = 1 THEN  4
             WHEN  MR.CAPITOL IN (1) AND MR.RIND IN ('05') AND   CIS2.NVAL(D.COL1) = 1 THEN  5
             WHEN  MR.CAPITOL IN (1) AND MR.RIND IN ('06') AND   CIS2.NVAL(D.COL1) = 1 THEN  6
             WHEN  MR.CAPITOL IN (1) AND MR.RIND IN ('07') AND   CIS2.NVAL(D.COL1) = 1 THEN  7  
    
    END) COL7

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
       
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CC.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (1)
  AND MR.RIND NOT  IN ('0')
  -------------------------------------------------
  GROUP BY 
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  MR.DENUMIRE
  
  
  UNION 
  
  SELECT 
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    MR.DENUMIRE,
    '2' AS ORDINE, 
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
        CROSS JOIN (
         
        SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (409)
  AND MR.RIND  IN ('1')
  -------------------------------------------------
  GROUP BY 
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  MR.DENUMIRE,
  CR.COL1 
  
  
  UNION 
  
SELECT 
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    MR.DENUMIRE,
    '3' AS ORDINE, 
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
        CROSS JOIN (
        SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (409)
  AND MR.RIND  IN ('2')
  -------------------------------------------------
  GROUP BY 
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  MR.DENUMIRE,
  CR.COL1 
  
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
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
        INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (409)
  AND MR.RIND NOT IN ('1','2')
  -------------------------------------------------
  GROUP BY 
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
  
  UNION 
  
  SELECT 
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
        CROSS JOIN (
        SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
       
        INNER JOIN   CIS2.VW_CL_TARI TT  ON (TT.CODUL=D.COL3)
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CC.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (409)
  AND MR.RIND NOT IN ('1','2')
  -------------------------------------------------
  GROUP BY 
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
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    MR.DENUMIRE,
    '6' AS ORDINE, 
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
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01')  
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (410)
  AND MR.RIND  IN ('1')
  -------------------------------------------------
  GROUP BY 
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  MR.DENUMIRE,
  CR.COL1
  
  
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
        CROSS JOIN (
        SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
        
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (410)
  AND MR.RIND NOT  IN ('1')
  -------------------------------------------------
  GROUP BY 
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
  
  UNION 
  
  SELECT 
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
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01')  
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        INNER JOIN   CIS2.VW_CL_TARI TT  ON (TT.CODUL=D.COL3)
        
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (410)
  AND MR.RIND NOT  IN ('1')
  -------------------------------------------------
  GROUP BY 
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
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    00000000 AS CUIIO,
    NULL DENUMIRE_CUIIO, 
    NULL RIND,
    SSS.DENUMIRE DENUMIRE,
    '9' AS ORDINE, 
    NULL AS COL1,
    NULL AS COL2,
    
   
    (SUM(CASE WHEN  MR.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL3,
    ---------------------------------------------------------------------------------------------------------------------
  
    
    (SUM(CASE WHEN  MR.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1
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
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (409,410)
  AND  SSS.CODUL IN ('0000000')
  -------------------------------------------------
  GROUP BY 
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  SSS.DENUMIRE,
  CR.COL1

  
  
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
       
      COL1, COL2, COL3,  COL4,  COL5, COL6
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
       
      CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6
    );
  END LOOP;
END;
  
  ;;"1";6;"";"";""
9510;"3.1";2008;46;2000;"Tab.4 b - Pachete";"2";4.71;"1";DECLARE

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
    DF.COL4,
    DF.COL5,
    DF.COL6,
    DF.COL7
    
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
 '0000000' AS DECIMAL_POS,
  TRIM(A.DENUMIRE) NUME_ROW,
   A.COL8   COL1,
    A.COL7   COL2,
    A.COL1   COL3,
    A.COL2   COL4,
 
  
    ---------------------
    ROUND(A.COL3,0)   COL5,
    ROUND(A.COL4,0)   COL6,
   
   (
   
  SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
   
                              )  AS  COL7 
    
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
    MAX(COL7)  COL7,
    MAX(COL8)  COL8
FROM
(
SELECT 
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    MR.DENUMIRE DENUMIRE,
    '1' AS ORDINE, 
    NULL   AS  COL1,
    NULL   AS  COL2,
    NULL   AS  COL3,
    NULL   AS  COL4,
    NULL   AS  COL5,
    D.CUIIO   AS  COL6,
    MAX(CASE WHEN  MR.CAPITOL IN (1) AND MR.RIND IN ('01') AND   CIS2.NVAL(D.COL1) = 1 THEN  1  
             WHEN  MR.CAPITOL IN (1) AND MR.RIND IN ('02') AND   CIS2.NVAL(D.COL1) = 1 THEN  2
             WHEN  MR.CAPITOL IN (1) AND MR.RIND IN ('03') AND   CIS2.NVAL(D.COL1) = 1 THEN  3
             WHEN  MR.CAPITOL IN (1) AND MR.RIND IN ('04') AND   CIS2.NVAL(D.COL1) = 1 THEN  4
             WHEN  MR.CAPITOL IN (1) AND MR.RIND IN ('05') AND   CIS2.NVAL(D.COL1) = 1 THEN  5
             WHEN  MR.CAPITOL IN (1) AND MR.RIND IN ('06') AND   CIS2.NVAL(D.COL1) = 1 THEN  6
             WHEN  MR.CAPITOL IN (1) AND MR.RIND IN ('07') AND   CIS2.NVAL(D.COL1) = 1 THEN  7  
    
    END) COL7,
     D.PACHET AS COL8

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
       
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CC.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (1)
  AND MR.RIND NOT  IN ('0')
  -------------------------------------------------
  GROUP BY 
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  MR.DENUMIRE,
  D.PACHET
  
  
  UNION 
  
  SELECT 
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    MR.DENUMIRE,
    '2' AS ORDINE, 
    NULL AS  COL1,
    NULL AS  COL2,
   ------------------------- 
    
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) COL3,
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) / CR.COL1 COL4,
    NULL AS COL5,
    ------------------------------
    NULL AS COL6,
    NULL AS COL7,
    D.PACHET AS COL8 

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        INNER  JOIN VW_CL_CUATM CT ON R.CUATM = CT.CODUL
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
         
        SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (409)
  AND MR.RIND  IN ('1')
  -------------------------------------------------
  GROUP BY 
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  MR.DENUMIRE,
  CR.COL1,
  D.PACHET
  
  
  UNION 
  
SELECT 
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    MR.DENUMIRE,
    '3' AS ORDINE, 
    NULL AS  COL1,
    NULL AS  COL2,
   ------------------------- 
    
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) COL3,
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) / CR.COL1 COL4,
    NULL AS COL5,
    ------------------------------
    NULL AS COL6,
    NULL AS COL7,
    D.PACHET AS COL8 

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        INNER  JOIN VW_CL_CUATM CT ON R.CUATM = CT.CODUL
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
        SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (409)
  AND MR.RIND  IN ('2')
  -------------------------------------------------
  GROUP BY 
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  MR.DENUMIRE,
  CR.COL1,
  D.PACHET  
  
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
NULL AS COL7,
COL8 AS COL8
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
  SUM(COL5) COL5,
  COL8
FROM
(
SELECT 
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
    NULL AS COL7,
    D.PACHET AS COL8

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        INNER  JOIN VW_CL_CUATM CT ON R.CUATM = CT.CODUL
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
        INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (409)
  AND MR.RIND NOT IN ('1','2')
  -------------------------------------------------
  GROUP BY 
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
  D.COL3,
  D.PACHET  
  
  UNION 
  
  SELECT 
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
    NULL AS COL7,
    D.PACHET AS COL8

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
       
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
        SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
       
        INNER JOIN   CIS2.VW_CL_TARI TT  ON (TT.CODUL=D.COL3)
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CC.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (409)
  AND MR.RIND NOT IN ('1','2')
  -------------------------------------------------
  GROUP BY 
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
  D.COL3,
  D.PACHET  
  
  
  
)
GROUP BY
  CODUL,
  FULL_CODE,
  DENUMIRE_CUATM,
  CUIIO,
  DENUMIRE,
  ORDINE,
  COL1,
  COL2,
  COL8
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
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    MR.DENUMIRE,
    '6' AS ORDINE, 
    NULL AS  COL1,
    NULL AS  COL2,
   ------------------------- 
    
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) COL3,
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) / CR.COL1 COL4,
    NULL AS COL5,
    ------------------------------
    NULL AS COL6,
    NULL AS COL7,
    D.PACHET AS COL8 

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        INNER  JOIN VW_CL_CUATM CT ON R.CUATM = CT.CODUL
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01')  
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (410)
  AND MR.RIND  IN ('1')
  -------------------------------------------------
  GROUP BY 
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  MR.DENUMIRE,
  CR.COL1,
  D.PACHET 
  
  
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
NULL AS COL7,
COL8
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
  SUM(COL5) COL5,
  COL8
FROM
(
SELECT 
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
    
    NULL AS COL6,
     
     D.PACHET AS COL8

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        INNER  JOIN VW_CL_CUATM CT ON R.CUATM = CT.CODUL
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
        SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
        
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (410)
  AND MR.RIND NOT  IN ('1')
  -------------------------------------------------
  GROUP BY 
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  SS.DENUMIRE,
  D.PACHET,
  D.COL1,
  D.COL3,
  CR.COL1
  
  UNION 
  
  SELECT 
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
    NULL AS COL6,
    D.PACHET AS COL8 

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        INNER  JOIN VW_CL_CUATM CT ON R.CUATM = CT.CODUL
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01')  
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        INNER JOIN   CIS2.VW_CL_TARI TT  ON (TT.CODUL=D.COL3)
        
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (410)
  AND MR.RIND NOT  IN ('1')
  -------------------------------------------------
  GROUP BY 
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  TT.DENUMIRE,
  D.PACHET, 
  D.COL1,
  D.COL3,
  CR.COL1
  
  
  
)
GROUP BY
  CODUL,
  FULL_CODE,
  DENUMIRE_CUATM,
  CUIIO,
  DENUMIRE,
  ORDINE,
  COL1,
  COL2,
  COL8
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
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    00000000 AS CUIIO,
    NULL DENUMIRE_CUIIO, 
    NULL RIND,
    SSS.DENUMIRE DENUMIRE,
    '9' AS ORDINE, 
    NULL AS COL1,
    NULL AS COL2,
    
   
    (SUM(CASE WHEN  MR.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL3,
    ---------------------------------------------------------------------------------------------------------------------
  
    
    (SUM(CASE WHEN  MR.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1
    AS COL4,
    
    
    NULL AS COL5,
    NULL AS COL6,
    NULL AS COL7,
    NULL AS COL8

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        INNER  JOIN VW_CL_CUATM CT ON R.CUATM = CT.CODUL
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
    
    INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (409,410)
  AND  SSS.CODUL IN ('0000000')
  -------------------------------------------------
  GROUP BY 
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  SSS.DENUMIRE,
  CR.COL1

  
  
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
       
      COL1, COL2, COL3,  COL4,  COL5, COL6, COL7
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
       
      CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7
    );
  END LOOP;
END;
  
  ;;"1";7;"";"";""
10508;"4";2008;46;2000;"Tab.5 b";"2";5.3;"1";DECLARE

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
    DF.COL4,
    DF.COL5,
    DF.COL6
    
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
 '000004' AS DECIMAL_POS,
  TRIM(A.DENUMIRE) NUME_ROW,
    A.COL7   COL1,
    A.COL1   COL2,
    A.COL2   COL3,
    A.COL3   COL4,
 
  
    ---------------------
    ROUND(A.COL4,0)   COL5,
   
   (
   
  SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
   
                              )  AS  COL6 
    
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
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    MR.DENUMIRE DENUMIRE,
    '1' AS ORDINE, 
    NULL   AS  COL1,
    NULL   AS  COL2,
    NULL   AS  COL3,
    NULL   AS  COL4,
    NULL   AS  COL5,
    D.CUIIO   AS  COL6,
    MAX(CASE WHEN  MR.CAPITOL IN (404) AND MR.RIND IN ('01') AND   CIS2.NVAL(D.COL1) = 1 THEN  1  
             WHEN  MR.CAPITOL IN (404) AND MR.RIND IN ('02') AND   CIS2.NVAL(D.COL1) = 1 THEN  2
             WHEN  MR.CAPITOL IN (404) AND MR.RIND IN ('03') AND   CIS2.NVAL(D.COL1) = 1 THEN  3
             WHEN  MR.CAPITOL IN (404) AND MR.RIND IN ('04') AND   CIS2.NVAL(D.COL1) = 1 THEN  4
             WHEN  MR.CAPITOL IN (404) AND MR.RIND IN ('05') AND   CIS2.NVAL(D.COL1) = 1 THEN  5
             WHEN  MR.CAPITOL IN (404) AND MR.RIND IN ('06') AND   CIS2.NVAL(D.COL1) = 1 THEN  6
             WHEN  MR.CAPITOL IN (404) AND MR.RIND IN ('07') AND   CIS2.NVAL(D.COL1) = 1 THEN  7  
    
    END) COL7

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
       
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CC.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (404)
  AND MR.RIND NOT  IN ('0')
  -------------------------------------------------
  GROUP BY 
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  MR.DENUMIRE
  
  
  UNION 
  
  SELECT 
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    MR.DENUMIRE,
    '2' AS ORDINE, 
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
        CROSS JOIN (
         
        SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (411)
  AND MR.RIND  IN ('1')
  -------------------------------------------------
  GROUP BY 
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  MR.DENUMIRE,
  CR.COL1 
  
  
  UNION 
  
SELECT 
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    MR.DENUMIRE,
    '3' AS ORDINE, 
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
        CROSS JOIN (
        SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (411)
  AND MR.RIND  IN ('2')
  -------------------------------------------------
  GROUP BY 
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  MR.DENUMIRE,
  CR.COL1 
  
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
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
        INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (411)
  AND MR.RIND NOT IN ('1','2')
  -------------------------------------------------
  GROUP BY 
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
  
  UNION 
  
  SELECT 
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
        CROSS JOIN (
        SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
       
        INNER JOIN   CIS2.VW_CL_TARI TT  ON (TT.CODUL=D.COL3)
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CC.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (411)
  AND MR.RIND NOT IN ('1','2')
  -------------------------------------------------
  GROUP BY 
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
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    MR.DENUMIRE,
    '6' AS ORDINE, 
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
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01')  
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (403)
  AND MR.RIND  IN ('1')
  -------------------------------------------------
  GROUP BY 
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  MR.DENUMIRE,
  CR.COL1
  
  
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
        CROSS JOIN (
        SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
        
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (403)
  AND MR.RIND NOT  IN ('1')
  -------------------------------------------------
  GROUP BY 
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
  
  UNION 
  
  SELECT 
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
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01')  
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        INNER JOIN   CIS2.VW_CL_TARI TT  ON (TT.CODUL=D.COL3)
        
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (403)
  AND MR.RIND NOT  IN ('1')
  -------------------------------------------------
  GROUP BY 
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
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    00000000 AS CUIIO,
    NULL DENUMIRE_CUIIO, 
    NULL RIND,
    SSS.DENUMIRE DENUMIRE,
    '9' AS ORDINE, 
    NULL AS COL1,
    NULL AS COL2,
    
   
    (SUM(CASE WHEN  MR.CAPITOL IN (411)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (403)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL3,
    ---------------------------------------------------------------------------------------------------------------------
  
    
    (SUM(CASE WHEN  MR.CAPITOL IN (411)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (403)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1
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
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (411,403)
  AND  SSS.CODUL IN ('0000000')
  -------------------------------------------------
  GROUP BY 
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  SSS.DENUMIRE,
  CR.COL1

  
  
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
    '4030000',
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
       
      COL1, COL2, COL3,  COL4,  COL5, COL6
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
       
      CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6
    );
  END LOOP;
END;
  
  ;;"1";6;"";"";""
9524;"4.1";2008;46;2000;"Tab.5 b - Pachete";"2";5.4;"1";DECLARE

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
    DF.COL4,
    DF.COL5,
    DF.COL6,
    DF.COL7
    
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
 '0000000' AS DECIMAL_POS,
  TRIM(A.DENUMIRE) NUME_ROW,
   A.COL8   COL1,
    A.COL7   COL2,
    A.COL1   COL3,
    A.COL2   COL4,
 
  
    ---------------------
    ROUND(A.COL3,0)   COL5,
    ROUND(A.COL4,0)   COL6,
   
   (
   
  SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
   
                              )  AS  COL7 
    
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
    MAX(COL7)  COL7,
    MAX(COL8)  COL8
FROM
(
SELECT 
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    MR.DENUMIRE DENUMIRE,
    '1' AS ORDINE, 
    NULL   AS  COL1,
    NULL   AS  COL2,
    NULL   AS  COL3,
    NULL   AS  COL4,
    NULL   AS  COL5,
    D.CUIIO   AS  COL6,
    MAX(CASE WHEN  MR.CAPITOL IN (404) AND MR.RIND IN ('01') AND   CIS2.NVAL(D.COL1) = 1 THEN  1  
             WHEN  MR.CAPITOL IN (404) AND MR.RIND IN ('02') AND   CIS2.NVAL(D.COL1) = 1 THEN  2
             WHEN  MR.CAPITOL IN (404) AND MR.RIND IN ('03') AND   CIS2.NVAL(D.COL1) = 1 THEN  3
             WHEN  MR.CAPITOL IN (404) AND MR.RIND IN ('04') AND   CIS2.NVAL(D.COL1) = 1 THEN  4
             WHEN  MR.CAPITOL IN (404) AND MR.RIND IN ('05') AND   CIS2.NVAL(D.COL1) = 1 THEN  5
             WHEN  MR.CAPITOL IN (404) AND MR.RIND IN ('06') AND   CIS2.NVAL(D.COL1) = 1 THEN  6
             WHEN  MR.CAPITOL IN (404) AND MR.RIND IN ('07') AND   CIS2.NVAL(D.COL1) = 1 THEN  7  
    
    END) COL7,
     D.PACHET AS COL8

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
       
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CC.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (404)
  AND MR.RIND NOT  IN ('0')
  -------------------------------------------------
  GROUP BY 
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  MR.DENUMIRE,
  D.PACHET
  
  
  UNION 
  
  SELECT 
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    MR.DENUMIRE,
    '2' AS ORDINE, 
    NULL AS  COL1,
    NULL AS  COL2,
   ------------------------- 
    
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) COL3,
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) / CR.COL1 COL4,
    NULL AS COL5,
    ------------------------------
    NULL AS COL6,
    NULL AS COL7,
    D.PACHET AS COL8 

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        INNER  JOIN VW_CL_CUATM CT ON R.CUATM = CT.CODUL
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
         
        SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (411)
  AND MR.RIND  IN ('1')
  -------------------------------------------------
  GROUP BY 
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  MR.DENUMIRE,
  CR.COL1,
  D.PACHET
  
  
  UNION 
  
SELECT 
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    MR.DENUMIRE,
    '3' AS ORDINE, 
    NULL AS  COL1,
    NULL AS  COL2,
   ------------------------- 
    
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) COL3,
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) / CR.COL1 COL4,
    NULL AS COL5,
    ------------------------------
    NULL AS COL6,
    NULL AS COL7,
    D.PACHET AS COL8 

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        INNER  JOIN VW_CL_CUATM CT ON R.CUATM = CT.CODUL
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
        SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (411)
  AND MR.RIND  IN ('2')
  -------------------------------------------------
  GROUP BY 
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  MR.DENUMIRE,
  CR.COL1,
  D.PACHET  
  
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
NULL AS COL7,
COL8 AS COL8
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
  SUM(COL5) COL5,
  COL8
FROM
(
SELECT 
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
    NULL AS COL7,
    D.PACHET AS COL8

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        INNER  JOIN VW_CL_CUATM CT ON R.CUATM = CT.CODUL
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
        INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (411)
  AND MR.RIND NOT IN ('1','2')
  -------------------------------------------------
  GROUP BY 
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
  D.COL3,
  D.PACHET  
  
  UNION 
  
  SELECT 
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
    NULL AS COL7,
    D.PACHET AS COL8

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
       
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
        SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
       
        INNER JOIN   CIS2.VW_CL_TARI TT  ON (TT.CODUL=D.COL3)
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CC.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (411)
  AND MR.RIND NOT IN ('1','2')
  -------------------------------------------------
  GROUP BY 
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
  D.COL3,
  D.PACHET  
  
  
  
)
GROUP BY
  CODUL,
  FULL_CODE,
  DENUMIRE_CUATM,
  CUIIO,
  DENUMIRE,
  ORDINE,
  COL1,
  COL2,
  COL8
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
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    MR.DENUMIRE,
    '6' AS ORDINE, 
    NULL AS  COL1,
    NULL AS  COL2,
   ------------------------- 
    
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) COL3,
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) / CR.COL1 COL4,
    NULL AS COL5,
    ------------------------------
    NULL AS COL6,
    NULL AS COL7,
    D.PACHET AS COL8 

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        INNER  JOIN VW_CL_CUATM CT ON R.CUATM = CT.CODUL
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01')  
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (403)
  AND MR.RIND  IN ('1')
  -------------------------------------------------
  GROUP BY 
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  MR.DENUMIRE,
  CR.COL1,
  D.PACHET 
  
  
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
NULL AS COL7,
COL8
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
  SUM(COL5) COL5,
  COL8
FROM
(
SELECT 
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
    
    NULL AS COL6,
     
     D.PACHET AS COL8

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        INNER  JOIN VW_CL_CUATM CT ON R.CUATM = CT.CODUL
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
        SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
        
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (403)
  AND MR.RIND NOT  IN ('1')
  -------------------------------------------------
  GROUP BY 
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  SS.DENUMIRE,
  D.PACHET,
  D.COL1,
  D.COL3,
  CR.COL1
  
  UNION 
  
  SELECT 
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
    NULL AS COL6,
    D.PACHET AS COL8 

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        INNER  JOIN VW_CL_CUATM CT ON R.CUATM = CT.CODUL
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01')  
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        INNER JOIN   CIS2.VW_CL_TARI TT  ON (TT.CODUL=D.COL3)
        
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (403)
  AND MR.RIND NOT  IN ('1')
  -------------------------------------------------
  GROUP BY 
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  TT.DENUMIRE,
  D.PACHET, 
  D.COL1,
  D.COL3,
  CR.COL1
  
  
  
)
GROUP BY
  CODUL,
  FULL_CODE,
  DENUMIRE_CUATM,
  CUIIO,
  DENUMIRE,
  ORDINE,
  COL1,
  COL2,
  COL8
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
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    00000000 AS CUIIO,
    NULL DENUMIRE_CUIIO, 
    NULL RIND,
    SSS.DENUMIRE DENUMIRE,
    '9' AS ORDINE, 
    NULL AS COL1,
    NULL AS COL2,
    
   
    (SUM(CASE WHEN  MR.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL3,
    ---------------------------------------------------------------------------------------------------------------------
  
    
    (SUM(CASE WHEN  MR.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1
    AS COL4,
    
    
    NULL AS COL5,
    NULL AS COL6,
    NULL AS COL7,
    NULL AS COL8

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        INNER  JOIN VW_CL_CUATM CT ON R.CUATM = CT.CODUL
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
    
    INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (411,403)
  AND  SSS.CODUL IN ('0000000')
  -------------------------------------------------
  GROUP BY 
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  SSS.DENUMIRE,
  CR.COL1

  
  
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
       
      COL1, COL2, COL3,  COL4,  COL5, COL6, COL7
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
       
      CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7
    );
  END LOOP;
END;
  
  ;;"1";7;"";"";""
9507;"5";2008;46;2000;"Tab. 6";"2";6;"1";DECLARE

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
    DF.COL4
    
  

   
FROM 
(


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
     C.ORDINE NR_ROW,
     C.ORDINE   AS ORDINE,
     '1111' AS DECIMAL_POS,
     c.denumire NUME_ROW,
     ROUND(R.COL1 / 1000,1)   AS COL1,
     ROUND(R.COL2 / 1000,1)   AS COL2,
     ROUND(R.COL3 / 1000,1)   AS COL3,
     ROUND(R.COL4 / 1000,1)   AS COL4
  FROM 

  (
           SELECT   
            c.codul,
            c.denumire,
            c.grupa,
            ROWNUM ordine,
            c.full_code
            
            FROM CIS2.VW_CL_CAEM2 C
            
            WHERE 
            C.CODUL LIKE '%0000'
            
            ORDER BY 
            c.full_code
            ) C 
            LEFT JOIN
            
            (
            
            SELECT 
    CC.CODUL,
    CC.DENUMIRE, 
    SUM(CASE WHEN  D.CAPITOL IN (409)  AND D.RIND IN ('1') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )   AS COL1,
 
    ROUND(SUM(CASE WHEN  D.CAPITOL IN (409)  AND D.RIND IN ('1') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ) / CR.COL1,0)   AS COL2,
    
    SUM(CASE WHEN  D.CAPITOL IN (411)  AND D.RIND IN ('1') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  AS COL3,
    
    ROUND(SUM(CASE WHEN  D.CAPITOL IN (411)  AND D.RIND IN ('1') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  / CR.COL1,0)  AS COL4
 

 FROM
    
    CIS2.VW_DATA_ALL D 
    
         INNER JOIN     CIS2.VW_CL_CAEM2 C  ON  (C.CODUL=D.CAEM2)
         INNER JOIN     CIS2.VW_CL_CAEM2 CC  ON (C.FULL_CODE LIKE '%' ||CC.CODUL||';%' )   
         INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
      -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') )  CR
        ------------------------------------------------------------------------------       
      

WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND D.CAPITOL IN (409,411)  AND D.RIND IN ('1')
  
 AND CC.CODUL LIKE '%0000'

  
  GROUP BY 
  CC.CODUL,
  CC.DENUMIRE,
  CC.FULL_CODE,
  CR.COL1 
  
  ORDER BY 
  CC.FULL_CODE
   
   
   )     R  ON (R.CODUL = C.CODUL)
            
           
   
   ORDER BY 
   C.ORDINE
   
   
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
       
      COL1, COL2, COL3,  COL4
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
       
      CR.COL1, CR.COL2, CR.COL3, CR.COL4
    );
  END LOOP;
END;
  
  
   ;;"1";4;"";"";""
9518;"6";2008;46;2000;"Tab. 8 ";"2";8;"1";DECLARE CURSOR C IS
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
    DF.COL4
    FROM  ( 
    
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
        ''||'~'||TTT.ORDINE||SUM(ROWNUM)  AS NR_ROW, 
     TTT.ORDINE  AS ORDINE,  
     '1111' AS DECIMAL_POS,
     TTT.DENUMIRE NUME_ROW, 
     ROUND((SUM(CASE WHEN  MC.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   +
     SUM(CASE WHEN  MC.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END ))/1000,1) AS COL1,
     ROUND(((SUM(CASE WHEN  MC.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) +
     SUM(CASE WHEN  MC.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)) / CR.COL1 )/1000,1) AS COL2,
     ROUND((SUM(CASE WHEN  MC.CAPITOL IN (411)  AND MR.RIND NOT IN ('1','2','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) +
     SUM(CASE WHEN  MC.CAPITOL IN (403)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END ))/1000,1) AS COL3,
     ROUND(((SUM(CASE WHEN  MC.CAPITOL IN (411)  AND MR.RIND NOT IN ('1','2','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) +
     SUM(CASE WHEN  MC.CAPITOL IN (403)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END )  ) / CR.COL1)/1000,1) AS COL4
     FROM DATA_ALL D
          INNER JOIN RENIM RN ON D.CUIIO = RN.CUIIO AND D.CUIIO_VERS = RN.CUIIO_VERS
          INNER  JOIN VW_CL_CUATM CT ON RN.CUATM = CT.CODUL
          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
          INNER  JOIN MD_CAPITOL MC ON MR.CAPITOL = MC.CAPITOL AND MR.CAPITOL_VERS = MC.CAPITOL_VERS
          INNER JOIN   CIS2.VW_CL_TARI TT  ON (TT.CODUL=D.COL3)
          INNER JOIN   CIS2.VW_CL_TARI TTT ON (TT.FULL_CODE LIKE '%' ||TTT.CODUL||';%' )  
        -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') ) CR
        ------------------------------------------------------------------------------   
WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46)  AND
  MC.CAPITOL IN (409,410,411,403)
  GROUP BY
  TTT.ORDINE,
  TTT.FULL_CODE,
  TTT.DENUMIRE,
  CR.COL1 
  
  ) DF;
  BEGIN
  FOR CR IN C
  LOOP
    INSERT INTO  CIS2.TABLE_OUT (
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
      COL1, COL2, COL3,  COL4 )
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
      CR.COL1, CR.COL2, CR.COL3, CR.COL4
    );
  END LOOP;
END;
  
  ;;"1";4;"";"";""
9519;"7";2008;46;2000;"Tab.10 ";"2";10.02;"1";DECLARE
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
    DF.COL4   
FROM 
(
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
CASE WHEN     CODUL IN (
        SELECT 
        CODUL
          FROM CIS2.CL_TARI
        )       THEN  ' '||'~'||ROWNUM ELSE      REPLACE(SUBSTR(CODUL,3,9),0)||'~'||ROWNUM  END NR_ROW,
ROWNUM ORDINE,
 '1111' AS DECIMAL_POS,
DENUMIRE NUME_ROW,
COL1,
COL2,
COL3,
COL4
FROM
(
 SELECT  
    CODUL,
    DENUMIRE,
    COL1,
    COL2,
    COL3,
    COL4
   FROM 
 (
SELECT 
     '1' ORDINE,
     TTT.ORDINE  ORDINE_CL, 
     TTT.DENUMIRE,
     TTT.CODUL CODUL,
     TTT.FULL_CODE,
    ROUND((SUM(CASE WHEN  MC.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   +
     SUM(CASE WHEN  MC.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END ))/1000,1) AS COL1,
     ROUND(((SUM(CASE WHEN  MC.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) +
     SUM(CASE WHEN  MC.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)) / CR.COL1 )/1000,1) AS COL2,
     ROUND((SUM(CASE WHEN  MC.CAPITOL IN (411)  AND MR.RIND NOT IN ('1','2','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) +
     SUM(CASE WHEN  MC.CAPITOL IN (403)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END ))/1000,1) AS COL3,
     ROUND(((SUM(CASE WHEN  MC.CAPITOL IN (411)  AND MR.RIND NOT IN ('1','2','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) +
     SUM(CASE WHEN  MC.CAPITOL IN (403)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END )  ) / CR.COL1)/1000,1) AS COL4
    FROM CIS2.DATA_ALL D 
      -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01')                      
                              
                              ) CR
        ------------------------------------------------------------------------------      
       INNER JOIN   CIS2.VW_CL_TARI TT ON (TT.CODUL=D.COL3)
       INNER JOIN   (
       SELECT c.codul,
            c.denumire,
            c.grupa,
            c.ordine,
            c.full_code
       FROM (SELECT c1.codul,
                    c1.denumire,
                    c1.grupa,
                    c1.ordine,
                       TRIM (TO_CHAR (c3.codul, '000'))
                    || ';'
                    || DECODE (c3.codul,
                               c2.codul, '',
                               TRIM (TO_CHAR (c2.codul, '000')) || ';')
                    || DECODE (c2.codul,
                               c1.codul, '',
                               TRIM (TO_CHAR (c1.codul, '000')) || ';')
                       AS full_code
               FROM (
              SELECT 
              RIND    CODUL, 
              DENUMIRE, 
              RINDOUT  GRUPA,
              ORDINE
   FROM  CIS2.MD_RIND_OUT
         WHERE 
         ID_MDTABLE IN (8170) 
             ) c1
                    INNER JOIN  (
                 SELECT 
                   RIND    CODUL, 
                   DENUMIRE, 
                   RINDOUT  GRUPA,
                   ORDINE
                FROM  CIS2.MD_RIND_OUT
                  WHERE 
               ID_MDTABLE IN (8170) )
                     c2 ON (c1.grupa = c2.codul)
                    INNER JOIN (
          SELECT 
           RIND    CODUL, 
           DENUMIRE, 
           RINDOUT  GRUPA,
           ORDINE
            FROM  CIS2.MD_RIND_OUT
             WHERE 
              ID_MDTABLE IN (8170) 
                      ) c3 ON (c2.grupa = c3.codul)) c
   ORDER BY c.ordine, c.full_code
       
       ) TTT ON (TT.FULL_CODE LIKE '%' ||TTT.CODUL||';%' )  
       
         INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
         INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
         INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
         INNER  JOIN MD_CAPITOL MC ON MR.CAPITOL = MC.CAPITOL AND MR.CAPITOL_VERS = MC.CAPITOL_VERS
             
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46)
  AND
  MR.CAPITOL IN (409,410,411,403)
  AND TTT.CODUL NOT IN ('555','444')
   GROUP BY
  TTT.DENUMIRE,
  TTT.CODUL,
  TTT.FULL_CODE,
  TTT.ORDINE,
  CR.COL1
 
 UNION ALL
  SELECT 
    '2' ORDINE,
      TTT.ORDINE  ORDINE_CL, 
     SSS.DENUMIRE,
     2||'_'||SSS.CODUL,
     TTT.FULL_CODE,
     ROUND((SUM(CASE WHEN  MC.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   +
     SUM(CASE WHEN  MC.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END ))/1000,1) AS COL1,
     ROUND(((SUM(CASE WHEN  MC.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) +
     SUM(CASE WHEN  MC.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)) / CR.COL1 )/1000,1) AS COL2,
     ROUND((SUM(CASE WHEN  MC.CAPITOL IN (411)  AND MR.RIND NOT IN ('1','2','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) +
     SUM(CASE WHEN  MC.CAPITOL IN (403)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END ))/1000,1) AS COL3,
     ROUND(((SUM(CASE WHEN  MC.CAPITOL IN (411)  AND MR.RIND NOT IN ('1','2','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) +
     SUM(CASE WHEN  MC.CAPITOL IN (403)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END )  ) / CR.COL1)/1000,1) AS COL4
     
     FROM CIS2.DATA_ALL D  
      -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        INNER JOIN   CIS2.VW_CL_TARI TT ON (TT.CODUL=D.COL3)
       INNER JOIN   (
       SELECT c.codul,
            c.denumire,
            c.grupa,
            c.ordine,
            c.full_code
       FROM (SELECT c1.codul,
                    c1.denumire,
                    c1.grupa,
                    c1.ordine,
                       TRIM (TO_CHAR (c3.codul, '000'))
                    || ';'
                    || DECODE (c3.codul,
                               c2.codul, '',
                               TRIM (TO_CHAR (c2.codul, '000')) || ';')
                    || DECODE (c2.codul,
                               c1.codul, '',
                               TRIM (TO_CHAR (c1.codul, '000')) || ';')
                       AS full_code
               FROM (
              SELECT 
              RIND    CODUL, 
              DENUMIRE, 
              RINDOUT  GRUPA,
              ORDINE
   FROM  CIS2.MD_RIND_OUT
         WHERE 
         ID_MDTABLE IN (8170) 
             ) c1
                    INNER JOIN  (
                 SELECT 
                   RIND    CODUL, 
                   DENUMIRE, 
                   RINDOUT  GRUPA,
                   ORDINE
                FROM  CIS2.MD_RIND_OUT
                  WHERE 
               ID_MDTABLE IN (8170) )
                     c2 ON (c1.grupa = c2.codul)
                    INNER JOIN (
          SELECT 
           RIND    CODUL, 
           DENUMIRE, 
           RINDOUT  GRUPA,
           ORDINE
            FROM  CIS2.MD_RIND_OUT
             WHERE 
              ID_MDTABLE IN (8170) 
                      ) c3 ON (c2.grupa = c3.codul)) c
   ORDER BY c.ordine, c.full_code
       
       ) TTT ON (TT.FULL_CODE LIKE '%' ||TTT.CODUL||';%' )    
         
         
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
         INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
         INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
         INNER JOIN   CIS2.VW_CL_SERVICII SS ON ((RTRIM(SS.CODUL,'0') )=D.COL1)     
         INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )    
         INNER  JOIN MD_CAPITOL MC ON MR.CAPITOL = MC.CAPITOL AND MR.CAPITOL_VERS = MC.CAPITOL_VERS
       -----------------------------------------------------------------------------
  WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46)  AND
  MR.CAPITOL IN (409,410,411,403) AND 
  TTT.CODUL NOT IN ('555','444','000') AND 
  SSS.CODUL NOT IN ('0000000')
      GROUP BY
      TTT.CODUL, 
      TTT.ORDINE,
      SSS.DENUMIRE,
      SSS.CODUL,
      TTT.FULL_CODE,
      CR.COL1 )
ORDER BY 
    ORDINE_CL,
    FULL_CODE,
    ORDINE,
    CODUL )  
    
    ) DF ;
   
    BEGIN

  FOR CR IN C
  
  LOOP
    INSERT INTO     CIS2.TABLE_OUT
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
      COL1, COL2, COL3,  COL4
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
       
      CR.COL1, CR.COL2, CR.COL3, CR.COL4
    );
  END LOOP;
END;
  
  ;;"1";4;"";"";""
10523;"8";2008;46;2000;"Tab.12. Dupa fiecare codul serviciilor";"2";12.61;"1";DECLARE

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
    DF.COL5,
    DF.COL6,
    DF.COL7
    
  

   
FROM 
(



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
     CUIIO||'~'|| ROWNUM/0.123 NR_ROW,
     ROWNUM  AS ORDINE,
     '0000000' AS DECIMAL_POS,
     DENUMIRE NUME_ROW,
     TO_NUMBER(SERV_CODUL) COL1,
     ROUND(COL1,0) COL2,
     ROUND(COL2,0) COL3,
     ROUND(COL3,0) COL4,
     ROUND(COL4,0) COL5,
     ROUND(COL5,0) COL6,
     ROUND(COL6,0) COL7
FROM
(

SELECT 
   '1' ORDINE,

    A.CUIIO, 
    A.SERV_CODUL,
    A.DENUMIRE,
    
    SUM(A.COL1)  AS COL1,
    SUM(A.COL2)  AS COL2,
    SUM(B.COL1)  AS COL3,
    SUM(B.COL2)  AS COL4,
    SUM(A.COL1) - SUM(B.COL1) AS COL5,
    SUM(A.COL2) - SUM(B.COL2) AS COL6

FROM 
(
SELECT 
   00000000 AS CUIIO,
    '0'   SERV_CODUL, 
   
    SSS.DENUMIRE DENUMIRE,
    
    
   
    (SUM(CASE WHEN  MR.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    ---------------------------------------------------------------------------------------------------------------------
  
    
    (SUM(CASE WHEN  MR.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1
    AS COL2
    
    
    
FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
    
      
        
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
    
    INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (409,410)
  AND  SSS.CODUL IN ('0000000')
  -------------------------------------------------
  GROUP BY 

   SSS.CODUL,
   
  SSS.DENUMIRE,
  CR.COL1
  ) A INNER JOIN (
  
  SELECT 
 CUIIO,
 SERV_CODUL,
 DENUMIRE,
 SUM(COL1) AS COL1,
SUM(COL2) AS COL2

 
FROM
 
(
SELECT 
    D.PERIOADA,
    00000000 AS CUIIO,
    '0'   SERV_CODUL, 
    SSS.DENUMIRE DENUMIRE,
    
  
   (SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    
    
    ROUND((SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1,0)
    AS COL2
        
 
   
     
          
    FROM
    
     CIS2.VW_DATA_ALL D 
     
    INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 ) 
    
    INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )
   
    LEFT JOIN (
    
    SELECT
            
            D.PERIOADA,
            SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) THEN D.COL1 ELSE NULL  END ) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                          INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
                      
                        WHERE
                              P.PERIOADA_ANULA = :pPERIOADA AND            
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01')
            
            GROUP BY 
            D.PERIOADA 
    )    CR  ON (D.PERIOADA=CR.PERIOADA)

           
           
   WHERE        
   
  (D.FORM = 44) AND
  (D.FORM_VERS = 1004) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  
  (D.FORM IN (44) AND D.CAPITOL IN (405,406)) AND 
 
  P.PERIOADA_ANULA = :pPERIOADA
 
   AND SSS.CODUL IN ('0000000')
  -- AND CC.CODUL IN ('0000000')

  GROUP BY  
  D.PERIOADA,
  SSS.DENUMIRE,
  CR.COL1
  )
  
  GROUP BY 
   CUIIO,
 SERV_CODUL,
 DENUMIRE

 
  
  )  B ON (B.CUIIO = B.CUIIO)
  
  
  
  GROUP BY 
  

     A.CUIIO,
     A.SERV_CODUL,
     A.DENUMIRE    


     UNION 
     
     
     SELECT
    '2' ORDINE, 

    A.CUIIO, 
    A.SERV_CODUL,
    A.DENUMIRE,
    
    SUM(A.COL1)  AS COL1,
    SUM(A.COL2)  AS COL2,
    SUM(B.COL1)  AS COL3,
    SUM(B.COL2)  AS COL4,
    SUM(A.COL1) - SUM(B.COL1) AS COL5,
    SUM(A.COL2) - SUM(B.COL2) AS COL6
FROM 

(

SELECT 
    D.CUIIO AS CUIIO,
    SS.CODUL   SERV_CODUL, 
    SS.DENUMIRE||'-'||MAX(R.DENUMIRE) DENUMIRE,
    
    
   
    (SUM(CASE WHEN  MR.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    ---------------------------------------------------------------------------------------------------------------------
  
    
    (SUM(CASE WHEN  MR.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1
    AS COL2
    
    
    
FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
    
      
        
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
    
  
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (409,410)
 
 AND SS.CODUL <> '0'
  -------------------------------------------------
  GROUP BY 

  D.CUIIO,
  SS.CODUL,
  SS.DENUMIRE,
  CR.COL1
 
  
  )  A  LEFT JOIN 
  
  (
  
  SELECT 
 CUIIO,
 SERV_CODUL,
 MAX(DENUMIRE)  DENUMIRE,
 SUM(COL1) AS COL1,
SUM(COL2) AS COL2

 
FROM
 
(
SELECT 
    D.PERIOADA,
    D.CUIIO AS CUIIO,
    SS.CODUL   SERV_CODUL, 
    SS.DENUMIRE||'-'||MAX(R.DENUMIRE) DENUMIRE,
    
  
   (SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    
    
    ROUND((SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1,0)
    AS COL2
        
 
   
     
          
    FROM
    
     CIS2.VW_DATA_ALL D 
     
    INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 ) 
    
   INNER JOIN CIS2.RENIM R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS) 
   
    LEFT JOIN (
    
    SELECT
            
            D.PERIOADA,
            SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) THEN D.COL1 ELSE NULL  END ) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                          INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
                      
                        WHERE
                              P.PERIOADA_ANULA = :pPERIOADA AND            
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01')
            
            GROUP BY 
            D.PERIOADA 
    )    CR  ON (D.PERIOADA=CR.PERIOADA)

           
           
   WHERE        
   
  (D.FORM = 44) AND
  (D.FORM_VERS = 1004) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  
  (D.FORM IN (44) AND D.CAPITOL IN (405,406)) AND 
 
  P.PERIOADA_ANULA = :pPERIOADA
 
   AND SS.CODUL <> '0'
   
   
  

  GROUP BY  
  D.PERIOADA,
  D.CUIIO,
  SS.CODUL,
  SS.DENUMIRE,
  CR.COL1
  )
  
  GROUP BY 
   CUIIO,
 SERV_CODUL
 
 --,
 --DENUMIRE

  
  
  ) B ON (B.CUIIO = A.CUIIO  AND B.SERV_CODUL  = A.SERV_CODUL)
  
  
  
  GROUP BY 

    A.CUIIO, 
    A.SERV_CODUL,
    A.DENUMIRE
    
    
  
    )

        
        
        
        
        
        
        
        
        
  ) DF
  
  ;
   
    BEGIN

  FOR CR IN C
  
  LOOP
   INSERT INTO   -- USER_BANCU.TABLE_OUT_TEST 
    
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
       
      COL1, COL2, COL3,  COL4, COL5, COL6, COL7
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
       
      CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7
    );
  END LOOP;
END;;;"1";7;"";"";""
9521;"8";2008;46;2000;"Tab.12. Dupa fiecare codul serviciilor - Pachet";"2";12.6101;"1";DECLARE

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
    DF.COL5,
    DF.COL6,
    DF.COL7,
    DF.COL8
    
  

   
FROM 
(






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
     CUIIO||'~'|| ROWNUM/0.123 NR_ROW,
     ROWNUM  AS ORDINE,
     '00000000' AS DECIMAL_POS,
     DENUMIRE NUME_ROW,
     TO_NUMBER(PACHET) COL1,
     TO_NUMBER(SERV_CODUL) COL2,
     ROUND(COL1,0) COL3,
     ROUND(COL2,0) COL4,
     ROUND(COL3,0) COL5,
     ROUND(COL4,0) COL6,
     ROUND(COL5,0) COL7,
     ROUND(COL6,0) COL8
FROM
(

SELECT 
   '1' ORDINE,

    A.CUIIO, 
    NULL PACHET,
    A.SERV_CODUL,
    A.DENUMIRE,
    
    SUM(A.COL1)  AS COL1,
    SUM(A.COL2)  AS COL2,
    SUM(B.COL1)  AS COL3,
    SUM(B.COL2)  AS COL4,
    SUM(A.COL1) - SUM(B.COL1) AS COL5,
    SUM(A.COL2) - SUM(B.COL2) AS COL6

FROM 
(
SELECT 
   00000000 AS CUIIO,
    '0'   SERV_CODUL, 
   
    SSS.DENUMIRE DENUMIRE,
    
    
   
    (SUM(CASE WHEN  MR.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    ---------------------------------------------------------------------------------------------------------------------
  
    
    (SUM(CASE WHEN  MR.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1
    AS COL2
    
    
    
FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
    
      
        
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
    
    INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (409,410)
  AND  SSS.CODUL IN ('0000000')
  -------------------------------------------------
  GROUP BY 

   SSS.CODUL,
   
  SSS.DENUMIRE,
  CR.COL1
  ) A INNER JOIN (
  
  SELECT 
 CUIIO,
 SERV_CODUL,
 DENUMIRE,
 SUM(COL1) AS COL1,
SUM(COL2) AS COL2

 
FROM
 
(
SELECT 
    D.PERIOADA,
    00000000 AS CUIIO,
    '0'   SERV_CODUL, 
    SSS.DENUMIRE DENUMIRE,
    
  
   (SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    
    
    ROUND((SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1,0)
    AS COL2
        
 
   
     
          
    FROM
    
     CIS2.VW_DATA_ALL D 
     
    INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 ) 
    
    INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )
   
    LEFT JOIN (
    
    SELECT
            
            D.PERIOADA,
            SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) THEN D.COL1 ELSE NULL  END ) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                          INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
                      
                        WHERE
                              P.PERIOADA_ANULA = :pPERIOADA AND            
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01')
            
            GROUP BY 
            D.PERIOADA 
    )    CR  ON (D.PERIOADA=CR.PERIOADA)

           
           
   WHERE        
   
  (D.FORM = 44) AND
  (D.FORM_VERS = 1004) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  
  (D.FORM IN (44) AND D.CAPITOL IN (405,406)) AND 
 
  P.PERIOADA_ANULA = :pPERIOADA
 
   AND SSS.CODUL IN ('0000000')
  -- AND CC.CODUL IN ('0000000')

  GROUP BY  
  D.PERIOADA,
  SSS.DENUMIRE,
  CR.COL1
  )
  
  GROUP BY 
   CUIIO,
 SERV_CODUL,
 DENUMIRE

 
  
  )  B ON (B.CUIIO = B.CUIIO)
  
  
  
  GROUP BY 
  

     A.CUIIO,
     A.SERV_CODUL,
     A.DENUMIRE
     
     
     
     UNION 
     
     
     SELECT
    '2' ORDINE, 

    A.CUIIO, 
    A.PACHET,
    A.SERV_CODUL,
    A.DENUMIRE,
    
    SUM(A.COL1)  AS COL1,
    SUM(A.COL2)  AS COL2,
    SUM(B.COL1)  AS COL3,
    SUM(B.COL2)  AS COL4,
    SUM(A.COL1) - SUM(B.COL1) AS COL5,
    SUM(A.COL2) - SUM(B.COL2) AS COL6
FROM 

(

SELECT 
L.CUIIO,
R.PACHET,
L.SERV_CODUL,
L.DENUMIRE,
L.COL1,
L.COL2



FROM 
(
SELECT 
    D.CUIIO AS CUIIO,
   
    SS.CODUL   SERV_CODUL, 
    SS.DENUMIRE||'-'||MAX(R.DENUMIRE) DENUMIRE,
    
    
   
    (SUM(CASE WHEN  MR.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    ---------------------------------------------------------------------------------------------------------------------
  
    
    (SUM(CASE WHEN  MR.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1
    AS COL2
    
    
    
FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
    
      
        
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
    
  
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (409,410)
 
 AND SS.CODUL <> '0'
  -------------------------------------------------
  GROUP BY 

  D.CUIIO,

  SS.CODUL,
  SS.DENUMIRE,
  CR.COL1
  ) L LEFT JOIN (
         SELECT 
                    DISTINCT  D.CUIIO,
                    D.PACHET
                    FROM CIS2.DATA_ALL  D 
                                INNER JOIN MD_RIND  R ON R.ID_MD = D.ID_MD 
                    
                    WHERE 
                    D.FORM = 46
                    AND D.PERIOADA IN(:pPERIOADA)
                    AND R.CAPITOL IN  (1)
                   
   
   )  R ON R.CUIIO = L.CUIIO
 
  
  )  A  LEFT JOIN 
  
  (
  
  SELECT 
 CUIIO,
 SERV_CODUL,
 MAX(DENUMIRE)  DENUMIRE,
 SUM(COL1) AS COL1,
SUM(COL2) AS COL2

 
FROM
 
(
SELECT 
    D.PERIOADA,
    D.CUIIO AS CUIIO,
    SS.CODUL   SERV_CODUL, 
    SS.DENUMIRE||'-'||MAX(R.DENUMIRE) DENUMIRE,
    
  
   (SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    
    
    ROUND((SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1,0)
    AS COL2
        
 
   
     
          
    FROM
    
     CIS2.VW_DATA_ALL D 
     
    INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 ) 
    
   INNER JOIN CIS2.RENIM R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS) 
   
    LEFT JOIN (
    
    SELECT
            
            D.PERIOADA,
            SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) THEN D.COL1 ELSE NULL  END ) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                          INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
                      
                        WHERE
                              P.PERIOADA_ANULA = :pPERIOADA AND            
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01')
            
            GROUP BY 
            D.PERIOADA 
    )    CR  ON (D.PERIOADA=CR.PERIOADA)

           
           
   WHERE        
   
  (D.FORM = 44) AND
  (D.FORM_VERS = 1004) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  
  (D.FORM IN (44) AND D.CAPITOL IN (405,406)) AND 
 
  P.PERIOADA_ANULA = :pPERIOADA
 
   AND SS.CODUL <> '0'
   
   
  

  GROUP BY  
  D.PERIOADA,
  D.CUIIO,
  SS.CODUL,
  SS.DENUMIRE,
  CR.COL1
  )
  
  GROUP BY 
   CUIIO,
 SERV_CODUL
 --,
 --DENUMIRE

  
  
  ) B ON (B.CUIIO = A.CUIIO  AND B.SERV_CODUL  = A.SERV_CODUL)
  
  
  
  GROUP BY 

    A.CUIIO, 
    A.PACHET,
    A.SERV_CODUL,
    A.DENUMIRE
    

    
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
       
      COL1, COL2, COL3,  COL4, COL5, COL6, COL7, COL8
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
       
      CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8
    );
  END LOOP;
END;;;"1";8;"";"";""
10524;"Tab.12.a";2008;46;2000;"Tab.12.a Diferenta. Dupa fiecare codul serviciilor";"2";12.62;"1";DECLARE

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
    DF.COL5,
    DF.COL6,
    DF.COL7
    
  

   
FROM 
(



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
     CUIIO||'~'|| ROWNUM/0.123 NR_ROW,
     ROWNUM  AS ORDINE,
     '0000000' AS DECIMAL_POS,
     DENUMIRE NUME_ROW,
     TO_NUMBER(SERV_CODUL) COL1,
     ROUND(COL1,0) COL2,
     ROUND(COL2,0) COL3,
     ROUND(COL3,0) COL4,
     ROUND(COL4,0) COL5,
     ROUND(COL5,0) COL6,
     ROUND(COL6,0) COL7
FROM
(

SELECT 
   '1' ORDINE,

    A.CUIIO, 
    A.SERV_CODUL,
    A.DENUMIRE,
    
    SUM(A.COL1)  AS COL1,
    SUM(A.COL2)  AS COL2,
    SUM(B.COL1)  AS COL3,
    SUM(B.COL2)  AS COL4,
    SUM(A.COL1) - SUM(B.COL1) AS COL5,
    SUM(A.COL2) - SUM(B.COL2) AS COL6

FROM 
(
SELECT 
   00000000 AS CUIIO,
    '0'   SERV_CODUL, 
   
    SSS.DENUMIRE DENUMIRE,
    
    
   
    (SUM(CASE WHEN  MR.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    ---------------------------------------------------------------------------------------------------------------------
  
    
    (SUM(CASE WHEN  MR.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1
    AS COL2
    
    
    
FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
    
      
        
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
    
    INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (409,410)
  AND  SSS.CODUL IN ('0000000')
  -------------------------------------------------
  GROUP BY 

   SSS.CODUL,
   
  SSS.DENUMIRE,
  CR.COL1
  ) A INNER JOIN (
  
  SELECT 
 CUIIO,
 SERV_CODUL,
 DENUMIRE,
 SUM(COL1) AS COL1,
SUM(COL2) AS COL2

 
FROM
 
(
SELECT 
    D.PERIOADA,
    00000000 AS CUIIO,
    '0'   SERV_CODUL, 
    SSS.DENUMIRE DENUMIRE,
    
  
   (SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    
    
    ROUND((SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1,0)
    AS COL2
        
 
   
     
          
    FROM
    
     CIS2.VW_DATA_ALL D 
     
    INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 ) 
    
    INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )
   
    LEFT JOIN (
    
    SELECT
            
            D.PERIOADA,
            SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) THEN D.COL1 ELSE NULL  END ) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                          INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
                      
                        WHERE
                              P.PERIOADA_ANULA = :pPERIOADA AND            
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01')
            
            GROUP BY 
            D.PERIOADA 
    )    CR  ON (D.PERIOADA=CR.PERIOADA)

           
           
   WHERE        
   
  (D.FORM = 44) AND
  (D.FORM_VERS = 1004) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  
  (D.FORM IN (44) AND D.CAPITOL IN (405,406)) AND 
 
  P.PERIOADA_ANULA = :pPERIOADA
 
   AND SSS.CODUL IN ('0000000')
  -- AND CC.CODUL IN ('0000000')

  GROUP BY  
  D.PERIOADA,
  SSS.DENUMIRE,
  CR.COL1
  )
  
  GROUP BY 
   CUIIO,
 SERV_CODUL,
 DENUMIRE

 
  
  )  B ON (B.CUIIO = B.CUIIO)
  
  
  
  GROUP BY 
  

     A.CUIIO,
     A.SERV_CODUL,
     A.DENUMIRE    


     UNION 
     
     
     SELECT
    '2' ORDINE, 

    A.CUIIO, 
    A.SERV_CODUL,
    A.DENUMIRE,
    
    SUM(A.COL1)  AS COL1,
    SUM(A.COL2)  AS COL2,
    SUM(B.COL1)  AS COL3,
    SUM(B.COL2)  AS COL4,
    SUM(A.COL1) - SUM(B.COL1) AS COL5,
    SUM(A.COL2) - SUM(B.COL2) AS COL6
FROM 

(

SELECT 
    D.CUIIO AS CUIIO,
    SS.CODUL   SERV_CODUL, 
    SS.DENUMIRE||'-'||MAX(R.DENUMIRE) DENUMIRE,
    
    
   
    (SUM(CASE WHEN  MR.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    ---------------------------------------------------------------------------------------------------------------------
  
    
    (SUM(CASE WHEN  MR.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1
    AS COL2
    
    
    
FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
    
      
        
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
    
  
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (409,410)
 
 AND SS.CODUL <> '0'
  -------------------------------------------------
  GROUP BY 

  D.CUIIO,
  SS.CODUL,
  SS.DENUMIRE,
  CR.COL1
 
  
  )  A  LEFT JOIN 
  
  (
  
  SELECT 
 CUIIO,
 SERV_CODUL,
 MAX(DENUMIRE)  DENUMIRE,
 SUM(COL1) AS COL1,
SUM(COL2) AS COL2

 
FROM
 
(
SELECT 
    D.PERIOADA,
    D.CUIIO AS CUIIO,
    SS.CODUL   SERV_CODUL, 
    SS.DENUMIRE||'-'||MAX(R.DENUMIRE) DENUMIRE,
    
  
   (SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    
    
    ROUND((SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1,0)
    AS COL2
        
 
   
     
          
    FROM
    
     CIS2.VW_DATA_ALL D 
     
    INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 ) 
    
   INNER JOIN CIS2.RENIM R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS) 
   
    LEFT JOIN (
    
    SELECT
            
            D.PERIOADA,
            SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) THEN D.COL1 ELSE NULL  END ) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                          INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
                      
                        WHERE
                              P.PERIOADA_ANULA = :pPERIOADA AND            
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01')
            
            GROUP BY 
            D.PERIOADA 
    )    CR  ON (D.PERIOADA=CR.PERIOADA)

           
           
   WHERE        
   
  (D.FORM = 44) AND
  (D.FORM_VERS = 1004) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  
  (D.FORM IN (44) AND D.CAPITOL IN (405,406)) AND 
 
  P.PERIOADA_ANULA = :pPERIOADA
 
   AND SS.CODUL <> '0'
   
   
  

  GROUP BY  
  D.PERIOADA,
  D.CUIIO,
  SS.CODUL,
  SS.DENUMIRE,
  CR.COL1
  )
  
  GROUP BY 
   CUIIO,
 SERV_CODUL
 
 --,
 --DENUMIRE

  
  
  ) B ON (B.CUIIO = A.CUIIO  AND B.SERV_CODUL  = A.SERV_CODUL)
  
  
  
  GROUP BY 

    A.CUIIO, 
    A.SERV_CODUL,
    A.DENUMIRE
    
    
    HAVING 
    SUM(A.COL1) - SUM(B.COL1) <> 0
    OR 
    SUM(A.COL2) - SUM(B.COL2) <> 0
    )

        
        
        
        
        
        
        
        
        
  ) DF
  
  ;
   
    BEGIN

  FOR CR IN C
  
  LOOP
   INSERT INTO   -- USER_BANCU.TABLE_OUT_TEST 
    
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
       
      COL1, COL2, COL3,  COL4, COL5, COL6, COL7
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
       
      CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7
    );
  END LOOP;
END;;;"1";7;"";"";""
11079;"Tab.12.a";2008;46;2000;"Tab.12.a  Diferenta. Dupa fiecare codul serviciilor - old";"2";12.621;"3";
INSERT INTO   -- USER_BANCU.TABLE_OUT_TEST 
    
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
       
      COL1, COL2, COL3,  COL4, COL5, COL6, COL7
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
     CUIIO||'~'|| ROWNUM/0.123 NR_ROW,
     ROWNUM  AS ORDINE,
     '0000000' AS DECIMAL_POS,
     DENUMIRE NUME_ROW,
     TO_NUMBER(SERV_CODUL) COL1,
     ROUND(COL1,0) COL2,
     ROUND(COL2,0) COL3,
     ROUND(COL3,0) COL4,
     ROUND(COL4,0) COL5,
     ROUND(COL5,0) COL6,
     ROUND(COL6,0) COL7
FROM
(

SELECT 
   '1' ORDINE,

    A.CUIIO, 
    A.SERV_CODUL,
    A.DENUMIRE,
    
    SUM(A.COL1)  AS COL1,
    SUM(A.COL2)  AS COL2,
    SUM(B.COL1)  AS COL3,
    SUM(B.COL2)  AS COL4,
    SUM(A.COL1) - SUM(B.COL1) AS COL5,
    SUM(A.COL2) - SUM(B.COL2) AS COL6

FROM 
(
SELECT 
   00000000 AS CUIIO,
    '0'   SERV_CODUL, 
   
    SSS.DENUMIRE DENUMIRE,
    
    
   
    (SUM(CASE WHEN  MR.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    ---------------------------------------------------------------------------------------------------------------------
  
    
    (SUM(CASE WHEN  MR.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1
    AS COL2
    
    
    
FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
    
      
        
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
    
    INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (409,410)
  AND  SSS.CODUL IN ('0000000')
  -------------------------------------------------
  GROUP BY 

   SSS.CODUL,
   
  SSS.DENUMIRE,
  CR.COL1
  ) A INNER JOIN (
  
  SELECT 
 CUIIO,
 SERV_CODUL,
 DENUMIRE,
 SUM(COL1) AS COL1,
SUM(COL2) AS COL2

 
FROM
 
(
SELECT 
    D.PERIOADA,
    00000000 AS CUIIO,
    '0'   SERV_CODUL, 
    SSS.DENUMIRE DENUMIRE,
    
  
   (SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    
    
    ROUND((SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1,0)
    AS COL2
        
 
   
     
          
    FROM
    
     CIS2.VW_DATA_ALL D 
     
    INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 ) 
    
    INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )
   
    LEFT JOIN (
    
    SELECT
            
            D.PERIOADA,
            SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) THEN D.COL1 ELSE NULL  END ) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                          INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
                      
                        WHERE
                              P.PERIOADA_ANULA = :pPERIOADA AND            
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01')
            
            GROUP BY 
            D.PERIOADA 
    )    CR  ON (D.PERIOADA=CR.PERIOADA)

           
           
   WHERE        
   
  (D.FORM = 44) AND
  (D.FORM_VERS = 1004) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  
  (D.FORM IN (44) AND D.CAPITOL IN (405,406)) AND 
 
  P.PERIOADA_ANULA = :pPERIOADA
 
   AND SSS.CODUL IN ('0000000')
  -- AND CC.CODUL IN ('0000000')

  GROUP BY  
  D.PERIOADA,
  SSS.DENUMIRE,
  CR.COL1
  )
  
  GROUP BY 
   CUIIO,
 SERV_CODUL,
 DENUMIRE

 
  
  )  B ON (B.CUIIO = B.CUIIO)
  
  
  
  GROUP BY 
  

     A.CUIIO,
     A.SERV_CODUL,
     A.DENUMIRE  
     UNION 
     
     
     SELECT
    '2' ORDINE, 

    A.CUIIO, 
    A.SERV_CODUL,
    A.DENUMIRE,
    
    SUM(A.COL1)  AS COL1,
    SUM(A.COL2)  AS COL2,
    SUM(B.COL1)  AS COL3,
    SUM(B.COL2)  AS COL4,
    SUM(A.COL1) - SUM(B.COL1) AS COL5,
    SUM(A.COL2) - SUM(B.COL2) AS COL6
FROM 

(

SELECT 
    D.CUIIO AS CUIIO,
    SS.CODUL   SERV_CODUL, 
    SS.DENUMIRE||'-'||MAX(R.DENUMIRE) DENUMIRE,
    
    
   
    (SUM(CASE WHEN  MR.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    ---------------------------------------------------------------------------------------------------------------------
  
    
    (SUM(CASE WHEN  MR.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1
    AS COL2
    
    
    
FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
    
      
        
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
    
  
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (409,410)
 
 AND SS.CODUL <> '0'
  -------------------------------------------------
  GROUP BY 

  D.CUIIO,
  SS.CODUL,
  SS.DENUMIRE,
  CR.COL1
 
  
  )  A  LEFT JOIN 
  
  (
  
  SELECT 
 CUIIO,
 SERV_CODUL,
 MAX(DENUMIRE)  DENUMIRE,
 SUM(COL1) AS COL1,
SUM(COL2) AS COL2

 
FROM
 
(
SELECT 
    D.PERIOADA,
    D.CUIIO AS CUIIO,
    SS.CODUL   SERV_CODUL, 
    SS.DENUMIRE||'-'||MAX(R.DENUMIRE) DENUMIRE,
    
  
   (SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    
    
    ROUND((SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1,0)
    AS COL2
        
 
   
     
          
    FROM
    
     CIS2.VW_DATA_ALL D 
     
    INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 ) 
    
   INNER JOIN CIS2.RENIM R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS) 
   
    LEFT JOIN (
    
    SELECT
            
            D.PERIOADA,
            SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) THEN D.COL1 ELSE NULL  END ) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                          INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
                      
                        WHERE
                              P.PERIOADA_ANULA = :pPERIOADA AND            
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01')
            
            GROUP BY 
            D.PERIOADA 
    )    CR  ON (D.PERIOADA=CR.PERIOADA)

           
           
   WHERE        
   
  (D.FORM = 44) AND
  (D.FORM_VERS = 1004) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  
  (D.FORM IN (44) AND D.CAPITOL IN (405,406)) AND 
 
  P.PERIOADA_ANULA = :pPERIOADA
 
   AND SS.CODUL <> '0'
   
   
  

  GROUP BY  
  D.PERIOADA,
  D.CUIIO,
  SS.CODUL,
  SS.DENUMIRE,
  CR.COL1
  )
  
  GROUP BY 
   CUIIO,
 SERV_CODUL
 
 --,
 --DENUMIRE

  
  
  ) B ON (B.CUIIO = A.CUIIO  AND B.SERV_CODUL  = A.SERV_CODUL)
  
  
  
  GROUP BY 

    A.CUIIO, 
    A.SERV_CODUL,
    A.DENUMIRE
    
    
    HAVING 
    SUM(A.COL1) - SUM(B.COL1) <> 0
    OR 
    SUM(A.COL2) - SUM(B.COL2) <> 0
    )

        
        
        
        
        
        
        
        
        
  ;;"1";7;"";"";""
9509;"Tab.12.a";2008;46;2000;"Tab.12.a Diferenta. Dupa fiecare codul serviciilor - Pachet";"2";12.63;"1";DECLARE

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
    DF.COL5,
    DF.COL6,
    DF.COL7,
    DF.COL8
    
  

   
FROM 
(






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
     CUIIO||'~'|| ROWNUM/0.123 NR_ROW,
     ROWNUM  AS ORDINE,
     '00000000' AS DECIMAL_POS,
     DENUMIRE NUME_ROW,
     TO_NUMBER(PACHET) COL1,
     TO_NUMBER(SERV_CODUL) COL2,
     ROUND(COL1,0) COL3,
     ROUND(COL2,0) COL4,
     ROUND(COL3,0) COL5,
     ROUND(COL4,0) COL6,
     ROUND(COL5,0) COL7,
     ROUND(COL6,0) COL8
FROM
(

SELECT 
   '1' ORDINE,

    A.CUIIO, 
    NULL PACHET,
    A.SERV_CODUL,
    A.DENUMIRE,
    
    SUM(A.COL1)  AS COL1,
    SUM(A.COL2)  AS COL2,
    SUM(B.COL1)  AS COL3,
    SUM(B.COL2)  AS COL4,
    SUM(A.COL1) - SUM(B.COL1) AS COL5,
    SUM(A.COL2) - SUM(B.COL2) AS COL6

FROM 
(
SELECT 
   00000000 AS CUIIO,
    '0'   SERV_CODUL, 
   
    SSS.DENUMIRE DENUMIRE,
    
    
   
    (SUM(CASE WHEN  MR.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    ---------------------------------------------------------------------------------------------------------------------
  
    
    (SUM(CASE WHEN  MR.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1
    AS COL2
    
    
    
FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
    
      
        
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
    
    INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (409,410)
  AND  SSS.CODUL IN ('0000000')
  -------------------------------------------------
  GROUP BY 

   SSS.CODUL,
   
  SSS.DENUMIRE,
  CR.COL1
  ) A INNER JOIN (
  
  SELECT 
 CUIIO,
 SERV_CODUL,
 DENUMIRE,
 SUM(COL1) AS COL1,
SUM(COL2) AS COL2

 
FROM
 
(
SELECT 
    D.PERIOADA,
    00000000 AS CUIIO,
    '0'   SERV_CODUL, 
    SSS.DENUMIRE DENUMIRE,
    
  
   (SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    
    
    ROUND((SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1,0)
    AS COL2
        
 
   
     
          
    FROM
    
     CIS2.VW_DATA_ALL D 
     
    INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 ) 
    
    INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )
   
    LEFT JOIN (
    
    SELECT
            
            D.PERIOADA,
            SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) THEN D.COL1 ELSE NULL  END ) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                          INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
                      
                        WHERE
                              P.PERIOADA_ANULA = :pPERIOADA AND            
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01')
            
            GROUP BY 
            D.PERIOADA 
    )    CR  ON (D.PERIOADA=CR.PERIOADA)

           
           
   WHERE        
   
  (D.FORM = 44) AND
  (D.FORM_VERS = 1004) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  
  (D.FORM IN (44) AND D.CAPITOL IN (405,406)) AND 
 
  P.PERIOADA_ANULA = :pPERIOADA
 
   AND SSS.CODUL IN ('0000000')
  -- AND CC.CODUL IN ('0000000')

  GROUP BY  
  D.PERIOADA,
  SSS.DENUMIRE,
  CR.COL1
  )
  
  GROUP BY 
   CUIIO,
 SERV_CODUL,
 DENUMIRE

 
  
  )  B ON (B.CUIIO = B.CUIIO)
  
  
  
  GROUP BY 
  

     A.CUIIO,
     A.SERV_CODUL,
     A.DENUMIRE
     
     
     
     UNION 
     
     
     SELECT
    '2' ORDINE, 

    A.CUIIO, 
    A.PACHET,
    A.SERV_CODUL,
    A.DENUMIRE,
    
    SUM(A.COL1)  AS COL1,
    SUM(A.COL2)  AS COL2,
    SUM(B.COL1)  AS COL3,
    SUM(B.COL2)  AS COL4,
    SUM(A.COL1) - SUM(B.COL1) AS COL5,
    SUM(A.COL2) - SUM(B.COL2) AS COL6
FROM 

(

SELECT 
L.CUIIO,
R.PACHET,
L.SERV_CODUL,
L.DENUMIRE,
L.COL1,
L.COL2



FROM 
(
SELECT 
    D.CUIIO AS CUIIO,
   
    SS.CODUL   SERV_CODUL, 
    SS.DENUMIRE||'-'||MAX(R.DENUMIRE) DENUMIRE,
    
    
   
    (SUM(CASE WHEN  MR.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    ---------------------------------------------------------------------------------------------------------------------
  
    
    (SUM(CASE WHEN  MR.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1
    AS COL2
    
    
    
FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
    
      
        
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
    
  
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (409,410)
 
 AND SS.CODUL <> '0'
  -------------------------------------------------
  GROUP BY 

  D.CUIIO,

  SS.CODUL,
  SS.DENUMIRE,
  CR.COL1
  ) L LEFT JOIN (
         SELECT 
                    DISTINCT  D.CUIIO,
                    D.PACHET
                    FROM CIS2.DATA_ALL  D 
                                INNER JOIN MD_RIND  R ON R.ID_MD = D.ID_MD 
                    
                    WHERE 
                    D.FORM = 46
                    AND D.PERIOADA IN(:pPERIOADA)
                    AND R.CAPITOL IN  (1)
                   
   
   )  R ON R.CUIIO = L.CUIIO
 
  
  )  A  LEFT JOIN 
  
  (
  
  SELECT 
 CUIIO,
 SERV_CODUL,
 MAX(DENUMIRE)  DENUMIRE,
 SUM(COL1) AS COL1,
SUM(COL2) AS COL2

 
FROM
 
(
SELECT 
    D.PERIOADA,
    D.CUIIO AS CUIIO,
    SS.CODUL   SERV_CODUL, 
    SS.DENUMIRE||'-'||MAX(R.DENUMIRE) DENUMIRE,
    
  
   (SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    
    
    ROUND((SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1,0)
    AS COL2
        
 
   
     
          
    FROM
    
     CIS2.VW_DATA_ALL D 
     
    INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 ) 
    
   INNER JOIN CIS2.RENIM R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS) 
   
    LEFT JOIN (
    
    SELECT
            
            D.PERIOADA,
            SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) THEN D.COL1 ELSE NULL  END ) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                          INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
                      
                        WHERE
                              P.PERIOADA_ANULA = :pPERIOADA AND            
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01')
            
            GROUP BY 
            D.PERIOADA 
    )    CR  ON (D.PERIOADA=CR.PERIOADA)

           
           
   WHERE        
   
  (D.FORM = 44) AND
  (D.FORM_VERS = 1004) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  
  (D.FORM IN (44) AND D.CAPITOL IN (405,406)) AND 
 
  P.PERIOADA_ANULA = :pPERIOADA
 
   AND SS.CODUL <> '0'
   
   
  

  GROUP BY  
  D.PERIOADA,
  D.CUIIO,
  SS.CODUL,
  SS.DENUMIRE,
  CR.COL1
  )
  
  GROUP BY 
   CUIIO,
 SERV_CODUL
 --,
 --DENUMIRE

  
  
  ) B ON (B.CUIIO = A.CUIIO  AND B.SERV_CODUL  = A.SERV_CODUL)
  
  
  
  GROUP BY 

    A.CUIIO, 
    A.PACHET,
    A.SERV_CODUL,
    A.DENUMIRE
    
  HAVING 
    SUM(A.COL1) - SUM(B.COL1) <> 0
    OR 
    SUM(A.COL2) - SUM(B.COL2) <> 0
    
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
       
      COL1, COL2, COL3,  COL4, COL5, COL6, COL7, COL8
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
       
      CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8
    );
  END LOOP;
END;;;"1";8;"";"";""
10525;"10";2008;46;2000;"Tab.13. Dupa fiecare codul serviciilor";"2";13.02;"1";DECLARE

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
    DF.COL5,
    DF.COL6,
    DF.COL7
    
  

   
FROM 
(



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
     CUIIO||'~'|| ROWNUM/0.123 NR_ROW,
     ROWNUM  AS ORDINE,
     '0000000' AS DECIMAL_POS,
     DENUMIRE NUME_ROW,
     TO_NUMBER(SERV_CODUL) COL1,
     ROUND(COL1,0) COL2,
     ROUND(COL2,0) COL3,
     ROUND(COL3,0) COL4,
     ROUND(COL4,0) COL5,
     ROUND(COL5,0) COL6,
     ROUND(COL6,0) COL7
FROM
(

SELECT 
   '1' ORDINE,

    A.CUIIO, 
    A.SERV_CODUL,
    A.DENUMIRE,
    
    SUM(A.COL1)  AS COL1,
    SUM(A.COL2)  AS COL2,
    SUM(B.COL1)  AS COL3,
    SUM(B.COL2)  AS COL4,
    SUM(A.COL1) - SUM(B.COL1) AS COL5,
    SUM(A.COL2) - SUM(B.COL2) AS COL6

FROM 
(
SELECT 
   00000000 AS CUIIO,
    '0'   SERV_CODUL, 
   
    SSS.DENUMIRE DENUMIRE,
    
    
   
    (SUM(CASE WHEN  MR.CAPITOL IN (411)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (403)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    ---------------------------------------------------------------------------------------------------------------------
  
    
    (SUM(CASE WHEN  MR.CAPITOL IN (411)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (403)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1
    AS COL2
    
    
    
FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
    
      
        
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
    
    INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (411,403)
  AND  SSS.CODUL IN ('0000000')
  -------------------------------------------------
  GROUP BY 

   SSS.CODUL,
   
  SSS.DENUMIRE,
  CR.COL1
  ) A INNER JOIN (
  
  SELECT 
 CUIIO,
 SERV_CODUL,
 DENUMIRE,
 SUM(COL1) AS COL1,
SUM(COL2) AS COL2

 
FROM
 
(
SELECT 
    D.PERIOADA,
    00000000 AS CUIIO,
    '0'   SERV_CODUL, 
    SSS.DENUMIRE DENUMIRE,
    
  
   (SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (407)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (408)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    
    
    ROUND((SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (407)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (408)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1,0)
    AS COL2
        
 
   
     
          
    FROM
    
     CIS2.VW_DATA_ALL D 
     
    INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 ) 
    
    INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )
   
    LEFT JOIN (
    
    SELECT
            
            D.PERIOADA,
            SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) THEN D.COL1 ELSE NULL  END ) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                          INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
                      
                        WHERE
                              P.PERIOADA_ANULA = :pPERIOADA AND            
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01')
            
            GROUP BY 
            D.PERIOADA 
    )    CR  ON (D.PERIOADA=CR.PERIOADA)

           
           
   WHERE        
   
  (D.FORM = 44) AND
  (D.FORM_VERS = 1004) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  
  (D.FORM IN (44) AND D.CAPITOL IN (407,408)) AND 
 
  P.PERIOADA_ANULA = :pPERIOADA
 
   AND SSS.CODUL IN ('0000000')
  -- AND CC.CODUL IN ('0000000')

  GROUP BY  
  D.PERIOADA,
  SSS.DENUMIRE,
  CR.COL1
  )
  
  GROUP BY 
   CUIIO,
 SERV_CODUL,
 DENUMIRE

 
  
  )  B ON (B.CUIIO = B.CUIIO)
  
  
  
  GROUP BY 
  

     A.CUIIO,
     A.SERV_CODUL,
     A.DENUMIRE
     
     
     
     
     UNION 
     
     
     SELECT
    '2' ORDINE, 

    A.CUIIO, 
    A.SERV_CODUL,
    A.DENUMIRE,
    
    SUM(A.COL1)  AS COL1,
    SUM(A.COL2)  AS COL2,
    SUM(B.COL1)  AS COL3,
    SUM(B.COL2)  AS COL4,
    SUM(A.COL1) - SUM(B.COL1) AS COL5,
    SUM(A.COL2) - SUM(B.COL2) AS COL6
FROM 

(

SELECT 
    D.CUIIO AS CUIIO,
    SS.CODUL   SERV_CODUL, 
    SS.DENUMIRE||'-'||MAX(R.DENUMIRE) DENUMIRE,
    
    
   
    (SUM(CASE WHEN  MR.CAPITOL IN (411)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (403)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    ---------------------------------------------------------------------------------------------------------------------
  
    
    (SUM(CASE WHEN  MR.CAPITOL IN (411)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (403)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1
    AS COL2
    
    
    
FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
    
      
        
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
    
  
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (411,403)
 
 AND SS.CODUL <> '0'
  -------------------------------------------------
  GROUP BY 

  D.CUIIO,
  SS.CODUL,
  SS.DENUMIRE,
  CR.COL1
 
  
  )  A  LEFT JOIN 
  
  (
  
  SELECT 
 CUIIO,
 SERV_CODUL,
MAX(DENUMIRE)  DENUMIRE,
 SUM(COL1) AS COL1,
SUM(COL2) AS COL2

 
FROM
 
(
SELECT 
    D.PERIOADA,
    D.CUIIO AS CUIIO,
    SS.CODUL   SERV_CODUL, 
    SS.DENUMIRE||'-'||MAX(R.DENUMIRE) DENUMIRE,
    
  
   (SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (407)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (408)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    
    
    ROUND((SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (407)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (408)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1,0)
    AS COL2
        
 
   
     
          
    FROM
    
     CIS2.VW_DATA_ALL D 
     
    INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 ) 
    
   INNER JOIN CIS2.RENIM R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS) 
   
    LEFT JOIN (
    
    SELECT
            
            D.PERIOADA,
            SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) THEN D.COL1 ELSE NULL  END ) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                          INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
                      
                        WHERE
                              P.PERIOADA_ANULA = :pPERIOADA AND            
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01')
            
            GROUP BY 
            D.PERIOADA 
    )    CR  ON (D.PERIOADA=CR.PERIOADA)

           
           
   WHERE        
   
  (D.FORM = 44) AND
  (D.FORM_VERS = 1004) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  
  (D.FORM IN (44) AND D.CAPITOL IN (407,408)) AND 
 
  P.PERIOADA_ANULA = :pPERIOADA
 
   AND SS.CODUL <> '0'
   
   
  

  GROUP BY  
  D.PERIOADA,
  D.CUIIO,
  SS.CODUL,
  SS.DENUMIRE,
  CR.COL1
  )
  
  GROUP BY 
   CUIIO,
 SERV_CODUL
 
 --,
 --DENUMIRE

  
  
  ) B ON (B.CUIIO = A.CUIIO  AND B.SERV_CODUL  = A.SERV_CODUL)
  
  
  
  GROUP BY 

    A.CUIIO, 
    A.SERV_CODUL,
    A.DENUMIRE
    
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
       
      COL1, COL2, COL3,  COL4, COL5, COL6, COL7
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
       
      CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7
    );
  END LOOP;
END;;;"1";7;"";"";""
9525;"10";2008;46;2000;"Tab.13. Dupa fiecare codul serviciilor - Pachet";"2";13.021;"1";DECLARE

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
    DF.COL5,
    DF.COL6,
    DF.COL7,
    DF.COL8
    
  

   
FROM 
(






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
     CUIIO||'~'|| ROWNUM/0.123 NR_ROW,
     ROWNUM  AS ORDINE,
     '00000000' AS DECIMAL_POS,
     DENUMIRE NUME_ROW,
     TO_NUMBER(PACHET) COL1,
     TO_NUMBER(SERV_CODUL) COL2,
     ROUND(COL1,0) COL3,
     ROUND(COL2,0) COL4,
     ROUND(COL3,0) COL5,
     ROUND(COL4,0) COL6,
     ROUND(COL5,0) COL7,
     ROUND(COL6,0) COL8
FROM
(

SELECT 
   '1' ORDINE,

    A.CUIIO, 
    NULL PACHET,
    A.SERV_CODUL,
    A.DENUMIRE,
    
    SUM(A.COL1)  AS COL1,
    SUM(A.COL2)  AS COL2,
    SUM(B.COL1)  AS COL3,
    SUM(B.COL2)  AS COL4,
    SUM(A.COL1) - SUM(B.COL1) AS COL5,
    SUM(A.COL2) - SUM(B.COL2) AS COL6

FROM 
(
SELECT 
   00000000 AS CUIIO,
    '0'   SERV_CODUL, 
   
    SSS.DENUMIRE DENUMIRE,
    
    
   
    (SUM(CASE WHEN  MR.CAPITOL IN (411)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (403)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    ---------------------------------------------------------------------------------------------------------------------
  
    
    (SUM(CASE WHEN  MR.CAPITOL IN (411)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (403)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1
    AS COL2
    
    
    
FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
    
      
        
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
    
    INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (411,403)
  AND  SSS.CODUL IN ('0000000')
  -------------------------------------------------
  GROUP BY 

   SSS.CODUL,
   
  SSS.DENUMIRE,
  CR.COL1
  ) A INNER JOIN (
  
  SELECT 
 CUIIO,
 SERV_CODUL,
 DENUMIRE,
 SUM(COL1) AS COL1,
SUM(COL2) AS COL2

 
FROM
 
(
SELECT 
    D.PERIOADA,
    00000000 AS CUIIO,
    '0'   SERV_CODUL, 
    SSS.DENUMIRE DENUMIRE,
    
  
   (SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (407)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (408)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    
    
    ROUND((SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (407)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (408)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1,0)
    AS COL2
        
 
   
     
          
    FROM
    
     CIS2.VW_DATA_ALL D 
     
    INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 ) 
    
    INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )
   
    LEFT JOIN (
    
    SELECT
            
            D.PERIOADA,
            SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) THEN D.COL1 ELSE NULL  END ) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                          INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
                      
                        WHERE
                              P.PERIOADA_ANULA = :pPERIOADA AND            
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01')
            
            GROUP BY 
            D.PERIOADA 
    )    CR  ON (D.PERIOADA=CR.PERIOADA)

           
           
   WHERE        
   
  (D.FORM = 44) AND
  (D.FORM_VERS = 1004) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  
  (D.FORM IN (44) AND D.CAPITOL IN (407,408)) AND 
 
  P.PERIOADA_ANULA = :pPERIOADA
 
   AND SSS.CODUL IN ('0000000')
  -- AND CC.CODUL IN ('0000000')

  GROUP BY  
  D.PERIOADA,
  SSS.DENUMIRE,
  CR.COL1
  )
  
  GROUP BY 
   CUIIO,
 SERV_CODUL,
 DENUMIRE

 
  
  )  B ON (B.CUIIO = B.CUIIO)
  
  
  
  GROUP BY 
  

     A.CUIIO,
     A.SERV_CODUL,
     A.DENUMIRE
     
     
     
     UNION 
     
     
     SELECT
    '2' ORDINE, 

    A.CUIIO, 
    A.PACHET,
    A.SERV_CODUL,
    A.DENUMIRE,
    
    SUM(A.COL1)  AS COL1,
    SUM(A.COL2)  AS COL2,
    SUM(B.COL1)  AS COL3,
    SUM(B.COL2)  AS COL4,
    SUM(A.COL1) - SUM(B.COL1) AS COL5,
    SUM(A.COL2) - SUM(B.COL2) AS COL6
FROM 

(

SELECT 
L.CUIIO,
R.PACHET,
L.SERV_CODUL,
L.DENUMIRE,
L.COL1,
L.COL2



FROM 
(
SELECT 
    D.CUIIO AS CUIIO,
   
    SS.CODUL   SERV_CODUL, 
    SS.DENUMIRE||'-'||MAX(R.DENUMIRE) DENUMIRE,
    
    
   
    (SUM(CASE WHEN  MR.CAPITOL IN (411)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (403)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    ---------------------------------------------------------------------------------------------------------------------
  
    
    (SUM(CASE WHEN  MR.CAPITOL IN (411)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (403)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1
    AS COL2
    
    
    
FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
    
      
        
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
    
  
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (411,403)
 
 AND SS.CODUL <> '0'
  -------------------------------------------------
  GROUP BY 

  D.CUIIO,

  SS.CODUL,
  SS.DENUMIRE,
  CR.COL1
  ) L LEFT JOIN (
         SELECT 
                    DISTINCT  D.CUIIO,
                    D.PACHET
                    FROM CIS2.DATA_ALL  D 
                                INNER JOIN MD_RIND  R ON R.ID_MD = D.ID_MD 
                    
                    WHERE 
                    D.FORM = 46
                    AND D.PERIOADA IN(:pPERIOADA)
                    AND R.CAPITOL IN  (1)
                   
   
   )  R ON R.CUIIO = L.CUIIO
 
  
  )  A  LEFT JOIN 
  
  (
  
  SELECT 
 CUIIO,
 SERV_CODUL,
  MAX(DENUMIRE)  DENUMIRE,
 SUM(COL1) AS COL1,
SUM(COL2) AS COL2

 
FROM
 
(
SELECT 
    D.PERIOADA,
    D.CUIIO AS CUIIO,
    SS.CODUL   SERV_CODUL, 
    SS.DENUMIRE||'-'||MAX(R.DENUMIRE) DENUMIRE,
    
  
   (SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (407)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (408)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    
    
    ROUND((SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (407)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (408)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1,0)
    AS COL2
        
 
   
     
          
    FROM
    
     CIS2.VW_DATA_ALL D 
     
    INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 ) 
    
   INNER JOIN CIS2.RENIM R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS) 
   
    LEFT JOIN (
    
    SELECT
            
            D.PERIOADA,
            SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) THEN D.COL1 ELSE NULL  END ) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                          INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
                      
                        WHERE
                              P.PERIOADA_ANULA = :pPERIOADA AND            
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01')
            
            GROUP BY 
            D.PERIOADA 
    )    CR  ON (D.PERIOADA=CR.PERIOADA)

           
           
   WHERE        
   
  (D.FORM = 44) AND
  (D.FORM_VERS = 1004) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  
  (D.FORM IN (44) AND D.CAPITOL IN (407,408)) AND 
 
  P.PERIOADA_ANULA = :pPERIOADA
 
   AND SS.CODUL <> '0'
   
   
  

  GROUP BY  
  D.PERIOADA,
  D.CUIIO,
  SS.CODUL,
  SS.DENUMIRE,
  CR.COL1
  )
  
  GROUP BY 
   CUIIO,
 SERV_CODUL
 --,
 --DENUMIRE

  
  
  ) B ON (B.CUIIO = A.CUIIO  AND B.SERV_CODUL  = A.SERV_CODUL)
  
  
  
  GROUP BY 

    A.CUIIO, 
    A.PACHET,
    A.SERV_CODUL,
    A.DENUMIRE
    

    
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
       
      COL1, COL2, COL3,  COL4, COL5, COL6, COL7, COL8
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
       
      CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8
    );
  END LOOP;
END;;;"1";8;"";"";""
10526;"11";2008;46;2000;"Tab.13.a Diferenta. Dupa fiecare codul serviciilor";"2";13.03;"1";DECLARE

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
    DF.COL5,
    DF.COL6,
    DF.COL7
    
  

   
FROM 
(



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
     CUIIO||'~'|| ROWNUM/0.123 NR_ROW,
     ROWNUM  AS ORDINE,
     '0000000' AS DECIMAL_POS,
     DENUMIRE NUME_ROW,
     TO_NUMBER(SERV_CODUL) COL1,
     ROUND(COL1,0) COL2,
     ROUND(COL2,0) COL3,
     ROUND(COL3,0) COL4,
     ROUND(COL4,0) COL5,
     ROUND(COL5,0) COL6,
     ROUND(COL6,0) COL7
FROM
(

SELECT 
   '1' ORDINE,

    A.CUIIO, 
    A.SERV_CODUL,
    A.DENUMIRE,
    
    SUM(A.COL1)  AS COL1,
    SUM(A.COL2)  AS COL2,
    SUM(B.COL1)  AS COL3,
    SUM(B.COL2)  AS COL4,
    SUM(A.COL1) - SUM(B.COL1) AS COL5,
    SUM(A.COL2) - SUM(B.COL2) AS COL6

FROM 
(
SELECT 
   00000000 AS CUIIO,
    '0'   SERV_CODUL, 
   
    SSS.DENUMIRE DENUMIRE,
    
    
   
    (SUM(CASE WHEN  MR.CAPITOL IN (411)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (403)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    ---------------------------------------------------------------------------------------------------------------------
  
    
    (SUM(CASE WHEN  MR.CAPITOL IN (411)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (403)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1
    AS COL2
    
    
    
FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
    
      
        
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
    
    INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (411,403)
  AND  SSS.CODUL IN ('0000000')
  -------------------------------------------------
  GROUP BY 

   SSS.CODUL,
   
  SSS.DENUMIRE,
  CR.COL1
  ) A INNER JOIN (
  
  SELECT 
 CUIIO,
 SERV_CODUL,
 DENUMIRE,
 SUM(COL1) AS COL1,
SUM(COL2) AS COL2

 
FROM
 
(
SELECT 
    D.PERIOADA,
    00000000 AS CUIIO,
    '0'   SERV_CODUL, 
    SSS.DENUMIRE DENUMIRE,
    
  
   (SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (407)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (408)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    
    
    ROUND((SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (407)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (408)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1,0)
    AS COL2
        
 
   
     
          
    FROM
    
     CIS2.VW_DATA_ALL D 
     
    INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 ) 
    
    INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )
   
    LEFT JOIN (
    
    SELECT
            
            D.PERIOADA,
            SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) THEN D.COL1 ELSE NULL  END ) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                          INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
                      
                        WHERE
                              P.PERIOADA_ANULA = :pPERIOADA AND            
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01')
            
            GROUP BY 
            D.PERIOADA 
    )    CR  ON (D.PERIOADA=CR.PERIOADA)

           
           
   WHERE        
   
  (D.FORM = 44) AND
  (D.FORM_VERS = 1004) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  
  (D.FORM IN (44) AND D.CAPITOL IN (407,408)) AND 
 
  P.PERIOADA_ANULA = :pPERIOADA
 
   AND SSS.CODUL IN ('0000000')
  -- AND CC.CODUL IN ('0000000')

  GROUP BY  
  D.PERIOADA,
  SSS.DENUMIRE,
  CR.COL1
  )
  
  GROUP BY 
   CUIIO,
 SERV_CODUL,
 DENUMIRE

 
  
  )  B ON (B.CUIIO = B.CUIIO)
  
  
  
  GROUP BY 
  

     A.CUIIO,
     A.SERV_CODUL,
     A.DENUMIRE
     
     
     
     
     UNION 
     
     
     SELECT
    '2' ORDINE, 

    A.CUIIO, 
    A.SERV_CODUL,
    A.DENUMIRE,
    
    SUM(A.COL1)  AS COL1,
    SUM(A.COL2)  AS COL2,
    SUM(B.COL1)  AS COL3,
    SUM(B.COL2)  AS COL4,
    SUM(A.COL1) - SUM(B.COL1) AS COL5,
    SUM(A.COL2) - SUM(B.COL2) AS COL6
FROM 

(

SELECT 
    D.CUIIO AS CUIIO,
    SS.CODUL   SERV_CODUL, 
    SS.DENUMIRE||'-'||MAX(R.DENUMIRE) DENUMIRE,
    
    
   
    (SUM(CASE WHEN  MR.CAPITOL IN (411)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (403)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    ---------------------------------------------------------------------------------------------------------------------
  
    
    (SUM(CASE WHEN  MR.CAPITOL IN (411)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (403)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1
    AS COL2
    
    
    
FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
    
      
        
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
    
  
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (411,403)
 
 AND SS.CODUL <> '0'
  -------------------------------------------------
  GROUP BY 

  D.CUIIO,
  SS.CODUL,
  SS.DENUMIRE,
  CR.COL1
 
  
  )  A  LEFT JOIN 
  
  (
  
  SELECT 
 CUIIO,
 SERV_CODUL,
 MAX(DENUMIRE)  DENUMIRE,
 SUM(COL1) AS COL1,
SUM(COL2) AS COL2

 
FROM
 
(
SELECT 
    D.PERIOADA,
    D.CUIIO AS CUIIO,
    SS.CODUL   SERV_CODUL, 
    SS.DENUMIRE||'-'||MAX(R.DENUMIRE) DENUMIRE,
    
  
   (SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (407)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (408)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    
    
    ROUND((SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (407)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (408)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1,0)
    AS COL2
        
 
   
     
          
    FROM
    
     CIS2.VW_DATA_ALL D 
     
    INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 ) 
    
   INNER JOIN CIS2.RENIM R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS) 
   
    LEFT JOIN (
    
    SELECT
            
            D.PERIOADA,
            SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) THEN D.COL1 ELSE NULL  END ) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                          INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
                      
                        WHERE
                              P.PERIOADA_ANULA = :pPERIOADA AND            
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01')
            
            GROUP BY 
            D.PERIOADA 
    )    CR  ON (D.PERIOADA=CR.PERIOADA)

           
           
   WHERE        
   
  (D.FORM = 44) AND
  (D.FORM_VERS = 1004) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  
  (D.FORM IN (44) AND D.CAPITOL IN (407,408)) AND 
 
  P.PERIOADA_ANULA = :pPERIOADA
 
   AND SS.CODUL <> '0'
   
   
  

  GROUP BY  
  D.PERIOADA,
  D.CUIIO,
  SS.CODUL,
  SS.DENUMIRE,
  CR.COL1
  )
  
  GROUP BY 
   CUIIO,
 SERV_CODUL
 --,
 --DENUMIRE

  
  
  ) B ON (B.CUIIO = A.CUIIO  AND B.SERV_CODUL  = A.SERV_CODUL)
  
  
  
  GROUP BY 

    A.CUIIO, 
    A.SERV_CODUL,
    A.DENUMIRE
    
     HAVING 
    SUM(A.COL1) - SUM(B.COL1) <> 0
    OR 
    SUM(A.COL2) - SUM(B.COL2) <> 0
    
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
       
      COL1, COL2, COL3,  COL4, COL5, COL6, COL7
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
       
      CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7
    );
  END LOOP;
END;;;"1";7;"";"";""
9515;"11";2008;46;2000;"Tab.13.a Diferenta. Dupa fiecare codul serviciilor - Pachet";"2";13.04;"1";DECLARE

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
    DF.COL5,
    DF.COL6,
    DF.COL7,
    DF.COL8
    
  

   
FROM 
(






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
     CUIIO||'~'|| ROWNUM/0.123 NR_ROW,
     ROWNUM  AS ORDINE,
     '00000000' AS DECIMAL_POS,
     DENUMIRE NUME_ROW,
     TO_NUMBER(PACHET) COL1,
     TO_NUMBER(SERV_CODUL) COL2,
     ROUND(COL1,0) COL3,
     ROUND(COL2,0) COL4,
     ROUND(COL3,0) COL5,
     ROUND(COL4,0) COL6,
     ROUND(COL5,0) COL7,
     ROUND(COL6,0) COL8
FROM
(

SELECT 
   '1' ORDINE,

    A.CUIIO, 
    NULL PACHET,
    A.SERV_CODUL,
    A.DENUMIRE,
    
    SUM(A.COL1)  AS COL1,
    SUM(A.COL2)  AS COL2,
    SUM(B.COL1)  AS COL3,
    SUM(B.COL2)  AS COL4,
    SUM(A.COL1) - SUM(B.COL1) AS COL5,
    SUM(A.COL2) - SUM(B.COL2) AS COL6

FROM 
(
SELECT 
   00000000 AS CUIIO,
    '0'   SERV_CODUL, 
   
    SSS.DENUMIRE DENUMIRE,
    
    
   
    (SUM(CASE WHEN  MR.CAPITOL IN (411)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (403)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    ---------------------------------------------------------------------------------------------------------------------
  
    
    (SUM(CASE WHEN  MR.CAPITOL IN (411)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (403)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1
    AS COL2
    
    
    
FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
    
      
        
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
    
    INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (411,403)
  AND  SSS.CODUL IN ('0000000')
  -------------------------------------------------
  GROUP BY 

   SSS.CODUL,
   
  SSS.DENUMIRE,
  CR.COL1
  ) A INNER JOIN (
  
  SELECT 
 CUIIO,
 SERV_CODUL,
 DENUMIRE,
 SUM(COL1) AS COL1,
SUM(COL2) AS COL2

 
FROM
 
(
SELECT 
    D.PERIOADA,
    00000000 AS CUIIO,
    '0'   SERV_CODUL, 
    SSS.DENUMIRE DENUMIRE,
    
  
   (SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (407)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (408)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    
    
    ROUND((SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (407)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (408)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1,0)
    AS COL2
        
 
   
     
          
    FROM
    
     CIS2.VW_DATA_ALL D 
     
    INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 ) 
    
    INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )
   
    LEFT JOIN (
    
    SELECT
            
            D.PERIOADA,
            SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) THEN D.COL1 ELSE NULL  END ) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                          INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
                      
                        WHERE
                              P.PERIOADA_ANULA = :pPERIOADA AND            
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01')
            
            GROUP BY 
            D.PERIOADA 
    )    CR  ON (D.PERIOADA=CR.PERIOADA)

           
           
   WHERE        
   
  (D.FORM = 44) AND
  (D.FORM_VERS = 1004) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  
  (D.FORM IN (44) AND D.CAPITOL IN (407,408)) AND 
 
  P.PERIOADA_ANULA = :pPERIOADA
 
   AND SSS.CODUL IN ('0000000')
  -- AND CC.CODUL IN ('0000000')

  GROUP BY  
  D.PERIOADA,
  SSS.DENUMIRE,
  CR.COL1
  )
  
  GROUP BY 
   CUIIO,
 SERV_CODUL,
 DENUMIRE

 
  
  )  B ON (B.CUIIO = B.CUIIO)
  
  
  
  GROUP BY 
  

     A.CUIIO,
     A.SERV_CODUL,
     A.DENUMIRE
     
     
     
     UNION 
     
     
     SELECT
    '2' ORDINE, 

    A.CUIIO, 
    A.PACHET,
    A.SERV_CODUL,
    A.DENUMIRE,
    
    SUM(A.COL1)  AS COL1,
    SUM(A.COL2)  AS COL2,
    SUM(B.COL1)  AS COL3,
    SUM(B.COL2)  AS COL4,
    SUM(A.COL1) - SUM(B.COL1) AS COL5,
    SUM(A.COL2) - SUM(B.COL2) AS COL6
FROM 

(

SELECT 
L.CUIIO,
R.PACHET,
L.SERV_CODUL,
L.DENUMIRE,
L.COL1,
L.COL2



FROM 
(
SELECT 
    D.CUIIO AS CUIIO,
   
    SS.CODUL   SERV_CODUL, 
    SS.DENUMIRE||'-'||MAX(R.DENUMIRE) DENUMIRE,
    
    
   
    (SUM(CASE WHEN  MR.CAPITOL IN (411)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (403)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    ---------------------------------------------------------------------------------------------------------------------
  
    
    (SUM(CASE WHEN  MR.CAPITOL IN (411)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (403)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1
    AS COL2
    
    
    
FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
    
      
        
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
    
  
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (411,403)
 
 AND SS.CODUL <> '0'
  -------------------------------------------------
  GROUP BY 

  D.CUIIO,

  SS.CODUL,
  SS.DENUMIRE,
  CR.COL1
  ) L LEFT JOIN (
         SELECT 
                    DISTINCT  D.CUIIO,
                    D.PACHET
                    FROM CIS2.DATA_ALL  D 
                                INNER JOIN MD_RIND  R ON R.ID_MD = D.ID_MD 
                    
                    WHERE 
                    D.FORM = 46
                    AND D.PERIOADA IN(:pPERIOADA)
                    AND R.CAPITOL IN  (1)
                   
   
   )  R ON R.CUIIO = L.CUIIO
 
  
  )  A  LEFT JOIN 
  
  (
  
  SELECT 
 CUIIO,
 SERV_CODUL,
 MAX(DENUMIRE)  DENUMIRE,
 SUM(COL1) AS COL1,
SUM(COL2) AS COL2

 
FROM
 
(
SELECT 
    D.PERIOADA,
    D.CUIIO AS CUIIO,
    SS.CODUL   SERV_CODUL, 
    SS.DENUMIRE||'-'||MAX(R.DENUMIRE) DENUMIRE,
    
  
   (SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (407)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (408)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    
    
    ROUND((SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (407)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (408)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1,0)
    AS COL2
        
 
   
     
          
    FROM
    
     CIS2.VW_DATA_ALL D 
     
    INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 ) 
    
   INNER JOIN CIS2.RENIM R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS) 
   
    LEFT JOIN (
    
    SELECT
            
            D.PERIOADA,
            SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) THEN D.COL1 ELSE NULL  END ) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                          INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
                      
                        WHERE
                              P.PERIOADA_ANULA = :pPERIOADA AND            
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01')
            
            GROUP BY 
            D.PERIOADA 
    )    CR  ON (D.PERIOADA=CR.PERIOADA)

           
           
   WHERE        
   
  (D.FORM = 44) AND
  (D.FORM_VERS = 1004) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  
  (D.FORM IN (44) AND D.CAPITOL IN (407,408)) AND 
 
  P.PERIOADA_ANULA = :pPERIOADA
 
   AND SS.CODUL <> '0'
   
   
  

  GROUP BY  
  D.PERIOADA,
  D.CUIIO,
  SS.CODUL,
  SS.DENUMIRE,
  CR.COL1
  )
  
  GROUP BY 
   CUIIO,
 SERV_CODUL
 --,
 --DENUMIRE

  
  
  ) B ON (B.CUIIO = A.CUIIO  AND B.SERV_CODUL  = A.SERV_CODUL)
  
  
  
  GROUP BY 

    A.CUIIO, 
    A.PACHET,
    A.SERV_CODUL,
    A.DENUMIRE
    
HAVING 
    SUM(A.COL1) - SUM(B.COL1) <> 0
    OR 
    SUM(A.COL2) - SUM(B.COL2) <> 0
    
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
       
      COL1, COL2, COL3,  COL4, COL5, COL6, COL7, COL8
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
       
      CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8
    );
  END LOOP;
END;;;"1";8;"";"";""
10527;"12";2008;46;2000;"Tab.14 ";"2";14.16;"1";DECLARE

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
    DF.COL4
   
   
   FROM 
(

SELECT 
    :pPERIOADA AS PERIOADA,
    :pFORM AS FORM,
    :pFORM_VERS AS FORM_VERS,
    :pID_MDTABLE AS ID_MDTABLE,
    :pCOD_CUATM AS COD_CUATM,
     CUATM_CODUL AS NR_SECTIE,
     CUATM_CODUL||'-'||DENUMIRE_CUATM AS NUME_SECTIE,
    '0' AS NR_SECTIE1,
    '0' AS NUME_SECTIE1,
    '0' AS NR_SECTIE2,
    '0' AS NUME_SECTIE2,
     CUIIO||'~'|| ROWNUM NR_ROW,
     ROWNUM  AS ORDINE,
     '00000' AS DECIMAL_POS,
     DENUMIRE NUME_ROW,
     SERV_CODUL COL1,
     COL1 COL2,
     COL2 COL3,
     COL3 COL4
     
     

 
    FROM  

(
 SELECT 
   '1' AS ORDINE, 
    CC.CODUL  CUATM_CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    00000000 AS CUIIO,
    '0'   SERV_CODUL, 
    SSS.DENUMIRE DENUMIRE,
    
  
   (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (409)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (410)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
        (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (409)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (410)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL2,
 
    (
     (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (409)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (410)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    )
        
    -
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (409)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (410)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    COL3
     
     
          
    FROM
    
     CIS2.VW_DATA_ALL D 
     
   
   INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 ) 
    
    INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )
   

---
            INNER JOIN CIS2.VW_CL_CUATM C ON (D.CUATM=C.CODUL) 
            
            INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
           ---
           
           
   
  WHERE 
  (D.PERIOADA IN(:pPERIOADA,:pPERIOADA-1)) AND
  --(D.PERIOADA =:pPERIOADA) AND
  --(D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND    
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46)
  AND
  D.CAPITOL IN (409,410)
 AND  SSS.CODUL IN ('0000000')
 AND CC.CODUL IN ('0000000')
  GROUP BY 
   CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  SSS.CODUL,
  SSS.DENUMIRE
  
  
  UNION 
  
  SELECT 
    '2' AS ORDINE,
    MAX(CC.CODUL) CUATM_CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    S.CODUL    SERV_CODUL,
    S.DENUMIRE||'-'||MAX(R.DENUMIRE) DENUMIRE,
    
    
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (409)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (410)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
        (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (409)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (410)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL2,
 
    (
     (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (409)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (410)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    )
        
    -
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (409)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (410)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    COL3
    
     
    FROM
    
     CIS2.VW_DATA_ALL D 
     INNER JOIN CIS2.CL_SERVICII S ON (S.CODUL=D.COL1)
     INNER JOIN CIS2.RENIM R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS) 
     
      INNER JOIN CIS2.VW_CL_CUATM C ON (D.CUATM=C.CODUL) 
            
      INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' ) 
     
    
  WHERE 
  (D.PERIOADA IN(:pPERIOADA,:pPERIOADA-1)) AND    
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46)
  AND
  D.CAPITOL IN (409,410)
  
  AND S.CODUL <> '0'
 
  
  AND CC.CODUL  IN  ( '0000000',
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
  
  GROUP BY 
  
--  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE,
  D.CUIIO,
  S.CODUL,
  S.DENUMIRE
  
  ORDER BY  ORDINE
  )
  
   
  
    
   

) DF

;
   
    BEGIN

  FOR CR IN C
  
  LOOP
    INSERT INTO -- USER_BANCU.TABLE_OUT_TEST 
    
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
       
      COL1, COL2, COL3,  COL4
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
       
      CR.COL1, CR.COL2, CR.COL3, CR.COL4
    );
  END LOOP;
END;
  
  ;;"1";4;"";"";""
9526;"12";2008;46;2000;"Tab.14 - Pachet ";"2";14.1601;"1";INSERT INTO -- USER_BANCU.TABLE_OUT_TEST 
    
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
       
      COL1, COL2, COL3,  COL4, COL5
    )

SELECT 
    :pPERIOADA AS PERIOADA,
    :pFORM AS FORM,
    :pFORM_VERS AS FORM_VERS,
    :pID_MDTABLE AS ID_MDTABLE,
    :pCOD_CUATM AS COD_CUATM,
     CUATM_CODUL AS NR_SECTIE,
     CUATM_CODUL||'-'||DENUMIRE_CUATM AS NUME_SECTIE,
    '0' AS NR_SECTIE1,
    '0' AS NUME_SECTIE1,
    '0' AS NR_SECTIE2,
    '0' AS NUME_SECTIE2,
     CUIIO||'~'|| ROWNUM NR_ROW,
     ROWNUM  AS ORDINE,
     '000000' AS DECIMAL_POS,
     DENUMIRE NUME_ROW,
     TO_NUMBER(TRIM(PACHET)) AS COL1,
     SERV_CODUL COL2,
     COL1 COL3,
     COL2 COL4,
     COL3 COL5
     
     

 
    FROM  

(
 SELECT 
   '1' AS ORDINE, 
    CC.CODUL  CUATM_CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    00000000 AS CUIIO,
    0 AS PACHET,
    '0'   SERV_CODUL, 
    SSS.DENUMIRE DENUMIRE,
    
  
   (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (409)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (410)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
        (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (409)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (410)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL2,
 
    (
     (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (409)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (410)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    )
        
    -
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (409)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (410)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    COL3
     
     
          
    FROM
    
     CIS2.VW_DATA_ALL D 
     
   
   INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 ) 
    
    INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )
   

---
            INNER JOIN CIS2.VW_CL_CUATM C ON (D.CUATM=C.CODUL) 
            
            INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
           ---
           
           
   
  WHERE 
  (D.PERIOADA IN(:pPERIOADA,:pPERIOADA-1)) AND
  --(D.PERIOADA =:pPERIOADA) AND
  --(D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND    
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46)
  AND
  D.CAPITOL IN (409,410)
 AND  SSS.CODUL IN ('0000000')
 AND CC.CODUL IN ('0000000')
  GROUP BY 
   CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  SSS.CODUL,
  SSS.DENUMIRE
  
  
  UNION 
  

SELECT 
L.ORDINE,
L.CUATM_CODUL,
L.FULL_CODE,
L.DENUMIRE_CUATM,
L.CUIIO,
R.PACHET,
L.SERV_CODUL,
L.DENUMIRE,
L.COL1,
L.COL2,
L.COL3
FROM 

(

SELECT 
    '2' AS ORDINE,
    MAX(CC.CODUL) CUATM_CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    S.CODUL    SERV_CODUL,
    S.DENUMIRE||'-'||MAX(R.DENUMIRE) DENUMIRE,
    
    
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (409)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (410)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
        (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (409)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (410)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL2,
 
    (
     (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (409)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (410)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    )
        
    -
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (409)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (410)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    COL3
    
     
    FROM
    
     CIS2.VW_DATA_ALL D 
     INNER JOIN CIS2.CL_SERVICII S ON (S.CODUL=D.COL1)
     INNER JOIN CIS2.RENIM R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS) 
     
      INNER JOIN CIS2.VW_CL_CUATM C ON (D.CUATM=C.CODUL) 
            
      INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' ) 
     
    
  WHERE 
  (D.PERIOADA IN(:pPERIOADA,:pPERIOADA-1)) AND    
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46)
  AND
  D.CAPITOL IN (409,410)
  
  AND S.CODUL <> '0'
 
  
  AND CC.CODUL  IN  ( '0000000',
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
  
  GROUP BY 
  
--  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE,
  D.CUIIO,
  S.CODUL,
  S.DENUMIRE
  
  ) L LEFT JOIN (
         SELECT 
                    DISTINCT  D.CUIIO,
                    D.PACHET
                    FROM CIS2.DATA_ALL  D 
                                INNER JOIN MD_RIND  R ON R.ID_MD = D.ID_MD 
                    
                    WHERE 
                    D.FORM = 46
                    AND D.PERIOADA IN(:pPERIOADA)
                    AND R.CAPITOL IN  (1)
                   
   
   )  R ON R.CUIIO = L.CUIIO
  
  ORDER BY  ORDINE
  )
  ;;"1";5;"";"";""
10528;"13";2008;46;2000;"Tab.14 a ";"2";14.161;"1";DECLARE

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
    DF.COL4
   
   
   FROM 
(

SELECT 
    :pPERIOADA AS PERIOADA,
    :pFORM AS FORM,
    :pFORM_VERS AS FORM_VERS,
    :pID_MDTABLE AS ID_MDTABLE,
    :pCOD_CUATM AS COD_CUATM,
     CUATM_CODUL AS NR_SECTIE,
     CUATM_CODUL||'-'||DENUMIRE_CUATM AS NUME_SECTIE,
    '0' AS NR_SECTIE1,
    '0' AS NUME_SECTIE1,
    '0' AS NR_SECTIE2,
    '0' AS NUME_SECTIE2,
     CUIIO||'~'|| ROWNUM NR_ROW,
     ROWNUM  AS ORDINE,
     '00000' AS DECIMAL_POS,
     DENUMIRE NUME_ROW,
     SERV_CODUL COL1,
     COL1 COL2,
     COL2 COL3,
     COL3 COL4
     
     

 
    FROM  

(
 
  
  SELECT 
    '2' AS ORDINE,
    MAX(CC.CODUL) CUATM_CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    S.CODUL    SERV_CODUL,
    S.DENUMIRE||'-'||MAX(R.DENUMIRE) DENUMIRE,
    
    
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (409)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (410)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
        (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (409)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (410)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL2,
 
    (
     (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (409)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (410)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    )
        
    -
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (409)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (410)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    COL3
    
     
    FROM
    
     CIS2.VW_DATA_ALL D 
     INNER JOIN CIS2.CL_SERVICII S ON (S.CODUL=D.COL1)
     INNER JOIN CIS2.RENIM R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS) 
     
      INNER JOIN CIS2.VW_CL_CUATM C ON (D.CUATM=C.CODUL) 
            
      INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' ) 
     
    
  WHERE 
  (D.PERIOADA IN(:pPERIOADA,:pPERIOADA-1)) AND    
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46)
  AND
  D.CAPITOL IN (409,410)
  
  AND S.CODUL <> '0'
 
  
  AND CC.CODUL  IN  ( '0000000',
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
  
  GROUP BY 
  
--  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE,
  D.CUIIO,
  S.CODUL,
  S.DENUMIRE
  
  
  HAVING 
  
   (
     (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (409)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (410)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    )
        
    -
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (409)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (410)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) >  500000
    
    
    
    OR 
    
    
    
    (
     (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (409)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (410)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    )
        
    -
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (409)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (410)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) >  500000
  
  ORDER BY  ORDINE
  )
  
   
  
    
   

) DF

;
   
    BEGIN

  FOR CR IN C
  
  LOOP
    INSERT INTO -- USER_BANCU.TABLE_OUT_TEST 
    
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
       
      COL1, COL2, COL3,  COL4
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
       
      CR.COL1, CR.COL2, CR.COL3, CR.COL4
    );
  END LOOP;
END;
  
  ;;"1";4;"";"";""
9513;"13";2008;46;2000;"Tab.14 a  - Pachet";"2";14.162;"1";INSERT INTO -- USER_BANCU.TABLE_OUT_TEST 
    
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
       
      COL1, COL2, COL3,  COL4, COL5
    )

SELECT 
    :pPERIOADA AS PERIOADA,
    :pFORM AS FORM,
    :pFORM_VERS AS FORM_VERS,
    :pID_MDTABLE AS ID_MDTABLE,
    :pCOD_CUATM AS COD_CUATM,
     CUATM_CODUL AS NR_SECTIE,
     CUATM_CODUL||'-'||DENUMIRE_CUATM AS NUME_SECTIE,
    '0' AS NR_SECTIE1,
    '0' AS NUME_SECTIE1,
    '0' AS NR_SECTIE2,
    '0' AS NUME_SECTIE2,
     CUIIO||'~'|| ROWNUM NR_ROW,
     ROWNUM  AS ORDINE,
     '000000' AS DECIMAL_POS,
     DENUMIRE NUME_ROW,
     TO_NUMBER(TRIM(PACHET)) AS COL1,
     SERV_CODUL COL2,
     COL1 COL3,
     COL2 COL4,
     COL3 COL5
     
     

 
    FROM  

(
 
  

SELECT 
L.ORDINE,
L.CUATM_CODUL,
L.FULL_CODE,
L.DENUMIRE_CUATM,
L.CUIIO,
R.PACHET,
L.SERV_CODUL,
L.DENUMIRE,
L.COL1,
L.COL2,
L.COL3
FROM 

(

SELECT 
    '2' AS ORDINE,
    MAX(CC.CODUL) CUATM_CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    S.CODUL    SERV_CODUL,
    S.DENUMIRE||'-'||MAX(R.DENUMIRE) DENUMIRE,
    
    
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (409)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (410)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
        (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (409)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (410)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL2,
 
    (
     (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (409)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (410)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    )
        
    -
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (409)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (410)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    COL3
    
     
    FROM
    
     CIS2.VW_DATA_ALL D 
     INNER JOIN CIS2.CL_SERVICII S ON (S.CODUL=D.COL1)
     INNER JOIN CIS2.RENIM R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS) 
     
      INNER JOIN CIS2.VW_CL_CUATM C ON (D.CUATM=C.CODUL) 
            
      INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' ) 
     
    
  WHERE 
  (D.PERIOADA IN(:pPERIOADA,:pPERIOADA-1)) AND    
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46)
  AND
  D.CAPITOL IN (409,410)
  
  AND S.CODUL <> '0'
 
  
  AND CC.CODUL  IN  ( '0000000',
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
  
  GROUP BY 
  
--  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE,
  D.CUIIO,
  S.CODUL,
  S.DENUMIRE
  
  
  HAVING 
  
   (
     (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (409)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (410)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    )
        
    -
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (409)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (410)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) >  500000
    
    
    
    OR 
    
    
    
    (
     (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (409)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (410)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    )
        
    -
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (409)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (410)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) >  500000
  
  ) L LEFT JOIN (
         SELECT 
                    DISTINCT  D.CUIIO,
                    D.PACHET
                    FROM CIS2.DATA_ALL  D 
                                INNER JOIN MD_RIND  R ON R.ID_MD = D.ID_MD 
                    
                    WHERE 
                    D.FORM = 46
                    AND D.PERIOADA IN(:pPERIOADA)
                    AND R.CAPITOL IN  (1)
                   
   
   )  R ON R.CUIIO = L.CUIIO
  
  ORDER BY  ORDINE
  )
  ;;"1";5;"";"";""
10529;"14";2008;46;2000;"Tab.15 ";"2";15.1;"1";DECLARE

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
    DF.COL4
   
   
   FROM 
(

SELECT 
    :pPERIOADA AS PERIOADA,
    :pFORM AS FORM,
    :pFORM_VERS AS FORM_VERS,
    :pID_MDTABLE AS ID_MDTABLE,
    :pCOD_CUATM AS COD_CUATM,
     CUATM_CODUL AS NR_SECTIE,
     CUATM_CODUL||'-'||DENUMIRE_CUATM AS NUME_SECTIE,
    '0' AS NR_SECTIE1,
    '0' AS NUME_SECTIE1,
    '0' AS NR_SECTIE2,
    '0' AS NUME_SECTIE2,
     CUIIO||'~'|| ROWNUM NR_ROW,
     ROWNUM  AS ORDINE,
     '00000' AS DECIMAL_POS,
     DENUMIRE NUME_ROW,
     SERV_CODUL COL1,
     COL1 COL2,
     COL2 COL3,
     COL3 COL4
     
     

 
    FROM  

(
 SELECT 
   '1' AS ORDINE, 
    CC.CODUL  CUATM_CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    00000000 AS CUIIO,
    '0'   SERV_CODUL, 
    SSS.DENUMIRE DENUMIRE,
    
  
   (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (411)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (403)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
        (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (411)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (403)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL2,
 
    (
     (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (411)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (403)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    )
        
    -
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (411)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (403)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    COL3
     
     
          
    FROM
    
     CIS2.VW_DATA_ALL D 
     
   
   INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 ) 
    
    INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )
   

---
            INNER JOIN CIS2.VW_CL_CUATM C ON (D.CUATM=C.CODUL) 
            
            INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
           ---
           
           
   
  WHERE 
  (D.PERIOADA IN(:pPERIOADA,:pPERIOADA-1)) AND
  --(D.PERIOADA =:pPERIOADA) AND
  --(D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND    
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46)
  AND
  D.CAPITOL IN (411,403)
 AND  SSS.CODUL IN ('0000000')
 AND CC.CODUL IN ('0000000')
  GROUP BY 
   CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  SSS.CODUL,
  SSS.DENUMIRE
  
  
  UNION 
  
  SELECT 
    '2' AS ORDINE,
    MAX(CC.CODUL)  CUATM_CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    S.CODUL    SERV_CODUL,
    S.DENUMIRE||'-'||MAX(R.DENUMIRE) DENUMIRE,
    
    
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (411)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (403)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
        (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (411)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (403)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL2,
 
    (
     (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (411)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (403)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    )
        
    -
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (411)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (403)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    COL3
    
     
    FROM
    
     CIS2.VW_DATA_ALL D 
     INNER JOIN CIS2.CL_SERVICII S ON (S.CODUL=D.COL1)
     INNER JOIN CIS2.RENIM R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS) 
     
      INNER JOIN CIS2.VW_CL_CUATM C ON (D.CUATM=C.CODUL) 
            
      INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' ) 
     
    
  WHERE 
  (D.PERIOADA IN(:pPERIOADA,:pPERIOADA-1)) AND    
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46)
  AND
  D.CAPITOL IN (411,403)
  
  AND S.CODUL <> '0'
  AND CC.CODUL  IN  ( '0000000',
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
  
  GROUP BY 
  

  CC.FULL_CODE,
  CC.DENUMIRE,
  D.CUIIO,
  S.CODUL,
  S.DENUMIRE
  
  ORDER BY  ORDINE
  )
  
   
  
    
   

) DF

;
   
    BEGIN

  FOR CR IN C
  
  LOOP
    INSERT INTO -- USER_BANCU.TABLE_OUT_TEST 
    
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
       
      COL1, COL2, COL3,  COL4
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
       
      CR.COL1, CR.COL2, CR.COL3, CR.COL4
    );
  END LOOP;
END;
  
  ;;"1";4;"";"";""
9527;"14";2008;46;2000;"Tab.15 - Pachet";"2";15.11;"1";INSERT INTO -- USER_BANCU.TABLE_OUT_TEST 
    
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
       
      COL1, COL2, COL3,  COL4, COL5
    )

SELECT 
    :pPERIOADA AS PERIOADA,
    :pFORM AS FORM,
    :pFORM_VERS AS FORM_VERS,
    :pID_MDTABLE AS ID_MDTABLE,
    :pCOD_CUATM AS COD_CUATM,
     CUATM_CODUL AS NR_SECTIE,
     CUATM_CODUL||'-'||DENUMIRE_CUATM AS NUME_SECTIE,
    '0' AS NR_SECTIE1,
    '0' AS NUME_SECTIE1,
    '0' AS NR_SECTIE2,
    '0' AS NUME_SECTIE2,
     CUIIO||'~'|| ROWNUM NR_ROW,
     ROWNUM  AS ORDINE,
     '000000' AS DECIMAL_POS,
     DENUMIRE NUME_ROW,
     TO_NUMBER(TRIM(PACHET)) AS COL1,
     SERV_CODUL COL2,
     COL1 COL3,
     COL2 COL4,
     COL3 COL5
     
     

 
    FROM  

(
 SELECT 
   '1' AS ORDINE, 
    CC.CODUL  CUATM_CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    00000000 AS CUIIO,
    0 AS PACHET,
    '0'   SERV_CODUL, 
    SSS.DENUMIRE DENUMIRE,
    
  
   (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (411)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (403)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
        (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (411)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (403)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL2,
 
    (
     (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (411)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (403)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    )
        
    -
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (411)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (403)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    COL3
     
     
          
    FROM
    
     CIS2.VW_DATA_ALL D 
     
   
   INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 ) 
    
    INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )
   

---
            INNER JOIN CIS2.VW_CL_CUATM C ON (D.CUATM=C.CODUL) 
            
            INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
           ---
           
           
   
  WHERE 
  (D.PERIOADA IN(:pPERIOADA,:pPERIOADA-1)) AND
  --(D.PERIOADA =:pPERIOADA) AND
  --(D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND    
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46)
  AND
  D.CAPITOL IN (411,403)
 AND  SSS.CODUL IN ('0000000')
 AND CC.CODUL IN ('0000000')
  GROUP BY 
   CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  SSS.CODUL,
  SSS.DENUMIRE
  
  
  UNION 
  

SELECT 
L.ORDINE,
L.CUATM_CODUL,
L.FULL_CODE,
L.DENUMIRE_CUATM,
L.CUIIO,
R.PACHET,
L.SERV_CODUL,
L.DENUMIRE,
L.COL1,
L.COL2,
L.COL3
FROM 

(

SELECT 
    '2' AS ORDINE,
    MAX(CC.CODUL) CUATM_CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    S.CODUL    SERV_CODUL,
    S.DENUMIRE||'-'||MAX(R.DENUMIRE) DENUMIRE,
    
    
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (411)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (403)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
        (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (411)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (403)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL2,
 
    (
     (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (411)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (403)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    )
        
    -
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (411)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (403)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    COL3
    
     
    FROM
    
     CIS2.VW_DATA_ALL D 
     INNER JOIN CIS2.CL_SERVICII S ON (S.CODUL=D.COL1)
     INNER JOIN CIS2.RENIM R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS) 
     
      INNER JOIN CIS2.VW_CL_CUATM C ON (D.CUATM=C.CODUL) 
            
      INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' ) 
     
    
  WHERE 
  (D.PERIOADA IN(:pPERIOADA,:pPERIOADA-1)) AND    
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46)
  AND
  D.CAPITOL IN (411,403)
  
  AND S.CODUL <> '0'
 
  
  AND CC.CODUL  IN  ( '0000000',
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
    '4030000',
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
  
  GROUP BY 
  
--  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE,
  D.CUIIO,
  S.CODUL,
  S.DENUMIRE
  
  ) L LEFT JOIN (
         SELECT 
                    DISTINCT  D.CUIIO,
                    D.PACHET
                    FROM CIS2.DATA_ALL  D 
                                INNER JOIN MD_RIND  R ON R.ID_MD = D.ID_MD 
                    
                    WHERE 
                    D.FORM = 46
                    AND D.PERIOADA IN(:pPERIOADA)
                    AND R.CAPITOL IN  (1)
                   
   
   )  R ON R.CUIIO = L.CUIIO
  
  ORDER BY  ORDINE
  )
  ;;"1";5;"";"";""
9514;"15";2008;46;2000;"Tab.15 a";"2";15.41;"1";DECLARE

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
    DF.COL4
   
   
   FROM 
(

SELECT 
    :pPERIOADA AS PERIOADA,
    :pFORM AS FORM,
    :pFORM_VERS AS FORM_VERS,
    :pID_MDTABLE AS ID_MDTABLE,
    :pCOD_CUATM AS COD_CUATM,
     CUATM_CODUL AS NR_SECTIE,
     CUATM_CODUL||'-'||DENUMIRE_CUATM AS NUME_SECTIE,
    '0' AS NR_SECTIE1,
    '0' AS NUME_SECTIE1,
    '0' AS NR_SECTIE2,
    '0' AS NUME_SECTIE2,
     CUIIO||'~'|| ROWNUM NR_ROW,
     ROWNUM  AS ORDINE,
     '00000' AS DECIMAL_POS,
     DENUMIRE NUME_ROW,
     SERV_CODUL COL1,
     COL1 COL2,
     COL2 COL3,
     COL3 COL4
     
     

 
    FROM  

(
 
  
  SELECT 
    '2' AS ORDINE,
    MAX(CC.CODUL)  CUATM_CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    S.CODUL    SERV_CODUL,
    S.DENUMIRE||'-'||MAX(R.DENUMIRE) DENUMIRE,
    
    
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (411)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (403)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
        (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (411)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (403)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL2,
 
    (
     (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (411)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (403)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    )
        
    -
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (411)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (403)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    COL3
    
     
    FROM
    
     CIS2.VW_DATA_ALL D 
     INNER JOIN CIS2.CL_SERVICII S ON (S.CODUL=D.COL1)
     INNER JOIN CIS2.RENIM R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS) 
     
      INNER JOIN CIS2.VW_CL_CUATM C ON (D.CUATM=C.CODUL) 
            
      INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' ) 
     
    
  WHERE 
  (D.PERIOADA IN(:pPERIOADA,:pPERIOADA-1)) AND    
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46)
  AND
  D.CAPITOL IN (411,403)
  
  AND S.CODUL <> '0'
  AND CC.CODUL  IN  ( '0000000',
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
  
  GROUP BY 
  

  CC.FULL_CODE,
  CC.DENUMIRE,
  D.CUIIO,
  S.CODUL,
  S.DENUMIRE
  
 
  
  HAVING 
  
   (
     (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (411)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (403)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    )
        
    -
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (411)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (403)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) >  500000
    
    
    
    OR 
    
    
    
    (
     (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (411)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (403)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    )
        
    -
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (411)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (403)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) >  500000
  
  ORDER BY  ORDINE
  )
  
   
  
    
   

) DF

;
   
    BEGIN

  FOR CR IN C
  
  LOOP
    INSERT INTO -- USER_BANCU.TABLE_OUT_TEST 
    
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
       
      COL1, COL2, COL3,  COL4
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
       
      CR.COL1, CR.COL2, CR.COL3, CR.COL4
    );
  END LOOP;
END;
  
  ;;"1";4;"";"";""
10530;"15";2008;46;2000;"Tab.15 a - Pachet";"2";15.42;"1";INSERT INTO -- USER_BANCU.TABLE_OUT_TEST 
    
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
       
      COL1, COL2, COL3,  COL4, COL5
    )

SELECT 
    :pPERIOADA AS PERIOADA,
    :pFORM AS FORM,
    :pFORM_VERS AS FORM_VERS,
    :pID_MDTABLE AS ID_MDTABLE,
    :pCOD_CUATM AS COD_CUATM,
     CUATM_CODUL AS NR_SECTIE,
     CUATM_CODUL||'-'||DENUMIRE_CUATM AS NUME_SECTIE,
    '0' AS NR_SECTIE1,
    '0' AS NUME_SECTIE1,
    '0' AS NR_SECTIE2,
    '0' AS NUME_SECTIE2,
     CUIIO||'~'|| ROWNUM NR_ROW,
     ROWNUM  AS ORDINE,
     '000000' AS DECIMAL_POS,
     DENUMIRE NUME_ROW,
     TO_NUMBER(TRIM(PACHET)) AS COL1,
     SERV_CODUL COL2,
     COL1 COL3,
     COL2 COL4,
     COL3 COL5
     
     

 
    FROM  

(
 
  

SELECT 
L.ORDINE,
L.CUATM_CODUL,
L.FULL_CODE,
L.DENUMIRE_CUATM,
L.CUIIO,
R.PACHET,
L.SERV_CODUL,
L.DENUMIRE,
L.COL1,
L.COL2,
L.COL3
FROM 

(

SELECT 
    '2' AS ORDINE,
    MAX(CC.CODUL) CUATM_CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    S.CODUL    SERV_CODUL,
    S.DENUMIRE||'-'||MAX(R.DENUMIRE) DENUMIRE,
    
    
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (411)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (403)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
        (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (411)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (403)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL2,
 
    (
     (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (411)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (403)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    )
        
    -
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (411)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (403)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    COL3
    
     
    FROM
    
     CIS2.VW_DATA_ALL D 
     INNER JOIN CIS2.CL_SERVICII S ON (S.CODUL=D.COL1)
     INNER JOIN CIS2.RENIM R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS) 
     
      INNER JOIN CIS2.VW_CL_CUATM C ON (D.CUATM=C.CODUL) 
            
      INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' ) 
     
    
  WHERE 
  (D.PERIOADA IN(:pPERIOADA,:pPERIOADA-1)) AND    
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46)
  AND
  D.CAPITOL IN (411,403)
  
  AND S.CODUL <> '0'
 
  
  AND CC.CODUL  IN  ( '0000000',
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
    '4030000',
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
  
  GROUP BY 
  
--  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE,
  D.CUIIO,
  S.CODUL,
  S.DENUMIRE
  
  
   HAVING 
  
   (
     (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (411)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (403)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    )
        
    -
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (411)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (403)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) >  500000
    
    
    
    OR 
    
    
    
    (
     (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (411)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (403)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    )
        
    -
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (411)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (403)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) >  500000
  
  ) L LEFT JOIN (
         SELECT 
                    DISTINCT  D.CUIIO,
                    D.PACHET
                    FROM CIS2.DATA_ALL  D 
                                INNER JOIN MD_RIND  R ON R.ID_MD = D.ID_MD 
                    
                    WHERE 
                    D.FORM = 46
                    AND D.PERIOADA IN(:pPERIOADA)
                    AND R.CAPITOL IN  (1)
                   
   
   )  R ON R.CUIIO = L.CUIIO
  
  ORDER BY  ORDINE
  )
  ;;"1";5;"";"";""
9516;"Tab.18 ";2008;46;2000;"Tab.18";"2";18;"1";INSERT INTO TABLE_OUT 
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
   A.CUIIO||'~'||ROWNUM AS NR_ROW,
   ROWNUM AS ORDINE, 
  '0000' AS DECIMAL_POS,
   NUME_ROW,
   SUBSTR(A.CAEM2,2,4) AS COL1,
   A.PACHET AS COL2,
   ROUND(A.COL1,1) AS COL3,
   ROUND(A.COL2,1) AS COL4
FROM


(
   SELECT
   L.CUIIO,
   L.NUME_ROW, 
   L.RIND,
   L.CAEM2,
   L.PACHET,
   L.COL1  AS COL1,
   R.COL1  AS COL2
   
   
   FROM 

(
SELECT
   R.CUIIO,
   MAX(R.DENUMIRE) AS NUME_ROW, 
   D.RIND,
   D.CAEM2,
   D.PACHET,
   ROUND(SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) THEN D.RIND ELSE NULL END),1) AS COL1
 



FROM
  CIS2.VW_DATA_ALL D
  INNER JOIN CIS2.RENIM R ON (R.CUIIO= D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS)
 
 WHERE
  D.FORM IN (46)                           AND 
  D.FORM_VERS = :pFORM_VERS                AND    
  D.CAPITOL IN (1)                         AND 
  D.PERIOADA IN (:pPERIOADA) AND 
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%'  
 
 -- AND D.CUIIO IN (13557) 
 

GROUP BY
  R.CUIIO,
  D.RIND,
  D.CAEM2,
  D.PACHET
ORDER BY
  R.CUIIO,
  D.RIND
  
  ) L LEFT JOIN (
  
  SELECT
   R.CUIIO,
   MAX(R.DENUMIRE) AS NUME_ROW, 
   D.RIND,
   
   D.CAEM2,
   D.PACHET,
   SUM(CASE WHEN 1=1  THEN D.RIND ELSE NULL END) AS COL1
    FROM
     CIS2.VW_DATA_ALL D
     
         INNER JOIN CIS2.RENIM R ON (R.CUIIO= D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS)
                
      
         INNER JOIN
         (
           SELECT P.PERIOADA FROM CIS2.VW_MD_PERIOADA P 
           WHERE P.PERIOADA = :pPERIOADA 
    
           UNION   
   
           SELECT P.PERIOADA  
           
           FROM CIS2.VW_MD_PERIOADA P 
           
           INNER JOIN CIS2.VW_MD_PERIOADA T ON(P.ANUL=T.ANUL AND P.TIP_PERIOADA=5 )
            
           WHERE T.PERIOADA = :pPERIOADA
           
           AND P.NUM = 4
   
        ) P ON(D.PERIOADA=P.PERIOADA)
        
        
 WHERE
  D.FORM IN (44)                           AND 
 -- D.FORM_VERS = :pFORM_VERS                AND    
  D.CAPITOL IN (1)                         AND 
 -- D.PERIOADA IN (:pPERIOADA) AND 
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%'  
 
 -- AND D.CUIIO IN (13557) 
  
  
  GROUP BY
  R.CUIIO,
  D.RIND,
  D.CAEM2,
  D.PACHET
ORDER BY
  R.CUIIO,
  D.RIND
  
  )  R ON R.CUIIO = L.CUIIO 
  
  ) A;;"1";4;"";"";""
9517;"Tab.19";2008;46;2000;"Tab.19";"2";19;"1";INSERT INTO TABLE_OUT 
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
   A.CUIIO||'~'||ROWNUM AS NR_ROW,
   ROWNUM AS ORDINE, 
  '0000' AS DECIMAL_POS,
   NUME_ROW,
   SUBSTR(A.CAEM2,2,4) AS COL1,
   A.PACHET AS COL2,
   ROUND(A.COL1,1) AS COL3,
   ROUND(A.COL2,1) AS COL4
FROM


(
   SELECT
   L.CUIIO,
   L.NUME_ROW, 
   L.RIND,
   L.CAEM2,
   L.PACHET,
   L.COL1  AS COL1,
   R.COL1  AS COL2
   
   
   FROM 

(
SELECT
   R.CUIIO,
   MAX(R.DENUMIRE) AS NUME_ROW, 
   D.RIND,
   D.CAEM2,
   D.PACHET,
   ROUND(SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) THEN D.RIND ELSE NULL END),1) AS COL1
 



FROM
  CIS2.VW_DATA_ALL D
  INNER JOIN CIS2.RENIM R ON (R.CUIIO= D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS)
 
 WHERE
  D.FORM IN (46)                           AND 
  D.FORM_VERS = :pFORM_VERS                AND    
  D.CAPITOL IN (404)                         AND 
  D.PERIOADA IN (:pPERIOADA) AND 
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%'  
 
 -- AND D.CUIIO IN (13557) 
 

GROUP BY
  R.CUIIO,
  D.RIND,
  D.CAEM2,
  D.PACHET
ORDER BY
  R.CUIIO,
  D.RIND
  
  ) L LEFT JOIN (
  
  SELECT
   R.CUIIO,
   MAX(R.DENUMIRE) AS NUME_ROW, 
   D.RIND,
   
   D.CAEM2,
   D.PACHET,
   SUM(CASE WHEN 1=1  THEN D.RIND ELSE NULL END) AS COL1
    FROM
     CIS2.VW_DATA_ALL D
     
         INNER JOIN CIS2.RENIM R ON (R.CUIIO= D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS)
                
      
         INNER JOIN
         (
           SELECT P.PERIOADA FROM CIS2.VW_MD_PERIOADA P 
           WHERE P.PERIOADA = :pPERIOADA 
    
           UNION   
   
           SELECT P.PERIOADA  
           
           FROM CIS2.VW_MD_PERIOADA P 
           
           INNER JOIN CIS2.VW_MD_PERIOADA T ON(P.ANUL=T.ANUL AND P.TIP_PERIOADA=5 )
            
           WHERE T.PERIOADA = :pPERIOADA
           
           AND P.NUM = 4
   
        ) P ON(D.PERIOADA=P.PERIOADA)
        
        
 WHERE
  D.FORM IN (44)                           AND 
 -- D.FORM_VERS = :pFORM_VERS                AND    
  D.CAPITOL IN (14)                         AND 
 -- D.PERIOADA IN (:pPERIOADA) AND 
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%'  
 
 -- AND D.CUIIO IN (13557) 
  
  
  GROUP BY
  R.CUIIO,
  D.RIND,
  D.CAEM2,
  D.PACHET
ORDER BY
  R.CUIIO,
  D.RIND
  
  )  R ON R.CUIIO = L.CUIIO 
  
  ) A;;"1";4;"";"";""
9512;"Tab.20 a";2008;46;2000;"Tab.20 a";"2";20.1;"1";  INSERT INTO TABLE_OUT
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
    COL1

  ) 

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
        COL1||'~'||ROWNUM   NR_ROW,        
        ROWNUM   ORDINE,
        '0' DECIMAL_POS,
        DENUMIRE NUME_ROW ,
        COL2
     

FROM 
(
 
  SELECT 
       
       '0' ORDINE,
       'Numarul intreprinderilor (total):' DENUMIRE,
       
        (SELECT 
       COUNT ( F.CUIIO)  AS CNT

        
   
   
     FROM CIS2.FORM_CUIIO F
     
        INNER JOIN 
      (
      SELECT 
        CUIIO, 
        MAX(CUIIO_VERS) AS CUIIO_VERS 

         
      FROM CIS2.FORM_CUIIO FC
      
      WHERE  
      1=1 
      
      AND FC.FORM IN (:pFORM)
      
      AND FC.CUIIO_VERS <= :pPERIOADA
      
      GROUP BY 
      CUIIO 
      ) FF ON (FF.CUIIO = F.CUIIO AND F.CUIIO_VERS = FF.CUIIO_VERS)
      
      
      
      LEFT  JOIN CIS2.RENIM R ON (R.CUIIO  = F.CUIIO  
        
                                   AND  R.CUIIO_VERS   = F.CUIIO_VERS )
      LEFT JOIN CIS2.VW_CL_CUATM CT ON (R.CUATM = CT.CODUL)    
      
      WHERE 
      
      F.FORM IN (:pFORM)
      AND F.STATUT <> '3'
      AND CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%'  ) COL1,
      
      (SELECT 
       COUNT ( F.CUIIO)  AS CNT

        
   
   
     FROM CIS2.FORM_CUIIO F
     
        INNER JOIN 
      (
      SELECT 
        CUIIO, 
        MAX(CUIIO_VERS) AS CUIIO_VERS 

         
      FROM CIS2.FORM_CUIIO FC
      
      WHERE  
      1=1 
      
      AND FC.FORM IN (:pFORM)
      
      AND FC.CUIIO_VERS <= :pPERIOADA - 1
      
      GROUP BY 
      CUIIO 
      ) FF ON (FF.CUIIO = F.CUIIO AND F.CUIIO_VERS = FF.CUIIO_VERS)
      
      
      
      LEFT  JOIN CIS2.RENIM R ON (R.CUIIO  = F.CUIIO  
        
                                   AND  R.CUIIO_VERS   = F.CUIIO_VERS )
      LEFT JOIN CIS2.VW_CL_CUATM CT ON (R.CUATM = CT.CODUL)    
      
      WHERE 
      
      F.FORM IN (:pFORM)
      AND F.STATUT <> '3'
      AND CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%'  ) COL2
       
      FROM DUAL 
  
  
  UNION 
  
  
  
  
  
  
  
  SELECT 
    
    '1' ORDINE,
    'Numarul rapoartelor redactate:' DENUMIRE,
    COUNT (DISTINCT CASE WHEN D.PERIOADA IN (:pPERIOADA) THEN D.CUIIO  END) AS COL1,
    COUNT (DISTINCT CASE WHEN D.PERIOADA IN (:pPERIOADA-1) THEN  D.CUIIO END) AS COL2
    FROM CIS2.VW_DATA_ALL D
  
  WHERE
  
  (D.PERIOADA IN (:pPERIOADA, :pPERIOADA-1)) AND
    
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46)
  AND
  D.CAPITOL IN (1,409,410,404,411,403)
  
  UNION 
  
  
  SELECT 
    
    '2' ORDINE,
    'Numarul rapoartelor eronate:' DENUMIRE,
    COUNT(DISTINCT CASE WHEN PERIOADA IN (:pPERIOADA) THEN CUIIO END) AS COL1,
    COUNT(DISTINCT CASE WHEN PERIOADA IN (:pPERIOADA - 1) THEN CUIIO END) AS COL12
    
    
    FROM CIS2.CONTROL
    
    WHERE 
    
    
    
    
    FORM = 46
    
    AND REZULTAT <> 'OK'
    AND PERIOADA IN (:pPERIOADA,:pPERIOADA-1)
  
  UNION 
  
  
  SELECT
            3||'_'||RIND ORDINE,
            DENUMIRE,
            COL1, 
            COL2  

           FROM
            (
 

                SELECT 
                     
                
                           A.RIND,         
                           CASE WHEN A.RIND = '01' THEN '01 - '||A.DENUMIRE  
                                 WHEN A.RIND = '02' THEN '02 - '||A.DENUMIRE
                                 WHEN A.RIND = '03' THEN '03 - '||A.DENUMIRE
                                 WHEN A.RIND = '04' THEN '04 - '||A.DENUMIRE
                                 WHEN A.RIND = '05' THEN '05 - '||A.DENUMIRE
                                 WHEN A.RIND = '06' THEN '06 - '||A.DENUMIRE
                                 WHEN A.RIND = '07' THEN '07 - '||A.DENUMIRE  
                            
                            ELSE A.DENUMIRE  END DENUMIRE, 
                            B.COL1,
                            B.COL2     
                     
                     FROM    
                   (         
                     SELECT 
                            R.RIND,
                            R.RIND_VERS,
                            R.DENUMIRE     
                                 
                            FROM 
                            
                            (   
                            SELECT 
                            R.RIND          RIND,
                            R.RIND_VERS     RIND_VERS,
                            R.DENUMIRE      DENUMIRE
                               
                            FROM CIS2.MD_RIND R
                            
                            INNER JOIN (                  
                            SELECT 
                            R.RIND,
                            MAX(R.RIND_VERS) AS RIND_VERS
                            
                            FROM CIS2.MD_RIND R 
                            
                            WHERE 
                            R.RIND_VERS <=:pPERIOADA
                            AND  (R.FORM =:pFORM) AND 
                            (R.FORM_VERS =:pFORM_VERS) AND
                            (:pID_MDTABLE=:pID_MDTABLE) AND 
                             R.FORM = 46  AND 
                             R.CAPITOL IN (1) AND 
                             R.RIND NOT IN  ('CD','-','CM')   
                            
                            GROUP BY 
                            R.RIND
                              
                            
                             ) RR   ON (    RR.RIND      = R.RIND
                                       AND  RR.RIND_VERS = R.RIND_VERS)
                                       
                                       
                            WHERE
                            
                           (R.FORM =:pFORM) AND 
                           (R.FORM_VERS =:pFORM_VERS) AND
                           (:pID_MDTABLE=:pID_MDTABLE) AND 
                           R.FORM = 46  AND 
                           R.CAPITOL IN (1) AND 
                           R.RIND NOT IN  ('CD','-','CM')                     
                           
                           
                           GROUP BY
                           R.RIND,
                           R.RIND_VERS,
                           R.DENUMIRE  ) R
                           
                           ORDER BY 
                           
                           R.RIND
                           
                           ) A  LEFT JOIN 
                           
                           
                           (
                           SELECT 


        MR.RIND,
        MR.RIND_VERS,
        MR.DENUMIRE DENUMIRE,
       SUM( CASE   WHEN D.PERIOADA IN (:pPERIOADA) AND   D.CUIIO = D.CUIIO AND D.COL1 = 1 THEN 1 ELSE NULL END)     AS COL1,
         
        SUM( CASE   WHEN D.PERIOADA IN (:pPERIOADA-1) AND   D.CUIIO = D.CUIIO AND D.COL1 = 1 THEN 1 ELSE NULL END)   AS COL2
        
FROM CIS2.VW_DATA_ALL D
  
  INNER JOIN CIS2.MD_RIND MR ON (MR.ID_MD = D.ID_MD)  


 WHERE
  
 (D.PERIOADA IN (:pPERIOADA,:pPERIOADA-1)) AND
    
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46)
  AND
  D.CAPITOL IN (1)
  
  
  
  
  GROUP  BY 
   MR.RIND,
   MR.RIND_VERS,
   MR.DENUMIRE
                           
                           ) B ON  
                           
                           ( 
                           A.RIND  = B.RIND
                           AND A.RIND_VERS   = B.RIND_VERS )
                           
                           
                           
                           
                           ORDER BY 
                           
                           A.RIND
                           
                           )
                           
                           
                           
                           )
                           
                           ORDER BY 
                           ORDINE;;"1";1;"";"";""
9511;"Tab.20 b";2008;46;2000;"Tab.20 b";"2";20.2;"1";  INSERT INTO TABLE_OUT
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
    COL1

  ) 

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
        COL1||'~'||ROWNUM   NR_ROW,        
        ROWNUM   ORDINE,
        '0' DECIMAL_POS,
        DENUMIRE NUME_ROW ,
        COL2
     

FROM 
(
 
  SELECT 
       
       '0' ORDINE,
       'Numarul intreprinderilor (total):' DENUMIRE,
       
        (SELECT 
       COUNT ( F.CUIIO)  AS CNT

        
   
   
     FROM CIS2.FORM_CUIIO F
     
        INNER JOIN 
      (
      SELECT 
        CUIIO, 
        MAX(CUIIO_VERS) AS CUIIO_VERS 

         
      FROM CIS2.FORM_CUIIO FC
      
      WHERE  
      1=1 
      
      AND FC.FORM IN (:pFORM)
      
      AND FC.CUIIO_VERS <= :pPERIOADA
      
      GROUP BY 
      CUIIO 
      ) FF ON (FF.CUIIO = F.CUIIO AND F.CUIIO_VERS = FF.CUIIO_VERS)
      
      
      
      LEFT  JOIN CIS2.RENIM R ON (R.CUIIO  = F.CUIIO  
        
                                   AND  R.CUIIO_VERS   = F.CUIIO_VERS )
      LEFT JOIN CIS2.VW_CL_CUATM CT ON (R.CUATM = CT.CODUL)    
      
      WHERE 
      
      F.FORM IN (:pFORM)
      AND F.STATUT <> '3'
      AND CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%'  ) COL1,
      
      (SELECT 
       COUNT ( F.CUIIO)  AS CNT

        
   
   
     FROM CIS2.FORM_CUIIO F
     
        INNER JOIN 
      (
      SELECT 
        CUIIO, 
        MAX(CUIIO_VERS) AS CUIIO_VERS 

         
      FROM CIS2.FORM_CUIIO FC
      
      WHERE  
      1=1 
      
      AND FC.FORM IN (:pFORM)
      
      AND FC.CUIIO_VERS <= :pPERIOADA - 1
      
      GROUP BY 
      CUIIO 
      ) FF ON (FF.CUIIO = F.CUIIO AND F.CUIIO_VERS = FF.CUIIO_VERS)
      
      
      
      LEFT  JOIN CIS2.RENIM R ON (R.CUIIO  = F.CUIIO  
        
                                   AND  R.CUIIO_VERS   = F.CUIIO_VERS )
      LEFT JOIN CIS2.VW_CL_CUATM CT ON (R.CUATM = CT.CODUL)    
      
      WHERE 
      
      F.FORM IN (:pFORM)
      AND F.STATUT <> '3'
      AND CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%'  ) COL2
       
      FROM DUAL  
  
  
  UNION 
  
  
  
  
  
  
  
  SELECT 
    
    '1' ORDINE,
    'Numarul rapoartelor redactate:' DENUMIRE,
    COUNT (DISTINCT CASE WHEN D.PERIOADA IN (:pPERIOADA) THEN D.CUIIO  END) AS COL1,
    COUNT (DISTINCT CASE WHEN D.PERIOADA IN (:pPERIOADA-1) THEN  D.CUIIO END) AS COL2
    FROM CIS2.VW_DATA_ALL D
  
  WHERE
  
  (D.PERIOADA IN (:pPERIOADA, :pPERIOADA-1)) AND
    
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46)
  AND
  D.CAPITOL IN (1,409,410,404,411,403)
  
  UNION 
  
  
  SELECT 
    
    '2' ORDINE,
    'Numarul rapoartelor eronate:' DENUMIRE,
    COUNT(DISTINCT CASE WHEN PERIOADA IN (:pPERIOADA) THEN CUIIO END) AS COL1,
    COUNT(DISTINCT CASE WHEN PERIOADA IN (:pPERIOADA - 1) THEN CUIIO END) AS COL12
    
    
    FROM CIS2.CONTROL
    
    WHERE 
    
    
    
    
    FORM = 46
    
    AND REZULTAT <> 'OK'
    AND PERIOADA IN (:pPERIOADA,:pPERIOADA-1)
  
  UNION 
  
  
  SELECT
            3||'_'||RIND ORDINE,
            DENUMIRE,
            COL1, 
            COL2  

           FROM
            (
 

                SELECT 
                     
                
                           A.RIND,         
                           CASE WHEN A.RIND = '01' THEN '01 - '||A.DENUMIRE  
                                 WHEN A.RIND = '02' THEN '02 - '||A.DENUMIRE
                                 WHEN A.RIND = '03' THEN '03 - '||A.DENUMIRE
                                 WHEN A.RIND = '04' THEN '04 - '||A.DENUMIRE
                                 WHEN A.RIND = '05' THEN '05 - '||A.DENUMIRE
                                 WHEN A.RIND = '06' THEN '06 - '||A.DENUMIRE
                                 WHEN A.RIND = '07' THEN '07 - '||A.DENUMIRE  
                            
                            ELSE A.DENUMIRE  END DENUMIRE, 
                            B.COL1,
                            B.COL2     
                     
                     FROM    
                   (         
                     SELECT 
                            R.RIND,
                            R.RIND_VERS,
                            R.DENUMIRE     
                                 
                            FROM 
                            
                            (   
                            SELECT 
                            R.RIND          RIND,
                            R.RIND_VERS     RIND_VERS,
                            R.DENUMIRE      DENUMIRE
                               
                            FROM CIS2.MD_RIND R
                            
                            INNER JOIN (                  
                            SELECT 
                            R.RIND,
                            MAX(R.RIND_VERS) AS RIND_VERS
                            
                            FROM CIS2.MD_RIND R 
                            
                            WHERE 
                            R.RIND_VERS <=:pPERIOADA
                            AND  (R.FORM =:pFORM) AND 
                            (R.FORM_VERS =:pFORM_VERS) AND
                            (:pID_MDTABLE=:pID_MDTABLE) AND 
                             R.FORM = 46  AND 
                             R.CAPITOL IN (404) AND 
                             R.RIND NOT IN  ('CD','-','CM')   
                            
                            GROUP BY 
                            R.RIND
                              
                            
                             ) RR   ON (    RR.RIND      = R.RIND
                                       AND  RR.RIND_VERS = R.RIND_VERS)
                                       
                                       
                            WHERE
                            
                           (R.FORM =:pFORM) AND 
                           (R.FORM_VERS =:pFORM_VERS) AND
                           (:pID_MDTABLE=:pID_MDTABLE) AND 
                           R.FORM = 46  AND 
                           R.CAPITOL IN (404) AND 
                           R.RIND NOT IN  ('CD','-','CM')                     
                           
                           
                           GROUP BY
                           R.RIND,
                           R.RIND_VERS,
                           R.DENUMIRE  ) R
                           
                           ORDER BY 
                           
                           R.RIND
                           
                           ) A  LEFT JOIN 
                           
                           
                           (
                           SELECT 


        MR.RIND,
        MR.RIND_VERS,
        MR.DENUMIRE DENUMIRE,
       SUM( CASE   WHEN D.PERIOADA IN (:pPERIOADA) AND   D.CUIIO = D.CUIIO AND D.COL1 = 1 THEN 1 ELSE NULL END)     AS COL1,
         
        SUM( CASE   WHEN D.PERIOADA IN (:pPERIOADA-1) AND   D.CUIIO = D.CUIIO AND D.COL1 = 1 THEN 1 ELSE NULL END)   AS COL2
        
FROM CIS2.VW_DATA_ALL D
  
  INNER JOIN CIS2.MD_RIND MR ON (MR.ID_MD = D.ID_MD)  


 WHERE
  
 (D.PERIOADA IN (:pPERIOADA,:pPERIOADA-1)) AND
    
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46)
  AND
  D.CAPITOL IN (404)
  
  
  
  
  GROUP  BY 
   MR.RIND,
   MR.RIND_VERS,
   MR.DENUMIRE
                           
                           ) B ON  
                           
                           ( 
                           A.RIND  = B.RIND
                           AND A.RIND_VERS   = B.RIND_VERS )
                           
                           
                           
                           
                           ORDER BY 
                           
                           A.RIND
                           
                           )
                           
                           
                           
                           )
                           
                           ORDER BY 
                           ORDINE;;"1";1;"";"";""
10531;"21";2008;46;2000;"Tab.21 a";"2";21.1;"1";DECLARE

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
    DF.COL3
   
    
  

   
FROM 
(


SELECT DISTINCT                                                                   
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
   R.CUATM||'~'||R.CUIIO AS NR_ROW, 
   0 AS ORDINE,
  '000' AS DECIMAL_POS,  
   R.DENUMIRE||' CAEM: '||R.CAEM2||')' AS NUME_ROW,
   R.CUIIO AS COL1,
   SUM(CASE WHEN D.PERIOADA IN :pPERIOADA   THEN D.RIND ELSE NULL END) AS COL2,
   SUM(CASE WHEN D.PERIOADA IN :pPERIOADA-1 THEN D.RIND ELSE NULL END) AS COL3  

FROM
  CIS2.VW_DATA_ALL D
  INNER JOIN (

SELECT
  DISTINCT
  R.CUIIO,
  R.CUATM,
  R.CUIIO_VERS,
  R.DENUMIRE  DENUMIRE,
  F.FORM,
  R.CAEM,
  R.CAEM2
FROM
  CIS2.RENIM R
  INNER JOIN CIS2.FORM_CUIIO F ON (R.CUIIO=F.CUIIO AND R.CUIIO_VERS=F.CUIIO_VERS)
  INNER JOIN CIS2.VW_DATA_ALL J ON F.FORM = J.FORM AND F.CUIIO = J.CUIIO AND F.CUIIO_VERS = J.CUIIO_VERS
  INNER JOIN 
  (
      SELECT
      R.CUIIO,
      MAX(R.CUIIO_VERS) AS CUIIO_VERS
    FROM
      CIS2.RENIM R
    WHERE
      R.CUIIO_VERS <= :pPERIOADA
    GROUP BY
      R.CUIIO
  ) D ON (R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS)
WHERE
  F.FORM IN (46) AND
  F.STATUT <> '3' AND
  
  (J.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') 
  ORDER BY CAEM2 
  
  
  
  ) R ON R.FORM = D.FORM AND R.CUIIO = D.CUIIO AND D.CUIIO_VERS <= R.CUIIO_VERS
  
WHERE
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  (D.FORM=:pFORM) AND
  (D.FORM_VERS=:pFORM_VERS) AND
  (:pID_MDTABLE=:pID_MDTABLE) AND
  (D.PERIOADA IN (:pPERIOADA, :pPERIOADA-1)) AND
   D.FORM IN (46) AND 
   D.CAPITOL IN (1) AND
   D.RIND NOT IN ('CM','CD','DIH') 
   
GROUP BY
  R.DENUMIRE,
  R.CUIIO,
  R.CUATM,
  R.CAEM2
  
ORDER BY
  R.CUIIO
  
  
   
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
       
      COL1, COL2, COL3
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
       
      CR.COL1, CR.COL2, CR.COL3
    );
  END LOOP;
END;
  
  
   
   
   ;;"1";3;"";"";""
9504;"21";2008;46;2000;"Tab.21 a - Pachet";"2";21.11;"1";DECLARE

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
    
    DF.COL4
   
    
  

   
FROM 
(


SELECT DISTINCT                                                                   
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
   R.CUATM||'~'||R.CUIIO AS NR_ROW, 
   0 AS ORDINE,
  '0000' AS DECIMAL_POS,  
   R.DENUMIRE||' CAEM: '||R.CAEM2||')' AS NUME_ROW,
   R.CUIIO AS COL1,
   MAX(CASE WHEN D.PERIOADA IN :pPERIOADA   THEN D.PACHET ELSE D.PACHET END) AS COL2,
   SUM(CASE WHEN D.PERIOADA IN :pPERIOADA   THEN D.RIND ELSE NULL END) AS COL3,
   SUM(CASE WHEN D.PERIOADA IN :pPERIOADA-1 THEN D.RIND ELSE NULL END) AS COL4  

FROM
  CIS2.VW_DATA_ALL D
  INNER JOIN (

SELECT
  DISTINCT
  R.CUIIO,
  
  R.CUATM,
  R.CUIIO_VERS,
  R.DENUMIRE  DENUMIRE,
  F.FORM,
  R.CAEM,
  R.CAEM2
FROM
  CIS2.RENIM R
  INNER JOIN CIS2.FORM_CUIIO F ON (R.CUIIO=F.CUIIO AND R.CUIIO_VERS=F.CUIIO_VERS)
  INNER JOIN CIS2.VW_DATA_ALL J ON F.FORM = J.FORM AND F.CUIIO = J.CUIIO AND F.CUIIO_VERS = J.CUIIO_VERS
  INNER JOIN 
  (
      SELECT
      R.CUIIO,
      MAX(R.CUIIO_VERS) AS CUIIO_VERS
    FROM
      CIS2.RENIM R
    WHERE
      R.CUIIO_VERS <= :pPERIOADA
    GROUP BY
      R.CUIIO
  ) D ON (R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS)
WHERE
  F.FORM IN (46) AND
  F.STATUT <> '3' AND
  
  (J.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') 
  ORDER BY CAEM2 
  
  
  
  ) R ON R.FORM = D.FORM AND R.CUIIO = D.CUIIO AND D.CUIIO_VERS <= R.CUIIO_VERS
  
WHERE
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  (D.FORM=:pFORM) AND
  (D.FORM_VERS=:pFORM_VERS) AND
  (:pID_MDTABLE=:pID_MDTABLE) AND
  (D.PERIOADA IN (:pPERIOADA, :pPERIOADA-1)) AND
   D.FORM IN (46) AND 
   D.CAPITOL IN (1) AND
   D.RIND NOT IN ('CM','CD','DIH') 
   
GROUP BY
  R.DENUMIRE,
  R.CUIIO,
  R.CUATM,
  R.CAEM2
  
ORDER BY
  R.CUIIO
  
  
   
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
       
      COL1, COL2, COL3, COL4
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
       
      CR.COL1, CR.COL2, CR.COL3, CR.COL4
    );
  END LOOP;
END;
  
  
   
   
   ;;"1";4;"";"";""
9505;"21b";2008;46;2000;"Tab.21 b";"2";21.2;"1";DECLARE

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
    DF.COL3
   
    
  

   
FROM 
(


SELECT DISTINCT                                                                   
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
   R.CUATM||'~'||R.CUIIO AS NR_ROW, 
   0 AS ORDINE,
  '000' AS DECIMAL_POS,  
   R.DENUMIRE||' CAEM: '||R.CAEM2||')' AS NUME_ROW,
   R.CUIIO AS COL1,
   SUM(CASE WHEN D.PERIOADA IN :pPERIOADA   THEN D.RIND ELSE NULL END) AS COL2,
   SUM(CASE WHEN D.PERIOADA IN :pPERIOADA-1 THEN D.RIND ELSE NULL END) AS COL3  

FROM
  CIS2.VW_DATA_ALL D
  INNER JOIN (

SELECT
  DISTINCT
  R.CUIIO,
  R.CUATM,
  R.CUIIO_VERS,
  R.DENUMIRE,
  F.FORM,
  R.CAEM,
  R.CAEM2
FROM
  CIS2.RENIM R
  INNER JOIN CIS2.FORM_CUIIO F ON (R.CUIIO=F.CUIIO AND R.CUIIO_VERS=F.CUIIO_VERS)
  INNER JOIN CIS2.VW_DATA_ALL J ON F.FORM = J.FORM AND F.CUIIO = J.CUIIO AND F.CUIIO_VERS = J.CUIIO_VERS
  INNER JOIN 
  (
      SELECT
      R.CUIIO,
      MAX(R.CUIIO_VERS) AS CUIIO_VERS
    FROM
      CIS2.RENIM R
    WHERE
      R.CUIIO_VERS <= :pPERIOADA
    GROUP BY
      R.CUIIO
  ) D ON (R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS)
WHERE
  F.FORM IN (46) AND
  F.STATUT <> '3' AND
  
  (J.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') 
  ORDER BY CAEM2 
  
  
  
  ) R ON R.FORM = D.FORM AND R.CUIIO = D.CUIIO AND D.CUIIO_VERS <= R.CUIIO_VERS
  
WHERE
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  (D.FORM=:pFORM) AND
  (D.FORM_VERS=:pFORM_VERS) AND
  (:pID_MDTABLE=:pID_MDTABLE) AND
  (D.PERIOADA IN (:pPERIOADA, :pPERIOADA-1)) AND
   D.FORM IN (46) AND 
   D.CAPITOL IN (404) AND
   D.RIND NOT IN ('CM','CD','DIH') 
   
GROUP BY
  R.DENUMIRE,
  R.CUIIO,
  R.CUATM,
  R.CAEM2
  
ORDER BY
  R.CUIIO
  
  
   
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
       
      COL1, COL2, COL3
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
       
      CR.COL1, CR.COL2, CR.COL3
    );
  END LOOP;
END;
  
  
   
   
   ;;"1";3;"";"";""
10532;"21b";2008;46;2000;"Tab.21 b - Pachet";"2";21.21;"1";DECLARE

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
    
    DF.COL4
   
    
  

   
FROM 
(


SELECT DISTINCT                                                                   
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
   R.CUATM||'~'||R.CUIIO AS NR_ROW, 
   0 AS ORDINE,
  '0000' AS DECIMAL_POS,  
   R.DENUMIRE||' CAEM: '||R.CAEM2||')' AS NUME_ROW,
   R.CUIIO AS COL1,
   MAX(CASE WHEN D.PERIOADA IN :pPERIOADA   THEN D.PACHET ELSE D.PACHET END) AS COL2,
   SUM(CASE WHEN D.PERIOADA IN :pPERIOADA   THEN D.RIND ELSE NULL END) AS COL3,
   SUM(CASE WHEN D.PERIOADA IN :pPERIOADA-1 THEN D.RIND ELSE NULL END) AS COL4  

FROM
  CIS2.VW_DATA_ALL D
  INNER JOIN (

SELECT
  DISTINCT
  R.CUIIO,
  
  R.CUATM,
  R.CUIIO_VERS,
  R.DENUMIRE  DENUMIRE,
  F.FORM,
  R.CAEM,
  R.CAEM2
FROM
  CIS2.RENIM R
  INNER JOIN CIS2.FORM_CUIIO F ON (R.CUIIO=F.CUIIO AND R.CUIIO_VERS=F.CUIIO_VERS)
  INNER JOIN CIS2.VW_DATA_ALL J ON F.FORM = J.FORM AND F.CUIIO = J.CUIIO AND F.CUIIO_VERS = J.CUIIO_VERS
  INNER JOIN 
  (
      SELECT
      R.CUIIO,
      MAX(R.CUIIO_VERS) AS CUIIO_VERS
    FROM
      CIS2.RENIM R
    WHERE
      R.CUIIO_VERS <= :pPERIOADA
    GROUP BY
      R.CUIIO
  ) D ON (R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS)
WHERE
  F.FORM IN (46) AND
  F.STATUT <> '3' AND
  
  (J.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') 
  ORDER BY CAEM2 
  
  
  
  ) R ON R.FORM = D.FORM AND R.CUIIO = D.CUIIO AND D.CUIIO_VERS <= R.CUIIO_VERS
  
WHERE
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  (D.FORM=:pFORM) AND
  (D.FORM_VERS=:pFORM_VERS) AND
  (:pID_MDTABLE=:pID_MDTABLE) AND
  (D.PERIOADA IN (:pPERIOADA, :pPERIOADA-1)) AND
   D.FORM IN (46) AND 
   D.CAPITOL IN (404) AND
   D.RIND NOT IN ('CM','CD','DIH') 
   
GROUP BY
  R.DENUMIRE,
  R.CUIIO,
  R.CUATM,
  R.CAEM2
  
ORDER BY
  R.CUIIO
  
  
   
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
       
      COL1, COL2, COL3, COL4
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
       
      CR.COL1, CR.COL2, CR.COL3, CR.COL4
    );
  END LOOP;
END;
  
  
   
   
   ;;"1";4;"";"";""
9523;"Tab.22";2008;46;2000;"Tab.22";"2";22;"1";  INSERT INTO TABLE_OUT
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
    COL1
  
  

  ) 

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
        AA.COL1||'~'||ROWNUM   NR_ROW,        
        ROWNUM   ORDINE,
        '0' DECIMAL_POS,
        AA.NUME_ROW  NUME_ROW ,
        AA.COL2  AS COL1
      

    
 

     FROM
     (

SELECT 
     CD.NR_ROW   AS NR_ROW,
     CD.NR_ROW   AS ORDINE,
     CD.NUME_ROW AS NUME_ROW,
    SUM(CASE WHEN  VC.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND D.CAPITOL IN (1)  AND D.RIND IN ('01') AND D.COL1 = 1  THEN 1 ELSE NULL END )  AS COL1,
    SUM(CASE WHEN  VC.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND D.CAPITOL IN (404)  AND D.RIND IN ('01') AND D.COL1 = 1  THEN 1 ELSE NULL END )  AS COL2,
     SUM(CASE WHEN  VC.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND D.CAPITOL IN (1)  AND D.RIND IN ('05') AND D.COL1 = 1  THEN 1 ELSE NULL END )  AS COL3,
    SUM(CASE WHEN  VC.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND D.CAPITOL IN (404)  AND D.RIND IN ('05') AND D.COL1 = 1  THEN 1 ELSE NULL END )  AS COL4
 

 FROM
    
     CIS2.VW_DATA_ALL D
     
      INNER JOIN CIS2.VW_CL_CUATM VC ON (VC.CODUL=D.CUATM)
      CROSS JOIN  
    
    
     
(
   SELECT 
         DENUMIRE           NUME_ROW,
         RIND               NR_ROW,
         RINDOUT           CUATM
        
        FROM CIS2.MD_RIND_OUT
        
        WHERE 
        
        ID_MDTABLE = 8096
   )
   CD
      
      

WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
   D.FORM IN (46) AND D.CAPITOL IN (1,404)
  
  

  
  GROUP BY 
    CD.NR_ROW,
    CD.NUME_ROW
      
    ORDER BY 
    CD.NR_ROW
  
  ) AA 
  
   ORDER BY AA.ORDINE;;"1";1;"";"";""
9520;"Tab.22 a";2008;46;2000;"Tab.22 a";"2";22.2;"1";  INSERT INTO TABLE_OUT
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
    COL1,
    COL2,
    COL3
  

  ) 

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
        AA.COL1||'~'||ROWNUM   NR_ROW,        
        ROWNUM   ORDINE,
        '000' DECIMAL_POS,
        AA.NUME_ROW  NUME_ROW ,
        AA.COL2  AS COL1,
        AA.COL3  AS COL2,
        AA.COL4  AS COL3
     

    
 

     FROM
     (

SELECT 
     CD.NR_ROW   AS NR_ROW,
     CD.NR_ROW   AS ORDINE,
     CD.NUME_ROW AS NUME_ROW,
    SUM(CASE WHEN  VC.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND D.CAPITOL IN (1)  AND D.RIND IN ('01') AND D.COL1 = 1  THEN 1 ELSE NULL END )  AS COL1,
    SUM(CASE WHEN  VC.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND D.CAPITOL IN (404)  AND D.RIND IN ('01') AND D.COL1 = 1  THEN 1 ELSE NULL END )  AS COL2,
     SUM(CASE WHEN  VC.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND D.CAPITOL IN (1)  AND D.RIND IN ('05') AND D.COL1 = 1  THEN 1 ELSE NULL END )  AS COL3,
    SUM(CASE WHEN  VC.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND D.CAPITOL IN (404)  AND D.RIND IN ('05') AND D.COL1 = 1  THEN 1 ELSE NULL END )  AS COL4
 

 FROM
    
     CIS2.VW_DATA_ALL D
     
      INNER JOIN CIS2.VW_CL_CUATM VC ON (VC.CODUL=D.CUATM)
      CROSS JOIN  
    
    
     
(
   SELECT 
         DENUMIRE           NUME_ROW,
         RIND               NR_ROW,
         RINDOUT           CUATM
        
        FROM CIS2.MD_RIND_OUT
        
        WHERE 
        
        ID_MDTABLE = 8096
   )
   CD
      
      

WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
   D.FORM IN (46) AND D.CAPITOL IN (1,404)
  
  

  
  GROUP BY 
    CD.NR_ROW,
    CD.NUME_ROW
      
    ORDER BY 
    CD.NR_ROW
  
  ) AA 
  
   ORDER BY AA.ORDINE;;"1";3;"";"";""
9522;"Tab.22 b";2008;46;2000;"Tab.22 b";"2";22.3;"1";  INSERT INTO TABLE_OUT
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
    COL13

  ) 

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
        AA.COL1||'~'||ROWNUM   NR_ROW,        
        ROWNUM   ORDINE,
        '0000000000000' DECIMAL_POS,
        AA.NUME_ROW  NUME_ROW ,
        AA.COL2   AS COL1,
        AA.COL3   AS COL2,
        AA.COL4   AS COL3,
        AA.COL5   AS COL4,
        AA.COL6   AS COL5,
        AA.COL7   AS COL6,
        AA.COL8   AS COL7,
        AA.COL9   AS COL8,
        AA.COL10  AS COL9,
        AA.COL11  AS COL10,
        AA.COL12  AS COL11,
        AA.COL13  AS COL12,
        AA.COL404  AS COL13
     

    
 

     FROM
     (

SELECT 
     CD.NR_ROW   AS NR_ROW,
     CD.NR_ROW   AS ORDINE,
     CD.NUME_ROW AS NUME_ROW,
     SUM(CASE WHEN  VC.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND D.CAPITOL IN (1)  AND D.RIND IN ('01') AND D.COL1 = 1  THEN 1 ELSE NULL END )  AS COL1,
     SUM(CASE WHEN  VC.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND D.CAPITOL IN (404)  AND D.RIND IN ('01') AND D.COL1 = 1  THEN 1 ELSE NULL END )  AS COL2,
     SUM(CASE WHEN  VC.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND D.CAPITOL IN (1)  AND D.RIND IN ('02') AND D.COL1 = 1  THEN 1 ELSE NULL END )  AS COL3,
     SUM(CASE WHEN  VC.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND D.CAPITOL IN (404)  AND D.RIND IN ('02') AND D.COL1 = 1  THEN 1 ELSE NULL END )  AS COL4,
     SUM(CASE WHEN  VC.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND D.CAPITOL IN (1)  AND D.RIND IN ('03') AND D.COL1 = 1  THEN 1 ELSE NULL END )  AS COL5,
     SUM(CASE WHEN  VC.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND D.CAPITOL IN (404)  AND D.RIND IN ('03') AND D.COL1 = 1  THEN 1 ELSE NULL END )  AS COL6,
     SUM(CASE WHEN  VC.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND D.CAPITOL IN (1)  AND D.RIND IN ('04') AND D.COL1 = 1  THEN 1 ELSE NULL END )  AS COL7,
     SUM(CASE WHEN  VC.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND D.CAPITOL IN (404)  AND D.RIND IN ('04') AND D.COL1 = 1  THEN 1 ELSE NULL END )  AS COL8,
     SUM(CASE WHEN  VC.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND D.CAPITOL IN (1)  AND D.RIND IN ('05') AND D.COL1 = 1  THEN 1 ELSE NULL END )  AS COL9,
     SUM(CASE WHEN  VC.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND D.CAPITOL IN (404)  AND D.RIND IN ('05') AND D.COL1 = 1  THEN 1 ELSE NULL END )  AS COL10,
     SUM(CASE WHEN  VC.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND D.CAPITOL IN (1)  AND D.RIND IN ('06') AND D.COL1 = 1  THEN 1 ELSE NULL END )  AS COL11,
     SUM(CASE WHEN  VC.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND D.CAPITOL IN (404)  AND D.RIND IN ('06') AND D.COL1 = 1  THEN 1 ELSE NULL END )  AS COL12,
     SUM(CASE WHEN  VC.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND D.CAPITOL IN (1)  AND D.RIND IN ('07')  AND D.COL1 = 1  THEN 1 ELSE NULL END )  AS COL13,
     SUM(CASE WHEN  VC.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND D.CAPITOL IN (404)  AND D.RIND IN ('07') AND D.COL1 = 1  THEN 1 ELSE NULL END )  AS COL404
 

 FROM
    
     CIS2.VW_DATA_ALL D
     
      INNER JOIN CIS2.VW_CL_CUATM VC ON (VC.CODUL=D.CUATM)
      CROSS JOIN  
    
    
     
(
   SELECT 
         DENUMIRE           NUME_ROW,
         RIND               NR_ROW,
         RINDOUT           CUATM
        
        FROM CIS2.MD_RIND_OUT
        
        WHERE 
        
        ID_MDTABLE = 8096
   )
   CD
      
      

WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
   D.FORM IN (46) AND D.CAPITOL IN (1,404)
  
  

  
  GROUP BY 
    CD.NR_ROW,
    CD.NUME_ROW
      
    ORDER BY 
    CD.NR_ROW
  
 ) AA 
  
   ORDER BY AA.ORDINE;;"1";13;"";"";""
