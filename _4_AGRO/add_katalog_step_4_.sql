
--UPDATE CIS.RENIM  VB 

SET 
(


   VB.CAEM2


) = 

(

SELECT

   L.CAEM2

                FROM  USER_BANCU.KATALOG L
                
                
                WHERE 
                
                
                 L.CUIIO = VB.CUIIO 
                 AND L.CUIIO_VERS = VB.CUIIO_VERS )
                 
                 
                 WHERE EXISTS 
                

                (
                
             SELECT
                  L.*

                FROM  USER_BANCU.KATALOG L
                
                
                WHERE 
                
                
                 L.CUIIO = VB.CUIIO 
                 AND L.CUIIO_VERS = VB.CUIIO_VERS
                )

