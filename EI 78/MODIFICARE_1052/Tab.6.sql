﻿SELECT 
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
     C.ORDINE NR_ROW,
     C.ORDINE   AS ORDINE,
     '1111' AS DECIMAL_POS,
     c.denumire NUME_ROW,
     R.COL1    AS COL1,
     R.COL2    AS COL2,
     R.COL3    AS COL3,
     R.COL4    AS COL4
  FROM 

  (
           SELECT   
            c.codul,
            c.denumire,
            c.grupa,
            ROWNUM ordine,
            c.full_code
            
            FROM CIS2.VW_CL_CAEM2 C
            
            WHERE 
            C.CODUL LIKE '%0000'
            
            ORDER BY 
            c.full_code
            ) C 
            LEFT JOIN
            
            (
            
            SELECT 
    CC.CODUL,
    CC.DENUMIRE, 
    ROUND((SUM(CASE WHEN  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   )/1000,1) AS COL1,
 
   ROUND(((SUM(CASE WHEN  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) 
     
     ) / CR.COL1 )/1000,1) AS COL2,
     
      ROUND((SUM(CASE WHEN  D.CAPITOL IN (407)  AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) 
     
     )/1000,1) AS COL3,
     
     ROUND(((SUM(CASE WHEN  D.CAPITOL IN (407)  AND D.RIND NOT IN ('1','2','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)
     
     ) / CR.COL1)/1000,1) AS COL4
 

 FROM
    
    CIS2.VW_DATA_ALL D 
    
         INNER JOIN     CIS2.VW_CL_CAEM2 C  ON  (C.CODUL=D.CAEM2)
         INNER JOIN     CIS2.VW_CL_CAEM2 CC  ON (C.FULL_CODE LIKE '%' ||CC.CODUL||';%' )   
         INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
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
                              AND MR.RIND IN ('01') 
                              
                              ) CR
        ------------------------------------------------------------------------------       
      

WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
 
  
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44) AND D.CAPITOL IN (405,407)   

  
 AND CC.CODUL LIKE '%0000'

  
  GROUP BY 
  CC.CODUL,
  CC.DENUMIRE,
  CC.FULL_CODE,
  CR.COL1 
  
  ORDER BY 
  CC.FULL_CODE
   
   
   )     R  ON (R.CODUL = C.CODUL)
            
           
   
   ORDER BY 
   C.ORDINE