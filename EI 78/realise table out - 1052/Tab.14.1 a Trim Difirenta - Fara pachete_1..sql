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
NVAL(SUM(COL1)) - NVAL(COL2) AS COL3
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
    NVAL(SUM(L.COL1)) - NVAL(SUM(R.COL2))  AS COL3 
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
  

   AND D.CUIIO = 20282383
  
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
  
  AND D.CUIIO = 20282383


  
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
    
     NVAL(SUM(L.COL1)) - NVAL(SUM(R.COL2)) >   500000
    
    OR
    
     NVAL(SUM(R.COL2)) - NVAL(SUM(L.COL1)) >   500000
    
    
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