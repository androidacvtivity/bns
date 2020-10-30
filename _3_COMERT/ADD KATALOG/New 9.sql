       SELECT     
           R.CUIIO,
           R.CUIIO_VERS
           

            FROM USER_BANCU.VW_MAX_RENIM_CIS2 R
            
            
            WHERE 
            
            R.CUIIO IN (
            
           

             SELECT 
             
             R.CUIIO
           
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (21) AND CUIIO_VERS <= 2008
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (21) 
             AND FC.STATUT <> '3'
             
             ) FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
            
            )
            
            
            
         AND  R.CUIIO_VERS  =  2009