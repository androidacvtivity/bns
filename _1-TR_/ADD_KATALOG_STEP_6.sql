



SELECT CUIIO

            from CIS2.FORM_CUIIO
            
            WHERE 
            
            FORM IN (4)

AND CUIIO IN (
SELECT 
    CUIIO
            FROM USER_BANCU.KAT_1_TR_AUTO )
            AND CUIIO_VERS = 2010