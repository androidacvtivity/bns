

     SELECT 
            CAEM2  
        FROM USER_BANCU.VW_PRODMOLD_2006;

------------------------------------------------------------        

        SELECT *
        FROM USER_BANCU.VW_PRODMOLD_2006;




;--END
--
--CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_PRODMOLD_2006
--(
--   CUIIO,
--   CUIIO_VERS,
--   CAEM2
--)
--AS
        

--            SELECT 
--                  VB.CUIIO,
--                  VB.CUIIO_VERS,
--                  VB.CAEM2,
--                  C.CODUL
--                  
--            FROM 
--            (

             SELECT
             
                L.CUIIO,
                L.CUIIO_VERS,
                TRIM(L.CAEM2)  CAEM2,
                R.CAEM2 NEW_CAEM2
            
            
             FROM USER_BANCU.NAME_2_INVEST_ANUL  L
             
                         LEFT JOIN CIS.RENIM R ON (R.CUIIO = L.CUIIO  AND R.CUIIO_VERS = L.CUIIO_VERS)
                         LEFT JOIN CIS2.VW_CL_CAEM2 C ON C.CODUL = L.CAEM2 

                WHERE 
                R.CUIIO IS NOT NULL 
                OR 
                C.CODUL IS NOT NULL
                
                
                --) VB
                
                          
                ; --END SQL




-------------------------------------------------------------------------------

            UPDATE  USER_BANCU.NAME_2_INVEST_ANUL
            
            
                SET CUIIO_VERS = 2006; 
                
      ---------------------------------------------------          
                



            SELECT *
            
            
             FROM USER_BANCU.NAME_2_INVEST_ANUL;