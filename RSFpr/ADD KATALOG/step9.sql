

--update CIS2.FORM_CUIIO
--
--set STATUT =  '1'


--
--            SELECT * 
--
--            FROM CIS2.FORM_CUIIO 
            
            
            WHERE 


            CUIIO IN (
            SELECT CUIIO  

FROM USER_BANCU.RSF_REPR_2009_FIN )

AND CUIIO_VERS = 2009
AND FORM = 63
AND STATUT =  '3'
AND FORM_VERS = 2000