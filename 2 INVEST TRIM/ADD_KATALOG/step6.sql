
--
--    INSERT INTO CIS.RENIM (
--    
--      CUIIO,
--      CUIIO_VERS,
--      DENUMIRE,        
--      EDIT_USER,       
--      STATUT,          
--      CUATM,  
--      CFOJ,         
--      CFP,
--      BUGET,
--      TIP,              
--      CAEM2   
--    
--    )
--



SELECT 
--  A.CUIIO,
--  A.CUIIO_VERS,
--  A.DENUMIRE,
--  A.CUATM,
--  A.CFOJ,
--  A.CFP,
--  A.CAEM2   

        A.CUIIO,
        A.CUIIO_VERS,
        A.DENUMIRE,        
        0 EDIT_USER,       
       '0' STATUT,          
        A.CUATM,   
        A.CFOJ,          
        A.CFP,
       '0' BUGET,
       '0' TIP,              
        A.CAEM2

FROM USER_BANCU.KAT_2_NVEST_TRIM A 


            LEFT JOIN CIS.RENIM R ON R.CUIIO = A.CUIIO AND R.CUIIO_VERS = A.CUIIO_VERS 
            
            WHERE 
            R.CUIIO IS NOT   NULL 