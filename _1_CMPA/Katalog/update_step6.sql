UPDATE CIS2.REG_UNIT_GC VB
        
 SET     (

 
                VB.NAME                      --7
 
  ) 
            = 
  (          
  SELECT 

 
                 C.NAME                         --7
 
  FROM USER_BANCU.REG_UNIT_GC_CMPA1 C
       WHERE
                   VB.UNIT_CODE       = C.UNIT_CODE AND 
                   VB.UNIT_CODE_VERS  = C.UNIT_CODE_VERS
                   
                )   
                WHERE EXISTS  
                
                (
                    SELECT *
                    FROM USER_BANCU.REG_UNIT_GC_CMPA1 C
                   WHERE
                   VB.UNIT_CODE       = C.UNIT_CODE AND 
                   VB.UNIT_CODE_VERS  = C.UNIT_CODE_VERS
                );