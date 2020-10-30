--INSERT INTO CIS2.TABLE_OUT
--(   
--    PERIOADA,
--    FORM,
--    FORM_VERS,
--    ID_MDTABLE,
--    COD_CUATM,
--    NR_SECTIE,
--    NUME_SECTIE,
--    NR_SECTIE1,
--    NUME_SECTIE1,
--    NR_SECTIE2,
--    NUME_SECTIE2,
--    NR_ROW,
--    ORDINE,
--    DECIMAL_POS,
--    NUME_ROW,
--    COL1,
--    COL2,
--    COL3,
--    COL4,
--    COL5,
--    COL6,
--    COL7,
--    COL8,
--    COL9,
--    COL10,
--    COL11,
--    COL12,
--    COL13
--  
--   )


SELECT
:pPERIOADA AS PERIOADA,
:pFORM AS FORM,
:pFORM_VERS AS FORM_VERS,
:pID_MDTABLE AS ID_MDTABLE,
:pCOD_CUATM AS COD_CUATM,
 A.NR_SECTIE AS NR_SECTIE,
 A.NUME_SECTIE AS NUME_SECTIE,
 '0' AS NR_SECTIE1,
'0' AS NUME_SECTIE1,
'0' AS NR_SECTIE2,
'0' AS NUME_SECTIE2,
 A.RIND||'~'||ROWNUM AS NR_ROW,
 A.RIND AS ORDINE,
'000000000000000' AS DECIMAL_POS, 
 A.DENUMIRE AS NUME_ROW,
      B.COL1,
      B.COL2,
      B.COL3,
      B.COL4,
      B.COL5,
      B.COL6,
      B.COL7,
      B.COL8,
      B.COL9,
      B.COL10,
      B.COL11,
      B.COL12,
      B.COL13
   
   
 
      
    FROM
