SELECT 
        L.CUIIO,
        L.DENUMIRE,
        L.CUATM,
        L.CFP,
        L.CFOJ
      
        
        
        FROM VW_KATALOG_29_AGRO_TRIM_4 L LEFT JOIN 
        
                         USER_BANCU.VW_KATALOG_9_AGRO R ON L.CUIIO = R.CUIIO  AND L.CUATM = R.CUATM  AND L.CFP = R.CFP  
                         AND L.CFOJ = R.CFOJ 
                         
                         
                         WHERE 
                         R.CUIIO  IS NOT NULL 
                         AND R.CUATM IS NOT NULL
                         
                           AND R.CFP IS NOT NULL
                           
                            AND R.CFOJ IS NOT NULL
                         