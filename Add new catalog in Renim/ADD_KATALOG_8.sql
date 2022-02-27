--   INSERT INTO CIS2.RENIM (
--            
--                    CUIIO,
--                    CUIIO_VERS,
--                    DENUMIRE,
--                    EDIT_USER,
--                    STATUT,
--                    CUATM,
--                    CFP,
--                    CFOJ,
--                    BUGET,
--                    TIP,
--                    CAEM2,
--                    idno
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
                    A.CFOJ,
                   '0' BUGET,
                   '0'  TIP,
                    A.CAEM2,
                    A.IDNO
                    
                    FROM USER_BANCU.KAT_2010_1_INVEST A 
                    
                    
                            LEFT JOIN CIS2.RENIM R ON  R.CUIIO = A.CUIIO AND R.CUIIO_VERS = A.CUIIO_VERS 
                            
                            
                            WHERE 
                            1=1 
                            AND R.CUIIO IS NOT  NULL;