




                    SELECT 
                    
                    DISTINCT A.CUIIO,
                     A.DENUMIRE,
                     A.CUATM,
                     A.CFP,
                     A.COCM,
                     A.CAEM2
--                     B.PACHET,
--                     B.USER_NAME
----                     C.REZULTAT
                     
                      FROM  USER_BANCU.VW_KATALOG_2_INVEST_2018 A  
                   --   
                      LEFT  JOIN  CIS2.VW_DATA_ALL B ON A.CUIIO = B.CUIIO AND  A.CUIIO_VERS = B.CUIIO_VERS AND B.FORM  = 8 AND B.PERIOADA = 2007 
                      
--                      LEFT JOIN  CIS2.CONTROL C ON C.CUIIO = A.CUIIO AND 
--                      A.CUIIO_VERS = C.CUIIO_VERS AND C.FORM = 8 AND C.PERIOADA = 2008
                      
                      
                        
                      
                      