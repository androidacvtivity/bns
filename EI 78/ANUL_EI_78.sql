INSERT INTO   USER_BANCU.TABLE_OUT_TEST 
    
    -- CIS2.TABLE_OUT
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
       
      COL1, COL2, COL3,  COL4
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
     C.ORDINE NR_ROW,
     C.ORDINE   AS ORDINE,
     '1111' AS DECIMAL_POS,
     c.denumire NUME_ROW,
     ROUND(R.COL1 / 1000,1)   AS COL1,
     ROUND(R.COL2 / 1000,1)   AS COL2,
     ROUND(R.COL3 / 1000,1)   AS COL3,
     ROUND(R.COL4 / 1000,1)   AS COL4
  FROM 

  (
           SELECT   
            c.codul,
            c.denumire,
            c.grupa,
            ROWNUM ordine,
            c.full_code
            
            FROM CIS2.VW_CL_CAEM2 C
            
            WHERE 
            C.CODUL LIKE '%0000'
            
            ORDER BY 
            c.full_code
            ) C 
            LEFT JOIN
            
            (
            
            SELECT 
    CC.CODUL,
    CC.DENUMIRE, 
    SUM(CASE WHEN  D.CAPITOL IN (409)  AND D.RIND IN ('1') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  AS COL1,
 
    SUM(CASE WHEN  D.CAPITOL IN (409)  AND D.RIND IN ('1') AND D.COL5 IS NOT NULL THEN D.COL5 ELSE 0 END )  AS COL2,
    
    SUM(CASE WHEN  D.CAPITOL IN (411)  AND D.RIND IN ('1') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  AS COL3,
    
    SUM(CASE WHEN  D.CAPITOL IN (411)  AND D.RIND IN ('1') AND D.COL5 IS NOT NULL THEN D.COL5 ELSE 0 END )  AS COL4
 

 FROM
    
    CIS2.VW_DATA_ALL D 
    
         INNER JOIN     CIS2.VW_CL_CAEM2 C  ON  (C.CODUL=D.CAEM2)
         INNER JOIN     CIS2.VW_CL_CAEM2 CC  ON (C.FULL_CODE LIKE '%' ||CC.CODUL||';%' )   
     
      
      

WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46) AND D.CAPITOL IN (409,411)  AND D.RIND IN ('1')
  
 AND CC.CODUL LIKE '%0000'

  
  GROUP BY 
  CC.CODUL,
  CC.DENUMIRE,
  CC.FULL_CODE
  
  ORDER BY 
  CC.FULL_CODE
   
   
   )     R  ON (R.CODUL = C.CODUL)
            
           
   
   ORDER BY 
   C.ORDINE