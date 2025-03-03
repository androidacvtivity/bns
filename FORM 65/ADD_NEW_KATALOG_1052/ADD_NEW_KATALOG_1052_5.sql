SELECT 
L.CUIIO
 FROM USER_BANCU.KAT_65_AUTO L LEFT JOIN (
 
 SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (5) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (5) AND FC.STATUT <> '3'
             
            AND FC.CUIIO_VERS =  1052
 
 ) R ON R.CUIIO = L.CUIIO
 
 
 WHERE 
 R.CUIIO IS NOT  NULL
 