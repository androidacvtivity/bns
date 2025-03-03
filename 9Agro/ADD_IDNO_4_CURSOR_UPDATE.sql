﻿DECLARE -- ====================================================================

  CURSOR C IS
        
              SELECT 
            L.CUIIO,
            L.CUIIO_VERS,
            TO_NUMBER(L.IDNO) NEW_IDNO,
            TO_NUMBER(R.IDNO) IDNO
               FROM  USER_BANCU.KAT_9_AGRO L
                        LEFT JOIN CIS2.RENIM R ON R.CUIIO = L.CUIIO  
                        AND R.CUIIO_VERS = L.CUIIO_VERS 
                        
                        
                        WHERE 
                        1=1   
                           
                        AND R.IDNO IS NULL
                        ORDER BY
                        R.IDNO
          
          
  ;

BEGIN -- ======================================================================
  FOR CR IN C
  LOOP
    UPDATE CIS2.RENIM SET 
      IDNO = CR.NEW_IDNO
    WHERE 
      CUIIO = CR.CUIIO AND
      CUIIO_VERS = CR.CUIIO_VERS 
      
      
    ;
  END LOOP;
END; -- =======================================================================