INSERT INTO TABLE_OUT_TEST
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
    COL10
)


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
'0000000000' AS DECIMAL_POS, 
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
      B.COL10 

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
                             R.CAPITOL IN (1001) AND 
                             ASCII(R.RIND) <> 45   
                            
                            GROUP BY 
                            R.RIND
                              
                            
                             ) RR   ON (    RR.RIND      = R.RIND
                                       AND  RR.RIND_VERS = R.RIND_VERS)
                                       
                                       
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
                           R.DENUMIRE
                           ) R 
                           
                           CROSS JOIN
                                    
  ( 
    SELECT 'Total' AS NUME_ROW,                                   '01' AS NR_ROW, '0000000' AS CUATM FROM DUAL UNION
    SELECT 'Mun. Chișinau' AS NUME_ROW,                           '02' AS NR_ROW, '0100000' AS CUATM FROM DUAL UNION 
    SELECT 'NORD' AS NUME_ROW,                                    '03' AS NR_ROW, '1111111' AS CUATM FROM DUAL UNION 
    SELECT 'Mun. Balți' AS NUME_ROW,                              '04' AS NR_ROW, '0300000' AS CUATM FROM DUAL UNION 
    SELECT 'Briceni' AS NUME_ROW,                                 '05' AS NR_ROW, '1400000' AS CUATM FROM DUAL UNION 
    SELECT 'Dondușeni' AS NUME_ROW,                               '06' AS NR_ROW, '3400000' AS CUATM FROM DUAL UNION 
    SELECT 'Drochia' AS NUME_ROW,                                 '07' AS NR_ROW, '3600000' AS CUATM FROM DUAL UNION 
    SELECT 'Edineț' AS NUME_ROW,                                  '08' AS NR_ROW, '4100000' AS CUATM FROM DUAL UNION 
    SELECT 'Falești' AS NUME_ROW,                                 '09' AS NR_ROW, '4300000' AS CUATM FROM DUAL UNION 
    SELECT 'Florești' AS NUME_ROW,                                '10' AS NR_ROW, '4500000' AS CUATM FROM DUAL UNION 
    SELECT 'Glodeni' AS NUME_ROW,                                 '11' AS NR_ROW, '4800000' AS CUATM FROM DUAL UNION
    SELECT 'Ocnița' AS NUME_ROW,                                  '12' AS NR_ROW, '6200000' AS CUATM FROM DUAL UNION 
    SELECT 'Rișcani' AS NUME_ROW,                                 '13' AS NR_ROW, '7100000' AS CUATM FROM DUAL UNION 
    SELECT 'Sîngerei' AS NUME_ROW,                                '14' AS NR_ROW, '7400000' AS CUATM FROM DUAL UNION 
    SELECT 'Soroca' AS NUME_ROW,                                  '15' AS NR_ROW, '7800000' AS CUATM FROM DUAL UNION 
    SELECT 'CENTRU' AS NUME_ROW,                                  '16' AS NR_ROW, '2222222' AS CUATM FROM DUAL UNION 
    SELECT 'Anenii Noi' AS NUME_ROW,                              '17' AS NR_ROW, '1000000' AS CUATM FROM DUAL UNION 
    SELECT 'Calarași' AS NUME_ROW,                                '18' AS NR_ROW, '2500000' AS CUATM FROM DUAL UNION 
    SELECT 'Criuleni' AS NUME_ROW,                                '19' AS NR_ROW, '3100000' AS CUATM FROM DUAL UNION 
    SELECT 'Dubăsari' AS NUME_ROW,                                '20' AS NR_ROW, '3800000' AS CUATM FROM DUAL UNION
    SELECT 'Hincești' AS NUME_ROW,                                '21' AS NR_ROW, '5300000' AS CUATM FROM DUAL UNION
    SELECT 'Ialoveni' AS NUME_ROW,                                '22' AS NR_ROW, '5500000' AS CUATM FROM DUAL UNION 
    SELECT 'Nisporeni' AS NUME_ROW,                               '23' AS NR_ROW, '6000000' AS CUATM FROM DUAL UNION 
    SELECT 'Orhei' AS NUME_ROW,                                   '24' AS NR_ROW, '6400000' AS CUATM FROM DUAL UNION 
    SELECT 'Rezina' AS NUME_ROW,                                  '25' AS NR_ROW, '6700000' AS CUATM FROM DUAL UNION 
    SELECT 'Strașeni' AS NUME_ROW,                                '26' AS NR_ROW, '8000000' AS CUATM FROM DUAL UNION 
    SELECT 'Șoldanești' AS NUME_ROW,                              '27' AS NR_ROW, '8300000' AS CUATM FROM DUAL UNION 
    SELECT 'Telenești' AS NUME_ROW,                               '28' AS NR_ROW, '8900000' AS CUATM FROM DUAL UNION 
    SELECT 'Ungheni' AS NUME_ROW,                                 '29' AS NR_ROW, '9200000' AS CUATM FROM DUAL UNION 
    SELECT 'SUD' AS NUME_ROW,                                     '30' AS NR_ROW, '3333333' AS CUATM FROM DUAL UNION 
    SELECT 'Basarabeasca' AS NUME_ROW,                            '31' AS NR_ROW, '1200000' AS CUATM FROM DUAL UNION
    SELECT 'Cahul' AS NUME_ROW,                                   '32' AS NR_ROW, '1700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cantemir' AS NUME_ROW,                                '33' AS NR_ROW, '2100000' AS CUATM FROM DUAL UNION 
    SELECT 'Căușeni' AS NUME_ROW,                                 '34' AS NR_ROW, '2700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cimișlia' AS NUME_ROW,                                '35' AS NR_ROW, '2900000' AS CUATM FROM DUAL UNION 
    SELECT 'Leova' AS NUME_ROW,                                   '36' AS NR_ROW, '5700000' AS CUATM FROM DUAL UNION 
    SELECT 'Ștefan Vodă' AS NUME_ROW,                             '37' AS NR_ROW, '8500000' AS CUATM FROM DUAL UNION 
    SELECT 'Taraclia' AS NUME_ROW,                                '38' AS NR_ROW, '8700000' AS CUATM FROM DUAL UNION 
    SELECT 'UAT Găgăuzia' AS NUME_ROW,                            '39' AS NR_ROW, '9600000' AS CUATM FROM DUAL UNION
    SELECT 'UAT dS Nistrului' AS NUME_ROW,                        '40' AS NR_ROW, '9800000' AS CUATM FROM DUAL UNION
    SELECT 'Mun.Bender' AS NUME_ROW,                              '41' AS NR_ROW, '0501000' AS CUATM FROM DUAL
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
  R.RIND_VERS,
  R.DENUMIRE,
   
  CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'  THEN  D.COL1 ELSE NULL END),1))  AS COL1,
  CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'  THEN  D.COL2 ELSE NULL END),1))  AS COL2,
  CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'  THEN  D.COL3 ELSE NULL END),1))  AS COL3,  
  CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'  THEN  D.COL4 ELSE NULL END),1))  AS COL4,
  CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'  THEN  D.COL5 ELSE NULL END),1))  AS COL5,
  CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'  THEN  D.COL6 ELSE NULL END),1))  AS COL6,
  CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'  THEN  D.COL7 ELSE NULL END),1))  AS COL7,
  CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'  THEN  D.COL8 ELSE NULL END),1))  AS COL8,
  CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'  THEN  D.COL9 ELSE NULL END),1))  AS COL9,
  CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'  THEN  D.COL10 ELSE NULL END),1)) AS COL10
    
FROM
  CIS2.VW_DATA_ALL D
  INNER JOIN CIS2.MD_RIND R ON (R.RIND = D.RIND AND R.CAPITOL=D.CAPITOL AND R.CAPITOL_VERS=D.CAPITOL_VERS AND R.RIND_VERS=D.RIND_VERS)
  ---------------------------------------------------------------------------------------------------------------
  
  INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)
  
  INNER JOIN CIS2.VW_CL_CUATM VC ON (VC.CODUL = RN.CUATM )          
  
  CROSS JOIN
                                    
  ( 
    SELECT 'Total' AS NUME_ROW,                                   '01' AS NR_ROW, '0000000' AS CUATM FROM DUAL UNION
    SELECT 'Mun. Chișinau' AS NUME_ROW,                           '02' AS NR_ROW, '0100000' AS CUATM FROM DUAL UNION 
    SELECT 'NORD' AS NUME_ROW,                                    '03' AS NR_ROW, '1111111' AS CUATM FROM DUAL UNION 
    SELECT 'Mun. Balți' AS NUME_ROW,                              '04' AS NR_ROW, '0300000' AS CUATM FROM DUAL UNION 
    SELECT 'Briceni' AS NUME_ROW,                                 '05' AS NR_ROW, '1400000' AS CUATM FROM DUAL UNION 
    SELECT 'Dondușeni' AS NUME_ROW,                               '06' AS NR_ROW, '3400000' AS CUATM FROM DUAL UNION 
    SELECT 'Drochia' AS NUME_ROW,                                 '07' AS NR_ROW, '3600000' AS CUATM FROM DUAL UNION 
    SELECT 'Edineț' AS NUME_ROW,                                  '08' AS NR_ROW, '4100000' AS CUATM FROM DUAL UNION 
    SELECT 'Falești' AS NUME_ROW,                                 '09' AS NR_ROW, '4300000' AS CUATM FROM DUAL UNION 
    SELECT 'Florești' AS NUME_ROW,                                '10' AS NR_ROW, '4500000' AS CUATM FROM DUAL UNION 
    SELECT 'Glodeni' AS NUME_ROW,                                 '11' AS NR_ROW, '4800000' AS CUATM FROM DUAL UNION
    SELECT 'Ocnița' AS NUME_ROW,                                  '12' AS NR_ROW, '6200000' AS CUATM FROM DUAL UNION 
    SELECT 'Rișcani' AS NUME_ROW,                                 '13' AS NR_ROW, '7100000' AS CUATM FROM DUAL UNION 
    SELECT 'Sîngerei' AS NUME_ROW,                                '14' AS NR_ROW, '7400000' AS CUATM FROM DUAL UNION 
    SELECT 'Soroca' AS NUME_ROW,                                  '15' AS NR_ROW, '7800000' AS CUATM FROM DUAL UNION 
    SELECT 'CENTRU' AS NUME_ROW,                                  '16' AS NR_ROW, '2222222' AS CUATM FROM DUAL UNION 
    SELECT 'Anenii Noi' AS NUME_ROW,                              '17' AS NR_ROW, '1000000' AS CUATM FROM DUAL UNION 
    SELECT 'Calarași' AS NUME_ROW,                                '18' AS NR_ROW, '2500000' AS CUATM FROM DUAL UNION 
    SELECT 'Criuleni' AS NUME_ROW,                                '19' AS NR_ROW, '3100000' AS CUATM FROM DUAL UNION 
    SELECT 'Dubăsari' AS NUME_ROW,                                '20' AS NR_ROW, '3800000' AS CUATM FROM DUAL UNION
    SELECT 'Hincești' AS NUME_ROW,                                '21' AS NR_ROW, '5300000' AS CUATM FROM DUAL UNION
    SELECT 'Ialoveni' AS NUME_ROW,                                '22' AS NR_ROW, '5500000' AS CUATM FROM DUAL UNION 
    SELECT 'Nisporeni' AS NUME_ROW,                               '23' AS NR_ROW, '6000000' AS CUATM FROM DUAL UNION 
    SELECT 'Orhei' AS NUME_ROW,                                   '24' AS NR_ROW, '6400000' AS CUATM FROM DUAL UNION 
    SELECT 'Rezina' AS NUME_ROW,                                  '25' AS NR_ROW, '6700000' AS CUATM FROM DUAL UNION 
    SELECT 'Strașeni' AS NUME_ROW,                                '26' AS NR_ROW, '8000000' AS CUATM FROM DUAL UNION 
    SELECT 'Șoldanești' AS NUME_ROW,                              '27' AS NR_ROW, '8300000' AS CUATM FROM DUAL UNION 
    SELECT 'Telenești' AS NUME_ROW,                               '28' AS NR_ROW, '8900000' AS CUATM FROM DUAL UNION 
    SELECT 'Ungheni' AS NUME_ROW,                                 '29' AS NR_ROW, '9200000' AS CUATM FROM DUAL UNION 
    SELECT 'SUD' AS NUME_ROW,                                     '30' AS NR_ROW, '3333333' AS CUATM FROM DUAL UNION 
    SELECT 'Basarabeasca' AS NUME_ROW,                            '31' AS NR_ROW, '1200000' AS CUATM FROM DUAL UNION
    SELECT 'Cahul' AS NUME_ROW,                                   '32' AS NR_ROW, '1700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cantemir' AS NUME_ROW,                                '33' AS NR_ROW, '2100000' AS CUATM FROM DUAL UNION 
    SELECT 'Căușeni' AS NUME_ROW,                                 '34' AS NR_ROW, '2700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cimișlia' AS NUME_ROW,                                '35' AS NR_ROW, '2900000' AS CUATM FROM DUAL UNION 
    SELECT 'Leova' AS NUME_ROW,                                   '36' AS NR_ROW, '5700000' AS CUATM FROM DUAL UNION 
    SELECT 'Ștefan Vodă' AS NUME_ROW,                             '37' AS NR_ROW, '8500000' AS CUATM FROM DUAL UNION 
    SELECT 'Taraclia' AS NUME_ROW,                                '38' AS NR_ROW, '8700000' AS CUATM FROM DUAL UNION 
    SELECT 'UAT Găgăuzia' AS NUME_ROW,                            '39' AS NR_ROW, '9600000' AS CUATM FROM DUAL UNION
    SELECT 'UAT dS Nistrului' AS NUME_ROW,                        '40' AS NR_ROW, '9800000' AS CUATM FROM DUAL UNION
    SELECT 'Mun.Bender' AS NUME_ROW,                              '41' AS NR_ROW, '0501000' AS CUATM FROM DUAL
      ) CD
      
--------------------------------------------------------------------------------------------------------------------------------------      
      
  
    WHERE
    (D.PERIOADA =:pPERIOADA) AND    
    (R.FORM =:pFORM) AND 
    (R.FORM_VERS =:pFORM_VERS) AND
    (:pID_MDTABLE=:pID_MDTABLE) AND 
    (D.CUATM_FULL LIKE '%' ||:pCOD_CUATM||';%') AND
    R.FORM = 17  AND 
    R.CAPITOL IN (1001) AND 
    ASCII(R.RIND) <> 45 

   
  
  GROUP BY 
  R.RIND,
  R.RIND_VERS,
  R.DENUMIRE,
  CD.NR_ROW,   
  CD.NUME_ROW
   
   ) B ON  (A.NR_SECTIE = B.NR_SECTIE 
            AND A.RIND  = B.RIND
            AND A.RIND_VERS   = B.RIND_VERS
            )
            
            
        ORDER BY 
            A.RIND,
            A.NR_SECTIE   