--DECLARE
--
--  CURSOR C IS
--
--SELECT 
--    DF.PERIOADA,
--    DF.FORM,
--    DF.FORM_VERS,
--    DF.ID_MDTABLE,
--    DF.COD_CUATM,
--    DF.NR_SECTIE,
--    DF.NUME_SECTIE,
--    DF.NR_SECTIE1,
--    DF.NUME_SECTIE1,
--    DF.NR_SECTIE2,
--    DF.NUME_SECTIE2,
--    DF.NR_ROW NR_ROW,
--    DF.ORDINE,
--    DF.DECIMAL_POS,
--    DF.NUME_ROW,
--    DF.COL1,
--    DF.COL2,
--    DF.COL3,
--    DF.COL4,
--    DF.COL5,
--    DF.COL6
--     
--FROM 
--(



 

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
     rind||'~'||ROWNUM AS NR_ROW,   
     ROWNUM ORDINE,
    '000000' AS DECIMAL_POS,
    DENUMIRE NUME_ROW,
      COL1,
      COL2,
      COL3,
      COL4,
      COL5,
      COL6
    

    FROM
  
(



 


 SELECT

     1 ORDINE,    
     '00' rind, 
     'Total gospodării cu animale, păsări și familii de albine' DENUMIRE,
      SUM(COL1) AS COL1,
      SUM(COL2) AS COL2,
      SUM(COL3) AS COL3,
      SUM(COL4) AS COL4,
      SUM(COL5) AS COL5,
      SUM(COL6) AS COL6
    

    FROM
  
(

  
  SELECT 
     2 ORDINE,    
         '01' rind, 
    'numai cu bovine' DENUMIRE,
    SUM(COL1) AS COL1,
    SUM(COL2) AS COL2,
    SUM(COL3) AS COL3,
    SUM(COL4) AS COL4,
    SUM(COL5) AS COL5,
    SUM(COL6) AS COL6

FROM 
(
SELECT
        
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0000000'||';%')    THEN   D.UNIT_CODE  ELSE NULL END) AS COL1,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0100000'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL2,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'1111111'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL3,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'2222222'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL4,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'3333333'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL5,
          COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'9600000'||';%')   THEN  D.UNIT_CODE ELSE NULL END) AS COL6
FROM
  VW_DATA_ALL_GC  D
  INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
  
  INNER  JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL 
 -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')     
  
  
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
--  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (58)  AND
  D.CAPITOL IN (416)
 
  
  GROUP BY 
  D.UNIT_CODE 
  
  HAVING 
 SUM (CASE WHEN D.RIND NOT IN('010','011','012', '013','014','015')  THEN  NVAL(D.COL1) +  NVAL(D.COL2) +  NVAL(D.COL3) +  NVAL(D.COL4) +  NVAL(D.COL5) +  NVAL(D.COL6)
+  NVAL(D.COL7) +  NVAL(D.COL8) +  NVAL(D.COL9) +  NVAL(D.COL10) +  NVAL(D.COL11) +  NVAL(D.COL2) +  NVAL(D.COL13) +  NVAL(D.COL14)
+  NVAL(D.COL15) +  NVAL(D.COL16) +  NVAL(D.COL17) +  NVAL(D.COL18) + NVAL(D.COL19) ELSE  0 END  ) = 0 

)


UNION 


SELECT 
     3 ORDINE,    
    '02' rind, 
    'numai cu porcine' DENUMIRE,
    SUM(COL1) AS COL1,
    SUM(COL2) AS COL2,
    SUM(COL3) AS COL3,
    SUM(COL4) AS COL4,
    SUM(COL5) AS COL5,
    SUM(COL6) AS COL6

FROM 
(
SELECT
        
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0000000'||';%')    THEN   D.UNIT_CODE  ELSE NULL END) AS COL1,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0100000'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL2,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'1111111'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL3,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'2222222'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL4,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'3333333'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL5,
          COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'9600000'||';%')   THEN  D.UNIT_CODE ELSE NULL END) AS COL6
FROM
  VW_DATA_ALL_GC  D
  INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
  
  INNER  JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL 
 -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')     
  
  
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
--  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (58)  AND
  D.CAPITOL IN (416)
 
  
  GROUP BY 
  D.UNIT_CODE 
  
  HAVING 
 SUM (CASE WHEN D.RIND NOT IN ('020','021','022', '023','024')  THEN  NVAL(D.COL1) +  NVAL(D.COL2) +  NVAL(D.COL3) +  NVAL(D.COL4) +  NVAL(D.COL5) +  NVAL(D.COL6)
+  NVAL(D.COL7) +  NVAL(D.COL8) +  NVAL(D.COL9) +  NVAL(D.COL10) +  NVAL(D.COL11) +  NVAL(D.COL2) +  NVAL(D.COL13) +  NVAL(D.COL14)
+  NVAL(D.COL15) +  NVAL(D.COL16) +  NVAL(D.COL17) +  NVAL(D.COL18) + NVAL(D.COL19) ELSE  0 END  ) = 0 

)
  


UNION 

SELECT 
     4 ORDINE,    
    '03' rind, 
    'numai cu ovine' DENUMIRE,
    SUM(COL1) AS COL1,
    SUM(COL2) AS COL2,
    SUM(COL3) AS COL3,
    SUM(COL4) AS COL4,
    SUM(COL5) AS COL5,
    SUM(COL6) AS COL6

FROM 
(
SELECT
        
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0000000'||';%')    THEN   D.UNIT_CODE  ELSE NULL END) AS COL1,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0100000'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL2,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'1111111'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL3,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'2222222'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL4,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'3333333'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL5,
          COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'9600000'||';%')   THEN  D.UNIT_CODE ELSE NULL END) AS COL6
FROM
  VW_DATA_ALL_GC  D
  INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
  
  INNER  JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL 
 -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')     
  
  
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
--  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (58)  AND
  D.CAPITOL IN (416)
 
  
  GROUP BY 
  D.UNIT_CODE 
  
  HAVING 
 SUM (CASE WHEN D.RIND NOT IN ('030','031','032', '033')  THEN  NVAL(D.COL1) +  NVAL(D.COL2) +  NVAL(D.COL3) +  NVAL(D.COL4) +  NVAL(D.COL5) +  NVAL(D.COL6)
+  NVAL(D.COL7) +  NVAL(D.COL8) +  NVAL(D.COL9) +  NVAL(D.COL10) +  NVAL(D.COL11) +  NVAL(D.COL2) +  NVAL(D.COL13) +  NVAL(D.COL14)
+  NVAL(D.COL15) +  NVAL(D.COL16) +  NVAL(D.COL17) +  NVAL(D.COL18) + NVAL(D.COL19) ELSE  0 END  ) = 0 

)
  


UNION 


SELECT 
     5 ORDINE,    
    '04' rind, 
    'numai cu caprine' DENUMIRE,
    SUM(COL1) AS COL1,
    SUM(COL2) AS COL2,
    SUM(COL3) AS COL3,
    SUM(COL4) AS COL4,
    SUM(COL5) AS COL5,
    SUM(COL6) AS COL6

FROM 
(
SELECT
        
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0000000'||';%')    THEN   D.UNIT_CODE  ELSE NULL END) AS COL1,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0100000'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL2,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'1111111'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL3,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'2222222'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL4,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'3333333'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL5,
          COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'9600000'||';%')   THEN  D.UNIT_CODE ELSE NULL END) AS COL6
