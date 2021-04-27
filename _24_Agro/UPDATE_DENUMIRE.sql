       SELECT 
                
                DENUMIRE denumire_old,
                
                CASE 
           
            WHEN  DENUMIRE LIKE '%Societatea cu Raspundere Limitata%'
           
            THEN  REPLACE(DENUMIRE,'Societatea cu Raspundere Limitata','SRL')  
            
            WHEN   DENUMIRE LIKE '%GOSPODARIA TARANEASCA%'
           
            THEN  REPLACE(DENUMIRE,'GOSPODARIA TARANEASCA','GT')
            
            ---------------------------------------------------------------------
            
            WHEN   DENUMIRE LIKE '%SOCIETATEA CU RASPUNDERE LIMITATA%'
           
            THEN  REPLACE(DENUMIRE,'SOCIETATEA CU RASPUNDERE LIMITATA','SRL')
            
          --------------------------------------------------------------------
          
            WHEN   DENUMIRE LIKE '%GOSPODARIE TARANEASCA%'
           
            THEN  REPLACE(DENUMIRE,'GOSPODARIE TARANEASCA','GT')
            
            ---------------------------------------------------------------------
            WHEN   DENUMIRE LIKE '%COOPERATIVA AGRICOLA DE PRODUCTIE%'
           
            THEN  REPLACE(DENUMIRE,'COOPERATIVA AGRICOLA DE PRODUCTIE','CAP')
            
            ----------------------------------------------------------------
            WHEN   DENUMIRE LIKE '%SOCIETATEA PE ACTIUNI%'
           
            THEN  REPLACE(DENUMIRE,'SOCIETATEA PE ACTIUNI','SA')
            ----------------------------------------------------------------
            
              ----------------------------------------------------------------
            WHEN   DENUMIRE LIKE '%SOCIETATEA COMERCIALA%'
           
            THEN  REPLACE(DENUMIRE,'SOCIETATEA COMERCIALA','SC')
            ----------------------------------------------------------------
            
            
               ----------------------------------------------------------------
            WHEN   DENUMIRE LIKE '%INTREPRINDEREA INDIVIDUALA%'
           
            THEN  REPLACE(DENUMIRE,'INTREPRINDEREA INDIVIDUALA','II')
            ----------------------------------------------------------------
             ----------------------------------------------------------------
            WHEN   DENUMIRE LIKE '%Intreprinderea Individuala%'
           
            THEN  REPLACE(DENUMIRE,'Intreprinderea Individuala','II')
            ----------------------------------------------------------------
            ----------------------------------------------------------------
            WHEN   DENUMIRE LIKE '%Intreprinderea Mixta%'
           
            THEN  REPLACE(DENUMIRE,'Intreprinderea Mixta','IM')
            ----------------------------------------------------------------
            
            
            ----------------------------------------------------------------
            WHEN   DENUMIRE LIKE '%INTREPRINDEREA MIXTA%'
           
            THEN  REPLACE(DENUMIRE,'INTREPRINDEREA MIXTA','IM')
            ----------------------------------------------------------------
            
            ----------------------------------------------------------------
            WHEN   DENUMIRE LIKE '%SOCIETATE COMERCIALA%'
           
            THEN  REPLACE(DENUMIRE,'SOCIETATE COMERCIALA','SC')
            ----------------------------------------------------------------
            
            ----------------------------------------------------------------
            WHEN   DENUMIRE LIKE '%SOCIETATEA  CU RASPUNDERE LIMITATA%'
           
            THEN  REPLACE(DENUMIRE,'SOCIETATEA  CU RASPUNDERE LIMITATA','SRL')
            ----------------------------------------------------------------
            
            ----------------------------------------------------------------
            WHEN   DENUMIRE LIKE '%Societatea Comerciala%'
           
            THEN  REPLACE(DENUMIRE,'Societatea Comerciala','SC')
            ----------------------------------------------------------------
            
             ----------------------------------------------------------------
            WHEN   DENUMIRE LIKE '%COOPERATIVA AGRICOLA DE PRODUCTIE%'
           
            THEN  REPLACE(DENUMIRE,'COOPERATIVA AGRICOLA DE PRODUCTIE','CAP')
            ----------------------------------------------------------------
            
            ----------------------------------------------------------------
            WHEN   DENUMIRE LIKE '%COOPERATIVA AGRICOLA DE PRODUCTIE%'
           
            THEN  REPLACE(DENUMIRE,'COOPERATIVA AGRICOLA DE PRODUCTIE','CAP')
            ----------------------------------------------------------------
            
            
            ----------------------------------------------------------------
            WHEN   DENUMIRE LIKE '%COOPERATIVA AGRICOLA DE PRODUCTIE%'
           
            THEN  REPLACE(DENUMIRE,'COOPERATIVA AGRICOLA DE PRODUCTIE','CAP')
            ----------------------------------------------------------------
            
            
            ----------------------------------------------------------------
            WHEN   DENUMIRE LIKE '%COOPERATIVA DE PRODUCTIE%'
           
            THEN  REPLACE(DENUMIRE,'COOPERATIVA DE PRODUCTIE','CAP')
            ----------------------------------------------------------------
            
             ----------------------------------------------------------------
            WHEN   DENUMIRE LIKE '%COOPERATIVA AGRICOLA DE PRODUCTIE%'
           
            THEN  REPLACE(DENUMIRE,'COOPERATIVA AGRICOLA DE PRODUCTIE','CAP')
            ----------------------------------------------------------------
            
             ----------------------------------------------------------------
            WHEN   DENUMIRE LIKE '%Cooperativa Agricola de Productie%'
           
            THEN  REPLACE(DENUMIRE,'Cooperativa Agricola de Productie','CAP')
            ----------------------------------------------------------------
            
            
              ----------------------------------------------------------------
            WHEN   DENUMIRE LIKE '%COOPERATIVA AGRICOLA DE PRODUCERE%'
           
            THEN  REPLACE(DENUMIRE,'COOPERATIVA AGRICOLA DE PRODUCERE','CAP')
            ----------------------------------------------------------------
            
            
            ELSE DENUMIRE END 
            
            DENUMIRE 
                
                FROM CIS2.RENIM 
                
                
                WHERE 
                CUIIO_VERS = 2010 
                
                
                
                order by 
                denumire