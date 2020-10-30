SELECT   
--    :pPERIOADA AS PERIOADA,
--    :pFORM AS FORM,
--    :pFORM_VERS AS FORM_VERS,
--    :pID_MDTABLE AS ID_MDTABLE,
--    :pCOD_CUATM AS COD_CUATM,
--    '0' AS NR_SECTIE,
--    '0' AS NUME_SECTIE,
--    '0' AS NR_SECTIE1,
--    '0' AS NUME_SECTIE1,
--    '0' AS NR_SECTIE2,
--    '0' AS NUME_SECTIE2,
     ROWNUM NR_ROW,
     AA.ORDINE  AS ORDINE,
    '1111' AS DECIMAL_POS,
     AA.NUME_ROW AS NUME_ROW,
     ROUND(AA.COL1 / 1000,1)   AS COL1,
     ROUND(AA.COL2 / 1000,1)   AS COL2,
     ROUND(AA.COL3 / 1000,1)   AS COL3,
     ROUND(AA.COL4 / 1000,1)   AS COL4

     FROM
     (

SELECT 
     CD.NR_ROW   AS NR_ROW,
     CD.NR_ROW   AS ORDINE,
     CD.NUME_ROW AS NUME_ROW,
    SUM(CASE WHEN  CT.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND  MR.CAPITOL IN (405)  AND MR.RIND IN ('1')  THEN NVAL(D.COL4) ELSE 0 END )  AS COL1,
    SUM(CASE WHEN  CT.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND  MR.CAPITOL IN (405)  AND MR.RIND IN ('1')  THEN NVAL(D.COL4) ELSE 0 END ) / CR.COL1  AS COL2,
    SUM(CASE WHEN  CT.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND  MR.CAPITOL IN (407)  AND MR.RIND IN ('1')  THEN NVAL(D.COL4) ELSE 0 END )  AS COL3,
    SUM(CASE WHEN  CT.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND  MR.CAPITOL IN (407)  AND MR.RIND IN ('1')  THEN NVAL(D.COL4) ELSE 0 END ) / CR.COL1  AS COL4
 
    FROM DATA_ALL D
          INNER JOIN RENIM RN ON D.CUIIO = RN.CUIIO AND D.CUIIO_VERS = RN.CUIIO_VERS
          INNER  JOIN VW_CL_CUATM CT ON RN.CUATM = CT.CODUL
          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
         
          CROSS JOIN  (
           SELECT DENUMIRE AS NUME_ROW, RIND AS NR_ROW,RINDOUT AS CUATM FROM CIS2.MD_RIND_OUT
             WHERE 
            ID_MDTABLE = 8096) CD  
            
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
             
 WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44) AND
  MR.CAPITOL IN (405,406,407,408)
  
  GROUP BY 
    CD.NR_ROW,
    CD.NUME_ROW,
    CR.COL1
      
    ORDER BY 
    CD.NR_ROW
    ) AA