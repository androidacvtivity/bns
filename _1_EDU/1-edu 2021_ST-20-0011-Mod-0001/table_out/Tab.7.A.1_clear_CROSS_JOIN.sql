--INSERT INTO TABLE_OUT 
--(
--  PERIOADA,
--  FORM,
--  FORM_VERS,
--  ID_MDTABLE,
--  COD_CUATM,
--  NR_SECTIE,
--  NUME_SECTIE,
--  NR_SECTIE1,
--  NUME_SECTIE1,
--  NR_SECTIE2,
--  NUME_SECTIE2,
--  NR_ROW,
--  ORDINE,
--  DECIMAL_POS,
--  NUME_ROW,  
-- COL1, COL2, COL3, COL4, COL5, COL6, COL7
--)


  SELECT DISTINCT
  :pPERIOADA AS PERIOADA,
  :pFORM AS FORM,
  :pFORM_VERS AS FORM_VERS,
  :pID_MDTABLE AS ID_MDTABLE,
  :pCOD_CUATM AS COD_CUATM,
   D.NR_SECTIE AS NR_SECTIE,
   D.NUME_SECTIE AS NUME_SECTIE,
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,
   

   D.ORDINE_2||'~'||ROWNUM NR_ROW,
 
   ROWNUM ORDINE,
  '0000000' AS DECIMAL_POS,
   D.NUME_ROW,
  
   CASE WHEN COL1 = 0 THEN NULL ELSE COL1 END AS COL1,
  CASE WHEN COL2 = 0 THEN NULL ELSE COL2 END AS COL2,
  CASE WHEN COL3 = 0 THEN NULL ELSE COL3 END AS COL3,
  CASE WHEN COL4 = 0 THEN NULL ELSE COL4 END AS COL4,
  CASE WHEN COL5 = 0 THEN NULL ELSE COL5 END AS COL5,
  CASE WHEN COL6 = 0 THEN NULL ELSE COL6 END AS COL6,
  CASE WHEN COL7 = 0 THEN NULL ELSE COL5 END AS COL7
   
FROM

