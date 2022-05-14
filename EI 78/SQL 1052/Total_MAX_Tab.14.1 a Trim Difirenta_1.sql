SELECT 
L.CUIIO L_CUIIO,
R.CUIIO R_CUIIO,
L.SERV_CODUL L_SERV_CODUL,
R.SERV_CODUL R_SERV_CODUL,
L.SERV_CODUL_OLD  L_SERV_CODUL_OLD,
R.SERV_CODUL_OLD  R_SERV_CODUL_OLD,
L.DENUMIRE L_DENUMIRE,
R.DENUMIRE R_DENUMIRE,
L.COL1  L_COL1,
R.COL1  R_COL1,
L.COL2  L_COL2,
R.COL2  R_COL2,
L.COL3  L_COL3,
R.COL3  R_COL3,
L.COL4  L_COL4,
R.COL4  R_COL4,
L.COL5  L_COL5,
R.COL5  R_COL5




FROM 
(
SELECT 

L.CUIIO,
L.SERV_CODUL,
L.SERV_CODUL_OLD,
L.DENUMIRE,
L.COL1,
L.COL2,
L.COL3,
L.COL4,
L.COL5
FROM 
(
SELECT 
CUIIO,
SERV_CODUL,
SERV_CODUL_OLD,
DENUMIRE,
MAX(COL1) AS COL1,
SUM(COL2) AS COL2,
SUM(COL3) AS COL3,
SUM(COL4) AS COL4,
SUM(COL5) AS COL5

FROM

(
SELECT 
    CUIIO,
ORDINE,
SERV_CODUL,
SERV_CODUL_OLD,
DENUMIRE,
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
    
    
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','-')  THEN NVAL(D.COL4) ELSE 0 END ))  
   
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
  AND  D.CAPITOL IN (405) 
  

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
    
    
       (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-')  THEN  NVAL(D.COL4) ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-')  THEN  NVAL(D.COL4) ELSE 0 END ))
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
  (D.PERIOADA IN(:pPERIOADA-1)) AND    
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
 -- (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND  D.CAPITOL IN (405,406) 
  
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
 
    L.CUIIO
 

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
    
    
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','-')  THEN NVAL(D.COL4) ELSE 0 END ))  
   
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
  AND  D.CAPITOL IN (405) 
  

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
    
    
       (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-')  THEN  NVAL(D.COL4) ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-')  THEN  NVAL(D.COL4) ELSE 0 END ))
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
  (D.PERIOADA IN(:pPERIOADA-1)) AND    
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
 -- (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND  D.CAPITOL IN (405,406) 
  
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


)




GROUP BY 
CUIIO,

SERV_CODUL,
SERV_CODUL_OLD,
DENUMIRE

HAVING 
1=1
--AND CUIIO = 40929220


ORDER BY
CUIIO

) L  



WHERE 
L.SERV_CODUL NOT  IN ('9999999')

ORDER BY 
L.CUIIO

) L LEFT JOIN (

SELECT 

L.CUIIO,
L.SERV_CODUL,
L.SERV_CODUL_OLD,
L.DENUMIRE,
L.COL1,
L.COL2,
L.COL3,
L.COL4,
L.COL5
FROM 
(
SELECT 
CUIIO,
SERV_CODUL,
SERV_CODUL_OLD,
DENUMIRE,
MAX(COL1) AS COL1,
SUM(COL2) AS COL2,
SUM(COL3) AS COL3,
SUM(COL4) AS COL4,
SUM(COL5) AS COL5

FROM

(
SELECT 
    CUIIO,
ORDINE,
SERV_CODUL,
SERV_CODUL_OLD,
DENUMIRE,
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
    
    
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','-')  THEN NVAL(D.COL4) ELSE 0 END ))  
   
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
  AND  D.CAPITOL IN (405) 
  

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
    
    
       (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-')  THEN  NVAL(D.COL4) ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-')  THEN  NVAL(D.COL4) ELSE 0 END ))
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
  (D.PERIOADA IN(:pPERIOADA-1)) AND    
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
 -- (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND  D.CAPITOL IN (405,406) 
  
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
 
    L.CUIIO
 

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
    
    
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','-')  THEN NVAL(D.COL4) ELSE 0 END ))  
   
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
  AND  D.CAPITOL IN (405) 
  

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
    
    
       (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-')  THEN  NVAL(D.COL4) ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-')  THEN  NVAL(D.COL4) ELSE 0 END ))
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
  (D.PERIOADA IN(:pPERIOADA-1)) AND    
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
 -- (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND  D.CAPITOL IN (405,406) 
  
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


)




GROUP BY 
CUIIO,

SERV_CODUL,
SERV_CODUL_OLD,
DENUMIRE

HAVING 
1=1
--AND CUIIO = 40929220


ORDER BY
CUIIO

) L  



WHERE 
L.SERV_CODUL  IN ('9999999')

ORDER BY 
L.CUIIO


) R ON L.CUIIO = R.CUIIO

ORDER BY

R_COL5