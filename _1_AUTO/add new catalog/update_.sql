

--update CIS2.FORM_CUIIO 

SET STATUT = '3'


 
--            SELECT  *
--            
--            FROM CIS2.FORM_CUIIO 
            
            WHERE 
            
            CUIIO IN (
            
            SELECT 
  R.CUIIO
  


FROM USER_BANCU.KAT_2_INVEST_FINAL L  RIGHT  JOIN (

SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (8) AND CUIIO_VERS <= 2009
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (8) AND FC.STATUT <> '3'

) R ON R.CUIIO = L.CUIIO AND  R.CUIIO_VERS = L.CUIIO_VERS 

WHERE 
L.CUIIO IS NULL 
            )
            
            AND FORM = 8 AND FORM_VERS = 2000
            AND STATUT = '1' 
            AND CUIIO_VERS = 2009
            
            
            