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
    DF.COL5
   
   
   FROM 
(






SELECT 
    :pPERIOADA AS PERIOADA,
    :pFORM AS FORM,
    :pFORM_VERS AS FORM_VERS,
    :pID_MDTABLE AS ID_MDTABLE,
    :pCOD_CUATM AS COD_CUATM,
    '0' AS NR_SECTIE,
   '0' AS  NUME_SECTIE,
    '0' AS NR_SECTIE1,
    '0' AS NUME_SECTIE1,
    '0' AS NR_SECTIE2,
    '0' AS NUME_SECTIE2,
     CUIIO||'-'||SERV_CODUL||'-'||SERV_CODUL_OLD||'~'||ROWNUM NR_ROW,
     ROWNUM  AS ORDINE,
     '00000' AS DECIMAL_POS,
     CUIIO||'-'||DENUMIRE NUME_ROW,
     PACHET     COL1,
     REPLACE(SERV_CODUL,'.','')   COL2,
   
    
     COL1 COL3,
     COL2 COL4,
     COL3 COL5
     FROM

(
SELECT
ORDINE,
CUIIO,
CUATM,
PACHET,
SERV_CODUL,
SERV_CODUL_OLD,
NULL DENUMIRE,
COL1,
COL2,
COL3

 
FROM 

(
SELECT 
1 ORDINE,
CUIIO,
CUATM,
PACHET,

'9999999' SERV_CODUL,
SERV_CODUL_OLD,

SUM(COL1) AS COL1,
COL2 AS COL2,
SUM(COL1) - COL2 AS COL3
FROM
(
SELECT  
 
    L.CUIIO,
    L.CUATM,
    L.PACHET,

    L.SERV_CODUL,
  
    L.SERV_CODUL_OLD,

    SUM(L.COL1) AS  COL1,
    SUM(R.COL2) AS  COL2, 
    SUM(L.COL1) - SUM(R.COL2)  AS COL3 
FROM 

(
SELECT 
    D.CUIIO,
    D.PACHET,
    D.CUATM,
    C.FULL_CODE,
    CI.ITEM_CODE    SERV_CODUL,
    CI.A01          SERV_CODUL_OLD,
    CI.NAME||' - '||R.DENUMIRE  DENUMIRE,
    
    
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (407)  AND D.RIND NOT IN ('1','-')  THEN NVAL(D.COL4) ELSE 0 END ))  
   
    AS COL1

   
     
    FROM
    
     CIS2.VW_DATA_ALL D 
     
  
      INNER JOIN (
         
         SELECT
                  CI.ITEM_CODE,
                  CI.A01,
                  CI.ITEM_PATH,
                  CI.NAME,
                  CI.SHOW_ORDER,
                  MAX(CI.ITEM_CODE_VERS) AS ITEM_CODE_VERS
                FROM
                  VW_CLS_CLASS_ITEM CI
                WHERE
                  CI.CLASS_CODE IN ('CSPM2') 
    
                GROUP BY
                  CI.ITEM_CODE,
                  CI.A01,
                  CI.ITEM_PATH,
                  CI.NAME,
                  CI.SHOW_ORDER
                  
             ) CI ON (
             
             TRIM(D.COL31)=TRIM(CI.ITEM_CODE)
             
             )
         
     INNER JOIN CIS2.RENIM R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS) 
     
      INNER JOIN CIS2.VW_CL_CUATM C ON (D.CUATM=C.CODUL) 
            
     
     
    
  WHERE 
  (D.PERIOADA IN(:pPERIOADA)) AND    
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
 -- (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND  D.CAPITOL IN (407) 
  

  --AND D.CUIIO = 4518099
  
  GROUP BY 

D.PACHET,
 D.CUATM,
 C.FULL_CODE,
 R.DENUMIRE,
 D.CUIIO,
CI.A01,
 CI.ITEM_CODE,
 CI.NAME

  
  

  ORDER BY 
 C.FULL_CODE,
  D.CUIIO  ) L LEFT JOIN (
  
  SELECT 
    D.CUIIO,
 
    D.CUATM,
    C.FULL_CODE,
    CI.ITEM_CODE    SERV_CODUL,
    CI.A01          SERV_CODUL_OLD,
    CI.NAME  DENUMIRE,
    
    
       (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-4) AND  D.CAPITOL IN (407)  AND D.RIND NOT IN ('1','2','-')  THEN  NVAL(D.COL4) ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-4) AND   D.CAPITOL IN (408)  AND D.RIND NOT IN ('1','-')  THEN  NVAL(D.COL4) ELSE 0 END ))
    AS COL2
   
     
    FROM
    
     CIS2.VW_DATA_ALL D 

     
      INNER JOIN (
         
         SELECT
                  CI.ITEM_CODE,
                  CI.A01,
                  CI.ITEM_PATH,
                  CI.NAME,
                  CI.SHOW_ORDER,
                  MAX(CI.ITEM_CODE_VERS) AS ITEM_CODE_VERS
                FROM
                  VW_CLS_CLASS_ITEM CI
                WHERE
                  CI.CLASS_CODE IN ('CSPM2') 
    
                GROUP BY
                  CI.ITEM_CODE,
                  CI.A01,
                  CI.ITEM_PATH,
                  CI.NAME,
                  CI.SHOW_ORDER
                  
             ) CI ON (TRIM(D.COL1)=TRIM(CI.A01))
         
     INNER JOIN CIS2.RENIM R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS) 
      INNER JOIN CIS2.VW_CL_CUATM C ON (D.CUATM=C.CODUL) 
    
  WHERE 
  (D.PERIOADA IN(:pPERIOADA-4)) AND    
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
 -- (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND  D.CAPITOL IN (407) 
  
--AND D.CUIIO = 4518099


  
  GROUP BY 


 D.CUATM,
 C.FULL_CODE,
 D.CUIIO,
CI.A01,
 CI.ITEM_CODE,
 CI.NAME
  
  

  ORDER BY 
 C.FULL_CODE,
  D.CUIIO
  
  
  ) R ON R.CUIIO = L.CUIIO AND L.SERV_CODUL = R.SERV_CODUL
  
   --INNER JOIN CIS2.VW_CL_CUATM CC ON (L.FULL_CODE LIKE '%'||CC.CODUL ||';%' )

