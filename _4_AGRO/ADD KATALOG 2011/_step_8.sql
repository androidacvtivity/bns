--        INSERT INTO CIS2.RENIM (
--            
--                    CUIIO,
--                    CUIIO_VERS,
--                    DENUMIRE,
--                    EDIT_USER,
--                    STATUT,
--                    CUATM,
--                    CFP,
--                    BUGET,
--                    TIP,
--                    CAEM2
--            
--            )





                   SELECT 
                    
                    A.CUIIO,
                    A.CUIIO_VERS,
                    A.DENUMIRE,
                    1   EDIT_USER,
                   '1' STATUT,
                    A.CUATM,
                    A.CFP,
                   '0' BUGET,
                   '0'  TIP,
                    A.CAEM2
               
                    FROM AGRO_4 A 
                    
                    
                            LEFT JOIN CIS2.RENIM R ON  R.CUIIO = A.CUIIO AND R.CUIIO_VERS = A.CUIIO_VERS 
                            
                            
                            WHERE 
                            1=1 
                             AND R.CUIIO IS NOT  NULL