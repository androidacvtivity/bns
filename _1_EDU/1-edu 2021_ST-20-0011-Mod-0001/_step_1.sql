             SELECT 
            D.ID_MDTABLE,
            D.TABELE,
            D.TABELE_VERS 
            
            FROM CIS2.MD_TABLES D INNER join (    
            
            SELECT 
           
            D.TABELE,
            MAX (D.TABELE_VERS) TABELE_VERS  
    
            FROM CIS2.MD_TABLES D
             where 
            D.FORM = 40
            
            group BY 
           
            D.TABELE 
            
            
            ) DD on (D.TABELE = dd.TABELE AND D.TABELE_VERS = dd.TABELE_VERS )
            
            where 
            D.FORM = 40
            
            
            group BY 
             D.ID_MDTABLE,
            D.TABELE,
            D.TABELE_VERS,
            d.ORDINE 
            
            order BY 
            d.ORDINE
            