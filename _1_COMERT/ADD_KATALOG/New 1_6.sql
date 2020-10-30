
--INSERT INTO CIS2.FORM_CUIIO (
--
--
--
--                    CUIIO,
--                    CUIIO_VERS,
--                    FORM,
--                    FORM_VERS,
--                    STATUT--
--)

                SELECT  
                   FC.CUIIO,
                   FC.CUIIO_VERS,
                   28 FORM,
                   2000 FORM_VERS,
                   '1'  STATUT
            
            FROM USER_BANCU.KAT_1_COMERT_v2 FC
            
            
                    WHERE 
                    
                    FC.CUIIO NOT IN (
                    
                    SELECT 
                   FC.CUIIO
                   
              FROM


                 (
                 SELECT 
                   FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (28) AND CUIIO_VERS <= :pPERIOADA 
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (28) AND FC.STATUT <> '3'
             ) FC 
                    
                    )