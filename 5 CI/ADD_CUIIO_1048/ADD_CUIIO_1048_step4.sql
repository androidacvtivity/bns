--INSERT  INTO CIS.RENIM
--
--(
--
--  CUIIO,
--  CUIIO_VERS,
--  DENUMIRE,
--  EDIT_USER,
--  STATUT,
--  CUATM,
--  CFP,
--  CFOJ,       
--  CAEM2  
--)

  SELECT 
  L.CUIIO,
  L.CUIIO_VERS,
  L.DENUMIRE,
  1 EDIT_USER,
  '1' STATUT,
  L.CUATM,
  L.CFP,
  L.CFOJ,       
  L.CAEM2  
             
             
             FROM USER_BANCU.KAT_RSF L LEFT JOIN 
             
                                                 CIS.RENIM R ON R.CUIIO = L.CUIIO AND R.CUIIO_VERS = L.CUIIO_VERS   
                                                 
                                                 
                                                 WHERE 
                                                 R.CUIIO IS NOT   NULL;
                                                      
             
                                            