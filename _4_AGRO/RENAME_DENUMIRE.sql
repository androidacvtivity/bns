--
--  CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_RENAME_4AGRO_DEN
--(
--           CUIIO,
--           CUIIO_VERS,
--           DEN_ORIG,
--           DENUMIRE
--)
--AS
--

        

        SELECT 
        
           CUIIO,
           CUIIO_VERS,
           DENUMIRE DEN_ORIG,
           
           CASE 
           
            WHEN  DENUMIRE LIKE '%Societatea cu Raspundere Limitata%'
           
            THEN  REPLACE(DENUMIRE,'Societatea cu Raspundere Limitata','SRL')  
            
            WHEN   DENUMIRE LIKE '%GOSPODARIA TARANEASCA%'
           
            THEN  REPLACE(DENUMIRE,'GOSPODARIA TARANEASCA','GŢ')
            
            ---------------------------------------------------------------------
            
            WHEN   DENUMIRE LIKE '%SOCIETATEA CU RASPUNDERE LIMITATA%'
           
            THEN  REPLACE(DENUMIRE,'SOCIETATEA CU RASPUNDERE LIMITATA','SRL')
            
          --------------------------------------------------------------------
          
            WHEN   DENUMIRE LIKE '%GOSPODARIE TARANEASCA%'
           
            THEN  REPLACE(DENUMIRE,'GOSPODARIE TARANEASCA','GŢ')
            
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
            
            
            ELSE DENUMIRE END 
            
            DENUMIRE 
        
        FROM USER_BANCU.VW_KATALOG_4AGRO_2018
        
        
        WHERE 
        1=1 
--      --  
--      
 --    AND DENUMIRE NOT  LIKE '%Societatea cu Raspundere Limitata%'
--      
--       AND DENUMIRE NOT LIKE '%SOCIETATEA CU RASPUNDERE LIMITATA%'
--        
--       AND DENUMIRE NOT  LIKE '%GOSPODARIA TARANEASCA%'
--       
--       AND DENUMIRE   NOT LIKE '%GOSPODARIE TARANEASCA%'
--       
--       AND DENUMIRE   NOT  LIKE '%COOPERATIVA AGRICOLA DE PRODUCTIE%'
--       
--       AND DENUMIRE   NOT  LIKE '%SOCIETATEA PE ACTIUNI%'
--       
--       AND DENUMIRE   NOT   LIKE '%SOCIETATEA COMERCIALA%'
--       
--       AND DENUMIRE    NOT   LIKE '%INTREPRINDEREA INDIVIDUALA%'
--       
--       AND DENUMIRE     NOT   LIKE '%Intreprinderea Individuala%'
--       
--       AND DENUMIRE     NOT   LIKE '%Intreprinderea Mixta%'
--       
--       AND DENUMIRE    NOT   LIKE '%INTREPRINDEREA MIXTA%'
--       
--       AND DENUMIRE     NOT   LIKE '%SOCIETATE COMERCIALA%'
--       
--       AND DENUMIRE     NOT    LIKE '%SOCIETATEA  CU RASPUNDERE LIMITATA%'
--       
--       AND DENUMIRE      NOT   LIKE '%Societatea Comerciala%'
        
        
        ORDER BY 
        
        DENUMIRE