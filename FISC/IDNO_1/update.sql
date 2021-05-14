DECLARE -- ====================================================================

CURSOR C IS



SELECT 

        R.CUIIO,
        L.CUIIO E_CUIIO,
        R.CUIIO_VERS,
        R.IDNO IDNO_NEW ,
        L.IDNO E_IDNO
        
        
        FROM 

(SELECT 
        
        R.CUIIO,
        R.CUIIO_VERS,
        R.IDNO
        
        FROM CIS2.RENIM R
        
        WHERE 
        
        R.CUIIO_VERS  = 2009
        
        AND 
        
        (R.IDNO IS NOT NULL
        AND  
        R.IDNO <> 0)
        
        
        
        
        ) R LEFT JOIN (
        
        
        SELECT 
        CUIIO,
        IDNO
        from USER_EREPORTING.IDNO_CUIIO
        )  L ON  L.CUIIO = R.CUIIO 
        
        
        
        WHERE 
        
       
        
        (
        
        L.IDNO IS NULL  
        
        OR 
       
        L.IDNO = 0
        
        )
         

         AND L.CUIIO IS NOT NULL
         
         
        



;

BEGIN -- ======================================================================
FOR CR IN C
LOOP
UPDATE USER_EREPORTING.IDNO_CUIIO SET
IDNO = CR.IDNO_NEW
WHERE
CUIIO = CR.CUIIO 



;
END LOOP;
END; --