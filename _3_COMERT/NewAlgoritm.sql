










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
                 R.RIND AS NR_ROW,
                 TO_NUMBER(R.RIND) AS ORDINE,
                 '11' AS DECIMAL_POS,
                 R.DENUMIRE AS NUME_ROW,
                 SUM(CASE WHEN R.ID_MD = D.ID_MD AND  D.PERIOADA IN (:pPERIOADA) THEN   D.COL1 ELSE NULL END) COL1,
                 SUM(CASE WHEN R.ID_MD = D.ID_MD AND  D.PERIOADA IN (:pPERIOADA-1) THEN D.COL1 ELSE NULL END) COL2
                
                    FROM CIS2.DATA_ALL D
                    
                        INNER JOIN CIS2.MD_RIND MR ON  (TRIM(MR.ID_MD) = TRIM(D.ID_MD))
                        INNER JOIN CIS2.RENIM RE ON (TRIM(RE.CUIIO) = TRIM(D.CUIIO) AND TRIM(D.CUIIO_VERS) = TRIM(RE.CUIIO_VERS))
                        INNER JOIN CIS2.VW_CL_CUATM C ON (TRIM(C.CODUL) = TRIM(RE.CUATM))
                    
                    
                     CROSS JOIN ( SELECT  DISTINCT R.DENUMIRE, R.RIND, R.ID_MD FROM CIS2.MD_RIND R 
                     WHERE R.CAPITOL IN (357, 358) AND R.RIND_VERS >= 2006 AND R.STATUT = '1' ) R
                    
                    WHERE 
                    MR.CAPITOL IN (357,358) AND
                    D.FORM_VERS = :pFORM_VERS AND
                    D.PERIOADA IN (:pPERIOADA, :pPERIOADA-1) AND 
                    D.FORM IN (21)
                    AND  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
                    AND R.ID_MD = D.ID_MD 
                    
                   GROUP BY
                   R.DENUMIRE,
                   R.RIND
                 
                    ORDER BY
                        R.RIND  
                
                     
                
                    