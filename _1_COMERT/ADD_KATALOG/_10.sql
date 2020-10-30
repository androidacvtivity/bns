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
                                  WHERE FORM IN (28) AND CUIIO_VERS <= 2008
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                           
             WHERE FC.FORM IN (28) AND FC.STATUT <> '3'
             ) FC 
             
             
             WHERE 
             FC.CUIIO_VERS   =    2008 ) FC
             
             
             
             WHERE 
             
             CUIIO NOT IN (
             
              SELECT 
       CUIIO 
       
            FROM USER_BANCU.KAT_1_COMERT_V2
             
             )