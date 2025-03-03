﻿--INSERT INTO CIS2.TABLE_OUT 
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
--  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8, COL9, COL10, COL11, COL12, COL13, COL14,COL15,COL16
--)


SELECT
--    :PPERIOADA AS PERIOADA,
--    :PFORM AS FORM,
--    :PFORM_VERS AS FORM_VERS,
--    :PID_MDTABLE AS ID_MDTABLE,
--    :PCOD_CUATM AS COD_CUATM,
--    '0' AS NR_SECTIE,
--    '0' AS NUME_SECTIE,
--    '0' AS NR_SECTIE1,
--    '0' AS NUME_SECTIE1,
--    '0' AS NR_SECTIE2,
--    '0' AS NUME_SECTIE2,
     RIND AS  NR_ROW,   
     ORDINE,
    '0000000000000000' AS DECIMAL_POS,
    DENUMIRE AS NUME_ROW, 
    COL1,  COL2,  COL3,  ROUND (COL3/NOZERO(COL2),5) AS COL4, 
    COL5,  COL6,  COL7,  ROUND (COL7/NOZERO(COL6),5) AS COL8,
    COL9,  COL10, COL11, ROUND (COL11/NOZERO(COL10),5) AS COL12,
    COL13, COL14, COL15, ROUND (COL15/NOZERO(COL14),5) AS COL16
FROM
(

SELECT 
         1 AS ORDINE, 
         '250' AS RIND,
         'Total sămînțoase' AS DENUMIRE, 
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL1 ELSE NULL END)) AS COL1,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL2 ELSE NULL END)) AS COL2,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL3 ELSE NULL END)) AS COL3, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL3 ELSE NULL END))/
         NOZERO (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL2 ELSE NULL END))) AS COL4,
            
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL1 ELSE NULL END)) AS COL5,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL2 ELSE NULL END)) AS COL6,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL3 ELSE NULL END)) AS COL7, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL3 ELSE NULL END))/
         NOZERO (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL2 ELSE NULL END))) AS COL8,
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL1 ELSE NULL END)) AS COL9,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL2 ELSE NULL END)) AS COL10,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL3 ELSE NULL END)) AS COL11, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL3 ELSE NULL END))/
         NOZERO (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL2 ELSE NULL END))) AS COL12,
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL1 ELSE NULL END)) AS COL13,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL2 ELSE NULL END)) AS COL14,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL3 ELSE NULL END)) AS COL15, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL3 ELSE NULL END))/
         NOZERO (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL2 ELSE NULL END))) AS COL16

   FROM
  
  CIS2.VW_DATA_ALL_GC   D                   
    
WHERE
  (D.PERIOADA = :PPERIOADA)  AND
  (D.FORM =:PFORM) AND
  (D.FORM_VERS =:PFORM_VERS) AND 
  (:PID_MDTABLE =:PID_MDTABLE) AND
 (D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%') AND
  D.FORM IN (61) AND D.CAPITOL IN ('1113') -- AND NR_GOSP=285600
 
 UNION
 
 SELECT 
          2 AS ORDINE, 
         '370' AS RIND,
         'Total sîmburoase' AS DENUMIRE, 
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL1 ELSE NULL END)) AS COL1,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL2 ELSE NULL END)) AS COL2,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL3 ELSE NULL END)) AS COL3, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL3 ELSE NULL END))/
         NOZERO (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL2 ELSE NULL END))) AS COL4,
            
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360') AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL1 ELSE NULL END)) AS COL5,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL2 ELSE NULL END)) AS COL6,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL3 ELSE NULL END)) AS COL7, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL3 ELSE NULL END))/
         NOZERO (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL2 ELSE NULL END))) AS COL8,
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')  AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL1 ELSE NULL END)) AS COL9,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')  AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL2 ELSE NULL END)) AS COL10,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL3 ELSE NULL END)) AS COL11, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360') AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL3 ELSE NULL END))/
         NOZERO (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')  AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL2 ELSE NULL END))) AS COL12,
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL1 ELSE NULL END)) AS COL13,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL2 ELSE NULL END)) AS COL14,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL3 ELSE NULL END)) AS COL15, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL3 ELSE NULL END))/
         NOZERO (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL2 ELSE NULL END))) AS COL16

   FROM
  
  CIS2.VW_DATA_ALL_GC   D                   
    
