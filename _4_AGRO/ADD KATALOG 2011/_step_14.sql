--            INSERT INTO CIS2.FORM_CUIIO
--            
--             (
--            
--                   CUIIO,
--                   CUIIO_VERS,
--                   FORM,
--                   FORM_VERS,
--                   STATUT 
--            
--            )


SELECT 
                    CUIIO,
                    CUIIO_VERS,
                    73 FORM,
                    2000 FORM_VERS,
                    '1' STATUT 
        
            FROM CIS2.RENIM 
            
            WHERE 
            
            CUIIO IN (
4076589,
4495702,
4495665,
4495659,
4495725,
4495754,
4928512,
4495731,
4495760,
4498925,
4495719,
4495866,
4499485,
4495671,
4495872,
4495783,
4928503,
37672964,
4495799,
4495808,
4495820,
4495814,
4495777,
4495837,
4495843,
4495853,
4495694


)  AND CUIIO_VERS = 2010