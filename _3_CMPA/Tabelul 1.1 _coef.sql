INSERT INTO  CIS2.TABLE_OUT
    (
      PERIOADA,
      FORM,
      FORM_VERS,
      ID_MDTABLE,
      COD_CUATM,
      NR_SECTIE,
      NUME_SECTIE,
      NR_SECTIE1,
      NUME_SECTIE1,
      NR_SECTIE2,
      NUME_SECTIE2,
      NR_ROW,
      ORDINE,
      DECIMAL_POS,
      NUME_ROW,
       
      COL1, COL2, COL3,  COL4, COL5 , COL6
    )

   
 



SELECT 
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
         A.RIND AS NR_ROW, 
          A.ordine ORDINE, 
         '222222' AS DECIMAL_POS,  
         A.DENUMIRE NUME_ROW, 
         ROUND(A.COL1,2)  AS COL1,
         ROUND(A.COL2,2)  AS COL2,
         ROUND(A.COL3,2)  AS COL3,
         ROUND(A.COL4,2)  AS COL4,
         ROUND(A.COL5,2)  AS COL5,
         ROUND(A.COL6,2)  AS COL6      

FROM 
(
SELECT 
        
         MR.RIND,
         MR.DENUMIRE, 
         MR.ORDINE,
         ROUND(SUM(CASE WHEN  D.FORM IN (62)  AND D.CAPITOL IN (1115) AND   D.RIND = MR.RIND     THEN    D.COL1  ELSE NULL END),2)   AS COL1,
         ROUND(SUM(CASE WHEN  D.FORM IN (62)  AND D.CAPITOL IN (1115) AND   D.RIND = MR.RIND     THEN    D.COL1  ELSE NULL END)/ RR.COL1,2) AS COL2,
         ROUND(SUM(CASE WHEN  D.FORM IN (62)  AND D.CAPITOL IN (1115) AND   D.RIND = MR.RIND     THEN    D.COL1  ELSE NULL END)/ RR.COL2,2) AS COL3,
         ROUND(SUM(CASE WHEN  D.FORM IN (62)  AND D.CAPITOL IN (1115) AND   D.RIND = MR.RIND     THEN    D.COL1  ELSE NULL END)/ RR.COL3,2) AS COL4,
         ROUND(SUM(CASE WHEN  D.FORM IN (62)  AND D.CAPITOL IN (1115) AND   D.RIND = MR.RIND     THEN    D.COL1  ELSE NULL END)/ RR.COL4,2) AS COL5,
         ROUND(SUM(CASE WHEN  D.FORM IN (62)  AND D.CAPITOL IN (1115) AND   D.RIND = MR.RIND     THEN    D.COL1  ELSE NULL END)/ RR.COL5,2) AS COL6
         
       
        
FROM
  VW_DATA_ALL_GC  D
 
  
  CROSS JOIN (
  SELECT 
            
            RIND,
            DENUMIRE,
            ORDINE    
           
            FROM    MD_RIND
            
            WHERE 
            
            form = 62
            
            AND CAPITOL = 1115
            AND CAPITOL_VERS = 1044
            
            
       
  ) MR
CROSS JOIN (
SELECT 
            
            SUM(CASE WHEN D.form = 62 AND  R.CAPITOL = 1118 AND D.PERIOADA = 1049 AND  R.RIND IN ('0') THEN  D.COL1 ELSE NULL END ) AS COL1,
            SUM(CASE WHEN D.form = 62 AND  R.CAPITOL = 1118 AND D.PERIOADA = 1049 AND R.RIND IN ('TIP2') THEN  D.COL1 ELSE NULL END ) AS COL2,
            SUM(CASE WHEN D.form = 62 AND  R.CAPITOL = 1118 AND D.PERIOADA = 1049 AND R.RIND IN ('TIP3') THEN  D.COL1 ELSE NULL END ) AS COL3,
            SUM(CASE WHEN D.form = 61 AND  R.CAPITOL = 1110 AND D.PERIOADA = 1049 AND R.RIND IN ('001') THEN  D.COL3 ELSE NULL END ) AS COL4,
             SUM(CASE WHEN D.form = 61 AND  R.CAPITOL = 1110 AND D.PERIOADA = 1049 AND R.RIND IN ('001') THEN  D.COL1 ELSE NULL END ) AS COL5
           
 FROM
  VW_DATA_ALL_GC  D
  INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
            
            WHERE 
            
           ( D.form = 62
            
            AND R.CAPITOL = 1118
            AND D.PERIOADA = 1049)
            
            
            OR
            
             (D.form = 61
            
            AND R.CAPITOL = 1110
            AND D.PERIOADA = 1049)
) RR
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND

  D.FORM IN (62) 
 

  
  GROUP BY 
  MR.RIND,
  MR.ORDINE,
  MR.DENUMIRE,
  RR.COL1,
  RR.COL2,
  RR.COL3,
  RR.COL4,
  RR.COL5
 ) A
 
 
  
 
 
        
        ORDER BY 
        A.ordine