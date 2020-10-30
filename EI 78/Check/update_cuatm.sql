

--STEP 1
                CREATE TABLE RENIM 


                AS 

                SELECT *
                
                
                    FROM CIS2.RENIM;
                    
                    
                    
--STEP2

--UPDATE RENIM VB

SET (

                VB.CUATM,
                VB.DENUMIRE,
                VB.CAEM2
) =

       (  SELECT 
            
              
                C.CUATM,
                C.DENUMIRE,
                C.CAEM2


           FROM USER_BANCU.VW_EI_78_2007 C
           
            WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                   
                )  
                 WHERE EXISTS  
                
                (
                    SELECT *
                    
                    FROM USER_BANCU.VW_EI_78_2007 C
                   
                   WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                );
                
                
                
                -----------------------------------------------
              --STEP3  
                
                SELECT  
          
            L.CUIIO ANUL_CUIIO,
            L.DENUMIRE,
            R.CUIIO TRIM_CUIIO,
            L.CUATM ANUL_CUATM,
            R.CUATM TRIM_CUATMa
     
            FROM   USER_BANCU.VW_KATALOG_EI_78_2007 L
            
                        
                                    RIGHT JOIN   USER_BANCU.VW_KATALOG_EI_78_1039 R ON R.CUIIO = L.CUIIO-- AND R.CUATM = L.CUATM
                                    
                                    
                                    
                                    WHERE 
                                    
                                    1=1
                                    
                                    
                                  AND   L.CUIIO IS NOT  NULL
                                     
                                    AND  
                                    
                                    (
                                    R.CUATM <> L.CUATM
                                    
                                    OR 
                                    
                                    R.DENUMIRE <> L.DENUMIRE
                                    
                                     
                                    OR 
                                    
                                    R.CAEM2 <> L.CAEM2   
                                    
                                    )
                