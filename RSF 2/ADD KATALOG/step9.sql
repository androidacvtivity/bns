﻿SELECT 
L.CUIIO 
FROM USER_BANCU.VW_KATALOG_RSF2_2009 L

    LEFT JOIN USER_BANCU.VW_KATALOG_RSF2_2008 R ON L.CUIIO = R.CUIIO 
    
    WHERE 
    R.CUIIO  IS NOT NULL 