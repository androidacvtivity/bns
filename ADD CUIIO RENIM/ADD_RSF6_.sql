﻿SELECT 
  L.CUIIO,
  L.CUIIO_VERS,
  L.DENUMIRE,
  L.CUATM, 
  L.CFP,         
  L.CFOJ,
  L.CAEM2,   
  L.IDNO
        
     FROM   USER_BANCU.KAT_4_RSF1_2 L  LEFT JOIN 
     
                    CIS2.RENIM R ON R.CUIIO = L.CUIIO AND R.CUIIO_VERS = L.CUIIO_VERS 
                    
                    WHERE 
                    
                    R.CUIIO IS NOT NULL;