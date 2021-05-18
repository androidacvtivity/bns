--INSERT INTO CIS.RENIM  
--(
--
--CUIIO,
--    CUIIO_VERS,
--    DENUMIRE,
--    EDIT_USER,
--    STATUT,
--    CUATM,
--    CFP,
--    CFOJ,
--    COCM,
--    CAEM,
--    BUGET,
--    TIP,
--    PROD,
--    FOR_CUB,
--    ETAPA_PROD,
--    RENIM_PERS,
--    CAEM2
--
--)



SELECT 
    CUIIO,
    1048 CUIIO_VERS,
    DENUMIRE,
    EDIT_USER,
    STATUT,
    CUATM,
    CFP,
    CFOJ,
    COCM,
    CAEM,
    BUGET,
    TIP,
    PROD,
    FOR_CUB,
    ETAPA_PROD,
    RENIM_PERS,
    CAEM2


FROM USER_BANCU.VW_MAX_RENIM_TRIM_CIS

WHERE 

CUIIO IN (

SELECT CUIIO 
FROM USER_BANCU.KAT_RSF

)


AND CUIIO_VERS <> 1048