FROM
  VW_DATA_ALL_GC  D
  INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
  
  INNER  JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL 
 -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')     
  
  
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
--  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (58)  AND
  D.CAPITOL IN (416)
 
  
  GROUP BY 
  D.UNIT_CODE 
  
  HAVING 
 SUM (CASE WHEN D.RIND NOT IN ('040','041','042')  THEN  NVAL(D.COL1) +  NVAL(D.COL2) +  NVAL(D.COL3) +  NVAL(D.COL4) +  NVAL(D.COL5) +  NVAL(D.COL6)
+  NVAL(D.COL7) +  NVAL(D.COL8) +  NVAL(D.COL9) +  NVAL(D.COL10) +  NVAL(D.COL11) +  NVAL(D.COL2) +  NVAL(D.COL13) +  NVAL(D.COL14)
+  NVAL(D.COL15) +  NVAL(D.COL16) +  NVAL(D.COL17) +  NVAL(D.COL18) + NVAL(D.COL19) ELSE  0 END  ) = 0 

)




UNION 



SELECT 
     6 ORDINE,    
    '05' rind, 
    'numai cu cabaline' DENUMIRE,
    SUM(COL1) AS COL1,
    SUM(COL2) AS COL2,
    SUM(COL3) AS COL3,
    SUM(COL4) AS COL4,
    SUM(COL5) AS COL5,
    SUM(COL6) AS COL6

FROM 
(
SELECT
        
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0000000'||';%')    THEN   D.UNIT_CODE  ELSE NULL END) AS COL1,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0100000'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL2,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'1111111'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL3,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'2222222'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL4,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'3333333'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL5,
          COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'9600000'||';%')   THEN  D.UNIT_CODE ELSE NULL END) AS COL6
FROM
  VW_DATA_ALL_GC  D
  INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
  
  INNER  JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL 
 -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')     
  
  
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
--  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (58)  AND
  D.CAPITOL IN (416)
 
  
  GROUP BY 
  D.UNIT_CODE 
  
  HAVING 
 SUM (CASE WHEN D.RIND NOT IN ('050','051')  THEN  NVAL(D.COL1) +  NVAL(D.COL2) +  NVAL(D.COL3) +  NVAL(D.COL4) +  NVAL(D.COL5) +  NVAL(D.COL6)
+  NVAL(D.COL7) +  NVAL(D.COL8) +  NVAL(D.COL9) +  NVAL(D.COL10) +  NVAL(D.COL11) +  NVAL(D.COL2) +  NVAL(D.COL13) +  NVAL(D.COL14)
+  NVAL(D.COL15) +  NVAL(D.COL16) +  NVAL(D.COL17) +  NVAL(D.COL18) + NVAL(D.COL19) ELSE  0 END  ) = 0 

)



UNION 

SELECT 
     7 ORDINE,    
    '06' rind, 
    'numai cu gaini ouataore' DENUMIRE,
    SUM(COL1) AS COL1,
    SUM(COL2) AS COL2,
    SUM(COL3) AS COL3,
    SUM(COL4) AS COL4,
    SUM(COL5) AS COL5,
    SUM(COL6) AS COL6

FROM 
(
SELECT
        
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0000000'||';%')    THEN   D.UNIT_CODE  ELSE NULL END) AS COL1,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0100000'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL2,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'1111111'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL3,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'2222222'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL4,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'3333333'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL5,
          COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'9600000'||';%')   THEN  D.UNIT_CODE ELSE NULL END) AS COL6
FROM
  VW_DATA_ALL_GC  D
  INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
  
  INNER  JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL 
 -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')     
  
  
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
--  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (58)  AND
  D.CAPITOL IN (416)
 
  
  GROUP BY 
  D.UNIT_CODE 
  
  HAVING 
 SUM (CASE WHEN D.RIND NOT IN ('061','060')  THEN  NVAL(D.COL1) +  NVAL(D.COL2) +  NVAL(D.COL3) +  NVAL(D.COL4) +  NVAL(D.COL5) +  NVAL(D.COL6)
+  NVAL(D.COL7) +  NVAL(D.COL8) +  NVAL(D.COL9) +  NVAL(D.COL10) +  NVAL(D.COL11) +  NVAL(D.COL2) +  NVAL(D.COL13) +  NVAL(D.COL14)
+  NVAL(D.COL15) +  NVAL(D.COL16) +  NVAL(D.COL17) +  NVAL(D.COL18) + NVAL(D.COL19) ELSE  0 END  ) = 0 

)

    UNION 
    
    SELECT 
     8 ORDINE,    
    '06.1' rind, 
    'numai cu giste' DENUMIRE,
    SUM(COL1) AS COL1,
    SUM(COL2) AS COL2,
    SUM(COL3) AS COL3,
    SUM(COL4) AS COL4,
    SUM(COL5) AS COL5,
    SUM(COL6) AS COL6

FROM 
(
SELECT
        
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0000000'||';%')    THEN   D.UNIT_CODE  ELSE NULL END) AS COL1,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0100000'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL2,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'1111111'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL3,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'2222222'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL4,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'3333333'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL5,
          COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'9600000'||';%')   THEN  D.UNIT_CODE ELSE NULL END) AS COL6
FROM
  VW_DATA_ALL_GC  D
  INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
  
  INNER  JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL 
 -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')     
  
  
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
--  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (58)  AND
  D.CAPITOL IN (416)
 
  
  GROUP BY 
  D.UNIT_CODE 
  
  HAVING 
 SUM (CASE WHEN D.RIND NOT IN ('070','071') THEN  NVAL(D.COL1) +  NVAL(D.COL2) +  NVAL(D.COL3) +  NVAL(D.COL4) +  NVAL(D.COL5) +  NVAL(D.COL6)
+  NVAL(D.COL7) +  NVAL(D.COL8) +  NVAL(D.COL9) +  NVAL(D.COL10) +  NVAL(D.COL11) +  NVAL(D.COL2) +  NVAL(D.COL13) +  NVAL(D.COL14)
+  NVAL(D.COL15) +  NVAL(D.COL16) +  NVAL(D.COL17) +  NVAL(D.COL18) + NVAL(D.COL19) ELSE  0 END  ) = 0 

)


UNION 


SELECT 
     9 ORDINE,    
    '06.2' rind, 
    'numai cu rati' DENUMIRE,
    SUM(COL1) AS COL1,
    SUM(COL2) AS COL2,
    SUM(COL3) AS COL3,
    SUM(COL4) AS COL4,
    SUM(COL5) AS COL5,
    SUM(COL6) AS COL6

FROM 
(
SELECT
        
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0000000'||';%')    THEN   D.UNIT_CODE  ELSE NULL END) AS COL1,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0100000'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL2,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'1111111'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL3,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'2222222'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL4,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'3333333'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL5,
          COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'9600000'||';%')   THEN  D.UNIT_CODE ELSE NULL END) AS COL6
FROM
  VW_DATA_ALL_GC  D
  INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
  
  INNER  JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL 
 -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')     
  
  
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
--  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (58)  AND
  D.CAPITOL IN (416)
 
  
  GROUP BY 
  D.UNIT_CODE 
  
  HAVING 
 SUM (CASE WHEN D.RIND NOT IN ('080','081')  THEN  NVAL(D.COL1) +  NVAL(D.COL2) +  NVAL(D.COL3) +  NVAL(D.COL4) +  NVAL(D.COL5) +  NVAL(D.COL6)
+  NVAL(D.COL7) +  NVAL(D.COL8) +  NVAL(D.COL9) +  NVAL(D.COL10) +  NVAL(D.COL11) +  NVAL(D.COL2) +  NVAL(D.COL13) +  NVAL(D.COL14)
+  NVAL(D.COL15) +  NVAL(D.COL16) +  NVAL(D.COL17) +  NVAL(D.COL18) + NVAL(D.COL19) ELSE  0 END  ) = 0 

)


UNION 

