-- SELECT * 
--      
--      FROM CIS2.FORM_REG_UNIT_GC  FC
      
      
      UPDATE CIS2.FORM_REG_UNIT_GC  FC

SET  FC.STATUT = '3' 
      
     WHERE 
     
     FC.UNIT_CODE  IN  (
     
     SELECT 
FC.UNIT_CODE 

    
FROM 
(
SELECT 
FC.UNIT_CODE, 
FC.UNIT_CODE_VERS,
FC.NR_GOSP,
FC.NR_MAPS,
FC.FORM,
FC.FORM_VERS,
FC.STATUT    
  FROM CIS2.FORM_REG_UNIT_GC  FC
       INNER JOIN (  
       
       SELECT UNIT_CODE, 
       
       
       
       MAX (UNIT_CODE_VERS) UNIT_CODE_VERS,
       NR_GOSP,
       NR_MAPS
                       FROM CIS2.FORM_REG_UNIT_GC
                      WHERE FORM IN (62) AND UNIT_CODE_VERS <= :pPERIOADA
                      
                      
                   GROUP BY 
                   UNIT_CODE,
                    NR_GOSP,
                     NR_MAPS
                   
                   
                   
                   
                   
                   ) BB
           ON (    BB.UNIT_CODE = FC.UNIT_CODE
               AND BB.UNIT_CODE_VERS = FC.UNIT_CODE_VERS
               AND BB.NR_GOSP = FC.NR_GOSP
               AND BB.NR_MAPS = FC.NR_MAPS
               
               )
 WHERE FC.FORM IN (62) AND FC.STATUT <> '3') FC 
 
                                              LEFT JOIN  USER_BANCU.CMPA3_v1 D  ON FC.UNIT_CODE = D.UNIT_CODE  
                                              
                                              
                                              WHERE 
                                              
                                              D.UNIT_CODE IS NULL 
 
 
-- WHERE 
-- FC.UNIT_CODE_VERS = 1048
     
     
     )
     
     AND FC.UNIT_CODE_VERS  = 1048
     AND FC.FORM = 62
     AND FC.UNIT_CODE_VERS = 1048
     AND FC.STATUT = '1' 