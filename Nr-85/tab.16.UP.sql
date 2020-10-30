SELECT 
        1 ORDINE, 
        CODUL,
        DENUMIRE,
        FULL_CODE,
        0000000 CUIIO,
        'Total' AS NUME_ROW,
        SUM(COL1) AS COL1,
        SUM(COL2) AS COL2,
        SUM(COL3) AS COL3,
        SUM(COL4) AS COL4,
        SUM(COL5) AS COL5
        FROM
        
(

SELECT  
                           CC.CODUL,
                           CC.DENUMIRE,
                           CC.FULL_CODE,
                           D.CUIIO,
                           MAX(R.DENUMIRE)  NUME_ROW,
                           SUM(CASE WHEN MR.CAPITOL IN (1001) AND MR.RIND IN ('010') THEN D.COL1 ELSE NULL END ) AS COL1, 
                           SUM(CASE WHEN MR.CAPITOL IN (1001) AND MR.RIND IN ('010') THEN D.COL2 ELSE NULL END ) AS COL2, 
                           SUM(CASE WHEN MR.CAPITOL IN (1002) AND MR.RIND IN ('010') THEN D.COL1 ELSE NULL END ) AS COL3,
                           SUM(CASE WHEN MR.CAPITOL IN (1007) AND MR.RIND IN ('010') THEN D.COL2 ELSE NULL END ) AS COL4,
                           SUM(CASE WHEN MR.CAPITOL IN (1007) AND MR.RIND IN ('130') THEN D.COL1 ELSE NULL END ) AS COL5
                              
                        FROM CIS2.DATA_ALL D
                              
                                INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS
                                INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM
                                INNER JOIN CIS2.VW_CL_CUATM CC ON C.FULL_CODE LIKE '%'||CC.CODUL||';%'
                                INNER JOIN CIS2.MD_RIND MR  ON   MR.ID_MD =D.ID_MD 
                                
                                
                                
                         WHERE 
                         
                         D.PERIOADA IN (:pPERIOADA)  
                         AND D.FORM IN (:pFORM) 
                         AND  (D.FORM_VERS =:pFORM_VERS) AND 
                         (:pID_MDTABLE=:pID_MDTABLE)  AND 
                         D.FORM = 17 AND 
                         MR.CAPITOL IN (1007,1001,1002)
                    
                        AND CC.PRGS IN ('2') 
                        AND CC.CODUL  NOT IN ('1111111','2222222','3333333')
                   
                        
                        GROUP BY 
                        D.CUIIO,
                        CC.CODUL,
                        CC.DENUMIRE,
                        CC.FULL_CODE

                        ORDER BY
                        CC.FULL_CODE
                        
                        
                        
                       )
                        
                       
                       GROUP BY 
                        CODUL,
                        DENUMIRE,
                        FULL_CODE