SELECT 
     10 ORDINE,    
    '06.3' rind, 
    'numai cu curcani' DENUMIRE,
    SUM(COL1) AS COL1,
    SUM(COL2) AS COL2,
    SUM(COL3) AS COL3,
    SUM(COL4) AS COL4,
    SUM(COL5) AS COL5,
    SUM(COL6) AS COL6

FROM 
(
SELECT
        
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0000000'||';%')    THEN   D.UNIT_CODE  ELSE NULL END) AS COL1,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0100000'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL2,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'1111111'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL3,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'2222222'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL4,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'3333333'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL5,
          COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'9600000'||';%')   THEN  D.UNIT_CODE ELSE NULL END) AS COL6
FROM
  VW_DATA_ALL_GC  D
  INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
  
  INNER  JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL 
 -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')     
  
  
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
--  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (58)  AND
  D.CAPITOL IN (416)
 
  
  GROUP BY 
  D.UNIT_CODE 
  
  HAVING 
 SUM (CASE WHEN D.RIND NOT IN ('090','091')  THEN  NVAL(D.COL1) +  NVAL(D.COL2) +  NVAL(D.COL3) +  NVAL(D.COL4) +  NVAL(D.COL5) +  NVAL(D.COL6)
+  NVAL(D.COL7) +  NVAL(D.COL8) +  NVAL(D.COL9) +  NVAL(D.COL10) +  NVAL(D.COL11) +  NVAL(D.COL2) +  NVAL(D.COL13) +  NVAL(D.COL14)
+  NVAL(D.COL15) +  NVAL(D.COL16) +  NVAL(D.COL17) +  NVAL(D.COL18) + NVAL(D.COL19) ELSE  0 END  ) = 0 

)


UNION 


SELECT 
     11 ORDINE,    
    '09' rind, 
    'numai cu iepuri' DENUMIRE,
    SUM(COL1) AS COL1,
    SUM(COL2) AS COL2,
    SUM(COL3) AS COL3,
    SUM(COL4) AS COL4,
    SUM(COL5) AS COL5,
    SUM(COL6) AS COL6

FROM 
(
SELECT
        
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0000000'||';%')    THEN   D.UNIT_CODE  ELSE NULL END) AS COL1,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0100000'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL2,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'1111111'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL3,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'2222222'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL4,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'3333333'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL5,
          COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'9600000'||';%')   THEN  D.UNIT_CODE ELSE NULL END) AS COL6
FROM
  VW_DATA_ALL_GC  D
  INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
  
  INNER  JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL 
 -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')     
  
  
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
--  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (58)  AND
  D.CAPITOL IN (416)
 
  
  GROUP BY 
  D.UNIT_CODE 
  
  HAVING 
 SUM (CASE WHEN D.RIND NOT IN ('100','101')  THEN  NVAL(D.COL1) +  NVAL(D.COL2) +  NVAL(D.COL3) +  NVAL(D.COL4) +  NVAL(D.COL5) +  NVAL(D.COL6)
+  NVAL(D.COL7) +  NVAL(D.COL8) +  NVAL(D.COL9) +  NVAL(D.COL10) +  NVAL(D.COL11) +  NVAL(D.COL2) +  NVAL(D.COL13) +  NVAL(D.COL14)
+  NVAL(D.COL15) +  NVAL(D.COL16) +  NVAL(D.COL17) +  NVAL(D.COL18) + NVAL(D.COL19) ELSE  0 END  ) = 0 

)



UNION 

SELECT 
     12 ORDINE,    
    '10' rind, 
    'numai cu albini' DENUMIRE,
    SUM(COL1) AS COL1,
    SUM(COL2) AS COL2,
    SUM(COL3) AS COL3,
    SUM(COL4) AS COL4,
    SUM(COL5) AS COL5,
    SUM(COL6) AS COL6

FROM 
(
SELECT
        
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0000000'||';%')    THEN   D.UNIT_CODE  ELSE NULL END) AS COL1,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0100000'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL2,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'1111111'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL3,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'2222222'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL4,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'3333333'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL5,
          COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'9600000'||';%')   THEN  D.UNIT_CODE ELSE NULL END) AS COL6
FROM
  VW_DATA_ALL_GC  D
  INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
  
  INNER  JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL 
 -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')     
  
  
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
--  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (58)  AND
  D.CAPITOL IN (416)
 
  
  GROUP BY 
  D.UNIT_CODE 
  
  HAVING 
 SUM (CASE WHEN D.RIND NOT IN ('200')  THEN  NVAL(D.COL1) +  NVAL(D.COL2) +  NVAL(D.COL3) +  NVAL(D.COL4) +  NVAL(D.COL5) +  NVAL(D.COL6)
+  NVAL(D.COL7) +  NVAL(D.COL8) +  NVAL(D.COL9) +  NVAL(D.COL10) +  NVAL(D.COL11) +  NVAL(D.COL2) +  NVAL(D.COL13) +  NVAL(D.COL14)
+  NVAL(D.COL15) +  NVAL(D.COL16) +  NVAL(D.COL17) +  NVAL(D.COL18) + NVAL(D.COL19) ELSE  0 END  ) = 0 

)


UNION 

SELECT
          14 ORDINE,    
         '11' rind, 
         'gospodării cu cîteva specii de animale și păsări' DENUMIRE,

          COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0000000'||';%')    THEN   D.UNIT_CODE  ELSE NULL END) AS COL1,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0100000'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL2,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'1111111'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL3,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'2222222'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL4,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'3333333'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL5,
          COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'9600000'||';%')   THEN  D.UNIT_CODE ELSE NULL END) AS COL6

