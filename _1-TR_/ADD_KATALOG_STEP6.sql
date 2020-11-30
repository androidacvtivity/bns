SELECT 
L.CUIIO,
L.CUIIO_VERS,
L.DENUMIRE,
L.CUATM,
L.CFP,
L.CFOJ,
L.CAEM2 
    
   FROM  USER_BANCU.TR_AUTO_2020_v2 L LEFT  JOIN 
   
                                            CIS2.RENIM R ON L.CUIIO = R.CUIIO AND  L.CUIIO_VERS = R.CUIIO_VERS
                                            
                                            
                                            WHERE 
                                            R.CUIIO IS NULL;