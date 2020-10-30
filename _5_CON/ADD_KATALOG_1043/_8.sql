
--INSERT INTO CIS2.RENIM A (
--
--           A.CUIIO,
--           A.CUIIO_VERS,
--           A.DENUMIRE,
--           A.EDIT_USER,
--           A.STATUT,
--           A.CUATM,
--           A.CFP,
--           A.CFOJ,
--
--           A.BUGET,
--           A.TIP,
--          
--           A.CAEM2
--) 

SELECT 
           A.CUIIO,
           A.CUIIO_VERS,
           A.DENUMIRE,
           1 EDIT_USER,
           '1' STATUT,
           A.CUATM,
           A.CFP,
           A.CFOJ,
          
           '0' BUGET,
           '0' TIP,
          
           A.CAEM2

         FROM USER_BANCU.KAT_5_CON_1043_1 A  
                                LEFT JOIN CIS2.RENIM B ON A.CUIIO = B.CUIIO AND 
                                                          A.CUIIO_VERS = B.CUIIO_VERS                                  
                                                          
                                                          
                                                          WHERE 
                                                          
                                                          B.CUIIO IS  NOT  NULL