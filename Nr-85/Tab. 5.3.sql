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
--   COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8, COL9, COL10, COL11, COL12, COL13, COL14, COL15, COL16, COL17, COL18, COL19, COL20, COL21, COL22, COL23
--)

SELECT
  :pPERIOADA,
  :pFORM,
  :pFORM_VERS,
  :pID_MDTABLE,
  :pCOD_CUATM,
   NT.CODUL AS NR_SECTIE,
   NT.DENUMIRE NUME_SECTIE,
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,
  CR.RIND AS NR_ROW, 
  CR.ORDINE AS ORDINE,
  '0' AS DECIMAL_POS,
  REPLACE(REPLACE(REPLACE(CR.DENUMIRE,'<b>',''),'</b>',''),'<br>','') NUME_ROW,
   
  ROUND(SUM( CASE WHEN CR.RIND = MR.RIND THEN D.COL1  ELSE NULL END ),0) AS COL1
  
  


  
        FROM CIS2.VW_DATA_ALL D
                    INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD =  D.ID_MD
                    
                    INNER JOIN CIS2.RENIM R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS)
                    INNER JOIN CIS2.CL_NTII NT ON NT.CODUL = R.NTII 
                    
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
  CR.RIND,
  CR.ORDINE,
  CR.DENUMIRE,
  NT.CODUL,
  NT.DENUMIRE 