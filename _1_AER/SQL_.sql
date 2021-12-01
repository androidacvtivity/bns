SELECT DISTINCT FC.CUIIO
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
                                  WHERE FORM IN (38) AND CUIIO_VERS <= 2009
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (38) AND FC.STATUT <> '3'
             
             
          
             )    FC  LEFT JOIN (
             
                 SELECT 
    DISTINCT CUIIO
        
                FROM CIS2.VW_DATA_ALL
                
                WHERE 
                
                FORM = 38
                
                AND PERIOADA = 2009
             
             ) R ON FC.CUIIO = R.CUIIO
             
             WHERE 
             R.CUIIO IS NULL