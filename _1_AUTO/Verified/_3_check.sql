SELECT
  L.CUIIO 
FROM USER_BANCU.VW_1_AUTO_431 L LEFT 

                JOIN USER_BANCU.VW_65_AUTO_1047 R ON L.CUIIO = R.CUIIO 
                
                WHERE 
                
                R.CUIIO IS NULL