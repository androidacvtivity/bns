--INSERT INTO CIS2.TABLE_OUT 
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
--  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8, COL9, COL10, COL11, COL12, COL13, COL14, COL15, COL16, COL17, COL18, COL19,
--  COL20, COL21,COL22, COL23, COL24
--)


SELECT
    :PPERIOADA AS PERIOADA,
    :PFORM AS FORM,
    :PFORM_VERS AS FORM_VERS,
    :PID_MDTABLE AS ID_MDTABLE,
    :PCOD_CUATM AS COD_CUATM,
    '0' AS NR_SECTIE,
    '0' AS NUME_SECTIE,
    '0' AS NR_SECTIE1,
    '0' AS NUME_SECTIE1,
    '0' AS NR_SECTIE2,
    '0' AS NUME_SECTIE2,
     RIND AS  NR_ROW,   
     ORDINE,
    '000000000000000000000000' AS DECIMAL_POS,
    DENUMIRE AS NUME_ROW, 
    COL1,   COL2,  COL3,  COL4,  COL5,  COL5/NOZERO(COL4) AS COL6, 
    COL7,   COL8,  COL9,  COL10, COL11, COL11/NOZERO(COL10) AS COL12,
    COL13,  COL14, COL15, COL16, COL17, COL17/NOZERO(COL16) AS COL18,
    COL19,  COL20, COL21, COL22, COL23, COL23/NOZERO(COL22) AS COL24
