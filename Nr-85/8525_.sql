INSERT INTO CIS2.TABLE_OUT
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
    COL1,
    COL2,
    COL3,
    COL4,
    COL5,
    COL6,
    COL7,
    COL8,
    COL9,
    COL10,
    COL11,
    COL12,
    COL13,
    COL14,
    COL15
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
 B.RIND||'~'||ROWNUM/0.1579 AS NR_ROW,
 B.RIND AS ORDINE,
'000000000000000' AS DECIMAL_POS, 
 B.DENUMIRE AS NUME_ROW,
      A.COL1,
      A.COL2,
      A.COL3,
      A.COL4,
      A.COL5,
      A.COL6,
      A.COL7,
      A.COL8,
      A.COL9,
      A.COL10, 
      A.COL11,
      A.COL12,
      A.COL13,
      A.COL14,
      A.COL15  

FROM 
(
SELECT 
 MR.RIND,
 MR.DENUMIRE,
-- MR.RIND_VERS,
 SUM(D.COL1)  AS COL1,
 SUM(D.COL2)  AS COL2,
 SUM(D.COL3)  AS COL3,
 SUM(D.COL4)  AS COL4,
 SUM(D.COL5)  AS COL5,
 SUM(D.COL6)  AS COL6,
 SUM(D.COL7)  AS COL7,
 SUM(D.COL8)  AS COL8,
 SUM(D.COL9)  AS COL9,
 SUM(D.COL10) AS COL10, 
 SUM(D.COL11) AS COL11,
 SUM(D.COL12) AS COL12,
 SUM(D.COL13) AS COL13,
 SUM(D.COL14) AS COL14,
 SUM(D.COL15) AS COL15
  
FROM CIS2.VW_DATA_ALL D

INNER JOIN CIS2.MD_RIND MR ON (D.ID_MD = MR.ID_MD)

WHERE
(D.PERIOADA =:pPERIOADA) AND
(D.FORM =:pFORM) AND 
(D.FORM_VERS =:pFORM_VERS) AND
(:pID_MDTABLE=:pID_MDTABLE) AND 
(D.CUATM_FULL LIKE '%' ||:pCOD_CUATM||';%') AND
MR.FORM = 17  AND 
MR.CAPITOL IN (1002)
AND MR.RIND_VERS IN (2004)


    GROUP BY
    MR.RIND, -- MR.RIND_VERS,
   
    MR.DENUMIRE

    ORDER BY
    MR.RIND 
    
   ) A RIGHT JOIN (
   
   SELECT 
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
                             R.CAPITOL IN (1002) AND 
                             ASCII(R.RIND) <> 45   
                             AND R.RIND_VERS IN (2004)  
                            
                            GROUP BY 
                            R.RIND
                              
                            
                             ) RR   ON (    RR.RIND      = R.RIND
                                       AND  RR.RIND_VERS = R.RIND_VERS)
                                       
                                       
                            WHERE
                            
                           (R.FORM =:pFORM) AND 
                           (R.FORM_VERS =:pFORM_VERS) AND
                           (:pID_MDTABLE=:pID_MDTABLE) AND 
                           R.FORM = 17  AND 
                           R.CAPITOL IN (1002) AND 
                           ASCII(R.RIND) <> 45  
                           AND R.RIND_VERS IN (2004)                     
                           
                           
                           GROUP BY
                           R.RIND,
                           R.RIND_VERS,
                           R.DENUMIRE
                           ) R 
                           
                           
            GROUP BY 
            R.RIND,
            R.RIND_VERS,
            R.DENUMIRE
   
   ) B ON (B.RIND = A.RIND)
   
   ORDER BY 
   B.RIND









