DECLARE -- ====================================================================

  CURSOR C IS
        SELECT 

   L.CUIIO CUIIO,
   2010 CUIIO_VERS,
   L.CUATM CUATM
  
   
   
  FROM USER_BANCU.VW_KATALOG_29_AGRO_1048 L 
  
                        LEFT JOIN USER_BANCU.VW_KATALOG_4_AGRO_2010 R ON L.CUIIO = R.CUIIO  AND 
                                                                         L.CUATM = R.CUATM 
                        
                        
                        WHERE 
                        R.CUIIO IS   NULL 
  ;

BEGIN -- ======================================================================
  FOR CR IN C
  LOOP
    UPDATE CIS2.RENIM SET 
      CUATM = CR.CUATM
    WHERE 

      CUIIO = CR.CUIIO AND
      CUIIO_VERS = CR.CUIIO_VERS 
      

    ;
  END LOOP;
END; -- =======================================================================