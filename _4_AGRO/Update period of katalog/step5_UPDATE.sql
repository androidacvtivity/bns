DECLARE -- ====================================================================

CURSOR C IS
SELECT 
            L.CUIIO,
            L.CUIIO_VERS,
            L.CFOJ OLD_CFOJ,
            R.CFOJ NEW_CFOJ
            
            
            FROM CIS2.RENIM L RIGHT JOIN USER_BANCU.KAT_4_AGRO_2020 R ON 
             R.CUIIO = L.CUIIO AND R.CUIIO_VERS = L.CUIIO_VERS
             
             
             
             WHERE 
             
             L.CUIIO IS NOT NULL 
            


             GROUP BY 
            L.CUIIO,
            L.CUIIO_VERS,
            L.CFOJ,
            R.CFOJ
         
         
        



;

BEGIN -- ======================================================================
FOR CR IN C
LOOP
UPDATE CIS2.RENIM SET
CFOJ = CR.NEW_CFOJ
WHERE
CUIIO = CR.CUIIO 
AND 
CUIIO_VERS = CR.CUIIO_VERS



;
END LOOP;
END; 