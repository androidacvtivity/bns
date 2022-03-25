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
             60 FORM,
             2000 FORM_VERS,
             '1' STATUT
 

            FROM CIS2.RENIM
            
            WHERE
            
           CUIIO IN (
            
       --    2930039,
20269269,
20422944,
37434414,
37721125,
37756796,
38356366,
38786635,
40024890,
40063507,
40111270,
40140805,
40528260,
40546462,
40658293,
40693160,
40709725,
40829553,
40829731,
40871058,
40878020,
40913443,
40934899,
41167203,
41243393,
41351680

            )
            
            AND CUIIO_VERS = 2010


        
        
        
        
        
        ;
