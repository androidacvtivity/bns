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
--  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8, COL9, COL10, COL11, COL12, COL13, COL14, COL15, COL16, COL17, COL18, COL19, COL20, COL21, COL22, COL23
--)

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
  '0' AS DECIMAL_POS,
  REPLACE(REPLACE(REPLACE(CR.DENUMIRE,'<b>',''),'</b>',''),'<br>','') NUME_ROW,
  
   ROUND(SUM(CASE WHEN CD.CFP LIKE '%'||D.CFP||'%' AND CR.RIND = MR.RIND THEN  D.COL1 END),1) AS COL1
   
  
  

  
        FROM CIS2.VW_DATA_ALL D
                    INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD =  D.ID_MD
                    
                    
                      CROSS JOIN
  (     
    SELECT 'Forme de Proprietate- Total pe Republica' AS NUME_ROW,            '01' AS NR_ROW, '11-12-13-14-15-16-17-18-19-20-22-23-24-25-26-27-28-29' AS CFP FROM DUAL UNION
    SELECT 'Proprietate proprietatea publica' AS NUME_ROW,                    '02' AS NR_ROW, '11-12-13'          AS CFP FROM DUAL UNION 
    SELECT 'Proprietate proprietatea privata - total' AS NUME_ROW,            '03' AS NR_ROW, '14-15-16-17-18-19-29' AS CFP FROM DUAL UNION     
    SELECT 'Proprietate proprietatea mixta (publica si privata)' AS NUME_ROW, '04' AS NR_ROW, '20'                AS CFP FROM DUAL UNION 
    SELECT 'Proprietate proprietatea straina' AS NUME_ROW,                    '05' AS NR_ROW, '22-23-24-25-26-27' AS CFP FROM DUAL UNION 
    SELECT 'Proprietate a intreprinderilor mixte' AS NUME_ROW,                '06' AS NR_ROW, '28'                AS CFP FROM DUAL    

  ) CD
  
  
  CROSS JOIN (
                    
SELECT 
    R.RIND,
    REPLACE(REPLACE(REPLACE(R.DENUMIRE,'<b>',''),'</b>',''),'<br>','') DENUMIRE,
    R.ORDINE

    FROM CIS2.MD_RIND R 
    
    WHERE 
    R.CAPITOL IN (1176) 
                    ) CR 
    
        
        WHERE
          D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
  D.FORM IN (69)                 AND 
  D.CAPITOL IN (1176)  
 
        
                
  GROUP BY 
  CD.NR_ROW,   
  CD.NUME_ROW,
  CR.RIND,
  CR.ORDINE,
  CR.DENUMIRE
  
 