DECLARE -- ====================================================================

  CURSOR C IS
        SELECT 

                  C.CUIIO,
                  C.CUIIO_VERS,   
                  C.DENUMIRE,
                  C.CUATM,
                  C.CFP,
                  C.CFOJ
                  
          FROM USER_BANCU."UPDATE" C  ;

BEGIN -- ======================================================================
  FOR CR IN C
  LOOP
    UPDATE RENIM SET 
      DENUMIRE = CR.DENUMIRE,
      CUATM  = CR.CUATM,
      CFP = CR.CFP,
      CFOJ = CR.CFOJ
    WHERE 
      CUIIO  = CR.CUIIO AND
      CUIIO_VERS = CR.CUIIO_VERS 
      
      
      
    ;
  END LOOP;
END; -- =======================================================================