(

SELECT
   CD.NR_ROW AS NR_SECTIE,
   CD.NUME_ROW AS NUME_SECTIE,
   B.NR_ROW,
   B.ORDINE,
   B.ORDINE_2,
   B.NUME_ROW, 

  SUM(CASE WHEN  B.NR_ROW = D.RIND   AND C.FULL_CODE LIKE '%'||CD.CUATM||';%'   THEN D.COL2 ELSE 0 END ) AS COL1,
  SUM(CASE WHEN  B.NR_ROW = D.RIND   AND C.FULL_CODE LIKE '%'||CD.CUATM||';%'   THEN D.COL3 ELSE 0 END ) AS COL2,
  SUM(CASE WHEN  B.NR_ROW = D.RIND   AND C.FULL_CODE LIKE '%'||CD.CUATM||';%'   THEN D.COL4 ELSE 0 END ) AS COL3,
  SUM(CASE WHEN  B.NR_ROW = D.RIND   AND C.FULL_CODE LIKE '%'||CD.CUATM||';%'   THEN D.COL5 ELSE 0 END ) AS COL4,
  SUM(CASE WHEN  B.NR_ROW = D.RIND   AND C.FULL_CODE LIKE '%'||CD.CUATM||';%'   THEN D.COL6 ELSE 0 END ) AS COL5,
  SUM(CASE WHEN  B.NR_ROW = D.RIND   AND C.FULL_CODE LIKE '%'||CD.CUATM||';%'   THEN D.COL7 ELSE 0 END ) AS COL6,
  SUM(CASE WHEN  B.NR_ROW = D.RIND   AND C.FULL_CODE LIKE '%'||CD.CUATM||';%'   THEN D.COL8 ELSE 0 END ) AS COL7
  


  
FROM CIS2.VW_DATA_ALL D
        INNER JOIN CIS2.MD_RIND MR ON (MR.ID_MD = D.ID_MD)
        INNER JOIN CIS2.VW_CL_CUATM C ON (D.CUATM=C.CODUL)
    
        
        CROSS JOIN
(

SELECT '01'  AS NR_ROW, 'Total'    AS NUME_ROW,  1 AS ORDINE, '1' AS ORDINE_2 FROM DUAL UNION
SELECT '-'  AS NR_ROW, 'din ei studieaza:'    AS NUME_ROW,  2 AS ORDINE,   '-' AS ORDINE_2 FROM DUAL UNION
SELECT '02'  AS NR_ROW, 'în limba româna'    AS NUME_ROW,   3 AS ORDINE, '2' AS ORDINE_2 FROM  DUAL UNION
SELECT '-'  AS NR_ROW, 'inclusiv în:'    AS NUME_ROW,   4 AS ORDINE , '-' AS ORDINE_2 FROM DUAL  UNION
SELECT '03'  AS NR_ROW, 'clasele 1-4'    AS NUME_ROW,   5 AS ORDINE , '3' AS ORDINE_2 FROM  DUAL  UNION
SELECT '04'  AS NR_ROW, 'clasele 5-9'    AS NUME_ROW,   6 AS ORDINE, '4' AS ORDINE_2 FROM  DUAL UNION
SELECT '05'  AS NR_ROW, 'clasele 10-12'    AS NUME_ROW,   7 AS ORDINE , '5' AS ORDINE_2 FROM  DUAL UNION
SELECT '06'  AS NR_ROW, 'în limba rusa'    AS NUME_ROW,  8 AS ORDINE , '6' AS ORDINE_2 FROM  DUAL  UNION
SELECT '-'  AS NR_ROW, 'inclusiv în:'    AS NUME_ROW,  9 AS ORDINE  , '-' AS ORDINE_2 FROM  DUAL UNION
SELECT '07'  AS NR_ROW, 'clasele 1-4'    AS NUME_ROW,  10 AS ORDINE , '7' AS ORDINE_2 FROM  DUAL UNION
SELECT '08'  AS NR_ROW, 'clasele 5-9'    AS NUME_ROW,  11 AS ORDINE , '8' AS ORDINE_2 FROM  DUAL UNION
SELECT '09'  AS NR_ROW, 'clasele 11-12'    AS NUME_ROW,  12 AS ORDINE , '9' AS ORDINE_2 FROM  DUAL 

 
) B
  
  CROSS JOIN
                                    
  ( 
    SELECT 'Total' AS NUME_ROW,                                   '01' AS NR_ROW, '0000000' AS CUATM FROM DUAL UNION
    SELECT 'Mun. Chisinau' AS NUME_ROW,                           '02' AS NR_ROW, '0100000' AS CUATM FROM DUAL UNION 
    SELECT 'NORD' AS NUME_ROW,                                    '03' AS NR_ROW, '1111111' AS CUATM FROM DUAL UNION 
    SELECT 'Mun. Balti' AS NUME_ROW,                              '04' AS NR_ROW, '0300000' AS CUATM FROM DUAL UNION 
    SELECT 'Briceni' AS NUME_ROW,                                 '05' AS NR_ROW, '1400000' AS CUATM FROM DUAL UNION 
    SELECT 'Donduseni' AS NUME_ROW,                               '06' AS NR_ROW, '3400000' AS CUATM FROM DUAL UNION 
    SELECT 'Drochia' AS NUME_ROW,                                 '07' AS NR_ROW, '3600000' AS CUATM FROM DUAL UNION 
    SELECT 'Edinet' AS NUME_ROW,                                  '08' AS NR_ROW, '4100000' AS CUATM FROM DUAL UNION 
    SELECT 'Falaseti' AS NUME_ROW,                                '09' AS NR_ROW, '4300000' AS CUATM FROM DUAL UNION 
    SELECT 'Floresti' AS NUME_ROW,                                '10' AS NR_ROW, '4500000' AS CUATM FROM DUAL UNION 
    SELECT 'Glodeni' AS NUME_ROW,                                 '11' AS NR_ROW, '4800000' AS CUATM FROM DUAL UNION
    SELECT 'Ocnita' AS NUME_ROW,                                  '12' AS NR_ROW, '6200000' AS CUATM FROM DUAL UNION 
    SELECT 'Riscani' AS NUME_ROW,                                 '13' AS NR_ROW, '7100000' AS CUATM FROM DUAL UNION 
    SELECT 'Singerei' AS NUME_ROW,                                '14' AS NR_ROW, '7400000' AS CUATM FROM DUAL UNION 
    SELECT 'Soroca' AS NUME_ROW,                                  '15' AS NR_ROW, '7800000' AS CUATM FROM DUAL UNION 
    SELECT 'CENTRU' AS NUME_ROW,                                  '16' AS NR_ROW, '2222222' AS CUATM FROM DUAL UNION 
    SELECT 'Anenii Noi' AS NUME_ROW,                              '17' AS NR_ROW, '1000000' AS CUATM FROM DUAL UNION 
    SELECT 'Calarasi' AS NUME_ROW,                                '18' AS NR_ROW, '2500000' AS CUATM FROM DUAL UNION 
    SELECT 'Criuleni' AS NUME_ROW,                                '19' AS NR_ROW, '3100000' AS CUATM FROM DUAL UNION 
    SELECT 'Dubasari' AS NUME_ROW,                                '20' AS NR_ROW, '3800000' AS CUATM FROM DUAL UNION
    SELECT 'Hincesti' AS NUME_ROW,                                '21' AS NR_ROW, '5300000' AS CUATM FROM DUAL UNION
    SELECT 'Ialoveni' AS NUME_ROW,                                '22' AS NR_ROW, '5500000' AS CUATM FROM DUAL UNION 
    SELECT 'Nisporeni' AS NUME_ROW,                               '23' AS NR_ROW, '6000000' AS CUATM FROM DUAL UNION 
    SELECT 'Orhei' AS NUME_ROW,                                   '24' AS NR_ROW, '6400000' AS CUATM FROM DUAL UNION 
    SELECT 'Rezina' AS NUME_ROW,                                  '25' AS NR_ROW, '6700000' AS CUATM FROM DUAL UNION 
    SELECT 'Straseni' AS NUME_ROW,                                '26' AS NR_ROW, '8000000' AS CUATM FROM DUAL UNION 
    SELECT 'Soldanesti' AS NUME_ROW,                              '27' AS NR_ROW, '8300000' AS CUATM FROM DUAL UNION 
    SELECT 'Telenesti' AS NUME_ROW,                               '28' AS NR_ROW, '8900000' AS CUATM FROM DUAL UNION 
    SELECT 'Ungheni' AS NUME_ROW,                                 '29' AS NR_ROW, '9200000' AS CUATM FROM DUAL UNION 
    SELECT 'SUD' AS NUME_ROW,                                     '30' AS NR_ROW, '3333333' AS CUATM FROM DUAL UNION 
    SELECT 'Basarabeasca' AS NUME_ROW,                            '31' AS NR_ROW, '1200000' AS CUATM FROM DUAL UNION
    SELECT 'Cahul' AS NUME_ROW,                                   '32' AS NR_ROW, '1700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cantemir' AS NUME_ROW,                                '33' AS NR_ROW, '2100000' AS CUATM FROM DUAL UNION 
    SELECT 'Causeni' AS NUME_ROW,                                 '34' AS NR_ROW, '2700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cimislia' AS NUME_ROW,                                '35' AS NR_ROW, '2900000' AS CUATM FROM DUAL UNION 
    SELECT 'Leova' AS NUME_ROW,                                   '36' AS NR_ROW, '5700000' AS CUATM FROM DUAL UNION 
    SELECT 'Stefan_Voda' AS NUME_ROW,                             '37' AS NR_ROW, '8500000' AS CUATM FROM DUAL UNION 
    SELECT 'Taraclia' AS NUME_ROW,                                '38' AS NR_ROW, '8700000' AS CUATM FROM DUAL UNION 
    SELECT 'UTA Gagauzia' AS NUME_ROW,                            '39' AS NR_ROW, '9600000' AS CUATM FROM DUAL UNION
    SELECT 'UATdS NISTRULUI' AS NUME_ROW,                         '40' AS NR_ROW, '9800000' AS CUATM FROM DUAL UNION
    SELECT 'MUN.BENDER' AS NUME_ROW,                              '41' AS NR_ROW, '0501000' AS CUATM FROM DUAL
       ) CD
WHERE 
  (D.PERIOADA =:pPERIOADA) AND
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE)  AND 
  (D.CUATM_FULL LIKE '%' ||:pCOD_CUATM||';%') AND
   D.FORM = 40 AND  
   D.CAPITOL IN 1024
  
   GROUP BY
  CD.NR_ROW,
  CD.NUME_ROW,
  B.ORDINE,
  B.ORDINE_2,
  B.NUME_ROW,
  B.NR_ROW
  
  
  UNION 
  
  SELECT
   CD.NR_ROW AS NR_SECTIE,
   CD.NUME_ROW AS NUME_SECTIE,
   B.NR_ROW,
   B.ORDINE,
   B.ORDINE_2,
   B.NUME_ROW, 

  SUM(CASE WHEN  B.NR_ROW = D.RIND   AND C.FULL_CODE LIKE '%'||CD.CUATM||';%'   THEN D.COL2 ELSE 0 END ) AS COL1,
  SUM(CASE WHEN  B.NR_ROW = D.RIND   AND C.FULL_CODE LIKE '%'||CD.CUATM||';%'   THEN D.COL3 ELSE 0 END ) AS COL2,
  SUM(CASE WHEN  B.NR_ROW = D.RIND   AND C.FULL_CODE LIKE '%'||CD.CUATM||';%'   THEN D.COL4 ELSE 0 END ) AS COL3,
  SUM(CASE WHEN  B.NR_ROW = D.RIND   AND C.FULL_CODE LIKE '%'||CD.CUATM||';%'   THEN D.COL5 ELSE 0 END ) AS COL4,
  SUM(CASE WHEN  B.NR_ROW = D.RIND   AND C.FULL_CODE LIKE '%'||CD.CUATM||';%'   THEN D.COL6 ELSE 0 END ) AS COL5,
  SUM(CASE WHEN  B.NR_ROW = D.RIND   AND C.FULL_CODE LIKE '%'||CD.CUATM||';%'   THEN D.COL7 ELSE 0 END ) AS COL6,
  SUM(CASE WHEN  B.NR_ROW = D.RIND   AND C.FULL_CODE LIKE '%'||CD.CUATM||';%'   THEN D.COL8 ELSE 0 END ) AS COL7
  


  
