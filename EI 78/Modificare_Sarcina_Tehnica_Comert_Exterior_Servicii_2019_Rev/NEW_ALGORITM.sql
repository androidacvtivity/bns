


SELECT 
    CC.CODUL,
    CC.DENUMIRE,
    SUM(CASE WHEN  MR.CAPITOL IN (405)  AND MR.RIND IN ('1')  THEN NVAL(D.COL4) ELSE NULL END )  AS COL1,
    
    ROUND(SUM(CASE WHEN  MR.CAPITOL IN (405)  AND MR.RIND IN ('1')  THEN NVAL(D.COL4) ELSE NULL END ) / NOZERO(CR.COL1),0)  AS COL2
    
    
   
    FROM DATA_ALL D
          INNER JOIN RENIM RN ON D.CUIIO = RN.CUIIO AND D.CUIIO_VERS = RN.CUIIO_VERS
          INNER  JOIN VW_CL_CUATM C ON RN.CUATM = C.CODUL
          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
         
           
            
            CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND   
                           --  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)    AND             
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01') ) CR 
                              
                              
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )  
             
 WHERE 
 
  --(D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA) AND     
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44) AND
  MR.CAPITOL IN (405,406,407,408)
  
  GROUP BY 
    CC.CODUL,
    CC.DENUMIRE,
    CC.FULL_CODE,
    CR.COL1
      
    
   ORDER BY 
   
   CC.FULL_CODE 
   