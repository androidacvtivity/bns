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
            
                
     ROUND(SUM(CASE WHEN 1=1 AND MR.RIND IN ('015') AND CT.FULL_CODE LIKE '%'||R.CS_CUATM||'%'  THEN D.COL2  ELSE NULL END),0) ||'~'||SUM(ROWNUM) AS NR_ROW, 
      R.NR_ROW ORDINE,
    '00000' AS DECIMAL_POS,
     R.NUME_ROW NUME_ROW,
     ROUND(SUM(CASE WHEN 1=1 AND MR.RIND IN ('010') AND CT.FULL_CODE LIKE '%'||R.CS_CUATM||'%'  THEN D.COL2  ELSE NULL END),0)  AS COL1,
     ROUND(SUM(CASE WHEN 1=1 AND MR.RIND IN ('020') AND CT.FULL_CODE LIKE '%'||R.CS_CUATM||'%'  THEN D.COL2  ELSE NULL END),0)  AS COL2,
     ROUND(SUM(CASE WHEN 1=1 AND MR.RIND IN ('035') AND CT.FULL_CODE LIKE '%'||R.CS_CUATM||'%'  THEN D.COL2  ELSE NULL END),0)  AS COL3,
     ROUND(SUM(CASE WHEN 1=1 AND MR.RIND IN ('065') AND CT.FULL_CODE LIKE '%'||R.CS_CUATM||'%'  THEN D.COL2  ELSE NULL END),0)  AS COL4,
     ROUND(SUM(CASE WHEN 1=1 AND MR.RIND IN ('100') AND CT.FULL_CODE LIKE '%'||R.CS_CUATM||'%'  THEN D.COL2  ELSE NULL END),0)  AS COL5
            
           
            
   
            
                



                 FROM DATA_ALL_GC D 
                 
                 
                 
                 
                        INNER JOIN CIS2.MD_RIND MR  ON (MR.ID_MD =  D.ID_MD)
                        
                
                        
          
               INNER JOIN REG_UNIT_GC RN
                ON     D.UNIT_CODE = RN.UNIT_CODE
                AND D.UNIT_CODE_VERS = RN.UNIT_CODE_VERS
                AND D.NR_GOSP = RN.NR_GOSP
                AND D.NR_MAPS = RN.NR_MAPS
                
                INNER  JOIN VW_CL_CUATM CT ON RN.CUATM = CT.CODUL 
                
                
                ---------------------------------------------
                CROSS JOIN 
  (
    SELECT
      DECODE(CS.CODUL, 
      '0000000','01',
      '0100000','02','1111111','03','0300000','04',
      '1400000','05','3400000','06','3600000','07','4100000','08','4300000','09',
      '4500000','10','4800000','11','6200000','12','7100000','13','7400000','14',
      '7800000','15','2222222','16','1000000','17','2500000','18','3100000','19',
      '3800000','20','5300000','21','5500000','22','6000000','23','6400000','24',
      '6700000','25','8000000','26','8300000','27','8900000','28','9200000','29',
      '3333333','30','1200000','31','1700000','32','2100000','33','2700000','34',
      '2900000','35','5700000','36','8500000','37','8700000','38','9600000','39'
      )
      AS NR_ROW,
      CS.DENUMIRE AS NUME_ROW,
      CS.CODUL AS CS_CUATM
    FROM
      CIS2.VW_CL_CUATM CS
    WHERE
      CS.CODUL 
      IN(
         '0000000',
         '0100000','1111111','0300000','1400000','3400000','3600000','4100000','4300000','4500000',
         '4800000','6200000','7100000','7400000','7800000','2222222','1000000','2500000','3100000','3800000',
         '5300000','5500000','6000000','6400000','6700000','8000000','8300000','8900000','9200000','3333333',
         '1200000','1700000','2100000','2700000','2900000','5700000','8500000','8700000','9600000')
  ) R 
                
                ---------------------------------------
                  
              --  INNER JOIN CIS2.VW_CL_CUATM CC ON (CT.FULL_CODE LIKE '%'||CC.CODUL||';%')     
                      
                ----------------------
                
                CROSS JOIN (
         
         SELECT 'Bovine - total' AS DENUMIRE, 1 AS ORDINE,  '010' AS RIND FROM DUAL UNION  
    SELECT '  vaci' AS DENUMIRE, 2 AS ORDINE,  '011' AS RIND FROM DUAL UNION   
    SELECT '  tineret 0-6 luni' AS DENUMIRE,3 AS ORDINE,  '012' AS RIND FROM DUAL UNION 
    SELECT '  tineret 6 luni pina la 1 an' AS DENUMIRE, 4 AS ORDINE,  '013' AS RIND FROM DUAL UNION 
    SELECT '  tineret peste 1 an' AS DENUMIRE, 4 AS ORDINE,  '014' AS RIND FROM DUAL UNION   
    SELECT '    din care junci peste 18 luni' AS DENUMIRE, 5 AS ORDINE,  '015' AS RIND FROM DUAL  UNION
    SELECT 'Porcine - total' AS DENUMIRE, 6 AS ORDINE,  '020' AS RIND FROM DUAL   UNION   
    SELECT '  scroafe de baza' AS DENUMIRE,7 AS ORDINE,  '021' AS RIND FROM DUAL  UNION 
    SELECT '  porcine 0-4 luni' AS DENUMIRE,8 AS ORDINE,  '022' AS RIND FROM DUAL  UNION
    SELECT '  porcine peste 4 luni' AS DENUMIRE,9 AS ORDINE,  '023' AS RIND FROM DUAL  UNION
    SELECT '    din care purcele de repr.de  la 9 lun' AS DENUMIRE,10 AS ORDINE,  '024' AS RIND FROM DUAL UNION  
    SELECT 'Ovine - total' AS DENUMIRE,11 AS ORDINE,  '030' AS RIND FROM DUAL  UNION
    SELECT '  oi fatatoare' AS DENUMIRE,12 AS ORDINE,  '031' AS RIND FROM DUAL UNION
    SELECT '  mioare de 1 an si peste' AS DENUMIRE,13 AS ORDINE,  '032' AS RIND FROM DUAL UNION 
    SELECT '  tineret pina la 1 an' AS DENUMIRE,14 AS ORDINE,  '033' AS RIND FROM DUAL    UNION
    SELECT 'Caprine - total' AS DENUMIRE,15 AS ORDINE,  '040' AS RIND FROM DUAL   UNION
    SELECT '  capre fatatoare de 1an si peste' AS DENUMIRE,16 AS ORDINE,  '041' AS RIND FROM DUAL UNION  
    SELECT '  tineret pina la 1 an' AS DENUMIRE,17 AS ORDINE,  '042' AS RIND FROM DUAL UNION 
    SELECT 'Cabaline' AS DENUMIRE,18 AS ORDINE,  '050' AS RIND FROM DUAL UNION
    SELECT '   adulte' AS DENUMIRE,20 AS ORDINE,  '051' AS RIND FROM DUAL UNION
    SELECT 'Gaini si cucosi total' AS DENUMIRE,21 AS ORDINE,  '060' AS RIND FROM DUAL UNION
    SELECT '  gaini ouatoare' AS DENUMIRE,22 AS ORDINE,  '061' AS RIND FROM DUAL  UNION 
    SELECT 'Giste total' AS DENUMIRE,23 AS ORDINE,  '070' AS RIND FROM DUAL  UNION 
    SELECT '  giste adulte' AS DENUMIRE,24 AS ORDINE,  '071' AS RIND FROM DUAL  UNION 
    SELECT 'Rate total' AS DENUMIRE,25 AS ORDINE,  '080' AS RIND FROM DUAL UNION    
    SELECT '  rate adulte' AS DENUMIRE,26 AS ORDINE,  '081' AS RIND FROM DUAL UNION
    SELECT 'Curcani total' AS DENUMIRE,27 AS ORDINE,  '090' AS RIND FROM DUAL UNION
    SELECT '  curcani adulti' AS DENUMIRE,28 AS ORDINE,  '091' AS RIND FROM DUAL UNION
    SELECT 'Iepuri total' AS DENUMIRE,29 AS ORDINE,  '100' AS RIND FROM DUAL UNION 
    SELECT '  iepuri adulti' AS DENUMIRE,30 AS ORDINE,  '101' AS RIND FROM DUAL UNION
    SELECT 'familii de albine' AS DENUMIRE,31 AS ORDINE,  '201' AS RIND FROM DUAL 
         ) VBG
     
                
                -----------------------
                
                
                
                        WHERE 
                        
                   --(D.PERIOADA IN (:pPERIOADA , :pPERIOADA - 1 )) AND
                    (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND   
                     
                   (D.FORM =:pFORM) AND
                   (D.FORM_VERS =:pFORM_VERS) AND 
                   (:pID_MDTABLE =:pID_MDTABLE) AND
                   (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
                   D.FORM IN (58)  AND
                   MR.CAPITOL IN (417)
                    
                   
                     GROUP BY
  R.NR_ROW,
  R.NUME_ROW