FROM CIS2.VW_DATA_ALL D
      
        INNER JOIN CIS2.MD_RIND MR ON (MR.ID_MD = D.ID_MD)
        INNER JOIN CIS2.VW_CL_CUATM C ON (D.CUATM=C.CODUL)
    
        
        CROSS JOIN
(

SELECT '10'  AS NR_ROW, 'în limba ucraineana'    AS NUME_ROW,  14 AS ORDINE , '10' AS ORDINE_2 FROM DUAL  UNION
SELECT '-'  AS NR_ROW, 'inclusiv în:'    AS NUME_ROW,    15 AS ORDINE  , '-' AS ORDINE_2 FROM DUAL  UNION
SELECT '11'  AS NR_ROW, 'clasele 1-4'    AS NUME_ROW,  16 AS ORDINE , '11' AS ORDINE_2 FROM DUAL UNION
SELECT '12'  AS NR_ROW, 'clasele 5-9'    AS NUME_ROW,  17 AS ORDINE , '12' AS ORDINE_2 FROM DUAL UNION
SELECT '13'  AS NR_ROW, 'clasele 10-12'    AS NUME_ROW,  18 AS ORDINE  , '13' AS ORDINE_2 FROM DUAL
 
) B
  CROSS JOIN
                                    
  ( 
    SELECT 'Total' AS NUME_ROW,                                   '01' AS NR_ROW, '0000000' AS CUATM FROM DUAL UNION
    SELECT 'Mun. Chisinau' AS NUME_ROW,                           '02' AS NR_ROW, '0100000' AS CUATM FROM DUAL UNION 
    SELECT 'NORD' AS NUME_ROW,                                    '03' AS NR_ROW, '1111111' AS CUATM FROM DUAL UNION 
    SELECT 'Mun. Balti' AS NUME_ROW,                              '04' AS NR_ROW, '0300000' AS CUATM FROM DUAL UNION 
    SELECT 'Briceni' AS NUME_ROW,                                 '05' AS NR_ROW, '1400000' AS CUATM FROM DUAL UNION 
    SELECT 'Donduseni' AS NUME_ROW,                               '06' AS NR_ROW, '3400000' AS CUATM FROM DUAL UNION 
    SELECT 'Drochia' AS NUME_ROW,                                 '07' AS NR_ROW, '3600000' AS CUATM FROM DUAL UNION 
    SELECT 'Edinet' AS NUME_ROW,                                  '08' AS NR_ROW, '4100000' AS CUATM FROM DUAL UNION 
    SELECT 'Falaseti' AS NUME_ROW,                                '09' AS NR_ROW, '4300000' AS CUATM FROM DUAL UNION 
    SELECT 'Floresti' AS NUME_ROW,                                '10' AS NR_ROW, '4500000' AS CUATM FROM DUAL UNION 
    SELECT 'Glodeni' AS NUME_ROW,                                 '11' AS NR_ROW, '4800000' AS CUATM FROM DUAL UNION
    SELECT 'Ocnita' AS NUME_ROW,                                  '12' AS NR_ROW, '6200000' AS CUATM FROM DUAL UNION 
    SELECT 'Riscani' AS NUME_ROW,                                 '13' AS NR_ROW, '7100000' AS CUATM FROM DUAL UNION 
    SELECT 'Singerei' AS NUME_ROW,                                '14' AS NR_ROW, '7400000' AS CUATM FROM DUAL UNION 
    SELECT 'Soroca' AS NUME_ROW,                                  '15' AS NR_ROW, '7800000' AS CUATM FROM DUAL UNION 
    SELECT 'CENTRU' AS NUME_ROW,                                  '16' AS NR_ROW, '2222222' AS CUATM FROM DUAL UNION 
    SELECT 'Anenii Noi' AS NUME_ROW,                              '17' AS NR_ROW, '1000000' AS CUATM FROM DUAL UNION 
    SELECT 'Calarasi' AS NUME_ROW,                                '18' AS NR_ROW, '2500000' AS CUATM FROM DUAL UNION 
    SELECT 'Criuleni' AS NUME_ROW,                                '19' AS NR_ROW, '3100000' AS CUATM FROM DUAL UNION 
    SELECT 'Dubasari' AS NUME_ROW,                                '20' AS NR_ROW, '3800000' AS CUATM FROM DUAL UNION
    SELECT 'Hincesti' AS NUME_ROW,                                '21' AS NR_ROW, '5300000' AS CUATM FROM DUAL UNION
    SELECT 'Ialoveni' AS NUME_ROW,                                '22' AS NR_ROW, '5500000' AS CUATM FROM DUAL UNION 
    SELECT 'Nisporeni' AS NUME_ROW,                               '23' AS NR_ROW, '6000000' AS CUATM FROM DUAL UNION 
    SELECT 'Orhei' AS NUME_ROW,                                   '24' AS NR_ROW, '6400000' AS CUATM FROM DUAL UNION 
    SELECT 'Rezina' AS NUME_ROW,                                  '25' AS NR_ROW, '6700000' AS CUATM FROM DUAL UNION 
    SELECT 'Straseni' AS NUME_ROW,                                '26' AS NR_ROW, '8000000' AS CUATM FROM DUAL UNION 
    SELECT 'Soldanesti' AS NUME_ROW,                              '27' AS NR_ROW, '8300000' AS CUATM FROM DUAL UNION 
    SELECT 'Telenesti' AS NUME_ROW,                               '28' AS NR_ROW, '8900000' AS CUATM FROM DUAL UNION 
    SELECT 'Ungheni' AS NUME_ROW,                                 '29' AS NR_ROW, '9200000' AS CUATM FROM DUAL UNION 
    SELECT 'SUD' AS NUME_ROW,                                     '30' AS NR_ROW, '3333333' AS CUATM FROM DUAL UNION 
    SELECT 'Basarabeasca' AS NUME_ROW,                            '31' AS NR_ROW, '1200000' AS CUATM FROM DUAL UNION
    SELECT 'Cahul' AS NUME_ROW,                                   '32' AS NR_ROW, '1700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cantemir' AS NUME_ROW,                                '33' AS NR_ROW, '2100000' AS CUATM FROM DUAL UNION 
    SELECT 'Causeni' AS NUME_ROW,                                 '34' AS NR_ROW, '2700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cimislia' AS NUME_ROW,                                '35' AS NR_ROW, '2900000' AS CUATM FROM DUAL UNION 
    SELECT 'Leova' AS NUME_ROW,                                   '36' AS NR_ROW, '5700000' AS CUATM FROM DUAL UNION 
    SELECT 'Stefan_Voda' AS NUME_ROW,                             '37' AS NR_ROW, '8500000' AS CUATM FROM DUAL UNION 
    SELECT 'Taraclia' AS NUME_ROW,                                '38' AS NR_ROW, '8700000' AS CUATM FROM DUAL UNION 
    SELECT 'UTA Gagauzia' AS NUME_ROW,                            '39' AS NR_ROW, '9600000' AS CUATM FROM DUAL UNION
    SELECT 'UATdS NISTRULUI' AS NUME_ROW,                         '40' AS NR_ROW, '9800000' AS CUATM FROM DUAL UNION
    SELECT 'MUN.BENDER' AS NUME_ROW,                              '41' AS NR_ROW, '0501000' AS CUATM FROM DUAL
       ) CD
  
