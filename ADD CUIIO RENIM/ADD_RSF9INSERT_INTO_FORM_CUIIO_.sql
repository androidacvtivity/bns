
            INSERT INTO CIS2.FORM_CUIIO
            
             (
            
                   CUIIO,
                   CUIIO_VERS,
                   FORM,
                   FORM_VERS,
                   STATUT 
            
            )



                    SELECT 

                    R.CUIIO,
                    R.CUIIO_VERS,
                    63 FORM,
                    2000 FORM_VERS,
                    '1' STATUT 
                
                    FROM USER_BANCU.KAT_4_RSF1_2 R
                    
                    WHERE 
                    
                    R.CUIIO NOT IN (
                    41479026,
                    2740801,
40621893,
40967522



                    )
                    
                                