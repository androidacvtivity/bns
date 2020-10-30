-- INSERT INTO FORM_CUIIO
--    
--      (
--                        CUIIO,
--                        CUIIO_VERS,
--                        FORM, 
--                        FORM_VERS,
--                        STATUT 
--      )


            SELECT 
                
                
                        L.CUIIO,
                        L.CUIIO_VERS,
                        45 FORM, 
                        1004 FORM_VERS,
                        '1' STATUT 
                        
                        
                        FROM USER_BANCU.KATALOG L
                         LEFT  JOIN CIS2.RENIM  R ON R.CUIIO = L.CUIIO AND  R.CUIIO_VERS = L.CUIIO_VERS             

            
            
            WHERE 
            1=1 
            
            AND R.CUIIO IS      NULL
            
AND           
L.CUIIO  NOT IN (
11871556,
32890509,
41150237,
273039874,
3778286567
)
           