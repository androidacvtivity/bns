--              INSERT INTO CIS2.FORM_CUIIO  
--              
--              (
--              
--                   CUIIO,
--                   CUIIO_VERS,
--                   FORM,
--                   FORM_VERS,
--                   STATUT
--              )




SELECT             A.CUIIO,
                   A.CUIIO_VERS,
                   12 FORM,
                   2000 FORM_VERS,
                   '1' STATUT
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
                                  WHERE FORM IN (12) AND CUIIO_VERS <= 2009
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (12) AND FC.STATUT <> '3' ) FC  RIGHT JOIN USER_BANCU.KAT_1_CC_FINAL A ON A.CUIIO = FC .CUIIO AND 
                                                                                                       A.CUIIO_VERS = FC.CUIIO_VERS 
                                                                                                       
                                                                                                       
                                                                                                       WHERE 
                                                                                                       FC.CUIIO IS NOT NULL 
                                                                                                       
             
   