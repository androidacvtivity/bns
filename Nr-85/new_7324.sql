DECLARE

  CURSOR C IS

SELECT 
    DF.PERIOADA,
    DF.FORM,
    DF.FORM_VERS,
    DF.ID_MDTABLE,
    DF.COD_CUATM,
    DF.NR_SECTIE,
    DF.NUME_SECTIE,
    DF.NR_SECTIE1,
    DF.NUME_SECTIE1,
    DF.NR_SECTIE2,
    DF.NUME_SECTIE2,
    DF.NR_ROW,
    DF.ORDINE,
    DF.DECIMAL_POS,
    DF.NUME_ROW,
    DF.COL1,
    DF.COL2,
    DF.COL3,
    DF.COL4,
    DF.COL5,
    DF.COL6,
    DF.COL7,
    DF.COL8,
    DF.COL9,
    DF.COL10
   
FROM 
(

SELECT
    :pPERIOADA AS PERIOADA,
    :pFORM AS FORM,
    :pFORM_VERS AS FORM_VERS,
    :pID_MDTABLE AS ID_MDTABLE,
    :pCOD_CUATM AS COD_CUATM,
    A.NR_SECTIE   AS NR_SECTIE,
    A.NUME_SECTIE AS NUME_SECTIE,
    '0' AS NR_SECTIE1,
    '0' AS NUME_SECTIE1,
    '0' AS NR_SECTIE2,
    '0' AS NUME_SECTIE2,
    A.RIND||'~'||ROWNUM AS NR_ROW,
    TO_NUMBER(A.RIND) AS ORDINE,
   '0000000000' AS DECIMAL_POS, 
    A.DENUMIRE AS NUME_ROW,
    CIS2.NVAL(B.COL1)   AS COL1,
    CIS2.NVAL(B.COL2)   AS COL2,
    CIS2.NVAL(B.COL3)   AS COL3,
    CIS2.NVAL(B.COL4)   AS COL4,
    CIS2.NVAL(B.COL5)   AS COL5,
    CIS2.NVAL(B.COL6)   AS COL6,
    CIS2.NVAL(B.COL7)   AS COL7,
    CIS2.NVAL(B.COL8)   AS COL8,
    CIS2.NVAL(B.COL9)   AS COL9,
    CIS2.NVAL(B.COL10)  AS COL10     
FROM 
(
SELECT 
                            CD.NR_ROW AS NR_SECTIE,
                            CD.NUME_ROW AS NUME_SECTIE,
                            R.RIND          RIND,
                            R.RIND_VERS     RIND_VERS,
                            R.DENUMIRE      DENUMIRE
                               
                            FROM CIS2.MD_RIND R
                            
                            INNER JOIN (                  
                            SELECT 
                            R.RIND,
                            MAX(R.RIND_VERS) AS RIND_VERS
                            
                            FROM CIS2.MD_RIND R 
                            
                            WHERE 
                            R.RIND_VERS <=:pPERIOADA
                            AND  (R.FORM =:pFORM) AND 
                            (R.FORM_VERS =:pFORM_VERS) AND
                            (:pID_MDTABLE=:pID_MDTABLE) AND 
                             R.FORM = 17  AND 
                             R.CAPITOL IN (1001) AND 
                             ASCII(R.RIND) <> 45   
                            
                            
                            GROUP BY 
                            R.RIND
                            
                            
                             
                            
                             ) RR   ON (    RR.RIND      = R.RIND
                                       AND  RR.RIND_VERS = R.RIND_VERS)
                                       
                             -------------------------------------------------
                             
                              CROSS JOIN
  (     
    SELECT 'Oraș' AS NUME_ROW,  '1' AS NR_ROW, '1'   AS N85_NTL  FROM DUAL UNION
    SELECT 'Sat'  AS  NUME_ROW, '2' AS NR_ROW, '2'   AS N85_NTL  FROM DUAL 
    
  ) CD
                             ------------------------------------------------  
                                     
                            WHERE
                            
                           (R.FORM =:pFORM) AND 
                           (R.FORM_VERS =:pFORM_VERS) AND
                           (:pID_MDTABLE=:pID_MDTABLE) AND 
                           R.FORM = 17  AND 
                           R.CAPITOL IN (1001) AND 
                           ASCII(R.RIND) <> 45  
                                             
                           
                           
                           GROUP BY
                           R.RIND,
                           R.RIND_VERS,
                           R.DENUMIRE,
                           CD.NR_ROW,   
                           CD.NUME_ROW
 
  ) A LEFT JOIN  
    
( 
SELECT 
                 CD.NR_ROW AS NR_SECTIE,
                 CD.NUME_ROW AS NUME_SECTIE,
                 MR.RIND,
                 MR.RIND_VERS,
                 MR.DENUMIRE,
                ROUND(SUM(CASE WHEN CD.N85_NTL LIKE '%'||RN.N85_NTL||'%'  THEN  CIS2.NVAL(D.COL1) END),1)   AS COL1,
  ROUND(SUM(CASE WHEN CD.N85_NTL LIKE '%'||RN.N85_NTL||'%'  THEN  CIS2.NVAL(D.COL2) END),1)   AS COL2,
  ROUND(SUM(CASE WHEN CD.N85_NTL LIKE '%'||RN.N85_NTL||'%'  THEN  CIS2.NVAL(D.COL3) END),1)   AS COL3,
  ROUND(SUM(CASE WHEN CD.N85_NTL LIKE '%'||RN.N85_NTL||'%'  THEN  CIS2.NVAL(D.COL4) END),1)   AS COL4,
  ROUND(SUM(CASE WHEN CD.N85_NTL LIKE '%'||RN.N85_NTL||'%'  THEN  CIS2.NVAL(D.COL5) END),1)   AS COL5,
  ROUND(SUM(CASE WHEN CD.N85_NTL LIKE '%'||RN.N85_NTL||'%'  THEN  CIS2.NVAL(D.COL6) END),1)   AS COL6,
  ROUND(SUM(CASE WHEN CD.N85_NTL LIKE '%'||RN.N85_NTL||'%'  THEN  CIS2.NVAL(D.COL7) END),1)   AS COL7,
  ROUND(SUM(CASE WHEN CD.N85_NTL LIKE '%'||RN.N85_NTL||'%'  THEN  CIS2.NVAL(D.COL8) END),1)   AS COL8,
  ROUND(SUM(CASE WHEN CD.N85_NTL LIKE '%'||RN.N85_NTL||'%'  THEN  CIS2.NVAL(D.COL9) END),1)   AS COL9,
  ROUND(SUM(CASE WHEN CD.N85_NTL LIKE '%'||RN.N85_NTL||'%'  THEN  CIS2.NVAL(D.COL10) END),1)  AS COL10
            
            
              FROM CIS2.DATA_ALL  D
                  
                            
                  INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)
                  INNER JOIN CIS2.VW_CL_CUATM C ON (RN.CUATM = C.CODUL)
                  
                  INNER JOIN CIS2.MD_RIND MR ON (MR.ID_MD = D.ID_MD)  
                  
                  
                   CROSS JOIN
  (     
    SELECT 'Oraș' AS NUME_ROW,  '1' AS NR_ROW, '1'   AS N85_NTL  FROM DUAL UNION
    SELECT 'Sat'  AS  NUME_ROW, '2' AS NR_ROW, '2'   AS N85_NTL  FROM DUAL 
    
  ) CD
                  
                  
                                                                 
                  
              
    WHERE
    (D.PERIOADA =:pPERIOADA) AND    
    (D.FORM =:pFORM) AND 
    (D.FORM_VERS =:pFORM_VERS) AND
    (:pID_MDTABLE=:pID_MDTABLE) AND 
    (C.FULL_CODE LIKE '%' ||:pCOD_CUATM||';%') AND
    MR.FORM = 17  AND 
    MR.CAPITOL IN (1001)  
    AND  ASCII(MR.RIND) <> 45   
               
               
   GROUP BY 
   MR.RIND,
   MR.RIND_VERS,
   MR.DENUMIRE, 
   CD.NR_ROW,   
   CD.NUME_ROW
  
  
  
  
   ) B ON (B.RIND                = A.RIND 
           AND   B.NR_SECTIE     = A.NR_SECTIE    )
   
  
     
        ORDER BY 
        ORDINE
        
         ) DF;
   
   
   BEGIN

  FOR CR IN C
  
  LOOP
    INSERT INTO  -- USER_BANCU.TABLE_OUT_TEST 
    
    CIS2.TABLE_OUT
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
       
      COL1, COL2, COL3,  COL4, COL5, COL6, COL7, COL8, COL9, COL10
    )
    VALUES
    (
      CR.PERIOADA,
      CR.FORM,
      CR.FORM_VERS,
      CR.ID_MDTABLE,
      CR.COD_CUATM,
      CR.NR_SECTIE,
      CR.NUME_SECTIE,
      CR.NR_SECTIE1,
      CR.NUME_SECTIE1,
      CR.NR_SECTIE2,
      CR.NUME_SECTIE2,
      CR.NR_ROW,
      CR.ORDINE,
      CR.DECIMAL_POS,
      CR.NUME_ROW,
       
      CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8, CR.COL9, CR.COL10
    );
  END LOOP;
END;