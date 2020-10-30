            


--
--      INSERT INTO CIS2.FORM_CUIIO
--      
--        (
--                CUIIO,
--                CUIIO_VERS,
--                FORM,
--                FORM_VERS,
--                STATUT
--                
--        
--        )




            
            SELECT 
            
             CUIIO,
             CUIIO_VERS,
             60 FORM,
             2000 FORM_VERS,
             '1' STATUT 
               



          FROM    RENIM
     
     WHERE 
           
           CUIIO IN (
40949079,
2684427,
41022195,
40399911,
40113607,
40278716,
40152168,
38892359,
38855721,
20187578,
20419066,
28433054,
1845194,
40211356,
4016515927,
40935261,
40935284,
40868352,
40868346,
40935255,
40810430
)


AND CUIIO_VERS  IN (2007)