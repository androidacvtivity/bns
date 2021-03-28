SELECT 
   '1' ORDINE,

    A.CUIIO, 
    A.SERV_CODUL,
    A.DENUMIRE,
    
    SUM(A.COL1)  AS COL1,
    SUM(A.COL2)  AS COL2,
    SUM(B.COL1)  AS COL3,
    SUM(B.COL2)  AS COL4,
    SUM(A.COL1) - SUM(B.COL1) AS COL5,
    SUM(A.COL2) - SUM(B.COL2) AS COL6

FROM 
(
SELECT 
   00000000 AS CUIIO,
    '0'   SERV_CODUL, 
   
    SSS.DENUMIRE DENUMIRE,
    
    
   
    (SUM(CASE WHEN  MR.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    ---------------------------------------------------------------------------------------------------------------------
  
    
    (SUM(CASE WHEN  MR.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  MR.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1
    AS COL2
    
    
    
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
  ) A INNER JOIN (
  
  SELECT 
 CUIIO,
 SERV_CODUL,
 DENUMIRE,
 SUM(COL1) AS COL1,
SUM(COL2) AS COL2

 
FROM
 
(
SELECT 
    D.PERIOADA,
    00000000 AS CUIIO,
    '0'   SERV_CODUL, 
    SSS.DENUMIRE DENUMIRE,
    
  
   (SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
    
    
    ROUND((SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4)  AND  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )) / CR.COL1,0)
    AS COL2
        
 
   
     
          
    FROM
    
     CIS2.VW_DATA_ALL D 
     
    INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 ) 
    
    INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )
   
    LEFT JOIN (
    
    SELECT
            
            D.PERIOADA,
            SUM(CASE WHEN   P.PERIOADA_ANULA = :pPERIOADA AND P.NUM IN (1,2,3,4) THEN D.COL1 ELSE NULL  END ) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                          INNER JOIN CIS2.VW_MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA) 
                      
                        WHERE
                              P.PERIOADA_ANULA = :pPERIOADA AND            
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01')
            
            GROUP BY 
            D.PERIOADA 
    )    CR  ON (D.PERIOADA=CR.PERIOADA)

           
           
   WHERE        
   
  (D.FORM = 44) AND
  (D.FORM_VERS = 1004) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  
  (D.FORM IN (44) AND D.CAPITOL IN (405,406)) AND 
 
  P.PERIOADA_ANULA = :pPERIOADA
 
   AND SSS.CODUL IN ('0000000')
  -- AND CC.CODUL IN ('0000000')

  GROUP BY  
  D.PERIOADA,
  SSS.DENUMIRE,
  CR.COL1
  )
  
  GROUP BY 
   CUIIO,
 SERV_CODUL,
 DENUMIRE

 
  
  )  B ON (B.CUIIO = B.CUIIO)
  
  
  
  GROUP BY 
  

     A.CUIIO,
     A.SERV_CODUL,
     A.DENUMIRE