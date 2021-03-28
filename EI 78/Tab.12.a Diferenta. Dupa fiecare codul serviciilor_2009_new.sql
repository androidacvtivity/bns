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

--SELECT
--    '1' ORDINE, 
--
----    A.CUIIO, 
----    A.SERV_CODUL,
----    A.DENUMIRE,
--
--   0 AS CUIIO,
--    '0'   SERV_CODUL, 
--   
--    'Total' DENUMIRE,
--    
--    SUM(A.COL1)  AS COL1,
--    SUM(A.COL2)  AS COL2,
--    SUM(B.COL1)  AS COL3,
--    SUM(B.COL2)  AS COL4,
--    SUM(A.COL1) - SUM(B.COL1) AS COL5,
--    SUM(A.COL2) - SUM(B.COL2) AS COL6
--FROM 
--
--(
--
--SELECT 
--    D.CUIIO AS CUIIO,
--    SS.CODUL   SERV_CODUL, 
--    SS.DENUMIRE||'-'||MAX(R.DENUMIRE) DENUMIRE,
--    
--    
--   
--    (SUM(CASE WHEN  MR.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
--    +
--    SUM(CASE WHEN  MR.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
--    AS COL1,
--    ---------------------------------------------------------------------------------------------------------------------
--  
--    
--    (SUM(CASE WHEN  MR.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
--    +
--    SUM(CASE WHEN  MR.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1
--    AS COL2
--    
--    
--    
--FROM CIS2.DATA_ALL D 
--        
--        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
--        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
--        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
--    
--      
--        
--    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
--    
--  
--        
--        -------------------------------------------------------------------------------
--        CROSS JOIN (
--         SELECT
--            SUM(D.COL1) AS COL1            
--                  FROM DATA_ALL D
--                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
--                      
--                        WHERE
--                             (D.PERIOADA =:pPERIOADA) AND               
--                              D.FORM IN (100)
--                              AND D.CUIIO IN (5)
--                              AND MR.CAPITOL IN (10003)
--                              AND MR.RIND IN ('01') 
--                              
--                              
--                              ) CR
--        ------------------------------------------------------------------------------   
--        
--   WHERE 
--  (D.PERIOADA =:pPERIOADA) AND 
--  (D.FORM =:pFORM) AND
--  (D.FORM_VERS =:pFORM_VERS) AND 
--  (:pID_MDTABLE =:pID_MDTABLE) AND
--  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
--  D.FORM IN (46) AND
--  MR.CAPITOL IN (409,410)
-- 
-- AND SS.CODUL <> '0'
--  -------------------------------------------------
--  GROUP BY 
--
--  D.CUIIO,
--  SS.CODUL,
--  SS.DENUMIRE,
--  CR.COL1
-- 
--  
--  )  A  LEFT JOIN 
--  
--  (
--  
--  SELECT 
-- CUIIO,
-- SERV_CODUL,
-- MAX(DENUMIRE)  DENUMIRE,
-- SUM(COL1) AS COL1,
--SUM(COL2) AS COL2
--
-- 
--FROM
-- 
--(
--SELECT 
--    D.PERIOADA,
--    D.CUIIO AS CUIIO,
--    SS.CODUL   SERV_CODUL, 
--    SS.DENUMIRE||'-'||MAX(R.DENUMIRE) DENUMIRE,
--    
--  
--   (SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
--    +
--    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
--    AS COL1,
--    
--    
--    ROUND((SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
--    +
--    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1,0)
--    AS COL2
--        
-- 
--   
--     
--          
--    FROM
--    
--     CIS2.VW_DATA_ALL D 
--     
--    INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
--    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 ) 
--    
--   INNER JOIN CIS2.RENIM R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS) 
--   
--    LEFT JOIN (
--    
--    SELECT
--            
--            D.PERIOADA,
--            SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) THEN D.COL1 ELSE NULL  END ) AS COL1            
--                  FROM DATA_ALL D
--                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
--                          INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
--                      
--                        WHERE
--                              P.PERIOADA_ANULA = :pPERIOADA AND            
--                              D.FORM IN (101)
--                              AND D.CUIIO IN (5)
--                              AND MR.CAPITOL IN (10002)
--                              AND MR.RIND IN ('01')
--            
--            GROUP BY 
--            D.PERIOADA 
--    )    CR  ON (D.PERIOADA=CR.PERIOADA)
--
--           
--           
--   WHERE        
--   
--  (D.FORM = 44) AND
--  (D.FORM_VERS = 1004) AND 
--  (:pID_MDTABLE =:pID_MDTABLE) AND
--  
--  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
--  
--  (D.FORM IN (44) AND D.CAPITOL IN (405,406)) AND 
-- 
--  P.PERIOADA_ANULA = :pPERIOADA
-- 
--   AND SS.CODUL <> '0'
--   
--   
--  
--
--  GROUP BY  
--  D.PERIOADA,
--  D.CUIIO,
--  SS.CODUL,
--  SS.DENUMIRE,
--  CR.COL1
--  )
--  
--  GROUP BY 
--   CUIIO,
-- SERV_CODUL
-- 
-- --,
-- --DENUMIRE
--
--  
--  
--  ) B ON (B.CUIIO = A.CUIIO  AND B.SERV_CODUL  = A.SERV_CODUL)
--  
--  
--  
----  GROUP BY 
----
----    A.CUIIO, 
----    A.SERV_CODUL,
----    A.DENUMIRE
--     
--     
--     
--     
--     UNION 
     
     
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
END;