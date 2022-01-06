

SELECT R.*

FROM CIS2.MD_CONTROL R 

INNER JOIN 


      (

            SELECT 
            
                CONTROL,
                MAX(CONTROL_VERS) CONTROL_VERS
                
                
            FROM CIS2.MD_CONTROL 
            
            
            GROUP BY 
            CONTROL
            
            )  L ON L.CONTROL  = R.CONTROL  
            AND L.CONTROL_VERS  = R.CONTROL_VERS
            
            
            WHERE 
            
            R.FORM = 25