WHERE
  (D.PERIOADA = :PPERIOADA)  AND
  (D.FORM =:PFORM) AND
  (D.FORM_VERS =:PFORM_VERS) AND 
  (:PID_MDTABLE =:PID_MDTABLE) AND
 (D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%') AND
  D.FORM IN (61) AND D.CAPITOL IN ('1113') 
  
  UNION
  
   SELECT 
          3 AS ORDINE, 
         '400' AS RIND,
         'Plantaţii nucifere' AS DENUMIRE, 
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL1 ELSE NULL END)) AS COL1,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL4 ELSE NULL END)) AS COL2,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL7 ELSE NULL END)) AS COL3, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL7 ELSE NULL END))/
         NOZERO (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL4 ELSE NULL END))) AS COL4,
            
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL1 ELSE NULL END)) AS COL5,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL4 ELSE NULL END)) AS COL6,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL7 ELSE NULL END)) AS COL7, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL7 ELSE NULL END))/
         NOZERO (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL4 ELSE NULL END))) AS COL8, 
         
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL1 ELSE NULL END)) AS COL9,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL4 ELSE NULL END)) AS COL10,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL7 ELSE NULL END)) AS COL11, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400') AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL7 ELSE NULL END))/
         NOZERO (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL2 ELSE NULL END))) AS COL12,
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL1 ELSE NULL END)) AS COL13,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL4 ELSE NULL END)) AS COL14,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL7 ELSE NULL END)) AS COL15, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL7 ELSE NULL END))/
         NOZERO (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL4 ELSE NULL END))) AS COL16
      
   FROM
  
  CIS2.VW_DATA_ALL_GC   D                   
    
WHERE
  (D.PERIOADA = :PPERIOADA)  AND
  (D.FORM =:PFORM) AND
  (D.FORM_VERS =:PFORM_VERS) AND 
  (:PID_MDTABLE =:PID_MDTABLE) AND
 (D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%') AND
  D.FORM IN (61) AND D.CAPITOL IN ('1113') 
  
  UNION
  
     SELECT 
          3 AS ORDINE, 
         '400' AS RIND,
         'Plantaţii nucifere' AS DENUMIRE, 
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL1 ELSE NULL END)) AS COL1,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL4 ELSE NULL END)) AS COL2,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL7 ELSE NULL END)) AS COL3, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL7 ELSE NULL END))/
         NOZERO (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL4 ELSE NULL END))) AS COL4,
            
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL1 ELSE NULL END)) AS COL5,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL4 ELSE NULL END)) AS COL6,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL7 ELSE NULL END)) AS COL7, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL7 ELSE NULL END))/
         NOZERO (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL4 ELSE NULL END))) AS COL8, 
         
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL1 ELSE NULL END)) AS COL9,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL4 ELSE NULL END)) AS COL10,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL7 ELSE NULL END)) AS COL11, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400') AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL7 ELSE NULL END))/
         NOZERO (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL2 ELSE NULL END))) AS COL12,
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL1 ELSE NULL END)) AS COL13,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL4 ELSE NULL END)) AS COL14,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL7 ELSE NULL END)) AS COL15, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL7 ELSE NULL END))/
         NOZERO (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL4 ELSE NULL END))) AS COL16
      
   FROM
  
  CIS2.VW_DATA_ALL_GC   D                   
    
WHERE
  (D.PERIOADA = :PPERIOADA)  AND
  (D.FORM =:PFORM) AND
  (D.FORM_VERS =:PFORM_VERS) AND 
  (:PID_MDTABLE =:PID_MDTABLE) AND
 (D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%') AND
  D.FORM IN (61) AND D.CAPITOL IN ('1113')
  
    UNION

  
     SELECT 
          4 AS ORDINE, 
         '500' AS RIND,
         'Pomuşoare -total ' AS DENUMIRE, 
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL1 ELSE NULL END)) AS COL1,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL4 ELSE NULL END)) AS COL2,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL7 ELSE NULL END)) AS COL3, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL7 ELSE NULL END))/
         NOZERO (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL4 ELSE NULL END))) AS COL4,
            
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL1 ELSE NULL END)) AS COL5,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL4 ELSE NULL END)) AS COL6,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL7 ELSE NULL END)) AS COL7, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL7 ELSE NULL END))/
         NOZERO (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL4 ELSE NULL END))) AS COL8, 
         
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL1 ELSE NULL END)) AS COL9,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL4 ELSE NULL END)) AS COL10,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL7 ELSE NULL END)) AS COL11, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500') AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL7 ELSE NULL END))/
         NOZERO (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL2 ELSE NULL END))) AS COL12,
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL1 ELSE NULL END)) AS COL13,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL4 ELSE NULL END)) AS COL14,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL7 ELSE NULL END)) AS COL15, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL7 ELSE NULL END))/
         NOZERO (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL4 ELSE NULL END))) AS COL16
      
   FROM
  
  CIS2.VW_DATA_ALL_GC   D                   
    
