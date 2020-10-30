  
   SELECT 
            D.CUIIO,
            D.CUIIO_VERS,
            D.CUATM
            
            
            FROM USER_BANCU.VW_KATALOG_1_ACHIZ_2017 D
            
            WHERE 
            D.CUATM LIKE '67%'
  ;
  
  
  --------------------------------------------------------------------------------------       
            UPDATE CIS2.FORM_CUIIO A 
            
            SET (
                 A.STATUT  
              ) = (
             
            
            SELECT FC.STATUT  
            
               
            FROM USER_BANCU.VW_FROM_CUIIO FC 
            
            
                WHERE 
                FC.CUIIO = A.CUIIO 
                AND FC.CUIIO_VERS = A.CUIIO_VERS
                AND FC.FORM = A.FORM 
                AND FC.FORM_VERS = A.FORM_VERS 
            
            
            
            )
            
            
            WHERE EXISTS 
            
            
             (
             
             SELECT FC.* 
            
               
            FROM USER_BANCU.VW_FROM_CUIIO FC 
            
            
                WHERE 
                FC.CUIIO = A.CUIIO 
                AND FC.CUIIO_VERS = A.CUIIO_VERS
                AND FC.FORM = A.FORM 
                AND FC.FORM_VERS = A.FORM_VERS 
              );

-------------------------------------------------------------------------------

SELECT *
FROM USER_BANCU.VW_FROM_CUIIO;

-------------------------------------------------------------------------------         
--         CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_FROM_CUIIO
--         (
--            CUIIO,
--            CUIIO_VERS,
--            FORM,
--            FORM_VERS,
--            STATUT
--           ) 
--           
--           AS 


SELECT 
            D.CUIIO,
            D.CUIIO_VERS,
            FC.FORM,
            FC.FORM_VERS,
            FC.STATUT
            
            FROM
            (
SELECT 
            D.CUIIO,
            D.CUIIO_VERS,
            D.CUATM
            
            
            FROM USER_BANCU.VW_KATALOG_2_ACHIZ_2017 D
            
            WHERE 
            D.CUATM LIKE '67%'
            AND D.CUATM LIKE '67%'
            
           

              ) D INNER JOIN CIS2.FORM_CUIIO FC ON (FC.CUIIO = D.CUIIO AND 
              
                                                    FC.CUIIO_VERS = D.CUIIO_VERS AND FC.FORM = 53  )
              
              
              
              
              
              ;





-------------------------------------------------------------------------------

            -- ALL CUATM 

            SELECT 
            D.CUIIO,
            D.CUIIO_VERS,
            D.CUATM
            
            
            FROM USER_BANCU.VW_KATALOG_2_ACHIZ_2017 D
            
            WHERE 
            D.CUATM LIKE '55%'
            
            
            
            
--            AND D.CUIIO NOT  IN  (
--            
--            37698136,
--3001709,
--40584382,
--37670445,
--38401753,
--415876,
--38176061,
--38869077,
--38887678,
--37308649,
--38995706,
--37296113,
--3002985,
--40099391,
--40357189,
--38189655)      


;            

            
            
            -- ALL CUATM 

            SELECT *
            FROM USER_BANCU.VW_KATALOG_1_ACHIZ_2017;