WHERE 
  (D.PERIOADA =:pPERIOADA) AND
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE)  AND 
  (D.CUATM_FULL LIKE '%' ||:pCOD_CUATM||';%') AND
   D.FORM = 40 AND  
   D.CAPITOL IN 1024
   AND D.COL1 = 67
 
   
   GROUP BY
  CD.NR_ROW,
  CD.NUME_ROW,
  B.ORDINE,
  B.ORDINE_2,
  B.NUME_ROW,
  B.NR_ROW
  
  
  UNION 
  
  SELECT
      CD.NR_ROW AS NR_SECTIE,
   CD.NUME_ROW AS NUME_SECTIE,
   B.NR_ROW,
   B.ORDINE,
   B.ORDINE_2,
   B.NUME_ROW, 

 SUM(CASE WHEN  B.NR_ROW = D.RIND   AND C.FULL_CODE LIKE '%'||CD.CUATM||';%'   THEN D.COL2 ELSE 0 END ) AS COL1,
  SUM(CASE WHEN  B.NR_ROW = D.RIND   AND C.FULL_CODE LIKE '%'||CD.CUATM||';%'   THEN D.COL3 ELSE 0 END ) AS COL2,
  SUM(CASE WHEN  B.NR_ROW = D.RIND   AND C.FULL_CODE LIKE '%'||CD.CUATM||';%'   THEN D.COL4 ELSE 0 END ) AS COL3,
  SUM(CASE WHEN  B.NR_ROW = D.RIND   AND C.FULL_CODE LIKE '%'||CD.CUATM||';%'   THEN D.COL5 ELSE 0 END ) AS COL4,
  SUM(CASE WHEN  B.NR_ROW = D.RIND   AND C.FULL_CODE LIKE '%'||CD.CUATM||';%'   THEN D.COL6 ELSE 0 END ) AS COL5,
  SUM(CASE WHEN  B.NR_ROW = D.RIND   AND C.FULL_CODE LIKE '%'||CD.CUATM||';%'   THEN D.COL7 ELSE 0 END ) AS COL6,
  SUM(CASE WHEN  B.NR_ROW = D.RIND   AND C.FULL_CODE LIKE '%'||CD.CUATM||';%'   THEN D.COL8 ELSE 0 END ) AS COL7
  


  
