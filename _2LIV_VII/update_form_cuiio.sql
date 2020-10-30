UPDATE CIS2.FORM_CUIIO VB

 SET (  VB.STATUT ) = 

(
           SELECT 
            
                R.STATUT 

            FROM VW_2_LIV R 
            
            WHERE 
            
            R.CUIIO = VB.CUIIO 
            AND R.CUIIO_VERS = VB.CUIIO_VERS
            AND R.FORM = VB.FORM
            AND R.FORM_VERS = VB.FORM_VERS
            
            )
            
            
            WHERE EXISTS  (
            
            SELECT 
            
                R.* 

            FROM VW_2_LIV R 
            
            WHERE 
            
            R.CUIIO = VB.CUIIO 
            AND R.CUIIO_VERS = VB.CUIIO_VERS
            AND R.FORM = VB.FORM
            AND R.FORM_VERS = VB.FORM_VERS
            
            )
            
            