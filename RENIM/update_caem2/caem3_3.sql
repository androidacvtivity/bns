  SELECT 
  L.CUIIO,
  L.CUIIO_VERS,

  TRIM(CA.CODUL) CAEM2


FROM
(
 SELECT 
         TRIM(L.CUIIO)  CUIIO,
         TRIM(L.CUIIO_VERS) CUIIO_VERS,
         TRIM(L.DENUMIRE) DENUMIRE,
         TRIM(L.CUATM)  CUATM,
         TRIM(L.CFP)    CFP,
         TRIM(L.CAEM2)  CAEM2,

         TRIM(L.IDNO)   IDNO
            FROM USER_BANCU.KAT_CAEM2 L
            

             
             ) L
             
              LEFT   JOIN  CIS2.VW_CL_CAEM2 CA ON CA.NUM_CODE = TRIM(L.CAEM2)  
              
              
              WHERE 
              CA.CODUL IS NOT   NULL 
              
              