FROM CIS2.VW_DATA_ALL D
        INNER JOIN CIS2.MD_RIND MR ON (MR.ID_MD = D.ID_MD)
        INNER JOIN CIS2.VW_CL_CUATM C ON (D.CUATM=C.CODUL)
     
        
        CROSS JOIN
(

SELECT '10'  AS NR_ROW, 'în limba bulgara'    AS NUME_ROW,  19 AS ORDINE , '14' AS ORDINE_2 FROM DUAL  UNION
SELECT '-'  AS NR_ROW, 'inclusiv în:'    AS NUME_ROW,    20 AS ORDINE , '-' AS ORDINE_2 FROM DUAL  UNION
SELECT '11'  AS NR_ROW, 'clasele 1-4'    AS NUME_ROW,  21 AS ORDINE , '15' AS ORDINE_2 FROM DUAL UNION
SELECT '12'  AS NR_ROW, 'clasele 5-9'    AS NUME_ROW,  22 AS ORDINE  , '16' AS ORDINE_2 FROM DUAL UNION
SELECT '13'  AS NR_ROW, 'clasele 10-12'    AS NUME_ROW,  23 AS ORDINE  , '17' AS ORDINE_2 FROM DUAL
 
) B
  CROSS JOIN
                                    
  ( 
    SELECT 'Total' AS NUME_ROW,                                   '01' AS NR_ROW, '0000000' AS CUATM FROM DUAL UNION
    SELECT 'Mun. Chisinau' AS NUME_ROW,                           '02' AS NR_ROW, '0100000' AS CUATM FROM DUAL UNION 
    SELECT 'NORD' AS NUME_ROW,                                    '03' AS NR_ROW, '1111111' AS CUATM FROM DUAL UNION 
    SELECT 'Mun. Balti' AS NUME_ROW,                              '04' AS NR_ROW, '0300000' AS CUATM FROM DUAL UNION 
    SELECT 'Briceni' AS NUME_ROW,                                 '05' AS NR_ROW, '1400000' AS CUATM FROM DUAL UNION 
    SELECT 'Donduseni' AS NUME_ROW,                               '06' AS NR_ROW, '3400000' AS CUATM FROM DUAL UNION 
    SELECT 'Drochia' AS NUME_ROW,                                 '07' AS NR_ROW, '3600000' AS CUATM FROM DUAL UNION 
    SELECT 'Edinet' AS NUME_ROW,                                  '08' AS NR_ROW, '4100000' AS CUATM FROM DUAL UNION 
    SELECT 'Falaseti' AS NUME_ROW,                                '09' AS NR_ROW, '4300000' AS CUATM FROM DUAL UNION 
    SELECT 'Floresti' AS NUME_ROW,                                '10' AS NR_ROW, '4500000' AS CUATM FROM DUAL UNION 
    SELECT 'Glodeni' AS NUME_ROW,                                 '11' AS NR_ROW, '4800000' AS CUATM FROM DUAL UNION
    SELECT 'Ocnita' AS NUME_ROW,                                  '12' AS NR_ROW, '6200000' AS CUATM FROM DUAL UNION 
    SELECT 'Riscani' AS NUME_ROW,                                 '13' AS NR_ROW, '7100000' AS CUATM FROM DUAL UNION 
    SELECT 'Singerei' AS NUME_ROW,                                '14' AS NR_ROW, '7400000' AS CUATM FROM DUAL UNION 
    SELECT 'Soroca' AS NUME_ROW,                                  '15' AS NR_ROW, '7800000' AS CUATM FROM DUAL UNION 
    SELECT 'CENTRU' AS NUME_ROW,                                  '16' AS NR_ROW, '2222222' AS CUATM FROM DUAL UNION 
    SELECT 'Anenii Noi' AS NUME_ROW,                              '17' AS NR_ROW, '1000000' AS CUATM FROM DUAL UNION 
    SELECT 'Calarasi' AS NUME_ROW,                                '18' AS NR_ROW, '2500000' AS CUATM FROM DUAL UNION 
    SELECT 'Criuleni' AS NUME_ROW,                                '19' AS NR_ROW, '3100000' AS CUATM FROM DUAL UNION 
    SELECT 'Dubasari' AS NUME_ROW,                                '20' AS NR_ROW, '3800000' AS CUATM FROM DUAL UNION
    SELECT 'Hincesti' AS NUME_ROW,                                '21' AS NR_ROW, '5300000' AS CUATM FROM DUAL UNION
    SELECT 'Ialoveni' AS NUME_ROW,                                '22' AS NR_ROW, '5500000' AS CUATM FROM DUAL UNION 
    SELECT 'Nisporeni' AS NUME_ROW,                               '23' AS NR_ROW, '6000000' AS CUATM FROM DUAL UNION 
    SELECT 'Orhei' AS NUME_ROW,                                   '24' AS NR_ROW, '6400000' AS CUATM FROM DUAL UNION 
    SELECT 'Rezina' AS NUME_ROW,                                  '25' AS NR_ROW, '6700000' AS CUATM FROM DUAL UNION 
    SELECT 'Straseni' AS NUME_ROW,                                '26' AS NR_ROW, '8000000' AS CUATM FROM DUAL UNION 
    SELECT 'Soldanesti' AS NUME_ROW,                              '27' AS NR_ROW, '8300000' AS CUATM FROM DUAL UNION 
    SELECT 'Telenesti' AS NUME_ROW,                               '28' AS NR_ROW, '8900000' AS CUATM FROM DUAL UNION 
    SELECT 'Ungheni' AS NUME_ROW,                                 '29' AS NR_ROW, '9200000' AS CUATM FROM DUAL UNION 
    SELECT 'SUD' AS NUME_ROW,                                     '30' AS NR_ROW, '3333333' AS CUATM FROM DUAL UNION 
    SELECT 'Basarabeasca' AS NUME_ROW,                            '31' AS NR_ROW, '1200000' AS CUATM FROM DUAL UNION
    SELECT 'Cahul' AS NUME_ROW,                                   '32' AS NR_ROW, '1700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cantemir' AS NUME_ROW,                                '33' AS NR_ROW, '2100000' AS CUATM FROM DUAL UNION 
    SELECT 'Causeni' AS NUME_ROW,                                 '34' AS NR_ROW, '2700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cimislia' AS NUME_ROW,                                '35' AS NR_ROW, '2900000' AS CUATM FROM DUAL UNION 
    SELECT 'Leova' AS NUME_ROW,                                   '36' AS NR_ROW, '5700000' AS CUATM FROM DUAL UNION 
    SELECT 'Stefan_Voda' AS NUME_ROW,                             '37' AS NR_ROW, '8500000' AS CUATM FROM DUAL UNION 
    SELECT 'Taraclia' AS NUME_ROW,                                '38' AS NR_ROW, '8700000' AS CUATM FROM DUAL UNION 
    SELECT 'UTA Gagauzia' AS NUME_ROW,                            '39' AS NR_ROW, '9600000' AS CUATM FROM DUAL UNION
    SELECT 'UATdS NISTRULUI' AS NUME_ROW,                         '40' AS NR_ROW, '9800000' AS CUATM FROM DUAL UNION
    SELECT 'MUN.BENDER' AS NUME_ROW,                              '41' AS NR_ROW, '0501000' AS CUATM FROM DUAL
       ) CD
  
