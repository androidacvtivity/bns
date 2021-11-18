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
  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8, COL9, COL10, COL11, COL12
)

SELECT
  :pPERIOADA,
  :pFORM,
  :pFORM_VERS,
  :pID_MDTABLE,
  :pCOD_CUATM,
  CD.NR_ROW AS NR_SECTIE,
  CD.NUME_ROW AS NUME_SECTIE,

  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,
  CR.RIND AS NR_ROW, 
  CR.ORDINE AS ORDINE,
  '000000000000' AS DECIMAL_POS,
  REPLACE(REPLACE(REPLACE(CR.DENUMIRE,'<b>',''),'</b>',''),'<br>','') NUME_ROW,
  
   ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%' AND CR.RIND = MR.RIND  THEN  D.COL1 END),1) AS COL1, 
   ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%' AND CR.RIND = MR.RIND THEN  D.COL2 END),1) AS COL2,
   ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%' AND CR.RIND = MR.RIND THEN  D.COL3 END),1) AS COL3,
   ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%' AND CR.RIND = MR.RIND THEN  D.COL4 END),1) AS COL4,
   ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%' AND CR.RIND = MR.RIND THEN  D.COL5 END),1) AS COL5,
   ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%' AND CR.RIND = MR.RIND THEN  D.COL6 END),1) AS COL6,
   ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%' AND CR.RIND = MR.RIND THEN  D.COL7 END),1) AS COL7,
   ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%' AND CR.RIND = MR.RIND  THEN  D.COL8 END),1) AS COL8,
   ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%' AND CR.RIND = MR.RIND THEN  D.COL9 END),1) AS COL9,
   ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%' AND CR.RIND = MR.RIND THEN  D.COL10 END),1) AS COL10,
   ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%' AND CR.RIND = MR.RIND THEN  D.COL11 END),1) AS COL11,
   ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%' AND CR.RIND = MR.RIND THEN  D.COL12 END),1) AS COL12
  


  
        FROM CIS2.VW_DATA_ALL D
        
        
                    INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD =  D.ID_MD
                    
                    INNER JOIN VW_CL_CUATM VC ON (VC.CODUL = D.CUATM)            
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
       
        
        CROSS JOIN (
                    
SELECT 
    R.RIND,
    REPLACE(REPLACE(REPLACE(R.DENUMIRE,'<b>',''),'</b>',''),'<br>','') DENUMIRE,
    R.ORDINE

    FROM CIS2.MD_RIND R 
    
    WHERE 
    R.CAPITOL IN (1171) 
                    ) CR 
       
        WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
  D.FORM IN (69)                 AND 
  D.CAPITOL IN (1171)  
 
        
                
  GROUP BY
  CD.NR_ROW,   
  CD.NUME_ROW,
  CR.RIND,
  CR.ORDINE,
  CR.DENUMIRE