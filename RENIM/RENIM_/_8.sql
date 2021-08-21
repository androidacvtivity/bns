SELECT 
DISTINCT L.CUIIO L_CUIIO,
L.IDNO,
L.CUIIO_8 L_CUIIO_8, 
R.CUIIO R_CUIIO

FROM 
(


SELECT 

    CUIIO,
    IDNO,
    SUBSTR(CUIIO,0,8) CUIIO_8, 
    LENGTH(TO_CHAR(CUIIO)) CUIIO_LENGTH 

    
        FROM CIS2.RENIM 
        
        WHERE 
        LENGTH(TO_CHAR(CUIIO))   > 8 
        AND CUIIO_VERS > 2000
        
        ) L LEFT JOIN (
        
        
        SELECT 

    CUIIO,
    SUBSTR(CUIIO,0,8) CUIIO_8, 
    LENGTH(TO_CHAR(CUIIO)) CUIIO_LENGTH 

    
        FROM CIS2.RENIM 
        
        WHERE 
        LENGTH(TO_CHAR(CUIIO))   <= 8 
        AND CUIIO_VERS > 2000
        
        ) R ON TRIM(R.CUIIO) = TRIM(L.CUIIO_8) 
        
        
        WHERE 
        
        R.CUIIO IS NOT NULL
        AND L.IDNO IS  NULL
        
        ORDER BY 
        L.CUIIO