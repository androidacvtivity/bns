--
--
--
--
--
--            INSERT INTO CIS2.RENIM (
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
--                    IDNO
--            
--            )





                   SELECT 
                    
                    A.CUIIO,
                    A.CUIIO_VERS,
                    A.DENUMIRE,
                    1   EDIT_USER,
                   '1' STATUT,
                    A.CUATM,
                    TRIM(A.CFP)  CFP,
                    TRIM(A.CFOJ) CFOJ,
                   '0' BUGET,
                   '0'  TIP,
                    A.CAEM2,
                    A.IDNO
                    
                   
               
 
  
                    
                    
                
                    FROM USER_BANCU.KAT_4_RSF1 A 
                    
                    
                            LEFT JOIN CIS2.RENIM R ON  R.CUIIO = A.CUIIO AND R.CUIIO_VERS = 2010 
                            
                            
                            WHERE 
                            1=1 
                             AND R.CUIIO IS NOT  NULL