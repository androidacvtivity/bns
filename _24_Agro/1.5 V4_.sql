﻿--1.5 V4
DECLARE -- ====================================================================

  CURSOR C IS
  SELECT
    :pCOD_CUATM AS pCOD_CUATM
  FROM
    DUAL;

BEGIN -- ======================================================================
  FOR CR IN C
  LOOP
   IF CR.pCOD_CUATM = '0000000' THEN
   
   
   ------------TOTAL CUATM---------
DECLARE
    
  CURSOR UPD_TABLE_OUT IS
       
SELECT
    R.NR_SECTIE,
  R.NUME_SECTIE,
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,
  ROUND(RR.COL1,0)||'~'||RR.NR_ROW AS NR_ROW,
  R.ORDINE,
  '01001001001001' AS DECIMAL_POS,
  R.NUME_ROW,
  R.COL1 AS COL1,  
  ROUND((CIS2.NVAL(R.COL1)/CIS2.NOZERO(RR.COL1))*100,1) AS COL2,
  ROUND(RR.COL4,0) AS COL3,
  ROUND(R.COL4,0) AS COL4,
  ROUND((CIS2.NVAL(R.COL4)/CIS2.NOZERO(RR.COL4))*100,1) AS COL5,
  ROUND(RR.COL7,0) AS COL6,
  ROUND(R.COL7,0) AS COL7,
  ROUND((CIS2.NVAL(R.COL7)/CIS2.NOZERO(RR.COL7))*100,1) AS COL8
