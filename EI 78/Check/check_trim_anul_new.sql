          

         SELECT 
            L.*
            
                FROM USER_BANCU.VW_KATALOG_EI_78_2008  L
                
                
                        LEFT JOIN USER_BANCU.VW_KATALOG_EI_78_1040 R ON (L.CUIIO = R.CUIIO)
                        
                        WHERE 
                        R.CUIIO IS NOT NULL
                        
                        
                        AND  
                                    
                                    (
                                    R.CUATM = L.CUATM
                                    
                                     
                                    
                                    OR R.DENUMIRE = L.DENUMIRE
                                    
                                     
                                    
                                    
                                    OR R.CAEM2 = L.CAEM2   
                                    
                                    
                                    OR 
                                    
                                    
                                    R.CFP = L.CFP
                                    
                                    
                                    )
                         