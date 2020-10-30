











            SELECT 
             
--            
                      CC.CODUL,
                      CC.DENUMIRE,
                    COUNT (DISTINCT D.CUIIO) AS CNT
                   --   R.DENUMIRE
             
            
             FROM CIS2.VW_DATA_ALL D
                              
                              INNER JOIN CIS2.RENIM R ON   R.CUIIO          = D.CUIIO 
                                                      AND  R.CUIIO_VERS     = D.CUIIO_VERS
                              ------------------------------------------------------------
                                                      INNER JOIN CIS2.VW_CL_CUATM C ON (C.CODUL = D.CUATM)
                                                      INNER JOIN CIS2.VW_CL_CUATM CC ON C.FULL_CODE LIKE '%'||CC.CODUL||'%%' 
             
             WHERE 
             D.PERIOADA IN (:pPERIOADA) 
             AND D.FORM IN (:pFORM)
             
             
             GROUP BY 
                      CC.CODUL,
                      CC.DENUMIRE,
                      CC.FULL_CODE
                      
                      ORDER BY 
                      CC.FULL_CODE
--                      D.CUIIO,
--                      R.DENUMIRE