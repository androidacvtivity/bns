UPDATE CIS2.RENIM VB
        
 SET     (

 
               
               
  VB.DENUMIRE,
  VB.CUATM, 
  VB.CFP,         
  VB.CFOJ,
  VB.CAEM2,   
  VB.IDNO

               
 
  ) 
            = 
  (          
  SELECT 

 
               
               
  C.DENUMIRE,
  C.CUATM, 
  C.CFP,         
  C.CFOJ,
  C.CAEM2,   
  C.IDNO

               
 
  FROM (


SELECT 
   L.CUIIO,
  L.CUIIO_VERS,
  L.DENUMIRE,
  L.CUATM, 
  L.CFP,         
  L.CFOJ,
  L.CAEM2,   
  L.IDNO

FROM
(
 SELECT 
         TRIM(L.CUIIO)  CUIIO,
         TRIM(L.CUIIO_VERS) CUIIO_VERS,
         TRIM(L.DENUMIRE) DENUMIRE,
         TRIM(L.CUATM)  CUATM,
         TRIM(L.CFP)    CFP,
         TRIM(L.CFOJ)   CFOJ,
         TRIM(L.CAEM2)  CAEM2,

         TRIM(L.IDNO)   IDNO
            FROM USER_BANCU.KAT_4_RSF1_2 L
            

             
             ) L
             
              LEFT   JOIN  CIS2.VW_CL_CAEM2 CA ON CA.CODUL = TRIM(L.CAEM2)  
              
              
              WHERE 
              CA.CODUL IS NOT   NULL 
              
              
  ) C
       WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                   
                )   
                WHERE EXISTS  
                
                (
      SELECT *
                    FROM (
  SELECT      
  L.CUIIO,
  L.CUIIO_VERS,
  L.DENUMIRE,
  L.CUATM, 
  L.CFP,         
  L.CFOJ,
  L.CAEM2,   
  L.IDNO
FROM
(
 SELECT 
         TRIM(L.CUIIO)  CUIIO,
         TRIM(L.CUIIO_VERS) CUIIO_VERS,
         TRIM(L.DENUMIRE) DENUMIRE,
         TRIM(L.CUATM)  CUATM,
         TRIM(L.CFOJ)   CFOJ,
         TRIM(L.CFP)    CFP,
         TRIM(L.CAEM2)  CAEM2,

         TRIM(L.IDNO)   IDNO
            FROM USER_BANCU.KAT_4_RSF1_2 L
            

             
             ) L
             
                            LEFT   JOIN  CIS2.VW_CL_CAEM2 CA ON CA.CODUL = TRIM(L.CAEM2)  
  
              
              
              WHERE 
              CA.CODUL IS NOT   NULL 
              
              
                    
                    ) C
                   WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                );