FROM
(

SELECT 
         1 AS ORDINE, 
         '250' AS RIND,
         'Total sam�n?oase' AS DENUMIRE, 
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL2 / 3 ELSE NULL END)) AS COL1,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL3 / 3 ELSE NULL END)) AS COL2,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL5 / 3 ELSE NULL END)) AS COL3, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL6 /3 ELSE NULL END)) AS COL4, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL8  ELSE NULL END)) AS COL5,
          
         NULL AS COL6,
            
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL1 ELSE NULL END)) AS COL7,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL2 ELSE NULL END)) AS COL8,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL3 ELSE NULL END)) AS COL9, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN '1113') AND D.RIND IN ('210','220','230','240')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL4 ELSE NULL END)) AS COL10, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL5 ELSE NULL END)) AS COL11, 
        
         NULL AS COL12,
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL1 ELSE NULL END)) AS COL13,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL2 ELSE NULL END)) AS COL14,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL3 ELSE NULL END)) AS COL15, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL4 ELSE NULL END)) AS COL16, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL5 ELSE NULL END)) AS COL17, 
        
         NULL AS COL18,
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL1 ELSE NULL END)) AS COL19,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL2 ELSE NULL END)) AS COL20,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL3 ELSE NULL END)) AS COL21, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL4 ELSE NULL END)) AS COL22, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL5 ELSE NULL END)) AS COL23, 
       
       NULL AS COL24
       
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
         'Total s�mburoase' AS DENUMIRE, 
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')   AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL1 ELSE NULL END)) AS COL1,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')   AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL2 ELSE NULL END)) AS COL2,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')   AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL3 ELSE NULL END)) AS COL3, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')   AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL4 ELSE NULL END)) AS COL4, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')   AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL5 ELSE NULL END)) AS COL5,
         NULL AS COL6,
            
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')   AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL1 ELSE NULL END)) AS COL7,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')   AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL2 ELSE NULL END)) AS COL8,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')   AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL3 ELSE NULL END)) AS COL9, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')   AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL4 ELSE NULL END)) AS COL10, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')   AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL5 ELSE NULL END)) AS COL11, 
        
         NULL AS COL12,
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')   AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL1 ELSE NULL END)) AS COL13,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')   AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL2 ELSE NULL END)) AS COL14,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')   AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL3 ELSE NULL END)) AS COL15, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')   AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL4 ELSE NULL END)) AS COL16, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')   AND  ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL5 ELSE NULL END)) AS COL17, 
        
         NULL AS COL18,
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')   AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL1 ELSE NULL END)) AS COL19,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')   AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL2 ELSE NULL END)) AS COL20,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')   AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL3 ELSE NULL END)) AS COL21, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')   AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL4 ELSE NULL END)) AS COL22, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('310','320','330','340','350','360')   AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL5 ELSE NULL END)) AS COL23, 
       
       NULL AS COL24
      
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
         'Plantatii nucifere' AS DENUMIRE, 
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL2 ELSE NULL END)) AS COL1,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL3 ELSE NULL END)) AS COL2,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL5 ELSE NULL END)) AS COL3, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL6 ELSE NULL END)) AS COL4,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL8 ELSE NULL END)) AS COL5,
         
         NULL AS COL6,
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL2 ELSE NULL END)) AS COL7,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL3 ELSE NULL END)) AS COL8,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL5 ELSE NULL END)) AS COL9, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL6 ELSE NULL END)) AS COL10,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL8 ELSE NULL END)) AS COL11,
         
         NULL AS COL12,
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL2 ELSE NULL END)) AS COL13,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL3 ELSE NULL END)) AS COL14,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL5 ELSE NULL END)) AS COL15, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL6 ELSE NULL END)) AS COL16,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL8 ELSE NULL END)) AS COL17,
         
         NULL AS COL18,  
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL2 ELSE NULL END)) AS COL19,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL3 ELSE NULL END)) AS COL20,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL5 ELSE NULL END)) AS COL21, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL6 ELSE NULL END)) AS COL22,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL8 ELSE NULL END)) AS COL23,
         
         NULL AS COL24       
         
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
         'Pomusoare -total ' AS DENUMIRE, 
         
          CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL2 ELSE NULL END)) AS COL1,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL3 ELSE NULL END)) AS COL2,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL5 ELSE NULL END)) AS COL3, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL6 ELSE NULL END)) AS COL4,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL8 ELSE NULL END)) AS COL5,
         
         NULL AS COL6,
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL2 ELSE NULL END)) AS COL7,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL3 ELSE NULL END)) AS COL8,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL5 ELSE NULL END)) AS COL9, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL6 ELSE NULL END)) AS COL10,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL8 ELSE NULL END)) AS COL11,
         
         NULL AS COL12,
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL2 ELSE NULL END)) AS COL13,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL3 ELSE NULL END)) AS COL14,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL5 ELSE NULL END)) AS COL15, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL6 ELSE NULL END)) AS COL16,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL8 ELSE NULL END)) AS COL17,
         
         NULL AS COL18,  
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL2 ELSE NULL END)) AS COL19,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL3 ELSE NULL END)) AS COL20,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL5 ELSE NULL END)) AS COL21, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL6 ELSE NULL END)) AS COL22,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('500')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL8 ELSE NULL END)) AS COL23,
         
         NULL AS COL24 
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
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240','310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL1 ELSE NULL END)) +
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400','500')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL2 ELSE NULL END)) AS COL1,
     
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240','310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL2 ELSE NULL END)) +
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400','500')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL3 ELSE NULL END)) AS COL2,
     
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240','310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL3 ELSE NULL END)) +
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400','500')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL5 ELSE NULL END)) AS COL3,
     
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240','310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL4 ELSE NULL END)) +
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400','500')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL6 ELSE NULL END)) AS COL4,
     
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240','310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL5 ELSE NULL END)) +
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400','500')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL8 ELSE NULL END)) AS COL5,
          
         NULL AS COL6,  
         
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240','310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL1 ELSE NULL END)) +
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400','500')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL2 ELSE NULL END)) AS COL7,
     
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240','310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL2 ELSE NULL END)) +
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400','500')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL3 ELSE NULL END)) AS COL8,
     
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240','310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL3 ELSE NULL END)) +
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400','500')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL5 ELSE NULL END)) AS COL9,
     
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240','310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL4 ELSE NULL END)) +
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400','500')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL6 ELSE NULL END)) AS COL10,
     
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240','310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL5 ELSE NULL END)) +
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400','500')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL8 ELSE NULL END)) AS COL11,
          
         NULL AS COL12,
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240','310','320','330','340','350','360')  AND ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL1 ELSE NULL END)) +
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400','500')  AND ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL2 ELSE NULL END)) AS COL13,
     
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240','310','320','330','340','350','360')  AND ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL2 ELSE NULL END)) +
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400','500')  AND ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL3 ELSE NULL END)) AS COL14,
     
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240','310','320','330','340','350','360')  AND ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL3 ELSE NULL END)) +
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400','500')  AND ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL5 ELSE NULL END)) AS COL15,
     
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240','310','320','330','340','350','360')  AND ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL4 ELSE NULL END)) +
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400','500')  AND ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL6 ELSE NULL END)) AS COL16,
     
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240','310','320','330','340','350','360')  AND ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL5 ELSE NULL END)) +
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400','500')  AND ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL8 ELSE NULL END)) AS COL17,
          
         NULL AS COL18,     
                  
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240','310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL1 ELSE NULL END)) +
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400','500')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL2 ELSE NULL END)) AS COL19,
     
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240','310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL2 ELSE NULL END)) +
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400','500')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL3 ELSE NULL END)) AS COL20,
     
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240','310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL3 ELSE NULL END)) +
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400','500')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL5 ELSE NULL END)) AS COL21,
     
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240','310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL4 ELSE NULL END)) +
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400','500')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL6 ELSE NULL END)) AS COL22,
     
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('210','220','230','240','310','320','330','340','350','360')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL5 ELSE NULL END)) +
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('400','500')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL8 ELSE NULL END)) AS COL23,
          
         NULL AS COL24  

    
        
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
         
          CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL2 ELSE NULL END)) AS COL1,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL3 ELSE NULL END)) AS COL2,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL5 ELSE NULL END)) AS COL3, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL6 ELSE NULL END)) AS COL4,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND D.CUATM_FULL LIKE '%'||1111111||';%' THEN D.COL8 ELSE NULL END)) AS COL5,
         
         NULL AS COL6,
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL2 ELSE NULL END)) AS COL7,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL3 ELSE NULL END)) AS COL8,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL5 ELSE NULL END)) AS COL9, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL6 ELSE NULL END)) AS COL10,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND D.CUATM_FULL LIKE '%'||2222222||';%' THEN D.COL8 ELSE NULL END)) AS COL11,
         
         NULL AS COL12,
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL2 ELSE NULL END)) AS COL13,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%'))THEN D.COL3 ELSE NULL END)) AS COL14,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL5 ELSE NULL END)) AS COL15, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL6 ELSE NULL END)) AS COL16,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND ((D.CUATM_FULL LIKE '%'||3333333||';%') OR (D.CUATM_FULL LIKE '%'||9600000||';%')) THEN D.COL8 ELSE NULL END)) AS COL17,
         
         NULL AS COL18,  
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL2 ELSE NULL END)) AS COL19,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL3 ELSE NULL END)) AS COL20,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL5 ELSE NULL END)) AS COL21, 
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL6 ELSE NULL END)) AS COL22,
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1113') AND D.RIND IN ('600')  AND D.CUATM_FULL LIKE '%'||:PCOD_CUATM||';%' THEN D.COL8 ELSE NULL END)) AS COL23,
         
         NULL AS COL24 
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
  
 