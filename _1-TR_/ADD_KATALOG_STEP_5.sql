--   INSERT INTO CIS2.FORM_CUIIO 
--   (
--       CUIIO,
--       CUIIO_VERS,
--       FORM,
--       FORM_VERS,
--       STATUT 
--   )
--   
--   
   SELECT 
       L.CUIIO,
       L.CUIIO_VERS,
       4 FORM,
       2000 FORM_VERS,
       '1' STATUT 
       
       
   FROM  USER_BANCU.KAT_1_TR_AUTO L 
   
   WHERE 
   L.CUIIO NOT IN (
   


SELECT CUIIO

            from CIS2.FORM_CUIIO
            
            WHERE 
            
            FORM IN (4)

AND CUIIO IN (
SELECT 
    CUIIO
            FROM USER_BANCU.KAT_1_TR_AUTO )
            AND CUIIO_VERS = 2010
   )
   
