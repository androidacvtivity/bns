SELECT 
     D.PERIOADA,
    CC.CODUL,
    CC.DENUMIRE, 
    ROUND(SUM(CASE WHEN  D.CAPITOL IN (405)  AND D.RIND IN ('1') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END)/1000,1)   AS COL1,
 
    ROUND((SUM(CASE WHEN  D.CAPITOL IN (405)  AND D.RIND IN ('1') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ) / CR.COL1)/1000,0)   AS COL2,
    
    ROUND(SUM(CASE WHEN  D.CAPITOL IN (407)  AND D.RIND IN ('1') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END)/1000,1)   AS COL3,
    
    ROUND((SUM(CASE WHEN  D.CAPITOL IN (407)  AND D.RIND IN ('1') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  / CR.COL1)/1000,0)  AS COL4
 

 FROM
    
    CIS2.VW_DATA_ALL D 
    
         INNER JOIN     CIS2.VW_CL_CAEM2 C  ON  (C.CODUL=D.CAEM2)
         INNER JOIN     CIS2.VW_CL_CAEM2 CC  ON (C.FULL_CODE LIKE '%' ||CC.CODUL||';%' )   
         INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
      -------------------------------------------------------------------------------
        LEFT JOIN (
         SELECT
         
             D.PERIOADA,
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                              (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND              
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01')
                              
                               GROUP BY 
   D.PERIOADA
                              
                               ) CR ON (D.PERIOADA=CR.PERIOADA) 
        ------------------------------------------------------------------------------       
      

WHERE 
  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44) AND D.CAPITOL IN (405,407)  AND D.RIND IN ('1')
  
 AND CC.CODUL LIKE '%0000'

  
  GROUP BY 
   D.PERIOADA,
  CC.CODUL,
  CC.DENUMIRE,
  CC.FULL_CODE,
  CR.COL1 
  
  ORDER BY 
  CC.FULL_CODE