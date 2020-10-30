
 INSERT INTO  CIS2.TABLE_OUT
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
       
      COL1
    )   

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
         MR.RIND||'~'||SUM(ROWNUM) AS NR_ROW, 
         MR.RIND ORDINE, 
         '00000' AS DECIMAL_POS,  
       
         MR.DENUMIRE NUME_ROW, 
         SUM(CASE WHEN  MR.RIND = R.RIND     THEN  D.COL1  ELSE NULL END) AS COL1
        
        
        
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
            
            form = 58
            
            AND CAPITOL = 418
           
        ) MR     
     
  
  
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND 
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (58)  AND
  D.CAPITOL IN (418)
  
  
  GROUP BY 
  MR.RIND,
  MR.ORDINE,
  MR.DENUMIRE
  
  ORDER BY 
  ORDINE
  