SELECT 

                 CA.CODUL,
                 CA.DENUMIRE,  
                 CA.FULL_CODE, 
                 SUM(CASE WHEN MR.RIND IN ('100')   THEN   D.COL1 ELSE NULL END) COL1,
                 SUM(CASE WHEN MR.RIND IN ('100')   THEN   D.COL2 ELSE NULL END) COL2
                
                    FROM CIS2.DATA_ALL D
                    
                        INNER JOIN CIS2.MD_RIND MR ON  (MR.ID_MD = D.ID_MD)
                        INNER JOIN CIS2.RENIM RE ON (RE.CUIIO = D.CUIIO AND D.CUIIO_VERS = RE.CUIIO_VERS)
                        INNER JOIN CIS2.VW_CL_CUATM C ON (C.CODUL = RE.CUATM)
                        INNER JOIN CIS2.VW_CL_CAEM2 CA ON (RE.CAEM2=CA.CODUL)
                    
                     
                    
                    WHERE 
                    MR.CAPITOL IN (357,358) AND
                    D.FORM_VERS = :pFORM_VERS AND
                    D.PERIOADA IN (:pPERIOADA) AND 
                    D.FORM IN (21)
                    AND  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
               
                    
                 GROUP BY
                    CA.CODUL,
                    CA.DENUMIRE,
                    CA.FULL_CODE
                 ORDER BY
                    CA.FULL_CODE