(
                          SELECT 
                            CD.NR_ROW AS NR_SECTIE,
                            CD.NUME_ROW AS NUME_SECTIE,
                            R.RIND,
                            R.RIND_VERS,
                            R.DENUMIRE     
                                 
                            FROM 
                            
                            (   
                            SELECT 
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
                             R.CAPITOL IN (1004) AND 
                             ASCII(R.RIND) <> 45   
                             AND R.RIND_VERS IN (2007)  
                            
                            GROUP BY 
                            R.RIND
                              
                            
                             ) RR   ON (    RR.RIND      = R.RIND
                                       AND  RR.RIND_VERS = R.RIND_VERS)
                                       
                                       
                            WHERE
                            
                           (R.FORM =:pFORM) AND 
                           (R.FORM_VERS =:pFORM_VERS) AND
                           (:pID_MDTABLE=:pID_MDTABLE) AND 
                           R.FORM = 17  AND 
                           R.CAPITOL IN (1004) AND 
                           ASCII(R.RIND) <> 45  
                           AND R.RIND_VERS IN (2007)                     
                           
                           
                           GROUP BY
                           R.RIND,
                           R.RIND_VERS,
                           R.DENUMIRE
                           ) R 
                           
                           CROSS JOIN
  (     
    SELECT 'Grădiniţă de copii' AS NUME_ROW,  '1' AS NR_ROW, '1'   AS N85_NTIIP  FROM DUAL UNION
    SELECT 'Creşă-grădiniţă de copii'  AS  NUME_ROW, '2' AS NR_ROW, '2'   AS N85_NTIIP  FROM DUAL UNION
    SELECT 'Creşă de copii'  AS  NUME_ROW, '3' AS NR_ROW, '3'   AS N85_NTIIP  FROM DUAL UNION
    SELECT 'Şcoală-grădiniţă de copii'  AS  NUME_ROW, '4' AS NR_ROW, '4'   AS N85_NTIIP  FROM DUAL UNION
    SELECT 'Centru comunitar'  AS  NUME_ROW, '5' AS NR_ROW, '5'   AS N85_NTIIP  FROM DUAL UNION
    SELECT 'Grupe pregătitoare pe lîngă instituţii de învăţămînt primar şi secundar general'  AS  NUME_ROW, '6' AS NR_ROW, '6'   AS N85_NTIIP  FROM DUAL
    
  ) CD  
      
            GROUP BY 
        R.RIND,
  R.RIND_VERS,
  R.DENUMIRE,
  CD.NR_ROW,   
  CD.NUME_ROW  
  
   ) A LEFT JOIN (
   
  SELECT
  CD.NR_ROW AS NR_SECTIE,
  CD.NUME_ROW AS NUME_SECTIE,
  R.RIND,
  R.RIND_VERS     RIND_VERS,
  R.DENUMIRE,
     CIS2.NVAL(ROUND(SUM(CASE WHEN CD.N85_NTIIP LIKE '%'||RN.N85_NTIIP||'%'  THEN  D.COL1 END),1))  AS COL1,
     CIS2.NVAL(ROUND(SUM(CASE WHEN CD.N85_NTIIP LIKE '%'||RN.N85_NTIIP||'%'  THEN  D.COL2 END),1))  AS COL2,
     CIS2.NVAL(ROUND(SUM(CASE WHEN CD.N85_NTIIP LIKE '%'||RN.N85_NTIIP||'%'  THEN  D.COL3 END),1))  AS COL3,
     CIS2.NVAL(ROUND(SUM(CASE WHEN CD.N85_NTIIP LIKE '%'||RN.N85_NTIIP||'%'  THEN  D.COL4 END),1))  AS COL4,
     CIS2.NVAL(ROUND(SUM(CASE WHEN CD.N85_NTIIP LIKE '%'||RN.N85_NTIIP||'%'  THEN  D.COL5 END),1))  AS COL5,
     CIS2.NVAL(ROUND(SUM(CASE WHEN CD.N85_NTIIP LIKE '%'||RN.N85_NTIIP||'%'  THEN  D.COL6 END),1))  AS COL6,
     CIS2.NVAL(ROUND(SUM(CASE WHEN CD.N85_NTIIP LIKE '%'||RN.N85_NTIIP||'%'  THEN  D.COL7 END),1))  AS COL7,
     CIS2.NVAL(ROUND(SUM(CASE WHEN CD.N85_NTIIP LIKE '%'||RN.N85_NTIIP||'%'  THEN  D.COL8 END),1))  AS COL8,
     CIS2.NVAL(ROUND(SUM(CASE WHEN CD.N85_NTIIP LIKE '%'||RN.N85_NTIIP||'%'  THEN  D.COL9 END),1))  AS COL9,
     CIS2.NVAL(ROUND(SUM(CASE WHEN CD.N85_NTIIP LIKE '%'||RN.N85_NTIIP||'%'  THEN  D.COL10 END),1))  AS COL10,
      CIS2.NVAL(ROUND(SUM(CASE WHEN CD.N85_NTIIP LIKE '%'||RN.N85_NTIIP||'%'  THEN  D.COL11 END),1))  AS COL11,
     CIS2.NVAL(ROUND(SUM(CASE WHEN CD.N85_NTIIP LIKE '%'||RN.N85_NTIIP||'%'  THEN  D.COL12 END),1))  AS COL12,
     CIS2.NVAL(ROUND(SUM(CASE WHEN CD.N85_NTIIP LIKE '%'||RN.N85_NTIIP||'%'  THEN  D.COL13 END),1))  AS COL13,
     CIS2.NVAL(ROUND(SUM(CASE WHEN CD.N85_NTIIP LIKE '%'||RN.N85_NTIIP||'%'  THEN  D.COL14 END),1))  AS COL14,
     CIS2.NVAL(ROUND(SUM(CASE WHEN CD.N85_NTIIP LIKE '%'||RN.N85_NTIIP||'%'  THEN  D.COL15 END),1))  AS COL15
     
     
     
     
     
--     ROUND(SUM(CASE WHEN CD.CFP LIKE '%'||R.CFP||'%'  THEN  D.COL1 END),1) AS COL1, 
--     ROUND(SUM(CASE WHEN CD.CFP LIKE '%'||R.CFP||'%'  THEN  D.COL2 END),1) AS COL2,
    
FROM
  CIS2.VW_DATA_ALL D
  INNER JOIN CIS2.MD_RIND R ON (R.RIND = D.RIND AND R.CAPITOL=D.CAPITOL AND R.CAPITOL_VERS=D.CAPITOL_VERS AND R.RIND_VERS=D.RIND_VERS)
  INNER JOIN CIS2.RENIM RN ON (RN.CUIIO = D.CUIIO AND RN.CUIIO_VERS = D.CUIIO_VERS)
  INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL)
  CROSS JOIN
  (     
    SELECT 'Grădiniţă de copii' AS NUME_ROW,  '1' AS NR_ROW, '1'   AS N85_NTIIP  FROM DUAL UNION
    SELECT 'Creşă-grădiniţă de copii'  AS  NUME_ROW, '2' AS NR_ROW, '2'   AS N85_NTIIP  FROM DUAL UNION
    SELECT 'Creşă de copii'  AS  NUME_ROW, '3' AS NR_ROW, '3'   AS N85_NTIIP  FROM DUAL UNION
    SELECT 'Şcoală-grădiniţă de copii'  AS  NUME_ROW, '4' AS NR_ROW, '4'   AS N85_NTIIP  FROM DUAL UNION
    SELECT 'Centru comunitar'  AS  NUME_ROW, '5' AS NR_ROW, '5'   AS N85_NTIIP  FROM DUAL UNION
    SELECT 'Grupe pregătitoare pe lîngă instituţii de învăţămînt primar şi secundar general'  AS  NUME_ROW, '6' AS NR_ROW, '6'   AS N85_NTIIP  FROM DUAL
    
  ) CD
  
  
  
    WHERE
    (D.PERIOADA =:pPERIOADA) AND    
    (R.FORM =:pFORM) AND 
    (R.FORM_VERS =:pFORM_VERS) AND
    (:pID_MDTABLE=:pID_MDTABLE) AND 
    (D.CUATM_FULL LIKE '%' ||:pCOD_CUATM||';%') AND
    R.FORM = 17  AND 
    R.CAPITOL IN (1004) AND 
    ASCII(R.RIND) <> 45 
    AND R.RIND_VERS IN (2007)
--    AND
   -- D.CUIIO IN (7001770)
   
  
  GROUP BY 
  R.RIND,
  R.RIND_VERS,
  R.DENUMIRE,
--  RN.N85_NTL,
--  NTL.DENUMIRE
  CD.NR_ROW,   
  CD.NUME_ROW
   
   ) B ON  (A.NR_SECTIE = B.NR_SECTIE 
            AND A.RIND  = B.RIND
            AND A.RIND_VERS   = B.RIND_VERS
            )
            
            
        ORDER BY 
            A.RIND,
            A.NR_SECTIE   