FROM
  VW_DATA_ALL_GC  D
     
  
  
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND

  D.FORM IN (58)  
  
  AND D.UNIT_CODE IN (
  /* Formatted on 20/06/2019 13:57:04 (QP5 v5.326) */
  SELECT D.UNIT_CODE 
  --COUNT (D.UNIT_CODE) AS CNT
    FROM (  SELECT 2
                       ORDINE,
                   D.UNIT_CODE,
                   D.RIND,
                   '01'
                       rind_tab,
                   'numai cu bovine'
                       DENUMIRE,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0000000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL1,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0100000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL2,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '1111111' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL3,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '2222222' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL4,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '3333333' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL5,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '9600000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL6
              FROM VW_DATA_ALL_GC D
                   INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
                   INNER JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL
             -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')


             WHERE     (D.PERIOADA IN ( :pPERIOADA))
                   AND (D.FORM = :pFORM)
                   AND (D.FORM_VERS = :pFORM_VERS)
                   AND ( :pID_MDTABLE = :pID_MDTABLE)
                   AND --  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
                       D.FORM IN (58)
                   AND D.CAPITOL IN (416)
                   AND D.RIND IN ('010')
          GROUP BY D.UNIT_CODE, D.RIND
          UNION
            SELECT 3
                       ORDINE,
                   D.UNIT_CODE,
                   D.RIND,
                   '02'
                       rind_tab,
                   'numai cu porcine'
                       DENUMIRE,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0000000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL1,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0100000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL2,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '1111111' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL3,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '2222222' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL4,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '3333333' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL5,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '9600000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL6
              FROM VW_DATA_ALL_GC D
                   INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
                   INNER JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL
             -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')


             WHERE     (D.PERIOADA IN ( :pPERIOADA))
                   AND (D.FORM = :pFORM)
                   AND (D.FORM_VERS = :pFORM_VERS)
                   AND ( :pID_MDTABLE = :pID_MDTABLE)
                   AND --  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
                       D.FORM IN (58)
                   AND D.CAPITOL IN (416)
                   AND D.RIND IN ('020')
          GROUP BY D.UNIT_CODE, D.RIND
          UNION
            SELECT 4
                       ORDINE,
                   D.UNIT_CODE,
                   D.RIND,
                   '03'
                       rind_tab,
                   'numai cu ovine  '
                       DENUMIRE,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0000000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL1,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0100000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL2,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '1111111' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL3,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '2222222' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL4,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '3333333' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL5,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '9600000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL6
              FROM VW_DATA_ALL_GC D
                   INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
                   INNER JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL
             -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')


             WHERE     (D.PERIOADA IN ( :pPERIOADA))
                   AND (D.FORM = :pFORM)
                   AND (D.FORM_VERS = :pFORM_VERS)
                   AND ( :pID_MDTABLE = :pID_MDTABLE)
                   AND --  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
                       D.FORM IN (58)
                   AND D.CAPITOL IN (416)
                   AND D.RIND IN ('030')
          GROUP BY D.UNIT_CODE, D.RIND
          UNION
            SELECT 5
                       ORDINE,
                   D.UNIT_CODE,
                   D.RIND,
                   '04'
                       rind_tab,
                   'numai cu caprine'
                       DENUMIRE,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0000000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL1,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0100000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL2,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '1111111' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL3,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '2222222' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL4,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '3333333' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL5,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '9600000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL6
              FROM VW_DATA_ALL_GC D
                   INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
                   INNER JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL
             -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')


             WHERE     (D.PERIOADA IN ( :pPERIOADA))
                   AND (D.FORM = :pFORM)
                   AND (D.FORM_VERS = :pFORM_VERS)
                   AND ( :pID_MDTABLE = :pID_MDTABLE)
                   AND --  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
                       D.FORM IN (58)
                   AND D.CAPITOL IN (416)
                   AND D.RIND IN ('040')
          GROUP BY D.UNIT_CODE, D.RIND
          UNION
            SELECT 6
                       ORDINE,
                   D.UNIT_CODE,
                   D.RIND,
                   '05'
                       rind_tab,
                   'numai cu cabaline'
                       DENUMIRE,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0000000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL1,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0100000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL2,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '1111111' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL3,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '2222222' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL4,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '3333333' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL5,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '9600000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL6
              FROM VW_DATA_ALL_GC D
                   INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
                   INNER JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL
             -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')


             WHERE     (D.PERIOADA IN ( :pPERIOADA))
                   AND (D.FORM = :pFORM)
                   AND (D.FORM_VERS = :pFORM_VERS)
                   AND ( :pID_MDTABLE = :pID_MDTABLE)
                   AND --  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
                       D.FORM IN (58)
                   AND D.CAPITOL IN (416)
                   AND D.RIND IN ('050')
          GROUP BY D.UNIT_CODE, D.RIND
          UNION
            SELECT 7.1
                       ORDINE,
                   D.UNIT_CODE,
                   D.RIND,
                   '06.1'
                       rind_tab,
                   'numai  gaini'
                       DENUMIRE,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0000000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL1,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0100000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL2,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '1111111' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL3,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '2222222' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL4,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '3333333' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL5,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '9600000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL6
              FROM VW_DATA_ALL_GC D
                   INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
                   INNER JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL
             -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')


             WHERE     (D.PERIOADA IN ( :pPERIOADA))
                   AND (D.FORM = :pFORM)
                   AND (D.FORM_VERS = :pFORM_VERS)
                   AND ( :pID_MDTABLE = :pID_MDTABLE)
                   AND --  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
                       D.FORM IN (58)
                   AND D.CAPITOL IN (416)
                   AND D.RIND IN ('060')
          GROUP BY D.UNIT_CODE, D.RIND
          UNION
            SELECT 7.2
                       ORDINE,
                   D.UNIT_CODE,
                   D.RIND,
                   '06.2'
                       rind_tab,
                   'numai  ga?te'
                       DENUMIRE,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0000000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL1,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0100000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL2,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '1111111' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL3,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '2222222' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL4,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '3333333' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL5,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '9600000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL6
              FROM VW_DATA_ALL_GC D
                   INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
                   INNER JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL
             -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')


             WHERE     (D.PERIOADA IN ( :pPERIOADA))
                   AND (D.FORM = :pFORM)
                   AND (D.FORM_VERS = :pFORM_VERS)
                   AND ( :pID_MDTABLE = :pID_MDTABLE)
                   AND --  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
                       D.FORM IN (58)
                   AND D.CAPITOL IN (416)
                   AND D.RIND IN ('070')
          GROUP BY D.UNIT_CODE, D.RIND
          UNION
            SELECT 7.3
                       ORDINE,
                   D.UNIT_CODE,
                   D.RIND,
                   '06.3'
                       rind_tab,
                   'numai  ra?e'
                       DENUMIRE,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0000000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL1,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0100000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL2,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '1111111' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL3,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '2222222' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL4,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '3333333' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL5,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '9600000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL6
              FROM VW_DATA_ALL_GC D
                   INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
                   INNER JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL
             -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')


             WHERE     (D.PERIOADA IN ( :pPERIOADA))
                   AND (D.FORM = :pFORM)
                   AND (D.FORM_VERS = :pFORM_VERS)
                   AND ( :pID_MDTABLE = :pID_MDTABLE)
                   AND --  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
                       D.FORM IN (58)
                   AND D.CAPITOL IN (416)
                   AND D.RIND IN ('080')
          GROUP BY D.UNIT_CODE, D.RIND
          UNION
            ------------------
            SELECT 7.4
                       ORDINE,
                   D.UNIT_CODE,
                   D.RIND,
                   '06.4'
                       rind_tab,
                   'numai curci'
                       DENUMIRE,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0000000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL1,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0100000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL2,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '1111111' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL3,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '2222222' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL4,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '3333333' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL5,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '9600000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL6
              FROM VW_DATA_ALL_GC D
                   INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
                   INNER JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL
             -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')


             WHERE     (D.PERIOADA IN ( :pPERIOADA))
                   AND (D.FORM = :pFORM)
                   AND (D.FORM_VERS = :pFORM_VERS)
                   AND ( :pID_MDTABLE = :pID_MDTABLE)
                   AND --  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
                       D.FORM IN (58)
                   AND D.CAPITOL IN (416)
                   AND D.RIND IN ('090')
          GROUP BY D.UNIT_CODE, D.RIND
          UNION
            SELECT 8
                       ORDINE,
                   D.UNIT_CODE,
                   D.RIND,
                   '07'
                       rind_tab,
                   'nimai cu iepuri de casa'
                       DENUMIRE,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0000000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL1,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0100000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL2,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '1111111' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL3,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '2222222' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL4,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '3333333' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL5,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '9600000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL6
              FROM VW_DATA_ALL_GC D
                   INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
                   INNER JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL
             -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')


             WHERE     (D.PERIOADA IN ( :pPERIOADA))
                   AND (D.FORM = :pFORM)
                   AND (D.FORM_VERS = :pFORM_VERS)
                   AND ( :pID_MDTABLE = :pID_MDTABLE)
                   AND --  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
                       D.FORM IN (58)
                   AND D.CAPITOL IN (416)
                   AND D.RIND IN ('100')
          GROUP BY D.UNIT_CODE, D.RIND
          UNION
            SELECT 9
                       ORDINE,
                   D.UNIT_CODE,
                   D.RIND,
                   '08'
                       rind_tab,
                   'numai cu familii de albine'
                       DENUMIRE,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0000000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL1,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0100000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL2,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '1111111' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL3,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '2222222' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL4,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '3333333' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL5,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '9600000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL6
              FROM VW_DATA_ALL_GC D
                   INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
                   INNER JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL
             -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')


             WHERE     (D.PERIOADA IN ( :pPERIOADA))
                   AND (D.FORM = :pFORM)
                   AND (D.FORM_VERS = :pFORM_VERS)
                   AND ( :pID_MDTABLE = :pID_MDTABLE)
                   AND --  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
                       D.FORM IN (58)
                   AND D.CAPITOL IN (416)
                   AND D.RIND IN ('200')
          GROUP BY D.UNIT_CODE, D.RIND) D
GROUP BY D.UNIT_CODE
  HAVING COUNT (D.UNIT_CODE) >= 2
  
  )
  


)
 



  
  

  







