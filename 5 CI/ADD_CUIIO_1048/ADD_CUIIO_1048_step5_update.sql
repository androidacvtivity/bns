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
                                                 R.CUIIO IS NOT   NULL;