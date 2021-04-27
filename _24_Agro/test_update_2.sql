UPDATE CIS2.RENIM

SET DENUMIRE = CASE 
           
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
            WHEN   DENUMIRE LIKE '%intreprinderea Mixta%'
           
            THEN  REPLACE(DENUMIRE,'intreprinderea Mixta','IM')
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
            
            
               ----------------------------------------------------------------
            WHEN   DENUMIRE LIKE '%Societatea pe Actiuni%'
           
            THEN  REPLACE(DENUMIRE,'Societatea pe Actiuni','SA')
            ----------------------------------------------------------------
            
            
             ----------------------------------------------------------------
            WHEN   DENUMIRE LIKE '%Societate cu Raspundere Limitata%'
           
            THEN  REPLACE(DENUMIRE,'Societate cu Raspundere Limitata','SRL')
            ----------------------------------------------------------------
            
            
              ----------------------------------------------------------------
            WHEN   DENUMIRE LIKE '%SOCIETATE CU RASPUNDERE LIMITATA%'
           
            THEN  REPLACE(DENUMIRE,'SOCIETATE CU RASPUNDERE LIMITATA','SRL')
            ----------------------------------------------------------------
            
            
              ----------------------------------------------------------------
            WHEN   DENUMIRE LIKE '%societatea cu Raspundere Limitata%'
           
            THEN  REPLACE(DENUMIRE,'societatea cu Raspundere Limitata','SRL')
            ----------------------------------------------------------------
            
            
             WHEN   DENUMIRE LIKE '%Societatea  cu Raspundere Limitata%'
           
            THEN  REPLACE(DENUMIRE,'Societatea  cu Raspundere Limitata','SRL')
            ----------------------------------------------------------------
            
            
             WHEN   DENUMIRE LIKE '%Societatea cu raspundere Limitata%'
           
            THEN  REPLACE(DENUMIRE,'Societatea cu raspundere Limitata','SRL')
            ----------------------------------------------------------------
            
            WHEN   DENUMIRE LIKE '%Societatea Cu Raspundere Limitata%'
           
            THEN  REPLACE(DENUMIRE,'Societatea Cu Raspundere Limitata','SRL')
            ----------------------------------------------------------------
            
             WHEN   DENUMIRE LIKE '%Societatea cu raspundere limitata%'
           
            THEN  REPLACE(DENUMIRE,'Societatea cu raspundere limitata','SRL')
            ----------------------------------------------------------------
            
             WHEN   DENUMIRE LIKE '%Societatea cu Raspundere  Limitata%'
           
            THEN  REPLACE(DENUMIRE,'Societatea cu Raspundere  Limitata','SRL')
            ----------------------------------------------------------------
            
            
            
            
            ELSE DENUMIRE END 
            
            
            
             WHERE 
                CUIIO_VERS  IN  (1048,2010,2009,1047,1046,1045,1044)