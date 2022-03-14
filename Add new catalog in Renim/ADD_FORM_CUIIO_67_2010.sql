--
--INSERT INTO CIS2.FORM_CUIIO (
--                    CUIIO,
--                    CUIIO_VERS,
--                    FORM,
--                    FORM_VERS,
--                    STATUT 
--)


SELECT 
                    R.CUIIO,
                    2010 CUIIO_VERS,
                    36  FORM,
                    2000 FORM_VERS,
                    '1'   STATUT 
               
               
               FROM cis2.RENIM R
             where 
             
             CUIIO IN (
select cuiio  FROM 

USER_BANCU.AGRO_34
)

AND CUIIO_VERS IN (2010)


