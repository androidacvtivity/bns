
               
               INSERT INTO CIS2.FORM_CUIIO 
               (
                    CUIIO,
                    CUIIO_VERS,
                    FORM,
                    FORM_VERS,
                    STATUT
               
               )
               SELECT             
                   B.CUIIO CUIIO,
                   B.CUIIO_VERS,
                   5 FORM,
                   1004 FORM_VERS,
                   '1' STATUT

    
           
           
          
          FROM   USER_BANCU.VW_65_AUTO_420 A  RIGHT JOIN USER_BANCU.KAT_1_AUTO_v2  B ON B.CUIIO = A.CUIIO AND B.CUIIO_VERS = A.CUIIO_VERS
          
          WHERE 
          
          A.CUIIO IS  NULL 
          
          
          
          
                