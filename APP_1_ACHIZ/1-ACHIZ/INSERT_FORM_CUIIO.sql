--          INSERT INTO CIS2.FORM_CUIIO
--                 (
--                 CUIIO,
--                 CUIIO_VERS,
--                 FORM,
--                 FORM_VERS,
--                 STATUT  
--                 )

            SELECT 
            
                 CUIIO,
                 CUIIO_VERS,
                 4  FORM,
                 2000 FORM_VERS,
                 '1' STATUT  
            
            FROM CIS2.RENIM
            
            WHERE 
           CUIIO IN (
2932564,
40008543,
40496494,

41103321,
41121744,
41172730,
41231266,
41292285
)

AND CUIIO_VERS IN (2007)