WHERE 
  (D.PERIOADA =:pPERIOADA) AND
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE)  AND 
  (D.CUATM_FULL LIKE '%' ||:pCOD_CUATM||';%') AND
   D.FORM = 40 AND  
   D.CAPITOL IN 1024
   AND D.COL1 = 160
   
   GROUP BY
  CD.NR_ROW,
  CD.NUME_ROW,
  B.ORDINE,
  B.ORDINE_2,
  B.NUME_ROW,
  B.NR_ROW
  



UNION 

SELECT
   CD.NR_ROW AS NR_SECTIE,
   CD.NUME_ROW AS NUME_SECTIE,
   B.NR_ROW,
   B.ORDINE,
   B.ORDINE_2,
   B.NUME_ROW, 

  SUM(CASE WHEN  B.NR_ROW = D.RIND   AND C.FULL_CODE LIKE '%'||CD.CUATM||';%'   THEN D.COL2 ELSE 0 END ) AS COL1,
  SUM(CASE WHEN  B.NR_ROW = D.RIND   AND C.FULL_CODE LIKE '%'||CD.CUATM||';%'   THEN D.COL3 ELSE 0 END ) AS COL2,
  SUM(CASE WHEN  B.NR_ROW = D.RIND   AND C.FULL_CODE LIKE '%'||CD.CUATM||';%'   THEN D.COL4 ELSE 0 END ) AS COL3,
  SUM(CASE WHEN  B.NR_ROW = D.RIND   AND C.FULL_CODE LIKE '%'||CD.CUATM||';%'   THEN D.COL5 ELSE 0 END ) AS COL4,
  SUM(CASE WHEN  B.NR_ROW = D.RIND   AND C.FULL_CODE LIKE '%'||CD.CUATM||';%'   THEN D.COL6 ELSE 0 END ) AS COL5,
  SUM(CASE WHEN  B.NR_ROW = D.RIND   AND C.FULL_CODE LIKE '%'||CD.CUATM||';%'   THEN D.COL7 ELSE 0 END ) AS COL6,
  SUM(CASE WHEN  B.NR_ROW = D.RIND   AND C.FULL_CODE LIKE '%'||CD.CUATM||';%'   THEN D.COL8 ELSE 0 END ) AS COL7
  


  
