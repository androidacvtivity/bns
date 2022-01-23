

            update CIS2.FORM_CUIIO
            
            SET STATUT = '3'




--            SELECT *
--            
--            FROM CIS2.FORM_CUIIO
            
            WHERE 
            
            CUIIO IN (
            SELECT             FC.CUIIO
                  
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
                                  WHERE FORM IN (12) AND CUIIO_VERS <= 2010
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (12) AND FC.STATUT <> '3' ) FC  LEFT JOIN USER_BANCU.KAT_1_CC A ON A.CUIIO = FC .CUIIO AND 
                                                                                                       A.CUIIO_VERS = FC.CUIIO_VERS 
                                                                                                       
                                                                                                       
                                                                                                       WHERE 
                                                                                                       A.CUIIO IS    NULL 
            
            )
            
            AND FORM = 12 AND CUIIO_VERS = 2010 AND FORM_VERS = 2000 AND STATUT = '1' 
            
            AND CUIIO NOT IN (
                  SELECT 
        DISTINCT CUIIO
        
            FROM DATA_ALL 
            
            WHERE 
            
            PERIOADA = 2010
            AND FORM = 12 
            
            AND CUIIO NOT IN (
            SELECT CUIIO
FROM USER_BANCU.KAT_1_CC
            )
            
            )