--   INSERT INTO CIS2.FORM_CUIIO 
--   (
--       CUIIO,
--       CUIIO_VERS,
--       FORM,
--       FORM_VERS,
--       STATUT 
--   )
--   
   
   SELECT 
       L.CUIIO,
       L.CUIIO_VERS,
       4 FORM,
       2000 FORM_VERS,
       '1' STATUT 
       
       
   FROM  USER_BANCU.TR_AUTO_2020_V2 L 
   
   
   LEFT JOIN 
   
   
                                        CIS2.FORM_CUIIO FC ON L.CUIIO = FC.CUIIO AND L.CUIIO_VERS = FC.CUIIO_VERS  AND FC.FORM = 4 
                                        
                                        
                                        WHERE 
                                        FC.CUIIO IS  NULL 