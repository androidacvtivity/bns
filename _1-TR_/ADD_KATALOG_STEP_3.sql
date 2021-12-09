SELECT 
L.CUIIO,
L.CUIIO_VERS,
L.DENUMIRE,
L.CUATM,
L.CFP,
L.CFOJ,
L.CAEM2 
    
   FROM  USER_BANCU.KAT_1_TR_AUTO L LEFT  JOIN 
   
                                            CIS2.RENIM R ON L.CUIIO = R.CUIIO AND  L.CUIIO_VERS = R.CUIIO_VERS
                                            
                                            
                                            WHERE 
                                            R.CUIIO IS NOT NULL;