            
            
            
        INSERT INTO USER_BANCU.FORM_1_INF FC  (
        
                   FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
        
        )


            
            SELECT
                   FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
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
                                  WHERE FORM IN (2) AND CUIIO_VERS <= 2008
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (2) AND FC.STATUT <> '3'
             ) FC
             
             
             WHERE 
             
             FC.CUIIO NOT IN (
             
             SELECT 
                                  
           A.CUIIO
           
          
           
                                            
              FROM   USER_BANCU.KAT_1_INF_1 A
             )
             
             
         
            AND  FC.CUIIO_VERS =  2008