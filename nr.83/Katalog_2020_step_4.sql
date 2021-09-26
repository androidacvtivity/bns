
--
--
--INSERT INTO CIS2.FORM_CUIIO (
--            CUIIO,
--            CUIIO_VERS,
--            FORM,
--            FORM_VERS,
--            STATUT
--
--)



            SELECT 
            
            CUIIO,
            CUIIO_VERS,
            69 FORM,
            2000 FORM_VERS,
            '1'  STATUT
    

              FROM   USER_BANCU.VW_MAX_RENIM_CIS2
              
              
              WHERE 
              
              CUIIO IN (
                SELECT FC.CUIIO

              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (40) AND CUIIO_VERS <= 2009
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (40) AND FC.STATUT <> '3'
              
              )
              
              
              AND 
              
              (CUIIO_VERS  =    2010) 