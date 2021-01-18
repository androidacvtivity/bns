            SELECT
            A.CUIIO,
            A.STATUT,   
            A.DENUMIRE,
            A.CUATM,
            A.CFP,
  
         
            CA.CODUL  AS CAEM2,
          
             
  A.ADRESA,     
  A.TELEFON  
            
             FROM
       (




            SELECT 
            
                   L.CUIIO AS CUIIO,
                   L.DENUMIRE DENUMIRE,
                   L.CUATM CUATM_OLD,
                   L.CFP,
                   CASE 
                   
                   WHEN LENGTH(L.CUATM) = 6  AND SUBSTR(L.CUATM,1,1) =  '1' THEN '0'||L.CUATM 
                   
                   
                   WHEN LENGTH(L.CUATM) = 6  AND SUBSTR(L.CUATM,1,1) =  '3' THEN '0'||L.CUATM 
                   
                   ELSE  L.CUATM END  CUATM,
                   
                   L.CAEM2,
                   
                   CASE WHEN  LENGTH(L.CAEM2) = 5   THEN SUBSTR(L.CAEM2,2,7)  ELSE  L.CAEM2 END  NEW_CAEM2, 
                   
                   
                   SUBSTR(L.CUATM,1,1) CUT,
                   
                   --
                   
                   
 -- CUIIO      
  --CUIIO_VERS 
  L.STATUT,     
--  L.DENUMIRE,  
  --CUATM      
  --CFP        
  --CAEM2      
  L.ADRESA,     
  L.TELEFON    
                   --  

            FROM USER_BANCU.KATALOG_EI_78_1040 L
            
            
            WHERE 
            
            1=1 
       
            ) A
            
            
                        INNER  JOIN  CIS2.VW_CL_CUATM C ON C.CODUL = A.CUATM 
                        INNER  JOIN  CIS2.VW_CL_CAEM2 CA ON CA.NUME_CODE = A.NEW_CAEM2
                        INNER  JOIN  CIS2.VW_CL_CFP CFP  ON CFP.CODUL = A.CFP
                       
            WHERE
            1=1
            
            
     --         AND C.CODUL IS NOT NULL 
           AND CA.CODUL IS NOT  NULL 
            
--            AND A.CUIIO IN (
--            41174445,
--41288697,
--41288906,
--41300033,
--41300429,
--41300688,
--41300903,
--41300912,
--41301831,
--41301854,
--41301920,
--41301937,
--41301995,
--41302173,
--41302730,
--41302954,
--41303758,
--41303994,
--41304002,
--41304545,
--41305668
--)