UNION 


  
  SELECT 
     2 ORDINE,    
         '01' rind, 
    'numai cu bovine' DENUMIRE,
    SUM(COL1) AS COL1,
    SUM(COL2) AS COL2,
    SUM(COL3) AS COL3,
    SUM(COL4) AS COL4,
    SUM(COL5) AS COL5,
    SUM(COL6) AS COL6

FROM 
(
SELECT
        
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0000000'||';%')    THEN   D.UNIT_CODE  ELSE NULL END) AS COL1,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0100000'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL2,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'1111111'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL3,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'2222222'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL4,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'3333333'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL5,
          COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'9600000'||';%')   THEN  D.UNIT_CODE ELSE NULL END) AS COL6
FROM
  VW_DATA_ALL_GC  D
  INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
  
  INNER  JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL 
 -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')     
  
  
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
--  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (58)  AND
  D.CAPITOL IN (416)
 
  
  GROUP BY 
  D.UNIT_CODE 
  
  HAVING 
 SUM (CASE WHEN D.RIND NOT IN('010','011','012', '013','014','015')  THEN  NVAL(D.COL1) +  NVAL(D.COL2) +  NVAL(D.COL3) +  NVAL(D.COL4) +  NVAL(D.COL5) +  NVAL(D.COL6)
+  NVAL(D.COL7) +  NVAL(D.COL8) +  NVAL(D.COL9) +  NVAL(D.COL10) +  NVAL(D.COL11) +  NVAL(D.COL2) +  NVAL(D.COL13) +  NVAL(D.COL14)
+  NVAL(D.COL15) +  NVAL(D.COL16) +  NVAL(D.COL17) +  NVAL(D.COL18) + NVAL(D.COL19) ELSE  0 END  ) = 0 

)


UNION 


SELECT 
     3 ORDINE,    
    '02' rind, 
    'numai cu porcine' DENUMIRE,
    SUM(COL1) AS COL1,
    SUM(COL2) AS COL2,
    SUM(COL3) AS COL3,
    SUM(COL4) AS COL4,
    SUM(COL5) AS COL5,
    SUM(COL6) AS COL6

FROM 
(
SELECT
        
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0000000'||';%')    THEN   D.UNIT_CODE  ELSE NULL END) AS COL1,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0100000'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL2,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'1111111'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL3,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'2222222'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL4,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'3333333'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL5,
          COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'9600000'||';%')   THEN  D.UNIT_CODE ELSE NULL END) AS COL6
FROM
  VW_DATA_ALL_GC  D
  INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
  
  INNER  JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL 
 -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')     
  
  
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
--  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (58)  AND
  D.CAPITOL IN (416)
 
  
  GROUP BY 
  D.UNIT_CODE 
  
  HAVING 
 SUM (CASE WHEN D.RIND NOT IN ('020','021','022', '023','024')  THEN  NVAL(D.COL1) +  NVAL(D.COL2) +  NVAL(D.COL3) +  NVAL(D.COL4) +  NVAL(D.COL5) +  NVAL(D.COL6)
+  NVAL(D.COL7) +  NVAL(D.COL8) +  NVAL(D.COL9) +  NVAL(D.COL10) +  NVAL(D.COL11) +  NVAL(D.COL2) +  NVAL(D.COL13) +  NVAL(D.COL14)
+  NVAL(D.COL15) +  NVAL(D.COL16) +  NVAL(D.COL17) +  NVAL(D.COL18) + NVAL(D.COL19) ELSE  0 END  ) = 0 

)
  


UNION 

SELECT 
     4 ORDINE,    
    '03' rind, 
    'numai cu ovine' DENUMIRE,
    SUM(COL1) AS COL1,
    SUM(COL2) AS COL2,
    SUM(COL3) AS COL3,
    SUM(COL4) AS COL4,
    SUM(COL5) AS COL5,
    SUM(COL6) AS COL6

FROM 
(
SELECT
        
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0000000'||';%')    THEN   D.UNIT_CODE  ELSE NULL END) AS COL1,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0100000'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL2,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'1111111'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL3,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'2222222'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL4,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'3333333'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL5,
          COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'9600000'||';%')   THEN  D.UNIT_CODE ELSE NULL END) AS COL6
FROM
  VW_DATA_ALL_GC  D
  INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
  
  INNER  JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL 
 -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')     
  
  
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
--  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (58)  AND
  D.CAPITOL IN (416)
 
  
  GROUP BY 
  D.UNIT_CODE 
  
  HAVING 
 SUM (CASE WHEN D.RIND NOT IN ('030','031','032', '033')  THEN  NVAL(D.COL1) +  NVAL(D.COL2) +  NVAL(D.COL3) +  NVAL(D.COL4) +  NVAL(D.COL5) +  NVAL(D.COL6)
+  NVAL(D.COL7) +  NVAL(D.COL8) +  NVAL(D.COL9) +  NVAL(D.COL10) +  NVAL(D.COL11) +  NVAL(D.COL2) +  NVAL(D.COL13) +  NVAL(D.COL14)
+  NVAL(D.COL15) +  NVAL(D.COL16) +  NVAL(D.COL17) +  NVAL(D.COL18) + NVAL(D.COL19) ELSE  0 END  ) = 0 

)
  


UNION 


SELECT 
     5 ORDINE,    
    '04' rind, 
    'numai cu caprine' DENUMIRE,
    SUM(COL1) AS COL1,
    SUM(COL2) AS COL2,
    SUM(COL3) AS COL3,
    SUM(COL4) AS COL4,
    SUM(COL5) AS COL5,
    SUM(COL6) AS COL6

FROM 
(
SELECT
        
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0000000'||';%')    THEN   D.UNIT_CODE  ELSE NULL END) AS COL1,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0100000'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL2,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'1111111'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL3,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'2222222'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL4,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'3333333'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL5,
          COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'9600000'||';%')   THEN  D.UNIT_CODE ELSE NULL END) AS COL6
FROM
  VW_DATA_ALL_GC  D
  INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
  
  INNER  JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL 
 -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')     
  
  
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
--  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (58)  AND
  D.CAPITOL IN (416)
 
  
  GROUP BY 
  D.UNIT_CODE 
  
  HAVING 
 SUM (CASE WHEN D.RIND NOT IN ('040','041','042')  THEN  NVAL(D.COL1) +  NVAL(D.COL2) +  NVAL(D.COL3) +  NVAL(D.COL4) +  NVAL(D.COL5) +  NVAL(D.COL6)
+  NVAL(D.COL7) +  NVAL(D.COL8) +  NVAL(D.COL9) +  NVAL(D.COL10) +  NVAL(D.COL11) +  NVAL(D.COL2) +  NVAL(D.COL13) +  NVAL(D.COL14)
+  NVAL(D.COL15) +  NVAL(D.COL16) +  NVAL(D.COL17) +  NVAL(D.COL18) + NVAL(D.COL19) ELSE  0 END  ) = 0 

)




UNION 



SELECT 
     6 ORDINE,    
    '05' rind, 
    'numai cu cabaline' DENUMIRE,
    SUM(COL1) AS COL1,
    SUM(COL2) AS COL2,
    SUM(COL3) AS COL3,
    SUM(COL4) AS COL4,
    SUM(COL5) AS COL5,
    SUM(COL6) AS COL6

