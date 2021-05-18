   
--INSERT INTO CIS.FORM_CUIIO (
--
-- CUIIO,
--   CUIIO_VERS,
--    FORM,
--   FORM_VERS,
--   STATUT 
--)   

   
   SELECT 
   CUIIO,
   CUIIO_VERS,
   1 FORM,
   1004 FORM_VERS,
   '1' STATUT 
   
   
   FROM USER_BANCU.KAT_RSF 
   
   
   WHERE 
   
   CUIIO NOT IN (
   38828820,
41043820

   )