



           INSERT INTO FORM_CUIIO (
           
           
             CUIIO,
             CUIIO_VERS,
             FORM,
             FORM_VERS,
             STATUT
           
           )

            SELECT 
            
             R.CUIIO,
             R.CUIIO_VERS,
             43 FORM,
             2000 FORM_VERS,
             '1' STATUT 
            

            FROM USER_BANCU.KATALOG R 