FROM
(
SELECT 
  R.NR_ROW,
  R.NUME_ROW,
  TO_NUMBER(R.NR_ROW) AS ORDINE,
  CF.ORDINE AS ORDINE_CFOJ,
  CF.NR_ROW AS CODE_CFJO,
  CF.NUME_ROW AS NNAME_CFOJ,
  CIS2.NVAL(SUM(CASE WHEN D.FORM IN (27) AND D.RIND IN ('17')  AND CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%' AND CF.NR_ROW LIKE '%'|| D.CFOJ ||'%' AND CF.FORM LIKE '%'|| D.FORM ||'%' THEN D.COL1 END)) AS COL1,  
            SUM(CASE WHEN D.FORM IN (27) AND D.RIND IN ('18')  AND CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%' AND CF.NR_ROW LIKE '%'|| D.CFOJ ||'%' AND CF.FORM LIKE '%'|| D.FORM ||'%' THEN D.COL1 END) AS COL4,    
 (CIS2.NVAL(SUM(CASE WHEN D.FORM IN (27) AND D.RIND IN ('18')  AND CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%' AND CF.NR_ROW LIKE '%'|| D.CFOJ ||'%' AND CF.FORM LIKE '%'|| D.FORM ||'%' THEN D.COL1 END))/
CIS2.NOZERO(SUM(CASE WHEN D.FORM IN (27) AND D.RIND IN ('122') AND CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%' AND CF.NR_ROW LIKE '%'|| D.CFOJ ||'%' AND CF.FORM LIKE '%'|| D.FORM ||'%' THEN D.COL1 END))*1000) AS COL7

  
  
FROM 
  CIS2.VW_DATA_ALL D
  INNER JOIN CIS2.RENIM RE ON (D.CUIIO=RE.CUIIO AND D.CUIIO_VERS=RE.CUIIO_VERS)
  CROSS JOIN
  (
    SELECT '420+450+684+685+686' AS NR_ROW, 'Gospodariile taranesti (de fermier), care au la balanta animale' AS NUME_ROW, 5 AS ORDINE, '27' AS FORM FROM DUAL UNION
    SELECT '880' AS NR_ROW, 'Gospodariile populatiei' AS NUME_ROW, 8 AS ORDINE, '30' AS FORM FROM DUAL UNION
    SELECT '590+620+880' AS NR_ROW, 'Gospodariile auxiliare' AS NUME_ROW, 7 AS ORDINE, '27' AS FORM FROM DUAL UNION
    SELECT '500+510+530+540+541+550+690+700+890+970' AS NR_ROW, 'Intreprinderile agricole' AS NUME_ROW, 6 AS ORDINE, '27' AS FORM FROM DUAL UNION
    SELECT '500+510+530+540+541+550+690+700+890+970+420+450+684+685+686' AS NR_ROW, 'Intreprinderile agricole si gospodariile taranesti (de fermier), care au balanta animale' AS NUME_ROW, 4 AS ORDINE, '27' AS FORM FROM DUAL UNION
    SELECT '500+510+530+540+541+550+690+700+890+970+420+450+880+590+620+684+685+686' AS NR_ROW, 'Gospodariile de toate categoriile' AS NUME_ROW, 1 AS ORDINE, '27,30' AS FORM FROM DUAL UNION
    SELECT '500+510+530+540+541+550+690+700+890+970+590+620+880' AS NR_ROW, 'Intreprinderile agricole(gosp.auxiliare)' AS NUME_ROW, 3 AS ORDINE, '27' AS FORM FROM DUAL UNION
    SELECT '500+510+530+540+541+550+690+700+890+970+420+450+880+590+620+684+685+686' AS NR_ROW, 'Intreprinderile agricole (gosp. auxiliare) si gospodariile taranesti (de fermier), care au la balanta animale' AS NUME_ROW, 2 AS ORDINE, '27' AS FORM FROM DUAL
  ) CF
  INNER JOIN CIS2.VW_CL_CUATM CC ON(D.CUATM = CC.CODUL)
  CROSS JOIN 
  (
    SELECT
      DECODE(CS.CODUL, 
      '0000000','01','0100000','02','1111111','03','0300000','04',
      '1400000','05','3400000','06','3600000','07','4100000','08','4300000','09',
      '4500000','10','4800000','11','6200000','12','7100000','13','7400000','14',
      '7800000','15','2222222','16','1000000','17','2500000','18','3100000','19',
      '3800000','20','5300000','21','5500000','22','6000000','23','6400000','24',
      '6700000','25','8000000','26','8300000','27','8900000','28','9200000','29',
      '3333333','30','1200000','31','1700000','32','2100000','33','2700000','34',
      '2900000','35','5700000','36','8500000','37','8700000','38','9600000','39')
      AS NR_ROW,
      CS.DENUMIRE AS NUME_ROW,
      CS.CODUL AS CS_CUATM
    FROM
      CIS2.VW_CL_CUATM CS
    WHERE
      CS.CODUL 
      IN(
         '0000000','0100000','1111111','0300000','1400000','3400000','3600000','4100000','4300000','4500000',
         '4800000','6200000','7100000','7400000','7800000','2222222','1000000','2500000','3100000','3800000',
         '5300000','5500000','6000000','6400000','6700000','8000000','8300000','8900000','9200000','3333333',
         '1200000','1700000','2100000','2700000','2900000','5700000','8500000','8700000','9600000'
        )
  ) R 
WHERE
 
  D.PERIOADA IN (SELECT PERIOADA_ANULA-1 FROM CIS2.VW_MD_PERIOADA WHERE PERIOADA IN (:pPERIOADA)) AND 
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
  D.FORM IN (27)               AND 
  D.CAPITOL IN (369,370,372)    AND D.CFOJ IS NOT NULL        
  
GROUP BY 
  R.NR_ROW,
  R.NUME_ROW,
  CF.NR_ROW,
  CF.NUME_ROW,
  CF.ORDINE
) RR

INNER JOIN CIS2.TABLE_OUT R ON R.NR_SECTIE=RR.ORDINE_CFOJ AND R.NUME_ROW=RR.NUME_ROW
WHERE 
  R.COD_CUATM IN (:pCOD_CUATM) AND 
  R.PERIOADA IN (:pPERIOADA) AND 
  R.ID_MDTABLE IN (:pID_MDTABLE) AND
 
  R.FORM IN (33);

  BEGIN  
  
    FOR V_GT IN UPD_TABLE_OUT LOOP    
        UPDATE CIS2.TABLE_OUT 
        
        SET 
            NR_ROW = V_GT.NR_ROW, 
            COL2 = V_GT.COL2,
            COL3 = V_GT.COL3,
            COL4 = V_GT.COL4,
            COL5 = V_GT.COL5,
            COL6 = V_GT.COL6,
            COL7 = V_GT.COL7, 
            COL8 = V_GT.COL8          

            
        WHERE        
          PERIOADA IN (:pPERIOADA)     AND 
          ID_MDTABLE IN (:pID_MDTABLE) AND
          FORM IN (:pFORM)             AND
          FORM_VERS IN (:pFORM_VERS)   AND
          NR_SECTIE IN (V_GT.NR_SECTIE)AND
          NUME_ROW IN (V_GT.NUME_ROW);
            
    END LOOP;   
    END;

   ELSE
     
   DECLARE
    
  CURSOR UPD_TABLE_OUT IS  
  
SELECT         
    R.NR_SECTIE,
  R.NUME_SECTIE,
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,
  ROUND(RR.COL4,0)||'~'||RR.NR_ROW AS NR_ROW,
  R.ORDINE,
  '000' AS DECIMAL_POS,
  R.NUME_ROW, 
  R.COL1 AS COL1,  
  ROUND((CIS2.NVAL(R.COL1)/CIS2.NOZERO(RR.COL1))*100,1) AS COL2,
  ROUND(RR.COL4,0) AS COL3,
  ROUND(R.COL4,0) AS COL4,
  ROUND((CIS2.NVAL(R.COL4)/CIS2.NOZERO(RR.COL4))*100,1) AS COL5,
  ROUND(RR.COL7,0) AS COL6,
  ROUND(R.COL7,0) AS COL7,
  ROUND((CIS2.NVAL(R.COL7)/CIS2.NOZERO(RR.COL7))*100,1) AS COL8
  
  FROM(
  
SELECT          
  '0' AS NR_SECTIE,
  '0' AS NUME_SECTIE,
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,
  ROUND(COL4,0)||'~'||NR_ROW AS NR_ROW,
  ORDINE,
  '000'  AS DECIMAL_POS,
  NR_ROW||' - '||NUME_ROW AS NUME_ROW, 
  ROUND(COL1,0) AS COL1,
  ROUND(COL4,0) AS COL4,
  ROUND(COL7,0) AS COL7
  
  FROM
(
SELECT 
  RE.CUIIO AS NR_ROW,
  MAX(RE.DENUMIRE) AS NUME_ROW,
  TO_NUMBER(RE.CUIIO) AS ORDINE,
--
  CIS2.NVAL(SUM(CASE WHEN D.FORM IN (27) AND D.RIND IN ('17')   THEN D.COL1 END)) AS COL1,  
            SUM(CASE WHEN D.FORM IN (27) AND D.RIND IN ('18')   THEN D.COL1 END) AS COL4,    
 (CIS2.NVAL(SUM(CASE WHEN D.FORM IN (27) AND D.RIND IN ('18')   THEN D.COL1 END))/
  CIS2.NOZERO(SUM(CASE WHEN D.FORM IN (27) AND D.RIND IN ('122') THEN D.COL1 END))*1000) AS COL7  
 
   
FROM 
  CIS2.VW_DATA_ALL D
  INNER JOIN CIS2.RENIM RE ON (D.CUIIO=RE.CUIIO AND D.CUIIO_VERS=RE.CUIIO_VERS)
  
WHERE
  D.PERIOADA IN (SELECT PERIOADA_ANULA-1 FROM CIS2.VW_MD_PERIOADA WHERE PERIOADA IN (:pPERIOADA)) AND
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
  D.FORM IN (27)                 AND 
  D.CAPITOL IN (369,370,372)      AND D.CFOJ IS NOT NULL
  
GROUP BY 
  RE.CUIIO
)
UNION
SELECT
  
  '0' AS NR_SECTIE,
  '0' AS NUME_SECTIE,
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,
  ROUND(COL1,0)||'~TOTAL' AS NR_ROW,
  0 AS ORDINE,
  '000'  AS DECIMAL_POS,
  'TOTAL' AS NUME_ROW, 
  ROUND(COL1,0) AS COL1,
  ROUND(COL4,0) AS COL4,
  ROUND(COL7,0) AS COL7
  
  FROM
(
SELECT 
  CIS2.NVAL(SUM(CASE WHEN D.FORM IN (27) AND D.RIND IN ('17')   THEN D.COL1 END)) AS COL1,  
            SUM(CASE WHEN D.FORM IN (27) AND D.RIND IN ('18')   THEN D.COL1 END) AS COL4,    
 (CIS2.NVAL(SUM(CASE WHEN D.FORM IN (27) AND D.RIND IN ('18')   THEN D.COL1 END))/
 CIS2.NOZERO(SUM(CASE WHEN D.FORM IN (27) AND D.RIND IN ('122') THEN D.COL1 END))*1000) AS COL7

 
  
FROM 
  CIS2.VW_DATA_ALL D  
WHERE
  D.PERIOADA IN (SELECT PERIOADA_ANULA-1 FROM CIS2.VW_MD_PERIOADA WHERE PERIOADA IN (:pPERIOADA))AND   
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
  D.FORM IN (27)                 AND 
   D.CAPITOL IN (369,370,372)      AND D.CFOJ IS NOT NULL
  )        
    )RR
INNER JOIN CIS2.TABLE_OUT R ON R.ORDINE=RR.ORDINE 
WHERE 
  R.COD_CUATM IN (:pCOD_CUATM) AND 
  R.PERIOADA IN (:pPERIOADA) AND 
  R.ID_MDTABLE IN (:pID_MDTABLE) AND
 
  R.FORM IN (33);
    
  BEGIN  
  
    FOR V_GT IN UPD_TABLE_OUT LOOP
    
        UPDATE CIS2.TABLE_OUT 
        
        SET 
            NR_ROW = V_GT.NR_ROW, 
            COL2 = V_GT.COL2,
            COL3 = V_GT.COL3,
            COL4 = V_GT.COL4,
            COL5 = V_GT.COL5,
            COL6 = V_GT.COL6,
            COL7 = V_GT.COL7, 
            COL8 = V_GT.COL8
            
        WHERE 
        
          PERIOADA IN (:pPERIOADA)     AND 
          ID_MDTABLE IN (:pID_MDTABLE) AND
          FORM IN (:pFORM)             AND
          FORM_VERS IN (:pFORM_VERS)   AND
          NR_SECTIE IN (V_GT.NR_SECTIE)AND
          NUME_ROW IN (V_GT.NUME_ROW);
            
    END LOOP;   
    END;

  

    
   END IF;
  END LOOP;
END; -- =======================================================================