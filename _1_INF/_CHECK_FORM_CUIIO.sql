
SELECT 

L.CUIIO L_CUIIO,
R.CUIIO R_CUIIO 

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
                                  WHERE FORM IN (2) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (2) AND FC.STATUT <> '3'
             
             ) L RIGHT  JOIN (
             
             SELECT 
         DISTINCT CUIIO 
         
         FROM CIS2.VW_DATA_ALL 
         
         WHERE 
         
         PERIOADA = 2009
         AND FORM  = 2
             
             ) R ON R.CUIIO = L.CUIIO 
             
             
             WHERE 
             
             L.CUIIO IS   NULL