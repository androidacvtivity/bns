SELECT 
            L.CUIIO,
            L.CUIIO_VERS,
            L.CFOJ OLD_CFOJ,
            R.CFOJ NEW_CFOJ
            
            
            FROM CIS2.RENIM L RIGHT JOIN USER_BANCU.KAT_4_AGRO_2020 R ON 
             R.CUIIO = L.CUIIO AND R.CUIIO_VERS = L.CUIIO_VERS
             
             
             
             WHERE 
             
             L.CUIIO IS NOT NULL 
            


             GROUP BY 
            L.CUIIO,
            L.CUIIO_VERS,
            L.CFOJ,
            R.CFOJ
            
            HAVING 
            L.CFOJ IS NOT  NULL
             
             