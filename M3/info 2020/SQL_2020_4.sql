






SELECT CUIIO,
CUIIO_VERS,
FORM,
FORM_VERS,
STATUT


            FROM CIS2.FORM_CUIIO 
            
            WHERE 
            
            CUIIO IN (
            SELECT DISTINCT D.CUIIO
                        
        
        
                FROM CIS2.VW_DATA_ALL D
                
                        INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
                        
                        
                        WHERE 
                        D.PERIOADA = 2009
                        AND D.FORM = 3
                       
                        
                       -- AND  (C.FULL_CODE LIKE '%' ||:pCOD_CUATM||';%') 
            )
            
            AND FORM = 3  AND CUIIO_VERS = 2009
            
            AND STATUT <> '1'