



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
     CUIIO||'-'||SERV_CODUL||'-'||SERV_CODUL_OLD||'~'||ROWNUM NR_ROW,
     ROWNUM  AS ORDINE,
     '00000' AS DECIMAL_POS,
     DENUMIRE NUME_ROW,
     PACHET     COL1,
     REPLACE(SERV_CODUL,'.','')   COL2,
   
    
     COL1 COL3,
     COL2 COL4,
     COL3 COL5
     
     
     

 
    FROM  

(
SELECT  
    CC.CODUL CUATM_CODUL,
    CC.DENUMIRE DENUMIRE_CUATM,  
    CC.FULL_CODE,    
    L.CUIIO,
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
  

--AND D.CUIIO = 25951
  
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
  
 
-- AND D.CUIIO = 25951


  
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
  
   INNER JOIN CIS2.VW_CL_CUATM CC ON (L.FULL_CODE LIKE '%'||CC.CODUL ||';%' )

GROUP BY 
    CC.CODUL,
    CC.DENUMIRE,  
     CC.FULL_CODE, 
    L.CUIIO,
    L.PACHET,
  --  L.CUATM,
   -- L.FULL_CODE,
    L.SERV_CODUL,
     L.SERV_CODUL_OLD,
    L.DENUMIRE
    
    
    HAVING 
    
    SUM(L.COL1) - SUM(R.COL2) >   500000
    
    OR
    
     SUM(R.COL2) - SUM(L.COL1) >   500000
    
    
    ORDER BY
    CC.FULL_CODE,
    L.CUIIO,
    L.SERV_CODUL
    
    )
    
    WHERE 
   
   CUATM_CODUL  IN (
   
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



