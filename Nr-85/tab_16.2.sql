                        
                       
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
     ROWNUM                  NR_ROW,
     ROWNUM   ORDINE,
    '00000000' AS DECIMAL_POS,
     NUME_ROW,
     CUIIO COL1,
     COL1 COL2,
     COL2 COL3,
     COL3 COL4,
     COL4 COL5,
     COL5 COL6
     
    
          FROM
                       ( 
                        SELECT  
                           
                           DISTINCT  D.CUIIO,
                           MAX(R.DENUMIRE)  NUME_ROW,
                           SUM(CASE WHEN MR.CAPITOL IN (1001) AND MR.RIND IN ('010') THEN D.COL1 ELSE NULL END ) AS COL1, 
                           SUM(CASE WHEN MR.CAPITOL IN (1001) AND MR.RIND IN ('010') THEN D.COL2 ELSE NULL END ) AS COL2, 
                           SUM(CASE WHEN MR.CAPITOL IN (1002) AND MR.RIND IN ('010') THEN D.COL1 ELSE NULL END ) AS COL3,
                           SUM(CASE WHEN MR.CAPITOL IN (1007) AND MR.RIND IN ('010') THEN D.COL1 ELSE NULL END ) AS COL4,
                           SUM(CASE WHEN MR.CAPITOL IN (1007) AND MR.RIND IN ('130') THEN D.COL1 ELSE NULL END ) AS COL5
                              
                        FROM CIS2.DATA_ALL D
                              
                                INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS
                                INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM
                                INNER JOIN CIS2.MD_RIND MR  ON   MR.ID_MD =D.ID_MD 
                                
                                
                                
                         WHERE 
                         
                         D.PERIOADA IN (:pPERIOADA)  
                         AND D.FORM IN (:pFORM) 
                         AND  (D.FORM_VERS =:pFORM_VERS) AND 
                         (:pID_MDTABLE=:pID_MDTABLE)  AND 
                         D.FORM = 17 AND 
                         MR.CAPITOL IN (1007,1001,1002)
                    
                     
                   --     AND D.CUIIO IN (7001770)  
                        
                        GROUP BY 
                        D.CUIIO
                       )