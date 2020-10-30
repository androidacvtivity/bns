INSERT INTO TABLE_OUT 
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
  
  COL1, COL2, COL3, COL4, COL5
)
SELECT DISTINCT                                                                     
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
   RIND AS NR_ROW,  
   ORDINE,
  '00000' AS DECIMAL_POS,
   NUME AS NUME_ROW,
   ROUND(COL1,1) AS COL1, 
   ROUND(COL2,1) AS COL2, 
   ROUND(COL3,1) AS COL3, 
   ROUND(COL4,1) AS COL4,
   ROUND(COL5,1) AS COL5
FROM
(
SELECT
  C.NUME,
  C.CAEM,
  C.RIND,
  C.ORDINE,
  D.COL1,
  D.COL2,
  D.COL3,
  D.COL4,
  D.COL5
FROM(  
SELECT
  C.DENUMIRE,
  C.CODUL,
  SUM(CASE WHEN D.PERIOADA BETWEEN FLOOR(:pPERIOADA/12)*12 AND :pPERIOADA THEN COL1 ELSE 0 END) AS COL1,
 
 CIS.NVAL(SUM(CASE WHEN D.PERIOADA BETWEEN FLOOR(:pPERIOADA/12)*12 AND :pPERIOADA THEN COL1 END)/
  SUM(CASE WHEN D.PERIOADA BETWEEN FLOOR((:pPERIOADA-12)/12)*12 AND :pPERIOADA-12 THEN COL1 END))*100 AS COL2,
  
  SUM(CASE WHEN D.PERIOADA IN :pPERIOADA THEN COL1 ELSE 0 END) AS COL3,
 
 CIS.NVAL(SUM(CASE WHEN D.PERIOADA IN :pPERIOADA THEN COL1 END)/
  SUM(CASE WHEN D.PERIOADA IN :pPERIOADA-1 THEN COL1 END))*100 AS COL4,
  
  CIS.NVAL(SUM(CASE WHEN D.PERIOADA IN :pPERIOADA THEN COL1 END)/
  SUM(CASE WHEN D.PERIOADA IN :pPERIOADA-12 THEN COL1 END))*100  AS COL5
  
FROM 
  CIS.VW_DATA_ALL_COEF D
  INNER JOIN CIS.VW_CL_CAEM2 B ON (D.CAEM2=B.CODUL)
  INNER JOIN CIS.VW_CL_CAEM2 C ON (B.FULL_CODE LIKE '%'||C.CODUL||';%')
  
WHERE
 (D.FORM=:pFORM) AND
 (D.FORM_VERS=:pFORM_VERS) AND
 (:pID_MDTABLE=:pID_MDTABLE) AND
 (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND   
  (D.PERIOADA BETWEEN FLOOR((:pPERIOADA-12)/12)*12 AND :pPERIOADA-12 OR 
     D.PERIOADA BETWEEN FLOOR(:pPERIOADA/12)*12 AND :pPERIOADA OR
     D.PERIOADA IN :pPERIOADA OR
     D.PERIOADA IN :pPERIOADA-1 ) AND
  D.FORM IN (4) AND 
  D.CAPITOL IN (4) AND 
  C.CODUL LIKE 'G46%' 
GROUP BY
  C.DENUMIRE,
  C.CODUL
  
) D
RIGHT JOIN 

(
SELECT 'COMERT CU RIDICATA CU exceptia COMERTULUI cu AUTOVEHICULE SI MOTOCICLETE - TOTAL(46 = (46.1 + 46.2 + 46.3 + 46.4 + 46.5 + 46.6 + 46.7 + 46.9))' AS NUME,               'G4600' AS CAEM, 1 AS ORDINE, '01' AS RIND FROM DUAL UNION
--SELECT 'din care' AS NUME 
SELECT 'Activitati de internediere in comertul cu ridicata(46.1 = (46.11 + 46.12 + 46.13 + 46.14 + 46.15 + 46.16 + 46.17 + 46.18 + 46.19))' AS NUME,                           'G4610' AS CAEM, 3 AS ORDINE, '02' AS RIND FROM DUAL UNION
SELECT 'Intermedieri in comertul cu materii prime agricole, animale vii, materii prime textile si cu semifabricate(46.11)' AS NUME,                                            'G4611' AS CAEM, 4 AS ORDINE, '03' AS RIND FROM DUAL UNION
SELECT 'Intermedieri in comertul cu combustibili, minereuri, metale si produse chimice pentru industrie(46.12)' AS NUME,                                                       'G4612' AS CAEM, 5 AS ORDINE, '04' AS RIND FROM DUAL UNION
SELECT 'Intermedieri in comertul cu material lemnos si materiale de constructii(46.13)' AS NUME,                                                                               'G4613' AS CAEM, 6 AS ORDINE, '05' AS RIND FROM DUAL UNION
SELECT 'Intermedieri in comertul cu masini, echipamente industriale, nave si avioane(46.14)' AS NUME,                                                                          'G4614' AS CAEM, 7 AS ORDINE, '06' AS RIND FROM DUAL UNION
SELECT 'Intermedieri in comertul cu mobila, articole de menaj si de fierarie(46.15)' AS NUME,                                                                                  'G4615' AS CAEM, 8 AS ORDINE, '07' AS RIND FROM DUAL UNION
SELECT 'Intermedieri in comertul cu textile, confectii din blana, incaltaminte si articole din piele(46.16)' AS NUME,                                                          'G4616' AS CAEM, 9 AS ORDINE, '08' AS RIND FROM DUAL UNION
SELECT 'Intermedieri in comertul cu produse alimentare, inclusiv bauturi, si tutun(46.17)' AS NUME,                                                                            'G4617' AS CAEM, 10 AS ORDINE, '09' AS RIND FROM DUAL UNION
SELECT 'Intermedieri in comertul specializat in vanzarea produselor cu caracter specific, n.c.a.(46.18)' AS NUME,                                                              'G4618' AS CAEM, 11 AS ORDINE, '10' AS RIND FROM DUAL UNION
SELECT 'Intermedieri in comertul cu produse diverse(46.19)' AS NUME,                                                                                                           'G4619' AS CAEM, 12 AS ORDINE, '11' AS RIND FROM DUAL UNION
SELECT 'Comertul cu ridicata al produselor agricole brute si al animalelor vii(46.2 = (46.21 + 46.22 + 46.23 + 46.24))' AS NUME,                                               'G4620' AS CAEM, 13 AS ORDINE, '12' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al cerealelor, semintelor, furajelor si tutunului neprelucrat(46.21)' AS NUME,                                                                      'G4621' AS CAEM, 14 AS ORDINE, '13' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al florilor si al plantelor(46.22)' AS NUME,                                                                                                        'G4622' AS CAEM, 15 AS ORDINE, '14' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al animalelor vii(46.23)' AS NUME,                                                                                                                  'G4623' AS CAEM, 16 AS ORDINE, '15' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al blanurilor, pieilor brute si al pieilor prelucrate(46.24)' AS NUME,                                                                              'G4624' AS CAEM, 17 AS ORDINE, '16' AS RIND FROM DUAL UNION
SELECT 'Comertul cu ridicata al produselor alimentare, al bauturilor si al tutunului(46.3 = (46.31 + 46.32 + 46.33 + 46.34 + 46.35 + 46.36 + 46.37 + 46.38 + 46.39))' AS NUME, 'G4630' AS CAEM, 18 AS ORDINE, '17' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al fructelor si legumelor(46.31)' AS NUME,                                                                                                          'G4631' AS CAEM, 19 AS ORDINE, '18' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al carnii si produselor din carne(46.32)' AS NUME,                                                                                                  'G4632' AS CAEM, 20 AS ORDINE, '19' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al produselor lactate, oualor, uleiurilor si grasimilor comestibile(46.33)' AS NUME,                                                                'G4633' AS CAEM, 21 AS ORDINE, '20' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al bauturilor(46.34)' AS NUME,                                                                                                                      'G4634' AS CAEM, 22 AS ORDINE, '21' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al produselor din tutun(46.35)' AS NUME,                                                                                                            'G4635' AS CAEM, 23 AS ORDINE, '22' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al zaharului, ciocolatei si produselor zaharoase(46.36)' AS NUME,                                                                                   'G4636' AS CAEM, 24 AS ORDINE, '23' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata cu cafea, ceai, cacao si condimente(46.37)' AS NUME,                                                                                                'G4637' AS CAEM, 25 AS ORDINE, '24' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata specializat al altor alimente, inclusiv peste, crustacee si moluste(46.38)' AS NUME,                                                                'G4638' AS CAEM, 26 AS ORDINE, '25' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata nespecializat de produse alimentare, bauturi si tutun(46.39)' AS NUME,                                                                              'G4639' AS CAEM, 27 AS ORDINE, '26' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al bunurilor de consum(46.4 = (46.41 + 46.42 + 46.43 + 46.44 + 46.45 + 46.46 + 46.47 + 46.48 + 46.49))' AS NUME,                                    'G4640' AS CAEM, 28 AS ORDINE, '27' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al produselor textile(46.41)' AS NUME,                                                                                                              'G4641' AS CAEM, 29 AS ORDINE, '28' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al imbracamintei si incaltamintei(46.42)' AS NUME,                                                                                                  'G4642' AS CAEM, 30 AS ORDINE, '29' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al aparatelor electrice de uz gospodaresc, al aparatelor de radio si televizoarelor(46.43)' AS NUME,                                                'G4643' AS CAEM, 31 AS ORDINE, '30' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al produselor din ceramica, sticlarie si al produselor de intretinere(46.44)' AS NUME,                                                              'G4644' AS CAEM, 32 AS ORDINE, '31' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al produselor cosmetice si de parfumerie(46.45)' AS NUME,                                                                                           'G4645' AS CAEM, 33 AS ORDINE, '32' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al produselor farmaceutice(46.46)' AS NUME,                                                                                                         'G4646' AS CAEM, 34 AS ORDINE, '33' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al mobilei, covoarelor si a articolelor de iluminat(46.47)' AS NUME,                                                                                'G4647' AS CAEM, 35 AS ORDINE, '34' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al ceasurilor si bijuteriilor(46.48)' AS NUME,                                                                                                      'G4648' AS CAEM, 36 AS ORDINE, '35' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al altor bunuri de uz gospodaresc(46.49)' AS NUME,                                                                                                  'G4649' AS CAEM, 37 AS ORDINE, '36' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al echipamentului informatic si de telecomunicatii(46.5 = (46.51 + 46.52))' AS NUME,                                                                'G4650' AS CAEM, 38 AS ORDINE, '37' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al calculatoarelor, echipamentelor periferice si software-lui(46.51)' AS NUME,                                                                      'G4651' AS CAEM, 39 AS ORDINE, '38' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata de componente si echipamente electronice si de telecomunicatii(46.52)' AS NUME,                                                                     'G4652' AS CAEM, 40 AS ORDINE, '39' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al altor masini, echipamente si furnituri(46.6 = (46.61 + 46.62 + 46.63 + 46.64 + 46.65 + 46.66 + 46.69))' AS NUME,                                 'G4660' AS CAEM, 41 AS ORDINE, '40' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al masinilor agricole, echipamentelor si furniturilor(46.61)' AS NUME,                                                                              'G4661' AS CAEM, 42 AS ORDINE, '41' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al masinilor-unelte(46.62)' AS NUME,                                                                                                                'G4662' AS CAEM, 43 AS ORDINE, '42' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al masinilor pentru industria miniera si constructii(46.63)' AS NUME,                                                                               'G4663' AS CAEM, 44 AS ORDINE, '43' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al masinilor pentru industria textila si al masinilor de cusut si de tricotat(46.64)' AS NUME,                                                      'G4664' AS CAEM, 45 AS ORDINE, '44' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al mobilei de birou(46.65)' AS NUME,                                                                                                                'G4665' AS CAEM, 46 AS ORDINE, '45' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al altor masini si echipamente de birou(46.66)' AS NUME,                                                                                            'G4666' AS CAEM, 47 AS ORDINE, '46' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al altor masini si echipamente(46.69)' AS NUME,                                                                                                     'G4669' AS CAEM, 48 AS ORDINE, '47' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata specializat al altor produse(46.7 = (46.71 + 46.72 + 46.73 + 46.74 + 46.75 + 46.76 + 46.77))' AS NUME,                                              'G4670' AS CAEM, 49 AS ORDINE, '48' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al combustibililor solizi, lichizi si gazosi si al produselor derivate(46.71)' AS NUME,                                                             'G4671' AS CAEM, 50 AS ORDINE, '49' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al metalelor si minereurilor metalice(46.72)' AS NUME,                                                                                              'G4672' AS CAEM, 51 AS ORDINE, '50' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al materialului lemnos si al materialelor de constructie si echipamentelor sanitare(46.73)' AS NUME,                                                'G4673' AS CAEM, 52 AS ORDINE, '51' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al echipamentelor si furniturilor de fierarie pentru instalatii sanitare si de incalzire(46.74)' AS NUME,                                           'G4674' AS CAEM, 53 AS ORDINE, '52' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al produselor chimice(46.75)' AS NUME,                                                                                                              'G4675' AS CAEM, 54 AS ORDINE, '53' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al altor produse intermediare(46.76)' AS NUME,                                                                                                      'G4676' AS CAEM, 55 AS ORDINE, '54' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata al deseurilor si resturilor(46.77)' AS NUME,                                                                                                        'G4677' AS CAEM, 56 AS ORDINE, '55' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata nespecializat(46.9 = (46.90))' AS NUME,                                                                                                             'G4690' AS CAEM, 57 AS ORDINE, '56' AS RIND FROM DUAL UNION
SELECT 'Comert cu ridicata nespecializat(46.90)' AS NUME,                                                                                                                      'G4690' AS CAEM, 58 AS ORDINE, '57' AS RIND FROM DUAL 
) C ON D.CODUL = C.CAEM
)

ORDER BY
  NR_ROW