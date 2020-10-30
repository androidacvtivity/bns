                         SELECT  *
                                   
                                   
                                 FROM     VW_REGISTRU_MODIF    
                                    
                                    WHERE 
                                    1=1
                                    
                                    AND 
                                    
                                    (DEN_COM  LIKE  '%BASS%'
                                    
                                    OR 
                                    
                                    DEN_COM  LIKE  '%SYSTEMS%'
                                    
                                    
                                    OR 
                                    
                                    DEN_COM  LIKE  '%SYSTEMS%'
                                    
                                    )
                                    
                                    
                                    
                                  ORDER BY 
                                    DATA_REG DESC;