GROUP BY 
--    CC.CODUL,
--    CC.DENUMIRE,  
--     CC.FULL_CODE, 
    L.CUIIO,
    L.CUATM,
    L.PACHET,

     L.SERV_CODUL,
     L.SERV_CODUL_OLD
   -- L.DENUMIRE
    
    
    HAVING 
    
    SUM(L.COL1) - SUM(R.COL2) >   500000
    
    OR
    
     SUM(R.COL2) - SUM(L.COL1) >   500000
    
    
    ORDER BY
   -- CC.FULL_CODE,
    L.CUIIO
 --   L.SERV_CODUL

)


GROUP BY 
CUIIO,
CUATM,
SERV_CODUL_OLD,
COL2,
PACHET
)

UNION 

SELECT
ORDINE,
CUIIO,
CUATM,
PACHET,
SERV_CODUL,
SERV_CODUL_OLD,
DENUMIRE,
COL1,
COL2,
COL3

 
FROM 

(


(

SELECT  
    2 ORDINE,
    L.CUIIO,
    L.CUATM,
    L.PACHET,

    L.SERV_CODUL,
    L.SERV_CODUL_OLD,
    L.DENUMIRE,
    SUM(L.COL1) AS  COL1,
    SUM(R.COL2) AS  COL2, 
    SUM(L.COL1) - SUM(R.COL2)  AS COL3 
FROM 

(
SELECT 
    D.CUIIO,
    D.PACHET,
    D.CUATM,
    C.FULL_CODE,
    CI.ITEM_CODE    SERV_CODUL,
    CI.A01          SERV_CODUL_OLD,
    CI.NAME||' - '||R.DENUMIRE  DENUMIRE,
    
    
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (407)  AND D.RIND NOT IN ('1','-')  THEN NVAL(D.COL4) ELSE 0 END ))  
   
    AS COL1

   
     
    FROM
    
     CIS2.VW_DATA_ALL D 
     
  
      INNER JOIN (
         
         SELECT
                  CI.ITEM_CODE,
                  CI.A01,
                  CI.ITEM_PATH,
                  CI.NAME,
                  CI.SHOW_ORDER,
                  MAX(CI.ITEM_CODE_VERS) AS ITEM_CODE_VERS
                FROM
                  VW_CLS_CLASS_ITEM CI
                WHERE
                  CI.CLASS_CODE IN ('CSPM2') 
    
                GROUP BY
                  CI.ITEM_CODE,
                  CI.A01,
                  CI.ITEM_PATH,
                  CI.NAME,
                  CI.SHOW_ORDER
                  
             ) CI ON (
             
             TRIM(D.COL31)=TRIM(CI.ITEM_CODE)
             
             )
         
     INNER JOIN CIS2.RENIM R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS) 
     
      INNER JOIN CIS2.VW_CL_CUATM C ON (D.CUATM=C.CODUL) 
            
     
     
    
  WHERE 
  (D.PERIOADA IN(:pPERIOADA)) AND    
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
 -- (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND  D.CAPITOL IN (407) 
  

  --AND D.CUIIO = 4518099
  
  GROUP BY 

D.PACHET,
 D.CUATM,
 C.FULL_CODE,
 R.DENUMIRE,
 D.CUIIO,
CI.A01,
 CI.ITEM_CODE,
 CI.NAME

  
  

  ORDER BY 
 C.FULL_CODE,
  D.CUIIO  ) L LEFT JOIN (
  
  SELECT 
    D.CUIIO,
 
    D.CUATM,
    C.FULL_CODE,
    CI.ITEM_CODE    SERV_CODUL,
    CI.A01          SERV_CODUL_OLD,
    CI.NAME  DENUMIRE,
    
    
       (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-4) AND  D.CAPITOL IN (407)  AND D.RIND NOT IN ('1','2','-')  THEN  NVAL(D.COL4) ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-4) AND   D.CAPITOL IN (408)  AND D.RIND NOT IN ('1','-')  THEN  NVAL(D.COL4) ELSE 0 END ))
    AS COL2
   
     
    FROM
    
     CIS2.VW_DATA_ALL D 

     
      INNER JOIN (
         
         SELECT
                  CI.ITEM_CODE,
                  CI.A01,
                  CI.ITEM_PATH,
                  CI.NAME,
                  CI.SHOW_ORDER,
                  MAX(CI.ITEM_CODE_VERS) AS ITEM_CODE_VERS
                FROM
                  VW_CLS_CLASS_ITEM CI
                WHERE
                  CI.CLASS_CODE IN ('CSPM2') 
    
                GROUP BY
                  CI.ITEM_CODE,
                  CI.A01,
                  CI.ITEM_PATH,
                  CI.NAME,
                  CI.SHOW_ORDER
                  
             ) CI ON (TRIM(D.COL1)=TRIM(CI.A01))
         
     INNER JOIN CIS2.RENIM R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS) 
      INNER JOIN CIS2.VW_CL_CUATM C ON (D.CUATM=C.CODUL) 
    
  WHERE 
  (D.PERIOADA IN(:pPERIOADA-4)) AND    
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
 -- (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND  D.CAPITOL IN (407,408) 
  
  --AND D.CUIIO = 4518099


  
  GROUP BY 


 D.CUATM,
 C.FULL_CODE,
 D.CUIIO,
CI.A01,
 CI.ITEM_CODE,
 CI.NAME
  
  

  ORDER BY 
 C.FULL_CODE,
  D.CUIIO
  
  
  ) R ON R.CUIIO = L.CUIIO AND L.SERV_CODUL = R.SERV_CODUL
  


GROUP BY 

    L.CUIIO,
    L.PACHET,
    L.CUATM,
    L.SERV_CODUL,
     L.SERV_CODUL_OLD,
    L.DENUMIRE
    
    
    HAVING 
    
    SUM(L.COL1) - SUM(R.COL2) >   500000
    
    OR
    
     SUM(R.COL2) - SUM(L.COL1) >   500000
    
    
    ORDER BY

    L.CUIIO,
    L.SERV_CODUL
    )
    )

ORDER BY 
CUIIO,
ORDINE,
SERV_CODUL,
SERV_CODUL_OLD
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
       
      COL1, COL2, COL3,  COL4, COL5
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