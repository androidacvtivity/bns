
  
  
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
                  CI.ITEM_CODE CODUL
                  
                  
                  
                FROM
                  VW_CLS_CLASS_ITEM CI
                WHERE
                  CI.CLASS_CODE IN ('TARI_ISO') 
    
                GROUP BY
                  CI.ITEM_CODE,
                  CI.ITEM_PATH,
                  CI.NAME,
                  CI.SHOW_ORDER
          
          
        )       THEN  ' '||'~'||ROWNUM ELSE      SUBSTR(CODUL,3,9)||'~'||ROWNUM  END NR_ROW,
        
        
        
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
     TTT.SHOW_ORDER  ORDINE_CL, 
     TTT.NAME  DENUMIRE,
     TTT.ITEM_CODE CODUL,
     TTT.ITEM_PATH FULL_CODE,
    ROUND((SUM(CASE WHEN  MC.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  
  
     
     )/1000,1) AS COL1,
     
     ROUND(((SUM(CASE WHEN  MC.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) 

     
     ) / CR.COL1 )/1000,1) AS COL2,
     
     
     ROUND((SUM(CASE WHEN  MC.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) 

     
     )/1000,1) AS COL3,
     
     
     ROUND(((SUM(CASE WHEN  MC.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) 
     

     
     ) / CR.COL1)/1000,1) AS COL4
    FROM CIS2.DATA_ALL D 
      -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01') ) CR
        ------------------------------------------------------------------------------      
       --INNER JOIN   CIS2.VW_CL_TARI TT ON (TT.CODUL=D.COL3)
       
       INNER JOIN   (
           SELECT
                  CI.ITEM_CODE,
                  CI.ITEM_PATH,
                  CI.NAME,
                  CI.SHOW_ORDER,
                  MAX(CI.ITEM_CODE_VERS) AS ITEM_CODE_VERS
                FROM
                  VW_CLS_CLASS_ITEM CI
                WHERE
                  CI.CLASS_CODE IN ('TARI_ISO') 
    
                GROUP BY
                  CI.ITEM_CODE,
                  CI.ITEM_PATH,
                  CI.NAME,
                  CI.SHOW_ORDER
           ) 
           
           TT ON  (TT.ITEM_CODE=D.COL33)
           INNER JOIN VW_CLS_CLASS_ITEM TTT ON (TTT.CLASS_CODE IN ('TARI_ISO') AND TT.ITEM_PATH LIKE '%'||TTT.ITEM_CODE||';%')
         INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
         INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
         INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
         INNER  JOIN MD_CAPITOL MC ON MR.CAPITOL = MC.CAPITOL AND MR.CAPITOL_VERS = MC.CAPITOL_VERS
             
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
--  (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND
  MR.CAPITOL IN (405,407)  
 AND TTT.ITEM_CODE  NOT IN ('555','444')
 AND TTT.ITEM_CODE  IN ('077')
   GROUP BY
   TTT.SHOW_ORDER,
   TTT.NAME,
   TTT.ITEM_CODE,
   TTT.ITEM_PATH,
--  TTT.ORDINE,
  CR.COL1
  
  
  UNION 
  
  SELECT 
     '2' ORDINE,
     TTT.SHOW_ORDER  ORDINE_CL,
      CII.NAME DENUMIRE, 
          CII.SHOW_ORDER||'_'||CII.ITEM_CODE  CODUL,
    -- TTT.NAME  DENUMIRE,
   --  TTT.ITEM_CODE CODUL,
     TTT.ITEM_PATH FULL_CODE,
    ROUND((SUM(CASE WHEN  MC.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  
  
     
     )/1000,1) AS COL1,
     
     ROUND(((SUM(CASE WHEN  MC.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) 

     
     ) / CR.COL1 )/1000,1) AS COL2,
     
     
     ROUND((SUM(CASE WHEN  MC.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) 

     
     )/1000,1) AS COL3,
     
     
     ROUND(((SUM(CASE WHEN  MC.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) 
     

     
     ) / CR.COL1)/1000,1) AS COL4
    FROM CIS2.DATA_ALL D 
      -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01') ) CR
        ------------------------------------------------------------------------------      
       --INNER JOIN   CIS2.VW_CL_TARI TT ON (TT.CODUL=D.COL3)
       
       INNER JOIN   (
           SELECT
                  CI.ITEM_CODE,
                  CI.ITEM_PATH,
                  CI.NAME,
                  CI.SHOW_ORDER,
                  MAX(CI.ITEM_CODE_VERS) AS ITEM_CODE_VERS
                FROM
                  VW_CLS_CLASS_ITEM CI
                WHERE
                  CI.CLASS_CODE IN ('TARI_ISO') 
    
                GROUP BY
                  CI.ITEM_CODE,
                  CI.ITEM_PATH,
                  CI.NAME,
                  CI.SHOW_ORDER
           ) 
           
           TT ON  (TT.ITEM_CODE=D.COL33)
           INNER JOIN VW_CLS_CLASS_ITEM TTT ON (TTT.CLASS_CODE IN ('TARI_ISO') AND TT.ITEM_PATH LIKE '%'||TTT.ITEM_CODE||';%')
           
           
         INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
         INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
         INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
         INNER  JOIN MD_CAPITOL MC ON MR.CAPITOL = MC.CAPITOL AND MR.CAPITOL_VERS = MC.CAPITOL_VERS
         
         
         INNER JOIN (
         
         SELECT
                  CI.ITEM_CODE,
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
                  CI.ITEM_PATH,
                  CI.NAME,
                  CI.SHOW_ORDER
                  
             ) CI ON (TRIM(D.COL31)=TRIM(CI.ITEM_CODE))
             
             
   INNER JOIN VW_CLS_CLASS_ITEM CII ON  (CII.CLASS_CODE IN ('CSPM2') AND REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||TRIM(CII.ITEM_CODE)||';%')
             
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
--  (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND
  MR.CAPITOL IN (405,407)  
 AND TTT.ITEM_CODE  
 

 
 NOT IN ('555','444','000') AND 
 
  --TTT.ITEM_CODE  IN ('077')
  CII.ITEM_CODE NOT IN ('00.00.00')
  
  -- TRIM(CII.ITEM_CODE) IN ('10.2.1.3')
  
  --AND CII.ITEM_PARENT IN ('10.2.1.3')
  
  
 --AND 
 
 --AND 
 AND TTT.ITEM_CODE  IN ('077')
 
 
   GROUP BY
   TTT.SHOW_ORDER,
   CII.NAME,
   CII.SHOW_ORDER,
   CII.ITEM_CODE,
 --  TTT.NAME,
 --  TTT.ITEM_CODE,
   TTT.ITEM_PATH,
--  TTT.ORDINE,
  CR.COL1
  )
  
  
  ORDER BY 
    ORDINE_CL,
 --   DENUMIRE,
    FULL_CODE,
    ORDINE,
    CODUL 

  )


    
    
    
    
   