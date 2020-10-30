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
     ROWNUM NR_ROW,
     AA.ORDINE  AS ORDINE,
    '1111' AS DECIMAL_POS,
     AA.NUME_ROW AS NUME_ROW,
     AA.COL1    AS COL1,
     AA.COL2    AS COL2,
     AA.COL3    AS COL3,
     AA.COL4    AS COL4

     FROM
     (

SELECT
    NR_ROW,
    ORDINE,
    NUME_ROW,
    SUM(COL1) AS COL1,
    SUM(COL2) AS COL2,
    SUM(COL3) AS COL3,
    SUM(COL4) AS COL4
FROM

(
SELECT 
     D.PERIOADA,
     CD.NR_ROW   AS NR_ROW,
     CD.NR_ROW   AS ORDINE,
     CD.NUME_ROW AS NUME_ROW,
    ROUND(SUM(CASE WHEN  CT.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND  MR.CAPITOL IN (405)  AND MR.RIND IN ('1')  THEN NVAL(D.COL4) ELSE 0 END)/1000,1)  AS COL1,
    ROUND((SUM(CASE WHEN  CT.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND  MR.CAPITOL IN (405)  AND MR.RIND IN ('1')  THEN NVAL(D.COL4) ELSE 0 END ) / CR.COL1)/1000,1)  AS COL2,
    ROUND(SUM(CASE WHEN  CT.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND  MR.CAPITOL IN (407)  AND MR.RIND IN ('1')  THEN NVAL(D.COL4) ELSE 0 END ) /1000,1) AS COL3,
    ROUND((SUM(CASE WHEN  CT.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND  MR.CAPITOL IN (407)  AND MR.RIND IN ('1')  THEN NVAL(D.COL4) ELSE 0 END )/ CR.COL1)/1000,1)  AS COL4
 
    FROM DATA_ALL D
          INNER JOIN RENIM RN ON D.CUIIO = RN.CUIIO AND D.CUIIO_VERS = RN.CUIIO_VERS
          INNER  JOIN VW_CL_CUATM CT ON RN.CUATM = CT.CODUL
          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
         
          CROSS JOIN  (
           SELECT DENUMIRE AS NUME_ROW, RIND AS NR_ROW,RINDOUT AS CUATM FROM CIS2.MD_RIND_OUT
             WHERE 
            ID_MDTABLE = 8096) CD  
            
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
                              
                              
                               ) CR  ON (D.PERIOADA=CR.PERIOADA)
             
 WHERE 
  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND  
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44) AND
  MR.CAPITOL IN (405,406,407,408)
  
  GROUP BY
    D.PERIOADA, 
    CD.NR_ROW,
    CD.NUME_ROW,
    CR.COL1
      
    ORDER BY 
    CD.NR_ROW
    )
    
    GROUP BY
    NR_ROW,
    ORDINE,
    NUME_ROW
  
  ) AA 
  
   ORDER BY AA.ORDINE