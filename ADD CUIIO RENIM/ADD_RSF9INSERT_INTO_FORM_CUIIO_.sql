--INSERT INTO CIS2.FORM_CUIIO
--            
--             (
--            
--                   CUIIO,
--                   CUIIO_VERS,
--                   FORM,
--                   FORM_VERS,
--                   STATUT 
--            
--            )



                    SELECT 

                    R.CUIIO,
                    R.CUIIO_VERS,
                    43 FORM,
                    2000 FORM_VERS,
                    '1' STATUT 
                
                    FROM  RENIM R
                    
                    WHERE 
                    
           CUIIO IN( 
7851697,
12089558,
35359690,
40063690,
41047752,
41069297,
41123648,
41150711,
41361572,
41416675,
41454121,
41497426,
41501702,
41501760,
41534765,
41558702,
41559446,
41559498,
4107611021,
4109741957,
4130903421,
4148166121,
4150106210

) AND CUIIO_VERS = 2011