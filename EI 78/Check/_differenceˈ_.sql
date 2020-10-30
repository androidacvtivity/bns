



    

        
    
     SELECT 
     
        
        A.CUIIO CUIIO_REN, 
        A.DENUMIRE  DENUMIRE_REN,
        B.DENUMIRE,
        A.CUATM  CUATM_REN,
        B.CUATM,
        A.CAEM2 CAEM2_REN,
        B.CAEM2,
        A.CFP  CFP_REN,
        B.CFP  
        
        
           

      FROM   USER_BANCU.VW_KATALOG_EI_78_1040 A
      
            
                        LEFT JOIN USER_BANCU.VW_EI_78_1040_TEST B ON A.CUIIO = B.CUIIO 
                        
                        
                        
                        
                        WHERE 
                        
                        B.CUIIO IS NOT NULL
                        
                        
                        AND  (A.CUATM <> B.CUATM
                        
                        OR 
                        
                        A.CAEM2 <> B.CAEM2
                        
                        OR 
                        
                        A.CFP <> B.CFP
                        
                        
                        OR 
                        
                        A.DENUMIRE <> B.DENUMIRE
                        
                        )
      
      
      
      
      
      
      
      
      
      
      