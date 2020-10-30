--            
--            INSERT INTO CIS2.FORM_CUIIO 
--            
--            (
--                CUIIO,
--                CUIIO_VERS,
--                FORM,
--                FORM_VERS,
--                STATUT 
--            
--            )


SELECT 
                 L.CUIIO,
                 L.CUIIO_VERS,
                 L.FORM,
                 L.FORM_VERS,
                 L.STATUT 
                 FROM

    (
            SELECT 
                 CUIIO,
                 2008 CUIIO_VERS,
                 4 FORM,
                 2000 FORM_VERS,
                 '1' STATUT 
             
                FROM USER_BANCU.RENIM_1_TR_AUTO 
                
                )L 
                
                                        LEFT JOIN CIS2.FORM_CUIIO  R ON L.CUIIO = R.CUIIO 
                                        AND R.FORM  = L.FORM
                                        AND R.CUIIO_VERS = L.CUIIO_VERS  
                                        AND R.FORM_VERS = L.FORM_VERS
                                        AND R.STATUT = L.STATUT
                                        
                                        
                                        
                                        WHERE 
                                        
                                        R.CUIIO IS NOT   NULL
                                       

ORDER BY 
 L.CUIIO