FROM 
(
SELECT
        
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0000000'||';%')    THEN   D.UNIT_CODE  ELSE NULL END) AS COL1,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0100000'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL2,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'1111111'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL3,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'2222222'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL4,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'3333333'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL5,
          COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'9600000'||';%')   THEN  D.UNIT_CODE ELSE NULL END) AS COL6
FROM
  VW_DATA_ALL_GC  D
  INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
  
  INNER  JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL 
 -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')     
  
  
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
--  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (58)  AND
  D.CAPITOL IN (416)
 
  
  GROUP BY 
  D.UNIT_CODE 
  
  HAVING 
 SUM (CASE WHEN D.RIND NOT IN ('050','051')  THEN  NVAL(D.COL1) +  NVAL(D.COL2) +  NVAL(D.COL3) +  NVAL(D.COL4) +  NVAL(D.COL5) +  NVAL(D.COL6)
+  NVAL(D.COL7) +  NVAL(D.COL8) +  NVAL(D.COL9) +  NVAL(D.COL10) +  NVAL(D.COL11) +  NVAL(D.COL2) +  NVAL(D.COL13) +  NVAL(D.COL14)
+  NVAL(D.COL15) +  NVAL(D.COL16) +  NVAL(D.COL17) +  NVAL(D.COL18) + NVAL(D.COL19) ELSE  0 END  ) = 0 

)



UNION 

SELECT 
     7 ORDINE,    
    '06' rind, 
    'numai cu gaini ouataore' DENUMIRE,
    SUM(COL1) AS COL1,
    SUM(COL2) AS COL2,
    SUM(COL3) AS COL3,
    SUM(COL4) AS COL4,
    SUM(COL5) AS COL5,
    SUM(COL6) AS COL6

FROM 
(
SELECT
        
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0000000'||';%')    THEN   D.UNIT_CODE  ELSE NULL END) AS COL1,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0100000'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL2,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'1111111'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL3,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'2222222'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL4,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'3333333'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL5,
          COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'9600000'||';%')   THEN  D.UNIT_CODE ELSE NULL END) AS COL6
FROM
  VW_DATA_ALL_GC  D
  INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
  
  INNER  JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL 
 -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')     
  
  
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
--  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (58)  AND
  D.CAPITOL IN (416)
 
  
  GROUP BY 
  D.UNIT_CODE 
  
  HAVING 
 SUM (CASE WHEN D.RIND NOT IN ('061','060')  THEN  NVAL(D.COL1) +  NVAL(D.COL2) +  NVAL(D.COL3) +  NVAL(D.COL4) +  NVAL(D.COL5) +  NVAL(D.COL6)
+  NVAL(D.COL7) +  NVAL(D.COL8) +  NVAL(D.COL9) +  NVAL(D.COL10) +  NVAL(D.COL11) +  NVAL(D.COL2) +  NVAL(D.COL13) +  NVAL(D.COL14)
+  NVAL(D.COL15) +  NVAL(D.COL16) +  NVAL(D.COL17) +  NVAL(D.COL18) + NVAL(D.COL19) ELSE  0 END  ) = 0 

)

    UNION 
    
    SELECT 
     8 ORDINE,    
    '07' rind, 
    'numai cu giste' DENUMIRE,
    SUM(COL1) AS COL1,
    SUM(COL2) AS COL2,
    SUM(COL3) AS COL3,
    SUM(COL4) AS COL4,
    SUM(COL5) AS COL5,
    SUM(COL6) AS COL6

FROM 
(
SELECT
        
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0000000'||';%')    THEN   D.UNIT_CODE  ELSE NULL END) AS COL1,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0100000'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL2,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'1111111'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL3,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'2222222'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL4,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'3333333'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL5,
          COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'9600000'||';%')   THEN  D.UNIT_CODE ELSE NULL END) AS COL6
FROM
  VW_DATA_ALL_GC  D
  INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
  
  INNER  JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL 
 -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')     
  
  
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
--  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (58)  AND
  D.CAPITOL IN (416)
 
  
  GROUP BY 
  D.UNIT_CODE 
  
  HAVING 
 SUM (CASE WHEN D.RIND NOT IN ('070','071') THEN  NVAL(D.COL1) +  NVAL(D.COL2) +  NVAL(D.COL3) +  NVAL(D.COL4) +  NVAL(D.COL5) +  NVAL(D.COL6)
+  NVAL(D.COL7) +  NVAL(D.COL8) +  NVAL(D.COL9) +  NVAL(D.COL10) +  NVAL(D.COL11) +  NVAL(D.COL2) +  NVAL(D.COL13) +  NVAL(D.COL14)
+  NVAL(D.COL15) +  NVAL(D.COL16) +  NVAL(D.COL17) +  NVAL(D.COL18) + NVAL(D.COL19) ELSE  0 END  ) = 0 

)


UNION 


SELECT 
     9 ORDINE,    
    '08' rind, 
    'numai cu rati' DENUMIRE,
    SUM(COL1) AS COL1,
    SUM(COL2) AS COL2,
    SUM(COL3) AS COL3,
    SUM(COL4) AS COL4,
    SUM(COL5) AS COL5,
    SUM(COL6) AS COL6

FROM 
(
SELECT
        
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0000000'||';%')    THEN   D.UNIT_CODE  ELSE NULL END) AS COL1,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0100000'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL2,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'1111111'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL3,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'2222222'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL4,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'3333333'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL5,
          COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'9600000'||';%')   THEN  D.UNIT_CODE ELSE NULL END) AS COL6
FROM
  VW_DATA_ALL_GC  D
  INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
  
  INNER  JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL 
 -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')     
  
  
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
--  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (58)  AND
  D.CAPITOL IN (416)
 
  
  GROUP BY 
  D.UNIT_CODE 
  
  HAVING 
 SUM (CASE WHEN D.RIND NOT IN ('080','081')  THEN  NVAL(D.COL1) +  NVAL(D.COL2) +  NVAL(D.COL3) +  NVAL(D.COL4) +  NVAL(D.COL5) +  NVAL(D.COL6)
+  NVAL(D.COL7) +  NVAL(D.COL8) +  NVAL(D.COL9) +  NVAL(D.COL10) +  NVAL(D.COL11) +  NVAL(D.COL2) +  NVAL(D.COL13) +  NVAL(D.COL14)
+  NVAL(D.COL15) +  NVAL(D.COL16) +  NVAL(D.COL17) +  NVAL(D.COL18) + NVAL(D.COL19) ELSE  0 END  ) = 0 

)


UNION 

SELECT 
     10 ORDINE,    
    '08' rind, 
    'numai cu curcani' DENUMIRE,
    SUM(COL1) AS COL1,
    SUM(COL2) AS COL2,
    SUM(COL3) AS COL3,
    SUM(COL4) AS COL4,
    SUM(COL5) AS COL5,
    SUM(COL6) AS COL6

FROM 
(
SELECT
        
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0000000'||';%')    THEN   D.UNIT_CODE  ELSE NULL END) AS COL1,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0100000'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL2,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'1111111'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL3,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'2222222'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL4,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'3333333'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL5,
          COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'9600000'||';%')   THEN  D.UNIT_CODE ELSE NULL END) AS COL6
FROM
  VW_DATA_ALL_GC  D
  INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
  
  INNER  JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL 
 -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')     
  
  
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
--  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (58)  AND
  D.CAPITOL IN (416)
 
  
  GROUP BY 
  D.UNIT_CODE 
  
  HAVING 
 SUM (CASE WHEN D.RIND NOT IN ('090','091')  THEN  NVAL(D.COL1) +  NVAL(D.COL2) +  NVAL(D.COL3) +  NVAL(D.COL4) +  NVAL(D.COL5) +  NVAL(D.COL6)
+  NVAL(D.COL7) +  NVAL(D.COL8) +  NVAL(D.COL9) +  NVAL(D.COL10) +  NVAL(D.COL11) +  NVAL(D.COL2) +  NVAL(D.COL13) +  NVAL(D.COL14)
+  NVAL(D.COL15) +  NVAL(D.COL16) +  NVAL(D.COL17) +  NVAL(D.COL18) + NVAL(D.COL19) ELSE  0 END  ) = 0 

)


