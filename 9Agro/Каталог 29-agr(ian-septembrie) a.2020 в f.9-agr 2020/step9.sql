﻿--INSERT INTO CIS2.FORM_CUIIO (
--
--       CUIIO,
--       CUIIO_VERS,
--       FORM,
--       FORM_VERS,
--       STATUT
--
--)











 SELECT 
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
                                  WHERE FORM IN (39) AND CUIIO_VERS <= 2009
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (39) 
             AND FC.STATUT <> '3'
             
             
             )  FC
            
                                                RIGHT   JOIN RENIM_2009 R ON R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS 
                                                
                                                WHERE 
                                                
                                                R.CUIIO IS NOT  NULL 
                                                
--                                                AND FC.STATUT <> '1'