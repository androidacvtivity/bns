UPDATE CIS2.RENIM VB
        
 SET     (
   
  
 
                  VB.DENUMIRE,
                  VB.CUATM,
                  VB.CFP,
                  VB.CFOJ, 
                  VB.CAEM2
                                    --5
  
  
  ) 
            = 
  (          
  SELECT 

                  C.DENUMIRE,
                  C.CUATM,
                  C.CFP,
                  C.CFOJ, 
                  C.CAEM2
                       
  
  FROM USER_BANCU.AGRO_34  C
        WHERE
                                                 VB.CUIIO             =  C.CUIIO          AND 
                                                 VB.CUIIO_VERS        =  C.CUIIO_VERS     
                                               
                                                 
                   
                )   
                WHERE EXISTS  
                
                (
                    SELECT *
                    FROM USER_BANCU.AGRO_34  C
                     WHERE
                     
                      VB.CUIIO             =  C.CUIIO          AND 
                      VB.CUIIO_VERS        =  C.CUIIO_VERS     
                                               
                     
                     
                );