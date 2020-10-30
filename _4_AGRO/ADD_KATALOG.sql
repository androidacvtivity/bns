
--INSERT INTO RENIM (
--             CUIIO,
--             CUIIO_VERS,
--             DENUMIRE,
--             EDIT_USER,
--             STATUT,
--             CUATM,
--             CFP,
--             CFOJ,
--             BUGET,
--             TIP
--            )
            
            SELECT 
             R.CUIIO,
             R.CUIIO_VERS,
             R.DENUMIRE,
             1 EDIT_USER,
             '1' STATUT,
             R.CUATM,
             R.CFP,
             R.CFOJ,
             '0' BUGET,
             '0' TIP
             

              
             
              FROM USER_BANCU.KATALOG R 
              
                     LEFT  JOIN RENIM RE ON  RE.CUIIO = R.CUIIO AND RE.CUIIO_VERS = R.CUIIO_VERS 
                     
                     
                     WHERE 
                     
                     RE.CUIIO IS   NOT NULL 
            

                   
