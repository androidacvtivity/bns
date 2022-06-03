DECLARE -- ====================================================================

CURSOR C IS




            SELECT 
               L.CUIIO,
               L.CUIIO_VERS,
               L.CAEM2   NEW_CAEM2
            FROM USER_BANCU.CAEM2 L LEFT JOIN  CIS2.RENIM R ON R.CUIIO = L.CUIIO 
                                                         AND  R.CUIIO_VERS = L.CUIIO_VERS
                                                         
                                                         WHERE 
                                                         R.CUIIO IS NOT NULL
         
        



;

BEGIN -- ======================================================================
FOR CR IN C
LOOP
UPDATE CIS2.RENIM   SET 
CAEM2 = TRIM(TRIM(CR.NEW_CAEM2))

WHERE


         CUIIO       =  CR.CUIIO 
    AND  CUIIO_VERS  =  CR.CUIIO_VERS



;
END LOOP;
END; 