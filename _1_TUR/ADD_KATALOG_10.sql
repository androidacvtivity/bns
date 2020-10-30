 
 INSERT INTO  CIS2.FORM_CUIIO (
            CUIIO,
            CUIIO_VERS,
            FORM,
            FORM_VERS,
            STATUT 
 
 )
 
 
 SELECT 
            CUIIO,
            CUIIO_VERS,
            4 FORM,
            2000 FORM_VERS,
            '1'  STATUT 
           
            
            FROM USER_BANCU.KAT_1_TR_AUTO_2
            
            
            WHERE 
            CUIIO NOT IN (
            
            40394664,
           40920992

            )