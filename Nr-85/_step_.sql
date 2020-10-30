SELECT 
    A.*
FROM
(
SELECT R.*
FROM ( 

SELECT FC.* 
   FROM CIS2.FORM_CUIIO FC
   INNER JOIN (
           
           
           SELECT 
           CUIIO,
            MAX(CUIIO_VERS)   CUIIO_VERS
            
            FROM CIS2.FORM_CUIIO
            
            
            WHERE 
            
            FORM IN (17)
            
            AND CUIIO_VERS <= 2006
            
            GROUP BY 
            CUIIO 
            
            
            
            ) BB ON (BB.CUIIO=FC.CUIIO AND BB.CUIIO_VERS=FC.CUIIO_VERS )
            
            
            
    WHERE
    
    FC.FORM IN (17)         
    
    AND FC.STATUT <> '3'
    
    
    ) FC INNER JOIN CIS2.RENIM R ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
    
    
    WHERE 
    1=1   
   
    )  A 












;
SELECT 
    A.*
FROM
(
SELECT R.*
FROM ( 
SELECT FC.* 
   FROM CIS2.FORM_CUIIO FC
   INNER JOIN (
           SELECT 
           CUIIO,
            MAX(CUIIO_VERS)   CUIIO_VERS
            
            FROM CIS2.FORM_CUIIO
            
            
            WHERE 
            
            FORM IN (17)
            
            AND CUIIO_VERS <= 2005
            
            GROUP BY 
            CUIIO ) BB ON (BB.CUIIO=FC.CUIIO AND BB.CUIIO_VERS=FC.CUIIO_VERS )
            
            
            
    WHERE
    
    FC.FORM IN (17)         
    
    AND FC.STATUT <> '3'
    ) FC INNER JOIN CIS2.RENIM R ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
    
    
    WHERE 
    1=1   
   
    )  A 