UNION 


SELECT 
     11 ORDINE,    
    '09' rind, 
    'numai cu iepuri' DENUMIRE,
    SUM(COL1) AS COL1,
    SUM(COL2) AS COL2,
    SUM(COL3) AS COL3,
    SUM(COL4) AS COL4,
    SUM(COL5) AS COL5,
    SUM(COL6) AS COL6

FROM 
(
SELECT
        
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0000000'||';%')    THEN   D.UNIT_CODE  ELSE NULL END) AS COL1,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0100000'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL2,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'1111111'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL3,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'2222222'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL4,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'3333333'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL5,
          COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'9600000'||';%')   THEN  D.UNIT_CODE ELSE NULL END) AS COL6
FROM
  VW_DATA_ALL_GC  D
  INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
  
  INNER  JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL 
 -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')     
  
  
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
--  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (58)  AND
  D.CAPITOL IN (416)
 
  
  GROUP BY 
  D.UNIT_CODE 
  
  HAVING 
 SUM (CASE WHEN D.RIND NOT IN ('100','101')  THEN  NVAL(D.COL1) +  NVAL(D.COL2) +  NVAL(D.COL3) +  NVAL(D.COL4) +  NVAL(D.COL5) +  NVAL(D.COL6)
+  NVAL(D.COL7) +  NVAL(D.COL8) +  NVAL(D.COL9) +  NVAL(D.COL10) +  NVAL(D.COL11) +  NVAL(D.COL2) +  NVAL(D.COL13) +  NVAL(D.COL14)
+  NVAL(D.COL15) +  NVAL(D.COL16) +  NVAL(D.COL17) +  NVAL(D.COL18) + NVAL(D.COL19) ELSE  0 END  ) = 0 

)



UNION 

SELECT 
     12 ORDINE,    
    '10' rind, 
    'numai cu albini' DENUMIRE,
    SUM(COL1) AS COL1,
    SUM(COL2) AS COL2,
    SUM(COL3) AS COL3,
    SUM(COL4) AS COL4,
    SUM(COL5) AS COL5,
    SUM(COL6) AS COL6

FROM 
(
SELECT
        
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0000000'||';%')    THEN   D.UNIT_CODE  ELSE NULL END) AS COL1,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0100000'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL2,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'1111111'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL3,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'2222222'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL4,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'3333333'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL5,
          COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'9600000'||';%')   THEN  D.UNIT_CODE ELSE NULL END) AS COL6
FROM
  VW_DATA_ALL_GC  D
  INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
  
  INNER  JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL 
 -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')     
  
  
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
--  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (58)  AND
  D.CAPITOL IN (416)
 
  
  GROUP BY 
  D.UNIT_CODE 
  
  HAVING 
 SUM (CASE WHEN D.RIND NOT IN ('200')  THEN  NVAL(D.COL1) +  NVAL(D.COL2) +  NVAL(D.COL3) +  NVAL(D.COL4) +  NVAL(D.COL5) +  NVAL(D.COL6)
+  NVAL(D.COL7) +  NVAL(D.COL8) +  NVAL(D.COL9) +  NVAL(D.COL10) +  NVAL(D.COL11) +  NVAL(D.COL2) +  NVAL(D.COL13) +  NVAL(D.COL14)
+  NVAL(D.COL15) +  NVAL(D.COL16) +  NVAL(D.COL17) +  NVAL(D.COL18) + NVAL(D.COL19) ELSE  0 END  ) = 0 

)


UNION 

SELECT
          14 ORDINE,    
         '11' rind, 
         'gospodării cu cîteva specii de animale și păsări' DENUMIRE,

          COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0000000'||';%')    THEN   D.UNIT_CODE  ELSE NULL END) AS COL1,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'0100000'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL2,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'1111111'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL3,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'2222222'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL4,
         COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'3333333'||';%')    THEN   D.UNIT_CODE ELSE NULL END) AS COL5,
          COUNT(DISTINCT CASE WHEN (D.CUATM_FULL LIKE '%'||'9600000'||';%')   THEN  D.UNIT_CODE ELSE NULL END) AS COL6

