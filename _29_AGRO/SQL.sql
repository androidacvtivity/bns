












            SELECT 
            
            DISTINCT  D.CUIIO,
                      R.DENUMIRE,
                      R.CUATM,
                      R.CAEM2,
                      R.CFP,
                      R.CFOJ,
                      D.CUATM_FULL
                      
            
            
            
            FROM CIS2.VW_DATA_ALL D
            
            
                        INNER JOIN CIS2.RENIM R ON R.CUIIO  = D.CUIIO AND R.CUIIO_VERS  = D.CUIIO_VERS 
            
            WHERE 
            
            
            D.PERIOADA IN (:pPERIOADA)
            
            AND D.FORM IN (:pFORM)
            
            AND 
            
            (
            D.RIND  IN ('70') 
            OR 
            D.RIND  IN ('72')
            ) 
            
            AND D.COL10 IS NOT NULL
            
            
            
            
            
            ORDER BY 
            D.CUATM_FULL
            