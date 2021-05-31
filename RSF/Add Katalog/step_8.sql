--INSERT INTO FORM_CUIIO (
--
--        CUIIO,
--        CUIIO_VERS,
--        FORM,
--        FORM_VERS,
--        STATUT
--)



        SELECT 
        L.CUIIO,
        L.CUIIO_VERS,
        63 FORM,
        2000 FORM_VERS,
        '1' STATUT
        
        FROM USER_BANCU.KAT_RSF L
        
        
        WHERE
        
        CUIIO NOT IN (
        40841040,
41003708,
41315499,
41390651

        )