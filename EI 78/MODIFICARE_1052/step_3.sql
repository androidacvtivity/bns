SELECT 

     CII.ITEM_CODE NR_ROW, 
     CII.ITEM_PATH,  
     CII.SHOW_ORDER   AS ORDINE,  

     CII.NAME NUME_ROW,
     ROUND((SUM(CASE WHEN  MC.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END))/1000,1) AS COL1
     
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
                  USER_BANCU.VW_CLS_CLASS_ITEM_USER_BANCU CI
                WHERE
                  CI.CLASS_CODE IN ('CSPM2') 
    
                GROUP BY
                  CI.ITEM_CODE,
                  CI.ITEM_PATH,
                  CI.NAME,
                  CI.SHOW_ORDER
                  
             ) CI ON (TRIM(D.COL31)=TRIM(CI.ITEM_CODE))
         
          --INNER JOIN VW_CLS_CLASS_ITEM_USER_BANCU CII ON (CII.CLASS_CODE IN ('CSPM2')  AND REPLACE(CI.ITEM_PATH,'.','') LIKE '%'||REPLACE(CII.ITEM_CODE,'.','') ||';%')
   
           INNER JOIN USER_BANCU.VW_CLS_CLASS_ITEM_USER_BANCU CII ON (CII.CLASS_CODE IN ('CSPM2')  AND CI.ITEM_PATH LIKE '%'||CII.ITEM_CODE ||';%')
        -------------------------------------------------------------------------------

        ------------------------------------------------------------------------------       
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND MC.CAPITOL IN (405,407) 
  
  AND CI.ITEM_CODE IN ('9999','99.00.1')
  
  GROUP BY 
   CII.ITEM_PATH,
  CII.ITEM_CODE,
  CII.SHOW_ORDER,  
  CII.NAME
  
  ORDER  BY
  CII.SHOW_ORDER