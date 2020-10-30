

            INSERT INTO CIS2.FORM_CUIIO (
            CUIIO,
            CUIIO_VERS,
            FORM,
            FORM_VERS,
            STATUT 
             )





            SELECT 
            
               B.CUIIO,
               B.CUIIO_VERS,
               18    FORM,
               1004  FORM_VERS,
               '1'   STATUT  
            FROM USER_BANCU.VW_KATALOG_5_CON_1043  A 
                   RIGHT JOIN  USER_BANCU.KAT_5_CON_1043_1 B ON B.CUIIO = A.CUIIO AND B.CUIIO_VERS = A.CUIIO_VERS 
                   
                   
                   WHERE
                   
                   A.CUIIO IS  NULL  
                   
                   
            
                           