WHERE
  (D.PERIOADA = :PPERIOADA)  AND
  (D.FORM =:PFORM) AND
  (D.FORM_VERS =:PFORM_VERS) AND 
  (:PID_MDTABLE =:PID_MDTABLE) AND
 (D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%') AND
  D.FORM IN (61) AND D.CAPITOL IN ('1113')
  
  
  UNION
  ----
  SELECT 
         5 AS ORDINE, 
         '550' AS RIND,
         'Fructe' AS DENUMIRE, 
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240','310','320','330','340','350','360','400','500')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL1 ELSE NULL END)) AS COL1,
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240','310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL2 ELSE NULL END)) +
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400','500')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL4 ELSE NULL END)) AS COL2,
     
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240','310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL3 ELSE NULL END)) +
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400','500')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL7 ELSE NULL END)) AS COL3,
     
         --
         NULL AS COL4,
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240','310','320','330','340','350','360','400','500')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL1 ELSE NULL END)) AS COL5,
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240','310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL2 ELSE NULL END)) +
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400','500')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL4 ELSE NULL END)) AS COL6,
     
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240','310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL3 ELSE NULL END)) +
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400','500')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL7 ELSE NULL END)) AS COL7,
         

         NULL AS COL8,
         
                  
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240','310','320','330','340','350','360','400','500')  AND((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL1 ELSE NULL END)) AS COL9,
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240','310','320','330','340','350','360')  AND ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL2 ELSE NULL END)) +
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400','500') AND ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL4 ELSE NULL END)) AS COL10,
     
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240','310','320','330','340','350','360')  AND ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL3 ELSE NULL END)) +
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400','500')  AND ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL7 ELSE NULL END)) AS COL11,
         

         NULL AS COL12,
      
          CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240','310','320','330','340','350','360','400','500')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL1 ELSE NULL END)) AS COL13,
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240','310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL2 ELSE NULL END)) +
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400','500')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL4 ELSE NULL END)) AS COL14,
     
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240','310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL3 ELSE NULL END)) +
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400','500')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL7 ELSE NULL END)) AS COL15,
         

         NULL AS COL16
    
        
   FROM
  
  CIS2.VW_DATA_ALL_GC   D                   
    
WHERE
  (D.PERIOADA = :PPERIOADA)  AND
  (D.FORM =:PFORM) AND
  (D.FORM_VERS =:PFORM_VERS) AND 
  (:PID_MDTABLE =:PID_MDTABLE) AND
 (D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%') AND
  D.FORM IN (61) AND D.CAPITOL IN ('1113') -- AND NR_GOSP=285600
  
 UNION 
  
     SELECT 
          7 AS ORDINE, 
         '600' AS RIND,
         'Struguri- total' AS DENUMIRE, 
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL1 ELSE NULL END)) AS COL1,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL4 ELSE NULL END)) AS COL2,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL7 ELSE NULL END)) AS COL3, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL7 ELSE NULL END))/
         NOZERO (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL4 ELSE NULL END))) AS COL4,
            
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL1 ELSE NULL END)) AS COL5,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL4 ELSE NULL END)) AS COL6,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL7 ELSE NULL END)) AS COL7, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL7 ELSE NULL END))/
         NOZERO (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL4 ELSE NULL END))) AS COL8, 
         
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL1 ELSE NULL END)) AS COL9,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL4 ELSE NULL END)) AS COL10,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL7 ELSE NULL END)) AS COL11, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600') AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL7 ELSE NULL END))/
         NOZERO (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL2 ELSE NULL END))) AS COL12,
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL1 ELSE NULL END)) AS COL13,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL4 ELSE NULL END)) AS COL14,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL7 ELSE NULL END)) AS COL15, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL7 ELSE NULL END))/
         NOZERO (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL4 ELSE NULL END))) AS COL16
      
   FROM
  
  CIS2.VW_DATA_ALL_GC   D                   
    
WHERE
  (D.PERIOADA = :PPERIOADA)  AND
  (D.FORM =:PFORM) AND
  (D.FORM_VERS =:PFORM_VERS) AND 
  (:PID_MDTABLE =:PID_MDTABLE) AND
 (D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%') AND
  D.FORM IN (61) AND D.CAPITOL IN ('1113')
 )
  
 