






SELECT 


     TT.ORDINE  AS ORDINE,  

     TT.DENUMIRE NUME_ROW, 
     ROUND((SUM(CASE WHEN  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   +
     SUM(CASE WHEN  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END ))/1000,1) AS COL1,
     
     ROUND(((SUM(CASE WHEN  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) +
     SUM(CASE WHEN  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)) / CR.COL1 )/1000,1) AS COL2



       
        
        FROM VW_DATA_ALL D
        
        
        
        
          INNER JOIN   CIS2.VW_CL_TARI TT  ON (TT.CODUL=D.COL3)
          
         -- INNER JOIN   CIS2.VW_CL_TARI TTT ON (TT.FULL_CODE LIKE '%' ||TTT.CODUL||';%' )  
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
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)  AND
  D.CAPITOL IN (405,406,407,408)   AND  D.CAPITOL_VERS  = 1040
  GROUP BY
  TT.ORDINE,
  TT.FULL_CODE,
  TT.DENUMIRE,
  CR.COL1
  
  
  ORDER BY
  
  TT.ORDINE 