FROM
  VW_DATA_ALL_GC  D
     
  
  
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND

  D.FORM IN (58)  
  
  AND D.UNIT_CODE IN (
  /* Formatted on 20/06/2019 13:57:04 (QP5 v5.326) */
  SELECT D.UNIT_CODE 
  --COUNT (D.UNIT_CODE) AS CNT
    FROM (  SELECT 2
                       ORDINE,
                   D.UNIT_CODE,
                   D.RIND,
                   '01'
                       rind_tab,
                   'numai cu bovine'
                       DENUMIRE,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0000000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL1,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0100000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL2,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '1111111' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL3,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '2222222' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL4,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '3333333' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL5,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '9600000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL6
              FROM VW_DATA_ALL_GC D
                   INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
                   INNER JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL
             -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')


             WHERE     (D.PERIOADA IN ( :pPERIOADA))
                   AND (D.FORM = :pFORM)
                   AND (D.FORM_VERS = :pFORM_VERS)
                   AND ( :pID_MDTABLE = :pID_MDTABLE)
                   AND --  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
                       D.FORM IN (58)
                   AND D.CAPITOL IN (416)
                   AND D.RIND IN ('010')
          GROUP BY D.UNIT_CODE, D.RIND
          UNION
            SELECT 3
                       ORDINE,
                   D.UNIT_CODE,
                   D.RIND,
                   '02'
                       rind_tab,
                   'numai cu porcine'
                       DENUMIRE,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0000000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL1,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0100000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL2,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '1111111' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL3,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '2222222' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL4,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '3333333' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL5,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '9600000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL6
              FROM VW_DATA_ALL_GC D
                   INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
                   INNER JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL
             -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')


             WHERE     (D.PERIOADA IN ( :pPERIOADA))
                   AND (D.FORM = :pFORM)
                   AND (D.FORM_VERS = :pFORM_VERS)
                   AND ( :pID_MDTABLE = :pID_MDTABLE)
                   AND --  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
                       D.FORM IN (58)
                   AND D.CAPITOL IN (416)
                   AND D.RIND IN ('020')
          GROUP BY D.UNIT_CODE, D.RIND
          UNION
            SELECT 4
                       ORDINE,
                   D.UNIT_CODE,
                   D.RIND,
                   '03'
                       rind_tab,
                   'numai cu ovine  '
                       DENUMIRE,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0000000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL1,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0100000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL2,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '1111111' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL3,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '2222222' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL4,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '3333333' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL5,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '9600000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL6
              FROM VW_DATA_ALL_GC D
                   INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
                   INNER JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL
             -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')


             WHERE     (D.PERIOADA IN ( :pPERIOADA))
                   AND (D.FORM = :pFORM)
                   AND (D.FORM_VERS = :pFORM_VERS)
                   AND ( :pID_MDTABLE = :pID_MDTABLE)
                   AND --  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
                       D.FORM IN (58)
                   AND D.CAPITOL IN (416)
                   AND D.RIND IN ('030')
          GROUP BY D.UNIT_CODE, D.RIND
          UNION
            SELECT 5
                       ORDINE,
                   D.UNIT_CODE,
                   D.RIND,
                   '04'
                       rind_tab,
                   'numai cu caprine'
                       DENUMIRE,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0000000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL1,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0100000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL2,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '1111111' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL3,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '2222222' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL4,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '3333333' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL5,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '9600000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL6
              FROM VW_DATA_ALL_GC D
                   INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
                   INNER JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL
             -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')


             WHERE     (D.PERIOADA IN ( :pPERIOADA))
                   AND (D.FORM = :pFORM)
                   AND (D.FORM_VERS = :pFORM_VERS)
                   AND ( :pID_MDTABLE = :pID_MDTABLE)
                   AND --  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
                       D.FORM IN (58)
                   AND D.CAPITOL IN (416)
                   AND D.RIND IN ('040')
          GROUP BY D.UNIT_CODE, D.RIND
          UNION
            SELECT 6
                       ORDINE,
                   D.UNIT_CODE,
                   D.RIND,
                   '05'
                       rind_tab,
                   'numai cu cabaline'
                       DENUMIRE,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0000000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL1,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0100000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL2,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '1111111' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL3,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '2222222' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL4,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '3333333' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL5,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '9600000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL6
              FROM VW_DATA_ALL_GC D
                   INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
                   INNER JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL
             -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')


             WHERE     (D.PERIOADA IN ( :pPERIOADA))
                   AND (D.FORM = :pFORM)
                   AND (D.FORM_VERS = :pFORM_VERS)
                   AND ( :pID_MDTABLE = :pID_MDTABLE)
                   AND --  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
                       D.FORM IN (58)
                   AND D.CAPITOL IN (416)
                   AND D.RIND IN ('050')
          GROUP BY D.UNIT_CODE, D.RIND
          UNION
            SELECT 7.1
                       ORDINE,
                   D.UNIT_CODE,
                   D.RIND,
                   '06.1'
                       rind_tab,
                   'numai  gaini'
                       DENUMIRE,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0000000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL1,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0100000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL2,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '1111111' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL3,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '2222222' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL4,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '3333333' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL5,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '9600000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL6
              FROM VW_DATA_ALL_GC D
                   INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
                   INNER JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL
             -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')


             WHERE     (D.PERIOADA IN ( :pPERIOADA))
                   AND (D.FORM = :pFORM)
                   AND (D.FORM_VERS = :pFORM_VERS)
                   AND ( :pID_MDTABLE = :pID_MDTABLE)
                   AND --  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
                       D.FORM IN (58)
                   AND D.CAPITOL IN (416)
                   AND D.RIND IN ('060')
          GROUP BY D.UNIT_CODE, D.RIND
          UNION
            SELECT 7.2
                       ORDINE,
                   D.UNIT_CODE,
                   D.RIND,
                   '06.2'
                       rind_tab,
                   'numai  ga?te'
                       DENUMIRE,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0000000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL1,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0100000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL2,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '1111111' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL3,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '2222222' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL4,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '3333333' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL5,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '9600000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL6
              FROM VW_DATA_ALL_GC D
                   INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
                   INNER JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL
             -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')


             WHERE     (D.PERIOADA IN ( :pPERIOADA))
                   AND (D.FORM = :pFORM)
                   AND (D.FORM_VERS = :pFORM_VERS)
                   AND ( :pID_MDTABLE = :pID_MDTABLE)
                   AND --  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
                       D.FORM IN (58)
                   AND D.CAPITOL IN (416)
                   AND D.RIND IN ('070')
          GROUP BY D.UNIT_CODE, D.RIND
          UNION
            SELECT 7.3
                       ORDINE,
                   D.UNIT_CODE,
                   D.RIND,
                   '06.3'
                       rind_tab,
                   'numai  ra?e'
                       DENUMIRE,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0000000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL1,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0100000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL2,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '1111111' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL3,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '2222222' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL4,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '3333333' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL5,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '9600000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL6
              FROM VW_DATA_ALL_GC D
                   INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
                   INNER JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL
             -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')


             WHERE     (D.PERIOADA IN ( :pPERIOADA))
                   AND (D.FORM = :pFORM)
                   AND (D.FORM_VERS = :pFORM_VERS)
                   AND ( :pID_MDTABLE = :pID_MDTABLE)
                   AND --  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
                       D.FORM IN (58)
                   AND D.CAPITOL IN (416)
                   AND D.RIND IN ('080')
          GROUP BY D.UNIT_CODE, D.RIND
          UNION
            ------------------
            SELECT 7.4
                       ORDINE,
                   D.UNIT_CODE,
                   D.RIND,
                   '06.4'
                       rind_tab,
                   'numai curci'
                       DENUMIRE,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0000000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL1,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0100000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL2,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '1111111' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL3,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '2222222' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL4,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '3333333' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL5,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '9600000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL6
              FROM VW_DATA_ALL_GC D
                   INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
                   INNER JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL
             -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')


             WHERE     (D.PERIOADA IN ( :pPERIOADA))
                   AND (D.FORM = :pFORM)
                   AND (D.FORM_VERS = :pFORM_VERS)
                   AND ( :pID_MDTABLE = :pID_MDTABLE)
                   AND --  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
                       D.FORM IN (58)
                   AND D.CAPITOL IN (416)
                   AND D.RIND IN ('090')
          GROUP BY D.UNIT_CODE, D.RIND
          UNION
            SELECT 8
                       ORDINE,
                   D.UNIT_CODE,
                   D.RIND,
                   '07'
                       rind_tab,
                   'nimai cu iepuri de casa'
                       DENUMIRE,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0000000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL1,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0100000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL2,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '1111111' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL3,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '2222222' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL4,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '3333333' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL5,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '9600000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL6
              FROM VW_DATA_ALL_GC D
                   INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
                   INNER JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL
             -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')


             WHERE     (D.PERIOADA IN ( :pPERIOADA))
                   AND (D.FORM = :pFORM)
                   AND (D.FORM_VERS = :pFORM_VERS)
                   AND ( :pID_MDTABLE = :pID_MDTABLE)
                   AND --  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
                       D.FORM IN (58)
                   AND D.CAPITOL IN (416)
                   AND D.RIND IN ('100')
          GROUP BY D.UNIT_CODE, D.RIND
          UNION
            SELECT 9
                       ORDINE,
                   D.UNIT_CODE,
                   D.RIND,
                   '08'
                       rind_tab,
                   'numai cu familii de albine'
                       DENUMIRE,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0000000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL1,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '0100000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL2,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '1111111' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL3,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '2222222' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL4,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '3333333' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL5,
                   COUNT (
                       DISTINCT CASE
                                    WHEN (D.CUATM_FULL LIKE
                                              '%' || '9600000' || ';%')
                                    THEN
                                        D.UNIT_CODE
                                    ELSE
                                        NULL
                                END)
                       AS COL6
              FROM VW_DATA_ALL_GC D
                   INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
                   INNER JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL
             -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')


             WHERE     (D.PERIOADA IN ( :pPERIOADA))
                   AND (D.FORM = :pFORM)
                   AND (D.FORM_VERS = :pFORM_VERS)
                   AND ( :pID_MDTABLE = :pID_MDTABLE)
                   AND --  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
                       D.FORM IN (58)
                   AND D.CAPITOL IN (416)
                   AND D.RIND IN ('200')
          GROUP BY D.UNIT_CODE, D.RIND) D
GROUP BY D.UNIT_CODE
  HAVING COUNT (D.UNIT_CODE) >= 2
  
  )
  


)
 



  
  


 


  
  

  ) DF
  
  ;
   
    BEGIN

  FOR CR IN C
  
  LOOP
   
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
       
      CR.COL1, CR.COL2, CR.COL3, CR.COL4 , CR.COL5 , CR.COL6
    );
  END LOOP;
END;
  
  