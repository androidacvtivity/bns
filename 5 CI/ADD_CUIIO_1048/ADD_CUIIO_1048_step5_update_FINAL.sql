DECLARE -- ====================================================================

CURSOR C IS



  SELECT 
  L.CUIIO,
  L.CUIIO_VERS,
  L.DENUMIRE NEW_DENUMIRE ,
  L.CUATM NEW_CUATM,
  L.CFP NEW_CFP,
  L.CFOJ NEW_CFOJ,       
  L.CAEM2 NEW_CAEM2  
             
             
             FROM USER_BANCU.KAT_RSF L LEFT JOIN 
             
                                                 CIS.RENIM R ON R.CUIIO = L.CUIIO AND R.CUIIO_VERS = L.CUIIO_VERS   
                                                 
                                                 
                                                 WHERE 
                                                 R.CUIIO IS NOT   NULL
         
         
        



;

BEGIN -- ======================================================================
FOR CR IN C
LOOP
UPDATE CIS.RENIM SET
DENUMIRE = CR.NEW_DENUMIRE,
CUATM = CR.NEW_CUATM,
CFP = CR.NEW_CFP,
CFOJ = CR.NEW_CFOJ,
CAEM2 = CR.NEW_CAEM2



WHERE
CUIIO = CR.CUIIO 
AND CUIIO_VERS = CR.CUIIO_VERS



;
END LOOP;
END; 