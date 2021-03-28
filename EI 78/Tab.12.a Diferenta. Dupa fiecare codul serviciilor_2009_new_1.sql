SELECT 
   00000000 AS CUIIO,
    '0'   SERV_CODUL, 
   
    SSS.DENUMIRE DENUMIRE,
    
    
   
    (SUM(CASE WHEN  MR.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-')  THEN NVAL(D.COL4) ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-')  THEN NVAL(D.COL4) ELSE 0 END ))
    AS COL1,
    ---------------------------------------------------------------------------------------------------------------------
  
    
    (SUM(CASE WHEN  MR.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-')  THEN NVAL(D.COL4) ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-')  THEN NVAL(D.COL4) ELSE 0 END )) / CR.COL1
    AS COL2
    
   --0	0	TOTAL	14482836705	836186667.802149
 
    
FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
    
      
        
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
    
    INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') 
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND
  MR.CAPITOL IN (409,410)
  AND  SSS.CODUL IN ('0000000')
  -------------------------------------------------
  GROUP BY 

   SSS.CODUL,
   
  SSS.DENUMIRE,
  CR.COL1