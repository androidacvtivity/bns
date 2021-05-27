DECLARE -- ====================================================================

CURSOR C IS



SELECT 
        R.CUIIO,
        L.CUIIO E_CUIIO,
        R.CUIIO_VERS,
        R.IDNO IDNO_NEW ,
        L.IDNO E_IDNO
        

        FROM 

(

SELECT 
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
        TRIM(IDNO) IDNO
        from USER_EREPORTING.IDNO_CUIIO D
        
        WHERE 
        1=1 
 
        
        )  L ON  L.CUIIO = R.CUIIO 
        
        
        WHERE 
       
       (  L.CUIIO IS NOT NULL
         
         AND 
         
         TRIM(TO_NUMBER(R.IDNO)) <>   TRIM(TO_NUMBER(L.IDNO)) 
         
         )
         
         
        



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