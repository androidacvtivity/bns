





        SELECT C.*
        
            FROM CIS2.VW_CL_CAEM2 C
            
            
            WHERE 
            
--            (SUBSTR(C.CODUL,1,3) IN('C11'))
--            
--            OR 
            
             C.CODUL LIKE '%0'
            
         --   (SUBSTR(C.CODUL,1,3) IN('A01','C10','O84','P85','Q86'))
            
            
            
