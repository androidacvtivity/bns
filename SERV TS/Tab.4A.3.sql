--INSERT INTO  TABLE_OUT
--(   
--    PERIOADA,
--    FORM,
--    FORM_VERS,
--    ID_MDTABLE,
--    COD_CUATM,
--    NR_SECTIE,
--    NUME_SECTIE,
--    NR_SECTIE1,
--    NUME_SECTIE1,
--    NR_SECTIE2,
--    NUME_SECTIE2,
--    NR_ROW,
--    ORDINE,
--    DECIMAL_POS,
--    NUME_ROW,
--    COL1,
--      COL2,
--      COL3,
--      COL4,
--      COL5,
--      COL6
--   
--   
--)
--

    SELECT   


:pPERIOADA AS PERIOADA,
:pFORM AS FORM,
:pFORM_VERS AS FORM_VERS,
:pID_MDTABLE AS ID_MDTABLE,
:pCOD_CUATM AS COD_CUATM, 
 NR_SECTIE  AS NR_SECTIE,
NUME_SECTIE  AS NUME_SECTIE,
 
'0' AS NR_SECTIE1,
'0' AS NUME_SECTIE1,
'0' AS NR_SECTIE2,
'0' AS NUME_SECTIE2,
 
      NR_ROW,
      ORDINE,
     '000000' AS DECIMAL_POS, 
      NUME_ROW,
     COL1,
      COL2,
      COL3,
      COL4,
      COL5,
      COL6
      
   
      FROM
 
      
     (         
      SELECT
      CFP.CODUL AS NR_SECTIE,
      CFP.DENUMIRE AS NUME_SECTIE,
     '010' AS NR_ROW,
      1  AS ORDINE,
      ' Total educatori, metodişti' AS NUME_ROW,
    
     CIS2.NVAL(SUM(CASE WHEN  D.RIND IN ('042')  THEN D.COL1 ELSE NULL END)) +
     CIS2.NVAL(SUM(CASE WHEN  D.RIND IN ('041')  THEN D.COL1 ELSE NULL END))
     AS   COL1,
        
     CIS2.NVAL(SUM(CASE WHEN  D.RIND IN ('041')  THEN D.COL2 ELSE NULL END)) +
     CIS2.NVAL(SUM(CASE WHEN  D.RIND IN ('042')  THEN D.COL2 ELSE NULL END)) 
     AS   COL2,
     
     
     CIS2.NVAL(SUM(CASE WHEN  D.RIND IN ('042')  THEN D.COL7 ELSE NULL END)) + 
     
     
     CIS2.NVAL(SUM(CASE WHEN  D.RIND IN ('041')  THEN D.COL7 ELSE NULL END))
        AS   
     
     
     COL3,
     
     CIS2.NVAL(SUM(CASE WHEN  D.RIND IN ('100')  THEN D.COL1 ELSE NULL END)) +
     
     CIS2.NVAL(SUM(CASE WHEN  D.RIND IN ('080')  THEN D.COL1 ELSE NULL END))
     
     
        AS   COL4,
     
     
     CIS2.NVAL(SUM(CASE WHEN  D.RIND IN ('042')  THEN D.COL8 ELSE NULL END)) +
     CIS2.NVAL(SUM(CASE WHEN  D.RIND IN ('041')  THEN D.COL8 ELSE NULL END))
     
        AS   COL5,
        
        
     CIS2.NVAL(SUM(CASE WHEN  D.RIND IN ('110')  THEN D.COL1 ELSE NULL END)) +
     CIS2.NVAL(SUM(CASE WHEN  D.RIND IN ('090')  THEN D.COL1 ELSE NULL END)) 
     
        AS   COL6
       
       FROM    
             CIS2.VW_DATA_ALL D    
                   
                   INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)    
                   
                   INNER JOIN CIS2.VW_CL_CFP CC ON  (CC.CODUL=D.CFP)
                   INNER JOIN CIS2.VW_CL_CFP CFP ON (CC.FULL_CODE LIKE '%'||CFP.CODUL||';%')   
                
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 AND
               D.CAPITOL IN (1004)
               AND 
               CIS2.CFP.GRUPA IN (10)

             GROUP BY
               CFP.CODUL,
               CFP.DENUMIRE

UNION 

  SELECT
     
      CFP.CODUL AS NR_SECTIE,
      CFP.DENUMIRE AS NUME_SECTIE,
     '020' AS NR_ROW,
      2  AS ORDINE,
     ' în grupe de creșă' AS NUME_ROW,
    
     SUM(CASE WHEN  D.RIND IN ('041')  THEN D.COL1 ELSE NULL END)   AS   COL1,   
     SUM(CASE WHEN  D.RIND IN ('041')  THEN D.COL2 ELSE NULL END)   AS   COL2,
     SUM(CASE WHEN  D.RIND IN ('041')  THEN D.COL7 ELSE NULL END)   AS   COL3,
     SUM(CASE WHEN  D.RIND IN ('080')  THEN D.COL1 ELSE NULL END)   AS   COL4,
     SUM(CASE WHEN  D.RIND IN ('041')  THEN D.COL8 ELSE NULL END)   AS   COL5,
     SUM(CASE WHEN  D.RIND IN ('090')  THEN D.COL1 ELSE NULL END)   AS   COL6
       
       FROM    
             CIS2.VW_DATA_ALL D    
                   
                   INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)    
                   
                   INNER JOIN CIS2.VW_CL_CFP CC ON  (CC.CODUL=D.CFP)
                   INNER JOIN CIS2.VW_CL_CFP CFP ON (CC.FULL_CODE LIKE '%'||CFP.CODUL||';%')   
                   
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 AND
               D.CAPITOL IN (1004)
               
               
                AND 
               CIS2.CFP.GRUPA IN (10)
               
                GROUP BY
               CFP.CODUL,
               CFP.DENUMIRE
               
               
               UNION 
               
               
   SELECT
     CFP.CODUL AS NR_SECTIE,
      CFP.DENUMIRE AS NUME_SECTIE,
     '030' AS NR_ROW,
      3  AS ORDINE,
      'în grupe mari și mixte' AS NUME_ROW,
    
     SUM(CASE WHEN  D.RIND IN ('042')  THEN D.COL1 ELSE NULL END)   AS   COL1,   
     SUM(CASE WHEN  D.RIND IN ('042')  THEN D.COL2 ELSE NULL END)   AS   COL2,
     SUM(CASE WHEN  D.RIND IN ('042')  THEN D.COL7 ELSE NULL END)   AS   COL3,
     SUM(CASE WHEN  D.RIND IN ('100')  THEN D.COL1 ELSE NULL END)   AS   COL4,
     SUM(CASE WHEN  D.RIND IN ('042')  THEN D.COL8 ELSE NULL END)   AS   COL5,
     SUM(CASE WHEN  D.RIND IN ('110')  THEN D.COL1 ELSE NULL END)   AS   COL6
       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
                   INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)    
                   
                   INNER JOIN CIS2.VW_CL_CFP CC ON  (CC.CODUL=D.CFP)
                   INNER JOIN CIS2.VW_CL_CFP CFP ON (CC.FULL_CODE LIKE '%'||CFP.CODUL||';%')   
    
                
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 AND
               D.CAPITOL IN (1004)


             AND 
             CIS2.CFP.GRUPA IN (10)

            GROUP BY
               CFP.CODUL,
               CFP.DENUMIRE
         ) 