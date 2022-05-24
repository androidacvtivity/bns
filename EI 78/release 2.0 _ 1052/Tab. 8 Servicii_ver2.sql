SELECT 
--  (CASE WHEN CII.ITEM_CODE = '98' THEN '99' ELSE  CII.ITEM_CODE END) ||'~'||CII.SHOW_ORDER  AS NR_ROW,  
   
     (CASE WHEN CII.ITEM_CODE = '98' THEN '99' ELSE  CII.ITEM_CODE END)    AS NR_ROW,  
     CII.SHOW_ORDER   AS ORDINE,  
     CII.NAME NUME_ROW,
     ROUND((SUM(CASE WHEN  MC.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END))/1000,1) AS COL1,
     ROUND(((SUM(CASE WHEN  MC.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) ) / CR.COL1 )/1000,1) AS COL2,
     ROUND((SUM(CASE WHEN  MC.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) )/1000,1) AS COL3,
     ROUND(((SUM(CASE WHEN  MC.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)) / CR.COL1)/1000,1) AS COL4
     FROM DATA_ALL D
          INNER JOIN RENIM RN
             ON D.CUIIO = RN.CUIIO AND D.CUIIO_VERS = RN.CUIIO_VERS
          INNER  JOIN VW_CL_CUATM CT ON RN.CUATM = CT.CODUL
          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
          INNER  JOIN MD_CAPITOL MC
             ON MR.CAPITOL = MC.CAPITOL AND MR.CAPITOL_VERS = MC.CAPITOL_VERS
         
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
                  
             ) CI 
             
              ON (TRIM(D.COL31)=TRIM(CI.ITEM_CODE))
              
           --   ON REPLACE(D.COL31,'.','') =  REPLACE(CI.ITEM_CODE,'.','')
         
         -- INNER JOIN VW_CLS_CLASS_ITEM CI ON (CI.CLASS_CODE IN ('CSPM2') AND (TRIM(D.COL31)=TRIM(CI.ITEM_CODE)))

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
          
          
          )
          
-- CII ON (REPLACE(CI.ITEM_PATH,'.','')  LIKE '%'||REPLACE(CII.ITEM_CODE,'.','')||';%')
          
          CII ON (CI.ITEM_PATH LIKE '%'||CII.ITEM_CODE||';%')
   
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
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
 -- (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND MC.CAPITOL IN (405,407) 
   AND CII.ITEM_CODE =  '10.3.1.1'
  GROUP BY 
  CII.ITEM_CODE,
  CII.SHOW_ORDER,  
  CII.NAME,
  CR.COL1
  
  ORDER  BY
  CII.SHOW_ORDER

    
    
    
    
    

    
    
    
    
    
   
  
