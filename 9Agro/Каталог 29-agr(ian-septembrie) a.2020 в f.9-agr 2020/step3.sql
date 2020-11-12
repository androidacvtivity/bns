SELECT *
    FROM RENIM_2009;

SELECT 
L.CUIIO,
L.CUIIO_VERS

    FROM RENIM_2009 L
    
    
               LEFT JOIN CIS2.RENIM R ON R.CUIIO = L.CUIIO AND R.CUIIO_VERS = L.CUIIO_VERS 
               
               
               WHERE 
               
               L.CUIIO IS NOT NULL;
               
               
    
    ;