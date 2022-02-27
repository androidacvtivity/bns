UPDATE CIS2.RENIM VB
        
 SET     (
   
  
 
                  VB.DENUMIRE,
                  VB.CUATM,
                  VB.CFP,
                  VB.CFOJ, 
                  VB.CAEM2,
                  VB.IDNO                    --5
  
  
  ) 
            = 
  (          
  SELECT 

                  C.DENUMIRE,
                  C.CUATM,
                  C.CFP,
                  C.CFOJ, 
                  C.CAEM2,
                  C.IDNO        
  
  FROM USER_BANCU.KAT_2010_1_INVEST  C
        WHERE
                                                 VB.CUIIO             =  C.CUIIO          AND 
                                                 VB.CUIIO_VERS        =  C.CUIIO_VERS     
                                               
                                                 
                   
                )   
                WHERE EXISTS  
                
                (
                    SELECT *
                    FROM USER_BANCU.KAT_2010_1_INVEST  C
                     WHERE
                     
                      VB.CUIIO             =  C.CUIIO          AND 
                      VB.CUIIO_VERS        =  C.CUIIO_VERS     
                                               
                     
                     
                );