SELECT 
    D.CUIIO,
 
    D.CUATM,
    C.FULL_CODE,
    CI.ITEM_CODE    SERV_CODUL,
    CI.A01          SERV_CODUL_OLD,
    CI.NAME  DENUMIRE,
    
    
       (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-4) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-')  THEN  NVAL(D.COL4) ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-4) AND   D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-')  THEN  NVAL(D.COL4) ELSE 0 END ))
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
                  USER_BANCU.VW_CLS_CLASS_ITEM_USER_BANCU CI
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
  AND  D.CAPITOL IN (405,406) 
  
 
  AND D.CUIIO = 25951


  
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
  
  