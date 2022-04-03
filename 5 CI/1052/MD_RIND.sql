--UPDATE  MD_RIND
--
--SET DENUMIRE =  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(DENUMIRE,'a','a'),'s','s'),'t','t'),'î','i'),'â','a'),'?','s') 

SELECT 
        RIND,
        DENUMIRE,
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(DENUMIRE,'a','a'),'s','s'),'t','t'),'î','i'),'â','a'),'?','s') 
        AS DENUMIRE

        
        FROM MD_RIND
        
        WHERE 
        
        FORM = 1
        
        
        AND 
        
        (-
        DENUMIRE LIKE '%a%'
        or 
        DENUMIRE LIKE '%s%'
        ) 
        
--        
--        
--        
--        ORDER BY 
--        ID_MD