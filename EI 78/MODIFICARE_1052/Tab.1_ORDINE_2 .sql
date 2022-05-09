SELECT
 ORDINE_TARA,
  DENUMIRE,
  CODUL_SERV,
  CL_ORDER_SERV,
  FULL_CODE,
  COL1,
  COL2,
  COL3,
  COL4
FROM(
SELECT 
     2 ORDINE,
      TTT.SHOW_ORDER AS ORDINE_TARA,
      TTT.NAME  DENUMIRE,
      CII.ITEM_CODE CODUL_SERV,
      CII.SHOW_ORDER CL_ORDER_SERV, 
      CII.ITEM_PATH FULL_CODE,
     
     ROUND((SUM(CASE WHEN  MC.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END))/1000,1) AS COL1,
     
     
     ROUND(((SUM(CASE WHEN  MC.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) ) / CR.COL1 )/1000,1) AS COL2,
     
     
     ROUND((SUM(CASE WHEN  MC.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) )/1000,1) AS COL3,
     
     
     ROUND(((SUM(CASE WHEN  MC.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) ) / CR.COL1)/1000,1) AS COL4
     
      
      FROM CIS2.DATA_ALL D 
       
       INNER JOIN   CIS2.RENIM  R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS) 
--       INNER JOIN   CIS2.VW_CL_TARI TT  ON (TT.CODUL=D.COL3)
--       INNER JOIN   CIS2.VW_CL_TARI TTT ON (TT.FULL_CODE LIKE '%' ||TTT.CODUL||';%' )   
       
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
       
       INNER JOIN   CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
       INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
       INNER  JOIN MD_CAPITOL MC ON MR.CAPITOL = MC.CAPITOL AND MR.CAPITOL_VERS = MC.CAPITOL_VERS
       
--       
--       INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 ) 
--       INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )   
--        
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
             
                INNER JOIN VW_CLS_CLASS_ITEM CII ON (CII.CLASS_CODE IN ('CSPM2')
          
     
          AND CI.ITEM_PATH LIKE '%'||CII.ITEM_CODE||';%')
       -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN CIS2.MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
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
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND
  MR.CAPITOL IN (405,407)  
  
  AND TTT.ITEM_CODE NOT IN ('000')
  AND CII.ITEM_CODE NOT IN ('00.00.00')
  
      GROUP BY
      TTT.SHOW_ORDER,
      TTT.NAME,
      CII.ITEM_CODE,
       TTT.ITEM_CODE,
       TTT.ITEM_PATH,
       CII.ITEM_PATH,
      CII.SHOW_ORDER,
      CR.COL1
      
    ORDER BY
    TTT.SHOW_ORDER 
--    
    
    )