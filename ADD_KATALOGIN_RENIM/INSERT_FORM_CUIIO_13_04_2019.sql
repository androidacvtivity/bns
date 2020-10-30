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
             43 FORM,
             2000 FORM_VERS,
             '1' STATUT
 

            FROM CIS2.RENIM
            
            WHERE
            
            ---

CUIIO IN (
41165204,
41242244,
41314934,
40605658,
40775679,
40935901,
4086898434,
41262203,
33008502,
4103837427,
41317306,
41342540,
41342557,
971012422107,
41342669
)
AND 
1=1

 AND CUIIO_VERS  = 2008

        
        
        
        
        
        ;
