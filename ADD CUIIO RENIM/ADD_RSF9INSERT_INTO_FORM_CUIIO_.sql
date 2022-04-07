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
                    38 FORM,
                    2000 FORM_VERS,
                    '1' STATUT 
                
                    FROM  RENIM R
                    
                    WHERE 
                    
           CUIIO IN (
20269655,
40185771,
40218430,
40445097,
41297466,
--4073387610,
4074252710,
4144155510,
38418966101,
38418966102,
40702284101,
40702284102,
41007853101

)  AND CUIIO_VERS = 2010
                    
   AND CUIIO NOT IN (
1

   )                             