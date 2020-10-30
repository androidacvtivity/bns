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
             46  FORM,
             2000 FORM_VERS,
             '1' STATUT
 

            FROM CIS2.RENIM
            
            WHERE
            
CUIIO IN (
       
       41326133,
40560625,
40790319,
41275387,
41240443,
41326498,
37776468,
37606697,  --40790319
41301831,
41324692,
40256577,
41285291


      )
       
      
      AND CUIIO_VERS  IN (1040)
        
        
        
        ;
