﻿SELECT 
    :pPERIOADA AS PERIOADA,
    :pFORM AS FORM,
    :pFORM_VERS AS FORM_VERS,
    :pID_MDTABLE AS ID_MDTABLE,
    :pCOD_CUATM AS COD_CUATM,
     A.NR_SECTIE,
     A.NUME_SECTIE,
    '0' AS NR_SECTIE1,
    '0' AS NUME_SECTIE1,
    '0' AS NR_SECTIE2,
     '0' AS NUME_SECTIE2,
         A.RIND AS NR_ROW, 
          A.ordine ORDINE, 
         '222222' AS DECIMAL_POS,  
         A.DENUMIRE NUME_ROW, 
         ROUND(A.COL1,2)  AS COL1,
         ROUND(A.COL2,2)  AS COL2,
         ROUND(A.COL3,2)  AS COL3,
         ROUND(A.COL4,2)  AS COL4,
         ROUND(A.COL5 / CR.COL3 ,2)  AS COL5,
         ROUND(A.COL6 / CR.COL1 ,2)  AS COL6      

FROM 
(
SELECT 
         CC.CODUL NR_SECTIE ,
     CC.DENUMIRE NUME_SECTIE, 
     CC.FULL_CODE,
         MR.RIND,
         MR.DENUMIRE, 
         MR.ORDINE,
         SUM(CASE WHEN  D.FORM IN (62)  AND D.CAPITOL IN (1116) AND   D.RIND = MR.RIND     THEN    D.COL1  ELSE NULL END) AS COL1,
        
         SUM(CASE WHEN  D.FORM IN (62)  AND D.CAPITOL IN (1116) AND   D.RIND = MR.RIND     THEN    D.COL1  ELSE NULL END)  / 
         NOZERO(SUM(CASE WHEN  D.FORM IN (62) AND  D.CAPITOL IN (1118)  AND  D.RIND IN ('0')  THEN  NVAL(D.COL1)  ELSE NULL END)) AS COL2,
         SUM(CASE WHEN  D.FORM IN (62)  AND D.CAPITOL IN (1116) AND   D.RIND = MR.RIND     THEN    D.COL1  ELSE NULL END)  / 
         NOZERO(SUM(CASE WHEN  D.FORM IN (62) AND  D.CAPITOL IN (1118)  AND  D.RIND IN ('TIP2')  THEN  NVAL(D.COL1)  ELSE NULL END))  AS COL3,
         SUM(CASE WHEN  D.FORM IN (62)  AND D.CAPITOL IN (1116) AND   D.RIND = MR.RIND     THEN    D.COL1  ELSE NULL END)  /  
         NOZERO(SUM(CASE WHEN  D.FORM IN (62) AND  D.CAPITOL IN (1118)  AND  D.RIND IN ('TIP3')  THEN  NVAL(D.COL1)  ELSE NULL END))  AS COL4,
             
         SUM(CASE WHEN  D.FORM IN (62)  AND D.CAPITOL IN (1116) AND   D.RIND = MR.RIND     THEN    D.COL1  ELSE NULL END)   AS COL5,
         
         SUM(CASE WHEN  D.FORM IN (62)  AND D.CAPITOL IN (1116) AND   D.RIND = MR.RIND     THEN    D.COL1  ELSE NULL END)   AS COL6
       
        
FROM
  VW_DATA_ALL_GC  D
    
  INNER  JOIN CIS2.VW_CL_CUATM CT ON D.CUATM = CT.CODUL 
  INNER JOIN CIS2.VW_CL_CUATM CC ON CT.FULL_CODE LIKE '%'||CC.CODUL||';%'   
    

  
  CROSS JOIN (
  SELECT 
            
            RIND,
            DENUMIRE,
            ORDINE    
           
            FROM    MD_RIND
            
            WHERE 
            
            form = 62
            
            AND CAPITOL = 1116
       
  ) MR

WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND

  D.FORM IN (62) 
  AND CC.PRGS IN ('2')

  
  GROUP BY 
    CC.CODUL,
                  CC.DENUMIRE, 
                  CC.FULL_CODE,
  MR.RIND,
  MR.ORDINE,
  MR.DENUMIRE
 ) A
  
 
 
        cross join (
        SELECT 
  SUM(D.COL1)   AS COL1,
  SUM(D.COL3)   AS COL3
  
FROM VW_DATA_ALL_GC D

WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  D.FORM IN (61) AND  D.CAPITOL IN (1110)  AND  D.RIND IN ('001')
        
        ) CR
 
 
        ORDER BY 
        A.ordine