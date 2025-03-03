﻿SELECT 
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
         MR.RIND||'~'||SUM(ROWNUM) AS NR_ROW, 
         MR.ORDINE ORDINE, 
         '0000000000000' AS DECIMAL_POS,  
       
         MR.DENUMIRE NUME_ROW, 
         SUM(CASE WHEN  MR.RIND = R.RIND     THEN  D.COL1  ELSE NULL END) AS COL1,
         SUM(CASE WHEN  MR.RIND = R.RIND     THEN  D.COL2  ELSE NULL END) AS COL2,
         SUM(CASE WHEN  MR.RIND = R.RIND     THEN  D.COL3  ELSE NULL END) AS COL3,
         SUM(CASE WHEN  MR.RIND = R.RIND     THEN  D.COL4  ELSE NULL END) AS COL4,
         SUM(CASE WHEN  MR.RIND = R.RIND     THEN  D.COL5  ELSE NULL END) AS COL5,
         SUM(CASE WHEN  MR.RIND = R.RIND     THEN  D.COL6  ELSE NULL END) AS COL6,
         SUM(CASE WHEN  MR.RIND = R.RIND     THEN  D.COL7  ELSE NULL END) AS COL7,
         SUM(CASE WHEN  MR.RIND = R.RIND     THEN  D.COL8  ELSE NULL END) AS COL8,
         SUM(CASE WHEN  MR.RIND = R.RIND     THEN  D.COL9  ELSE NULL END) AS COL9,
         SUM(CASE WHEN  MR.RIND = R.RIND     THEN  D.COL10  ELSE NULL END) AS COL10,
         SUM(CASE WHEN  MR.RIND = R.RIND     THEN  D.COL11  ELSE NULL END) AS COL11,
         SUM(CASE WHEN  MR.RIND = R.RIND     THEN  D.COL12  ELSE NULL END) AS COL12,
         SUM(CASE WHEN  MR.RIND = R.RIND     THEN  D.COL13  ELSE NULL END) AS COL13
        
        
FROM
  VW_DATA_ALL_GC  D
  INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
  
  CROSS JOIN (
  SELECT 
            
            RIND,
            DENUMIRE,
            ORDINE    
            
            
            FROM    MD_RIND
            
            WHERE 
            
            form = 62
            
            AND CAPITOL = 1117
           
        ) MR     
     
  
  
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND 
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (62)  AND
  D.CAPITOL IN (1117)
  
  
  GROUP BY 
  MR.RIND,
  MR.ORDINE,
  MR.DENUMIRE
  
    ORDER BY 
  ORDINE
   
  