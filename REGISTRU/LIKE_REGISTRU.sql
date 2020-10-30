 
ALTER TABLE INITERNEDIAR_REGISTRU_MD
    
    ADD  WEBSITE VARCHAR2(1024 BYTE) 
    
    ;    



ALTER TABLE INITERNEDIAR_REGISTRU_MD
    
    ADD  LINKEDIN VARCHAR2(1024 BYTE) 
    
    ;    
     
alter table
   INITERNEDIAR_REGISTRU_MD
rename column
   FACEBOK
TO
   FACEBOOK;
     
     
     
     
     ---------------------------------------------------------------------
     
     SELECT 
       
        LINKEDIN  
            
            FROM INITERNEDIAR_REGISTRU_MD
            
            WHERE 
            
            DEN_COM LIKE '%SEVEN%'
            
            AND  
            
            IDNO IN (1016600006930)
            
            ORDER BY 
            
            DATA_REG DESC
            ;