--SELECT FC.CUIIO,
--       FC.CUIIO_VERS
--                  
--              FROM
--(
SELECT FC.CUIIO,
       FC.CUIIO_VERS
                  
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (46) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (46) AND FC.STATUT <> '3' 
             
--             ) FC 
--             
--
--WHERE 
--
--FC.CUIIO_VERS =   2010