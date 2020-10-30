                 SELECT
                 R.RIND,
                 D.CUIIO,
                 --TO_NUMBER(R.RIND) AS ORDINE,
               
                 RE.DENUMIRE AS NUME_ROW,
                 RE.CAEM2,
                 RE.CUATM,
                 D.PACHET,
                 SUM(CASE WHEN R.ID_MD = D.ID_MD  THEN   D.COL1 ELSE NULL END) COL1,
                 SUM(CASE WHEN R.ID_MD = D.ID_MD  THEN   D.COL2 ELSE NULL END) COL2
                
                    FROM CIS2.DATA_ALL D
                    
                        INNER JOIN CIS2.MD_RIND MR ON  (MR.ID_MD = D.ID_MD)
                        INNER JOIN CIS2.RENIM RE ON (RE.CUIIO = D.CUIIO AND D.CUIIO_VERS = RE.CUIIO_VERS)
                        INNER JOIN CIS2.VW_CL_CUATM C ON (C.CODUL = RE.CUATM)
                    
                    
                     CROSS JOIN ( 
                     
                     SELECT  DISTINCT R.DENUMIRE, R.RIND, R.ID_MD FROM CIS2.MD_RIND R 
                     WHERE R.CAPITOL IN (357, 358) AND R.RIND_VERS >= 2007 AND R.STATUT = '1'
                     
                     AND R.RIND IN ('111','213','221','224','257','271','276') 
                     
                     
                     ) R
                    
                    WHERE 
                    MR.CAPITOL IN (357,358) AND
                    D.FORM_VERS = :pFORM_VERS AND
                    D.PERIOADA IN (:pPERIOADA) AND 
                    D.FORM IN (21)
                    AND  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
                    AND R.ID_MD = D.ID_MD
                --    AND  D.CUIIO IN (1398418)
                         
                   
                    
                    
                   GROUP BY
                   D.CUIIO,
                   RE.DENUMIRE,
                   R.RIND,
                   C.FULL_CODE,
                   RE.CAEM2,
                   RE.CUATM,
                   D.PACHET
                   
                   
                   
                   HAVING 
                   
                 SUM(CASE WHEN R.ID_MD = D.ID_MD  THEN   D.COL1 ELSE 0  END) > 0
                 
                 OR 
                 
                 SUM(CASE WHEN R.ID_MD = D.ID_MD  THEN   D.COL2 ELSE 0 END)  > 0
                   
                   ORDER BY 
                   
                   C.FULL_CODE,
                --   R.RIND,
                   D.CUIIO,
                   R.RIND 