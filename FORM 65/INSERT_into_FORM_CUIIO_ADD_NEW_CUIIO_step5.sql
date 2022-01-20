--INSERT into FORM_CUIIO (
--
--  CUIIO,
--  CUIIO_VERS, 
--  FORM, 
--  form_vers,
--  statut 
--)

SELECT 
  L.CUIIO,
  L.CUIIO_VERS, 
  5 FORM, 
  1004 form_vers,
  '1' statut     
FROM USER_BANCU.KAT_CAEM2 L

      