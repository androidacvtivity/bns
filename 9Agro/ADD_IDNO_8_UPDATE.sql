 SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM

(
 SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (39) AND CUIIO_VERS <= 2010
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (39) 
             AND FC.STATUT <> '3'
             AND FC.CUIIO_VERS = 2010 ) FC
             
             LEFT JOIN (
             SELECT 
            CUIIO
            
               FROM  USER_BANCU.KAT_9_AGRO 
             
             ) R ON R.CUIIO = FC.CUIIO 
             
             
             WHERE 
             
             R.CUIIO IS NOT NULL
             
             
           