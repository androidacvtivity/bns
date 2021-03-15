UPDATE CIS2.REG_UNIT_GC VB
        
 SET     (

 
               
                 VB.CUATM
                                   --7
 
  ) 
            = 
  (          
  SELECT 

 
                
                 C.CUATM
                                        --7
 
  FROM USER_BANCU.REG_UNIT_GC_HOLD C
       WHERE

                   
                   
                   
                      
                        
                  VB.UNIT_CODE = C.UNIT_CODE
                  AND VB.UNIT_CODE_VERS = C.UNIT_CODE_VERS
                  AND VB.NR_GOSP = C.NR_GOSP
                  AND VB.NR_MAPS = C.NR_MAPS
                   
                )   
                WHERE EXISTS  
                
                (
                    SELECT *
                    FROM USER_BANCU.REG_UNIT_GC_HOLD C
                    

                   WHERE
                   VB.UNIT_CODE = C.UNIT_CODE
                  AND VB.UNIT_CODE_VERS = C.UNIT_CODE_VERS
                  AND VB.NR_GOSP = C.NR_GOSP
                  AND VB.NR_MAPS = C.NR_MAPS
                );