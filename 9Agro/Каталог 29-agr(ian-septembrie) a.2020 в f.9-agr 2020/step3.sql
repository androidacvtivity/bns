SELECT *
    FROM RENIM_2010;

SELECT 
L.CUIIO,
L.CUIIO_VERS

    FROM RENIM_2010 L
    
    
               LEFT JOIN CIS2.RENIM R ON R.CUIIO = L.CUIIO AND R.CUIIO_VERS = L.CUIIO_VERS 
               
               
               WHERE 
               
               L.CUIIO IS NULL;
               
               
    
    ;