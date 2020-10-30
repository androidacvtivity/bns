





        SELECT 
        
        A.*
        
        FROM


        (       

        SELECT 
            
            A.CUIIO,
            CASE WHEN A.CUIIO = B .CUIIO THEN B.DENUMIRE ELSE  A.DENUMIREA END DENUMIREA, 
            A.CUATM,
            A.CFP,
            A.CAEM2,
            A.ADRESA,
            A.TELEFON
            
            
        FROM USER_BANCU.KATALOG_EI_78_2019 A
        
        
                              LEFT JOIN USER_BANCU.KATALOG_EI_NAME B ON B.CUIIO = A.CUIIO
                              
                              ) A  
                              
                              
                              
                              LEFT JOIN CIS2.VW_CL_CUATM C ON C.CODUL = A.CUATM
                              
                              
                              
                              WHERE 
                              C.CODUL IS NOT   NULL
                              
                              
                              
                              ORDER BY 
                              
                              C.FULL_CODE,
                              A.CUIIO
                              
                              