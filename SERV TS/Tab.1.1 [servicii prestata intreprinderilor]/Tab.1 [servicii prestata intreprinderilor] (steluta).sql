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
--  
--  COL1, COL2, COL3, COL4
--)
SELECT DISTINCT                                                                     
--  :pPERIOADA AS PERIOADA,                                                    
--  :pFORM AS FORM,                                                            
--  :pFORM_VERS AS FORM_VERS,                                                  
--  :pID_MDTABLE AS ID_MDTABLE,                                                
--  :pCOD_CUATM AS COD_CUATM,                                                  
--  '0' AS NR_SECTIE,                                                         
--  '0' AS NUME_SECTIE,                                                        
--  '0' AS NR_SECTIE1,
--  '0' AS NUME_SECTIE1,
--  '0' AS NR_SECTIE2,
--  '0' AS NUME_SECTIE2,
   ORDINE AS NR_ROW,  
   ORDINE,
  '0000' AS DECIMAL_POS,
   NUME_ROW,
   ROUND(COL1,1) AS COL1, ROUND(COL2,1) AS COL2, ROUND(COL3,1) AS COL3, ROUND(COL4,1) AS COL4
FROM (
--Start Total
SELECT
  'Cifra de afeceri (venitul din vinzari) - total:' AS NUME_ROW,
  0 AS ORDINE,
  ROUND(SUM(COL1),1) AS COL1,
  ROUND(SUM(COL2),1) AS COL2,
  ROUND(SUM(COL3),1) AS COL3,
  ROUND(SUM(COL4),1) AS COL4
FROM (

SELECT
  B.NUME_ROW,
  B.ORDINE,
  SUM(CASE WHEN D.CAEM2 LIKE B.NR_ROW||'%' AND D.PERIOADA BETWEEN FLOOR(:pPERIOADA/12)*12 AND :pPERIOADA THEN COL1 END) AS COL1,
  SUM(CASE WHEN D.CAEM2 LIKE B.NR_ROW||'%' AND D.PERIOADA BETWEEN FLOOR((:pPERIOADA-12)/12)*12 AND :pPERIOADA-12 THEN COL1 END) AS COL2,
  SUM(CASE WHEN D.CAEM2 LIKE B.NR_ROW||'%' AND D.PERIOADA IN :pPERIOADA THEN D.COL1 ELSE 0 END) AS COL3,
  SUM(CASE WHEN D.CAEM2 LIKE B.NR_ROW||'%' AND D.PERIOADA IN :pPERIOADA-1 THEN D.COL1 ELSE 0 END) AS COL4
  
FROM 
  CIS.VW_DATA_ALL_COEF D
  CROSS JOIN
    (
      SELECT 'H49' AS NR_ROW, 'Transporturi terestre si transporturi prin conducte (49)' AS NUME_ROW, 1 AS ORDINE, '01' AS RIND  FROM DUAL UNION
      SELECT 'H50' AS NR_ROW, 'Transporturi pe apa (50)' AS NUME_ROW, 2 AS ORDINE, '02' AS RIND FROM DUAL UNION 
      SELECT 'H51' AS NR_ROW, 'Transporturi aeriene (51)' AS NUME_ROW, 3 AS ORDINE, '03' AS RIND FROM DUAL UNION
      SELECT 'H52' AS NR_ROW, 'Depozitare si activitati auxiliare pentru transporturi (52)' AS NUME_ROW, 4 AS ORDINE, '04' AS RIND FROM DUAL UNION
      SELECT 'H53' AS NR_ROW, 'Activitati de posta si de curier (53)' AS NUME_ROW, 5 AS ORDINE, '05' AS RIND FROM DUAL UNION
      SELECT 'J58' AS NR_ROW, 'Activitati de editare (58)' AS NUME_ROW, 6 AS ORDINE, '06' AS RIND FROM DUAL UNION
      SELECT 'J61' AS NR_ROW, 'Comunicatii electronice (61)' AS NUME_ROW, 7 AS ORDINE, '07' AS RIND FROM DUAL UNION
      SELECT 'J62' AS NR_ROW, 'Activitati de servicii în tehnologia informatiei (62)' AS NUME_ROW, 8 AS ORDINE, '08' AS RIND FROM DUAL UNION
      SELECT 'J63' AS NR_ROW, 'Activitati de servicii informatice (63)' AS NUME_ROW, 9 AS ORDINE, '09' AS RIND FROM DUAL UNION
      SELECT 'L68' AS NR_ROW, 'Tranzactii imobiliare (68)' AS NUME_ROW, 10 AS ORDINE, '10' AS RIND FROM DUAL UNION
      SELECT 'M69' AS NR_ROW, 'Activitati juridice si de contabilitate (69)' AS NUME_ROW, 11 AS ORDINE, '11' AS RIND FROM DUAL UNION
      SELECT 'M70' AS NR_ROW, 'Activitati ale directiilor administrative centralizate; activitati de management si de consultanta în management (70)' AS NUME_ROW, 12 AS ORDINE, '12' AS RIND FROM DUAL UNION
      SELECT 'M71' AS NR_ROW, 'Activitati de arhitectura si inginerie; activitati de testari si analiza tehnica (71)' AS NUME_ROW, 13 AS ORDINE, '13' AS RIND FROM DUAL UNION
      SELECT 'M72' AS NR_ROW, 'Cercetare-dezvoltare (72)' AS NUME_ROW, 14 AS ORDINE, '14' AS RIND FROM DUAL UNION
      SELECT 'M73' AS NR_ROW, 'Publicitate si activitati de studiere a pietei (73)' AS NUME_ROW, 15 AS ORDINE, '15' AS RIND FROM DUAL UNION
      SELECT 'M74' AS NR_ROW, 'Alte activitati profesionale, stiintifice si tehnice (74 (fara 74.2))' AS NUME_ROW, 16 AS ORDINE, '16' AS RIND FROM DUAL UNION
      SELECT 'N77' AS NR_ROW, 'Activitati de închiriere si leasing (77(fara 77.2))' AS NUME_ROW, 17 AS ORDINE, '17' AS RIND FROM DUAL UNION
      SELECT 'N78' AS NR_ROW, 'Activitati de servicii privind forta de munca (78)' AS NUME_ROW, 18 AS ORDINE, '18' AS RIND FROM DUAL UNION
      SELECT 'N80' AS NR_ROW, 'Activitati de investigatii si protectie (80)' AS NUME_ROW, 19 AS ORDINE, '19' AS RIND FROM DUAL UNION
      --SELECT 'N81+N812' AS NR_ROW, 'Activitati de întretinere si curatare a cladirilor, Alte activitati de curatenie (81.1 si 81.2)' AS NUME_ROW, 20 AS ORDINE FROM DUAL UNION
      SELECT 'N82' AS NR_ROW, 'Servicii administrative, servicii suport si alte activitati de servicii prestate în principal întreprinderilor (82)' AS NUME_ROW, 21 AS ORDINE , '21' AS RIND FROM DUAL
      
    ) B
  
WHERE
 (D.FORM=:pFORM) AND
 (D.FORM_VERS=:pFORM_VERS) AND
 (:pID_MDTABLE=:pID_MDTABLE) AND
 (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  FORM = 4 AND
  CAPITOL = 4 AND
  D.RIND = '10' AND
  (D.PERIOADA BETWEEN FLOOR((:pPERIOADA-12)/12)*12 AND :pPERIOADA-12 OR 
     D.PERIOADA BETWEEN FLOOR(:pPERIOADA/12)*12 AND :pPERIOADA OR
     D.PERIOADA IN :pPERIOADA OR
     D.PERIOADA IN :pPERIOADA-1 ) AND
     D.CAEM2 NOT LIKE 'N772%' AND
  D.CAEM2 NOT LIKE 'M742%'
     
GROUP BY
  B.NUME_ROW,
  B.ORDINE
     
 UNION


SELECT
  'Activitati de întretinere si curatare a cladirilor, Alte activitati de curatenie (81)' NUME_ROW,
  20 AS ORDINE,
  SUM(CASE WHEN D.PERIOADA BETWEEN FLOOR(:pPERIOADA/12)*12 AND :pPERIOADA THEN COL1 END) AS COL1,
  SUM(CASE WHEN D.PERIOADA BETWEEN FLOOR((:pPERIOADA-12)/12)*12 AND :pPERIOADA-12 THEN COL1 END) AS COL2,
  SUM(CASE WHEN D.PERIOADA IN :pPERIOADA THEN D.COL1 ELSE 0 END) AS COL3,
  SUM(CASE WHEN D.PERIOADA IN :pPERIOADA-1 THEN D.COL1 ELSE 0 END) AS COL4
  
FROM 
  CIS.VW_DATA_ALL_COEF D


WHERE
 (D.FORM=:pFORM) AND
 (D.FORM_VERS=:pFORM_VERS) AND
 (:pID_MDTABLE=:pID_MDTABLE) AND
 (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  FORM = 4 AND
  CAPITOL = 4 AND
  RIND = '10' AND
  (CAEM2 LIKE 'N811%' OR
  CAEM2 LIKE 'N812%' OR
  CAEM2 LIKE 'N813%') AND
  
   (D.PERIOADA BETWEEN FLOOR((:pPERIOADA-12)/12)*12 AND :pPERIOADA-12 OR 
     D.PERIOADA BETWEEN FLOOR(:pPERIOADA/12)*12 AND :pPERIOADA OR
     D.PERIOADA IN :pPERIOADA OR
     D.PERIOADA IN :pPERIOADA-1 ))
     
     
     --End Total 
     
UNION

SELECT
  B.NUME_ROW,
  B.ORDINE,
  SUM(CASE WHEN D.CAEM2 LIKE B.NR_ROW||'%' AND D.PERIOADA BETWEEN FLOOR(:pPERIOADA/12)*12 AND :pPERIOADA THEN COL1 END) AS COL1,
  SUM(CASE WHEN D.CAEM2 LIKE B.NR_ROW||'%' AND D.PERIOADA BETWEEN FLOOR((:pPERIOADA-12)/12)*12 AND :pPERIOADA-12 THEN COL1 END) AS COL2,
  SUM(CASE WHEN D.CAEM2 LIKE B.NR_ROW||'%' AND D.PERIOADA IN :pPERIOADA THEN D.COL1 ELSE 0 END) AS COL3,
  SUM(CASE WHEN D.CAEM2 LIKE B.NR_ROW||'%' AND D.PERIOADA IN :pPERIOADA-1 THEN D.COL1 ELSE 0 END) AS COL4
  
FROM 
  CIS.VW_DATA_ALL_COEF D
  CROSS JOIN
    (
      SELECT 'H49' AS NR_ROW, 'Transporturi terestre si transporturi prin conducte (49)' AS NUME_ROW, 1 AS ORDINE, '01' AS RIND  FROM DUAL UNION
      SELECT 'H50' AS NR_ROW, 'Transporturi pe apa (50)' AS NUME_ROW, 2 AS ORDINE, '02' AS RIND FROM DUAL UNION 
      SELECT 'H51' AS NR_ROW, 'Transporturi aeriene (51)' AS NUME_ROW, 3 AS ORDINE, '03' AS RIND FROM DUAL UNION
      SELECT 'H52' AS NR_ROW, 'Depozitare si activitati auxiliare pentru transporturi (52)' AS NUME_ROW, 4 AS ORDINE, '04' AS RIND FROM DUAL UNION
      SELECT 'H53' AS NR_ROW, 'Activitati de posta si de curier (53)' AS NUME_ROW, 5 AS ORDINE, '05' AS RIND FROM DUAL UNION
      SELECT 'J58' AS NR_ROW, 'Activitati de editare (58)' AS NUME_ROW, 6 AS ORDINE, '06' AS RIND FROM DUAL UNION
      SELECT 'J61' AS NR_ROW, 'Comunicatii electronice (61)' AS NUME_ROW, 7 AS ORDINE, '07' AS RIND FROM DUAL UNION
      SELECT 'J62' AS NR_ROW, 'Activitati de servicii în tehnologia informatiei (62)' AS NUME_ROW, 8 AS ORDINE, '08' AS RIND FROM DUAL UNION
      SELECT 'J63' AS NR_ROW, 'Activitati de servicii informatice (63)' AS NUME_ROW, 9 AS ORDINE, '09' AS RIND FROM DUAL UNION
      SELECT 'L68' AS NR_ROW, 'Tranzactii imobiliare (68)' AS NUME_ROW, 10 AS ORDINE, '10' AS RIND FROM DUAL UNION
      SELECT 'M69' AS NR_ROW, 'Activitati juridice si de contabilitate (69)' AS NUME_ROW, 11 AS ORDINE, '11' AS RIND FROM DUAL UNION
      SELECT 'M70' AS NR_ROW, 'Activitati ale directiilor administrative centralizate; activitati de management si de consultanta în management (70)' AS NUME_ROW, 12 AS ORDINE, '12' AS RIND FROM DUAL UNION
      SELECT 'M71' AS NR_ROW, 'Activitati de arhitectura si inginerie; activitati de testari si analiza tehnica (71)' AS NUME_ROW, 13 AS ORDINE, '13' AS RIND FROM DUAL UNION
      SELECT 'M72' AS NR_ROW, 'Cercetare-dezvoltare (72)' AS NUME_ROW, 14 AS ORDINE, '14' AS RIND FROM DUAL UNION
      SELECT 'M73' AS NR_ROW, 'Publicitate si activitati de studiere a pietei (73)' AS NUME_ROW, 15 AS ORDINE, '15' AS RIND FROM DUAL UNION
      SELECT 'M74' AS NR_ROW, 'Alte activitati profesionale, stiintifice si tehnice (74 (fara 74.2))' AS NUME_ROW, 16 AS ORDINE, '16' AS RIND FROM DUAL UNION
      SELECT 'N77' AS NR_ROW, 'Activitati de închiriere si leasing (77(fara 77.2))' AS NUME_ROW, 17 AS ORDINE, '17' AS RIND FROM DUAL UNION
      SELECT 'N78' AS NR_ROW, 'Activitati de servicii privind forta de munca (78)' AS NUME_ROW, 18 AS ORDINE, '18' AS RIND FROM DUAL UNION
      SELECT 'N80' AS NR_ROW, 'Activitati de investigatii si protectie (80)' AS NUME_ROW, 19 AS ORDINE, '19' AS RIND FROM DUAL UNION
      --SELECT 'N81+N812' AS NR_ROW, 'Activitati de întretinere si curatare a cladirilor, Alte activitati de curatenie (81.1 si 81.2)' AS NUME_ROW, 20 AS ORDINE FROM DUAL UNION
      SELECT 'N82' AS NR_ROW, 'Servicii administrative, servicii suport si alte activitati de servicii prestate în principal întreprinderilor (82)' AS NUME_ROW, 21 AS ORDINE , '21' AS RIND FROM DUAL
      
    ) B
  
WHERE
 (D.FORM=:pFORM) AND
 (D.FORM_VERS=:pFORM_VERS) AND
 (:pID_MDTABLE=:pID_MDTABLE) AND
 (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  FORM = 4 AND
  CAPITOL = 4 AND
  D.RIND = '10' AND
  (D.PERIOADA BETWEEN FLOOR((:pPERIOADA-12)/12)*12 AND :pPERIOADA-12 OR 
     D.PERIOADA BETWEEN FLOOR(:pPERIOADA/12)*12 AND :pPERIOADA OR
     D.PERIOADA IN :pPERIOADA OR
     D.PERIOADA IN :pPERIOADA-1 ) AND
     D.CAEM2 NOT LIKE 'N772%' AND
     D.CAEM2 NOT LIKE 'M742%'
     
GROUP BY
  B.NUME_ROW,
  B.ORDINE
     
 UNION


SELECT
  'Activitati de întretinere si curatare a cladirilor, Alte activitati de curatenie (81)' NUME_ROW,
  20 AS ORDINE,
  SUM(CASE WHEN D.PERIOADA BETWEEN FLOOR(:pPERIOADA/12)*12 AND :pPERIOADA THEN COL1 END) AS COL1,
  SUM(CASE WHEN D.PERIOADA BETWEEN FLOOR((:pPERIOADA-12)/12)*12 AND :pPERIOADA-12 THEN COL1 END) AS COL2,
  SUM(CASE WHEN D.PERIOADA IN :pPERIOADA THEN D.COL1 ELSE 0 END) AS COL3,
  SUM(CASE WHEN D.PERIOADA IN :pPERIOADA-1 THEN D.COL1 ELSE 0 END) AS COL4
  
FROM 
  CIS.VW_DATA_ALL_COEF D


WHERE
 (D.FORM=:pFORM) AND
 (D.FORM_VERS=:pFORM_VERS) AND
 (:pID_MDTABLE=:pID_MDTABLE) AND
 (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  FORM = 4 AND
  CAPITOL = 4 AND
  RIND = '10' AND
  (CAEM2 LIKE 'N811%' OR
  CAEM2 LIKE 'N812%' OR
  CAEM2 LIKE 'N813%') AND
  
   (D.PERIOADA BETWEEN FLOOR((:pPERIOADA-12)/12)*12 AND :pPERIOADA-12 OR 
     D.PERIOADA BETWEEN FLOOR(:pPERIOADA/12)*12 AND :pPERIOADA OR
     D.PERIOADA IN :pPERIOADA OR
     D.PERIOADA IN :pPERIOADA-1 )     
     
     )
     
     ORDER BY 
     ORDINE