FROM CIS2.VW_DATA_ALL D
        INNER JOIN CIS2.MD_RIND MR ON (MR.ID_MD = D.ID_MD)
        INNER JOIN CIS2.VW_CL_CUATM C ON (D.CUATM=C.CODUL)
      
        
        CROSS JOIN
(

SELECT '10'  AS NR_ROW, 'în limba engleza'    AS NUME_ROW,  24 AS ORDINE , '18' AS ORDINE_2 FROM DUAL  UNION
SELECT '-'  AS NR_ROW, 'inclusiv în:'    AS NUME_ROW,    25 AS ORDINE , '-' AS ORDINE_2 FROM DUAL  UNION
SELECT '11'  AS NR_ROW, 'clasele 1-4'    AS NUME_ROW,  26 AS ORDINE , '19' AS ORDINE_2  FROM DUAL UNION
SELECT '12'  AS NR_ROW, 'clasele 5-9'    AS NUME_ROW,  27 AS ORDINE , '20' AS ORDINE_2 FROM DUAL UNION
SELECT '13'  AS NR_ROW, 'clasele 10-12'    AS NUME_ROW,  28 AS ORDINE , '21' AS ORDINE_2 FROM DUAL
 
) B
  
  CROSS JOIN
                                    
  ( 
    SELECT 'Total' AS NUME_ROW,                                   '01' AS NR_ROW, '0000000' AS CUATM FROM DUAL UNION
    SELECT 'Mun. Chisinau' AS NUME_ROW,                           '02' AS NR_ROW, '0100000' AS CUATM FROM DUAL UNION 
    SELECT 'NORD' AS NUME_ROW,                                    '03' AS NR_ROW, '1111111' AS CUATM FROM DUAL UNION 
    SELECT 'Mun. Balti' AS NUME_ROW,                              '04' AS NR_ROW, '0300000' AS CUATM FROM DUAL UNION 
    SELECT 'Briceni' AS NUME_ROW,                                 '05' AS NR_ROW, '1400000' AS CUATM FROM DUAL UNION 
    SELECT 'Donduseni' AS NUME_ROW,                               '06' AS NR_ROW, '3400000' AS CUATM FROM DUAL UNION 
    SELECT 'Drochia' AS NUME_ROW,                                 '07' AS NR_ROW, '3600000' AS CUATM FROM DUAL UNION 
    SELECT 'Edinet' AS NUME_ROW,                                  '08' AS NR_ROW, '4100000' AS CUATM FROM DUAL UNION 
    SELECT 'Falaseti' AS NUME_ROW,                                '09' AS NR_ROW, '4300000' AS CUATM FROM DUAL UNION 
    SELECT 'Floresti' AS NUME_ROW,                                '10' AS NR_ROW, '4500000' AS CUATM FROM DUAL UNION 
    SELECT 'Glodeni' AS NUME_ROW,                                 '11' AS NR_ROW, '4800000' AS CUATM FROM DUAL UNION
    SELECT 'Ocnita' AS NUME_ROW,                                  '12' AS NR_ROW, '6200000' AS CUATM FROM DUAL UNION 
    SELECT 'Riscani' AS NUME_ROW,                                 '13' AS NR_ROW, '7100000' AS CUATM FROM DUAL UNION 
    SELECT 'Singerei' AS NUME_ROW,                                '14' AS NR_ROW, '7400000' AS CUATM FROM DUAL UNION 
    SELECT 'Soroca' AS NUME_ROW,                                  '15' AS NR_ROW, '7800000' AS CUATM FROM DUAL UNION 
    SELECT 'CENTRU' AS NUME_ROW,                                  '16' AS NR_ROW, '2222222' AS CUATM FROM DUAL UNION 
    SELECT 'Anenii Noi' AS NUME_ROW,                              '17' AS NR_ROW, '1000000' AS CUATM FROM DUAL UNION 
    SELECT 'Calarasi' AS NUME_ROW,                                '18' AS NR_ROW, '2500000' AS CUATM FROM DUAL UNION 
    SELECT 'Criuleni' AS NUME_ROW,                                '19' AS NR_ROW, '3100000' AS CUATM FROM DUAL UNION 
    SELECT 'Dubasari' AS NUME_ROW,                                '20' AS NR_ROW, '3800000' AS CUATM FROM DUAL UNION
    SELECT 'Hincesti' AS NUME_ROW,                                '21' AS NR_ROW, '5300000' AS CUATM FROM DUAL UNION
    SELECT 'Ialoveni' AS NUME_ROW,                                '22' AS NR_ROW, '5500000' AS CUATM FROM DUAL UNION 
    SELECT 'Nisporeni' AS NUME_ROW,                               '23' AS NR_ROW, '6000000' AS CUATM FROM DUAL UNION 
    SELECT 'Orhei' AS NUME_ROW,                                   '24' AS NR_ROW, '6400000' AS CUATM FROM DUAL UNION 
    SELECT 'Rezina' AS NUME_ROW,                                  '25' AS NR_ROW, '6700000' AS CUATM FROM DUAL UNION 
    SELECT 'Straseni' AS NUME_ROW,                                '26' AS NR_ROW, '8000000' AS CUATM FROM DUAL UNION 
    SELECT 'Soldanesti' AS NUME_ROW,                              '27' AS NR_ROW, '8300000' AS CUATM FROM DUAL UNION 
    SELECT 'Telenesti' AS NUME_ROW,                               '28' AS NR_ROW, '8900000' AS CUATM FROM DUAL UNION 
    SELECT 'Ungheni' AS NUME_ROW,                                 '29' AS NR_ROW, '9200000' AS CUATM FROM DUAL UNION 
    SELECT 'SUD' AS NUME_ROW,                                     '30' AS NR_ROW, '3333333' AS CUATM FROM DUAL UNION 
    SELECT 'Basarabeasca' AS NUME_ROW,                            '31' AS NR_ROW, '1200000' AS CUATM FROM DUAL UNION
    SELECT 'Cahul' AS NUME_ROW,                                   '32' AS NR_ROW, '1700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cantemir' AS NUME_ROW,                                '33' AS NR_ROW, '2100000' AS CUATM FROM DUAL UNION 
    SELECT 'Causeni' AS NUME_ROW,                                 '34' AS NR_ROW, '2700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cimislia' AS NUME_ROW,                                '35' AS NR_ROW, '2900000' AS CUATM FROM DUAL UNION 
    SELECT 'Leova' AS NUME_ROW,                                   '36' AS NR_ROW, '5700000' AS CUATM FROM DUAL UNION 
    SELECT 'Stefan_Voda' AS NUME_ROW,                             '37' AS NR_ROW, '8500000' AS CUATM FROM DUAL UNION 
    SELECT 'Taraclia' AS NUME_ROW,                                '38' AS NR_ROW, '8700000' AS CUATM FROM DUAL UNION 
    SELECT 'UTA Gagauzia' AS NUME_ROW,                            '39' AS NR_ROW, '9600000' AS CUATM FROM DUAL UNION
    SELECT 'UATdS NISTRULUI' AS NUME_ROW,                         '40' AS NR_ROW, '9800000' AS CUATM FROM DUAL UNION
    SELECT 'MUN.BENDER' AS NUME_ROW,                              '41' AS NR_ROW, '0501000' AS CUATM FROM DUAL
       ) CD
WHERE 
  (D.PERIOADA =:pPERIOADA) AND
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE)  AND 
  (D.CUATM_FULL LIKE '%' ||:pCOD_CUATM||';%') AND
   D.FORM = 40 AND  
   D.CAPITOL IN 1024
   AND D.COL1 = 152
  
   GROUP BY
  CD.NR_ROW,
  CD.NUME_ROW,
  B.ORDINE,
  B.ORDINE_2,
  B.NUME_ROW,
  B.NR_ROW
  


  
 ORDER BY

  ORDINE
  
  )D
  

  



ORDER BY 
ROWNUM