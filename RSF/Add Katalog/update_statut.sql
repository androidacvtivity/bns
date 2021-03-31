
--        UPDATE CIS2.FORM_CUIIO
--        SET STATUT = '3'

--        SELECT *
--        FROM CIS2.FORM_CUIIO
--        
--        WHERE 
--        
--        FORM = 57
--        AND CUIIO_VERS = 2009
--        AND STATUT = '1' 
--        AND FORM_VERS = 2000
--        AND CUIIO IN (
--        
--        SELECT  
--        FC.CUIIO
--                  
--              FROM 
--
--(



SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <=  (:pPERIOADA)
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3'
             
             
             
             
             
             
             
             
--             ) FC
--             
--             
--      --87411    
--      --CUIIO_VERS = 2009 = 87411   
--             WHERE 
--             FC.CUIIO_VERS = 2009
--             AND 
--             FC.STATUT = '3'
--             AND 
--             FC.FORM_VERS  =  2000
--             
--             --85594
--        