--
--        INSERT INTO FORM_CUIIO 
--        (
--        CUIIO,
--        CUIIO_VERS,
--        FORM,
--        FORM_VERS,
--        STATUT
--        
--        )
           
        SELECT 
             CUIIO,
             CUIIO_VERS,
             45 FORM,
             1004 FORM_VERS,
             '1'  STATUT 
            

            

           FROM  USER_BANCU.VW_MAX_RENIM_TRIM_CIS2
           
           
           WHERE
          

           
CUIIO IN (
4088191548,
4106781948,
4122377589,
3860297780,
31416890,
26910890,
--31299899,
27014898,
31199897,
7990892,
--41151062,
--41151062,
41267703,
40092213,
40891534,
40558924,
41136020,
40840796,
100683463


)

































 
          
     ORDER BY 
     
     CUIIO