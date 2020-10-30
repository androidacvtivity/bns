
--    INSERT INTO CIS2.RENIM (
--    
--      CUIIO,
--      CUIIO_VERS,
--      DENUMIRE,        
--      EDIT_USER,       
--      STATUT,          
--      CUATM,           
--      CFP,
--      BUGET,
--      TIP,              
--      CAEM2   
--    
--    )




    SELECT 
    
        R.CUIIO,
        2007  CUIIO_VERS,
        R.DENUMIRE,        
        0 EDIT_USER,       
       '0' STATUT,          
        R.CUATM,           
        R.CFP,
       '0' BUGET,
       '0' TIP,              
        R.CAEM2         
       
      
        FROM

    (

       SELECT * 
       
         
       
       FROM  USER_BANCU.VW_MAX_RENIM_CIS2 ) L  RIGHT JOIN 

       (

        SELECT 
        
            A.CUIIO,
            A.DENUMIRE,
            A.CUATM,
            
      
            A.CFP,
         
            CA.CODUL  AS CAEM2
            
              
            
            FROM


        (

            SELECT 
            
                   L.CUIO AS CUIIO,
                   L.DENUMIREA DENUMIRE,
                   L.CUATM CUATM_OLD,
                   L.CFP,
                   CASE 
                   
                   WHEN LENGTH(L.CUATM) = 6  AND SUBSTR(L.CUATM,1,1) =  '1' THEN '0'||L.CUATM 
                   
                   
                   WHEN LENGTH(L.CUATM) = 6  AND SUBSTR(L.CUATM,1,1) =  '3' THEN '0'||L.CUATM 
                   
                   ELSE  L.CUATM END  CUATM,
                   
                   L.CAEM2,
                   
                   CASE WHEN  LENGTH(L.CAEM2) = 5   THEN SUBSTR(L.CAEM2,2,7)  ELSE  L.CAEM2 END  NEW_CAEM2, 
                   
                   
                   SUBSTR(L.CUATM,1,1) CUT  

            FROM USER_BANCU.IT_PARK_CHISNAU_2018 L
            
            
            WHERE 
            
            1=1 
       
            ) A
            
            
                        INNER  JOIN  CIS2.VW_CL_CUATM C ON C.CODUL = A.CUATM 
                        INNER   JOIN  CIS2.VW_CL_CAEM2 CA ON SUBSTR(CA.CODUL,2,7) = A.NEW_CAEM2
                        INNER  JOIN  CIS2.VW_CL_CFP CFP  ON CFP.CODUL = A.CFP
                       
            WHERE
            1=1
            
           -- AND CA.CODUL IS NULL 
           -- AND C.CODUL IS NOT  NULL
             
            --AND LENGTH(A.CUATM) = 7    
  
            -- AND  LENGTH(A.NEW_CAEM2) =  4   


         )  R ON R.CUIIO = L.CUIIO

                            


            WHERE 
            L.CUIIO IS NULL     
       