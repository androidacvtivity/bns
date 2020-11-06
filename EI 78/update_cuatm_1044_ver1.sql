    UPDATE CIS2.RENIM  VB
        
       SET (
        
--         VB.DENUMIRE,
         VB.CUATM
--         VB.CAEM2,
--         VB.CFP 
        
        ) 
        
        = 
        
        (
        SELECT
--         C.DENUMIREA DENUMIRE,
         C.CUATM
--         C.CAEM2,
--         C.CFP 
        
        
        FROM USER_BANCU.EI_78_1044 C 
        
        WHERE 
        
                       VB.CUIIO       = C.CUIIO  
                   AND VB.CUIIO_VERS  = C.CUIIO_VERS
                  
                   
                   )
                   
                   WHERE EXISTS  
                   
                   (
                   SELECT *
        
        
        
       FROM USER_BANCU.EI_78_1044 C 
        
        WHERE 
        
                       VB.CUIIO       = C.CUIIO  
                   AND VB.CUIIO_VERS  = C.CUIIO_VERS
                   
                   );