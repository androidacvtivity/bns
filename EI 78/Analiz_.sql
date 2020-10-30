

         

                   SELECT 
            
                   L.CUIIO,
                   L.DENUMIRE,
                   L.CUATM CUATM_OLD,
                   L.CFP,
                   CASE 
                   
                   WHEN LENGTH(L.CUATM) = 6  AND SUBSTR(L.CUATM,1,1) =  '1' THEN '0'||L.CUATM 
                   
                   
                   WHEN LENGTH(L.CUATM) = 6  AND SUBSTR(L.CUATM,1,1) =  '3' THEN '0'||L.CUATM 
                   
                   ELSE  L.CUATM END  CUATM,
                   
                   L.CAEM2,
                   
                   CASE WHEN  LENGTH(L.CAEM2) = 5   THEN SUBSTR(L.CAEM2,2,7)  ELSE  L.CAEM2 END  NEW_CAEM2, 
                   
                   
                   SUBSTR(L.CUATM,1,1) CUT  

            FROM USER_BANCU.KATALOG_EI_78 L