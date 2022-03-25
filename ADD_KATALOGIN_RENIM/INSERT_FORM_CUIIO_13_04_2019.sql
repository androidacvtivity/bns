--INSERT INTO CIS2.FORM_CUIIO 
--    
--     (
--     
--       CUIIO,
--       CUIIO_VERS,
--       FORM,
--       FORM_VERS,
--       STATUT
--     )


      SELECT CUIIO,
             CUIIO_VERS,
             63 FORM,
             2000 FORM_VERS,
             '1' STATUT
 

            FROM CIS2.RENIM
            
            WHERE
            
            ---


CUIIO IN (
41009384,
41417976,
41452725,
41452748,
41455043,
41471697,
41473489,
41476795,
41479138,
41479181,
41479322,
41479463,
41485469,
41499750,
41505841,
41536511,
41536681
) AND CUIIO_VERS >= 2010

AND 
1=1



        
        
        
        
        
        ;
