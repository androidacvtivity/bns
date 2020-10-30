                
--                 INSERT INTO CIS2.FORM_CUIIO FC  (
--                 
--                   FC.CUIIO,
--                   FC.CUIIO_VERS,
--                   FC.FORM,
--                   FC.FORM_VERS,
--                   FC.STATUT
--                 )       
----


                
                SELECT         
                   R.CUIIO,
                   R.CUIIO_VERS,
                   21 FORM,
                   2000 FORM_VERS,
                   '1' STATUT
              FROM (          

  SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (21) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             
             FC.FORM IN (21) 
             AND FC.STATUT <> '3'
             )  FC  RIGHT  JOIN  USER_BANCU.KAT_3_COMERT_v2  R   ON R.CUIIO = FC.CUIIO  
             
             
             
--            
        WHERE
        FC.CUIIO IS  NULL 
--        
--        AND FC.CUIIO_VERS = 2008