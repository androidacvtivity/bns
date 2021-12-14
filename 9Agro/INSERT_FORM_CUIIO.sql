SELECT 
                   L.NEW_CUIIO,
                   FC.CUIIO,
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
             WHERE FC.FORM IN (39) AND FC.STATUT <> '3'
             
             ) FC RIGHT JOIN (
             
             
             select *
   
   from USER_BANCU.KAT_9_AGRO
   
   WHERE 
   
   cuiio NOT in (
   SELECT 
        distinct CUIIO
        
            FROM data_all
            
            WHERE 
            
            perioada IN (2010)
            
            and form = 39
            
            AND cuiio IN (
            
            SELECT 
L.CUIIO


FROM USER_BANCU.KAT_9_AGRO L
            )
   )) L ON L.NEW_CUIIO = FC.CUIIO
             
             WHERE 
             FC.CUIIO IS NOT NULL