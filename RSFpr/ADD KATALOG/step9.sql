

--update CIS2.FORM_CUIIO
--
--set STATUT =  '1'



            SELECT * 

            FROM CIS2.FORM_CUIIO 
            
            
            WHERE 


            CUIIO IN (
            SELECT CUIIO  

FROM USER_BANCU.KAT_RSF1 )

AND CUIIO_VERS = 2009
AND FORM = 57
AND STATUT =  '1'
AND FORM_VERS = 2000