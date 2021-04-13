--INSERT INTO CIS2.FORM_CUIIO 
--
--(
--
--CUIIO,
--CUIIO_VERS,
--FORM,
--FORM_VERS,
--STATUT
--)


SELECT 
CUIIO,
CUIIO_VERS,
63 FORM,
2000 FORM_VERS,
'1' STATUT

    FROM USER_BANCU.KAT_RSF
    
   WHERE 
   1=1
--    
--    CUIIO IN (
--    SELECT 
--CUIIO
--
--
--    FROM USER_BANCU.KAT_RSF
--    
--   
--    
--    )
--    
--    AND CUIIO_VERS = 2009
--    AND FORM = 57
    
    
--    CUIIO NOT IN 
--    
--    (40433217,40523630)
