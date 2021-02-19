  SELECT 
  L.CUIIO,
  L.CUIIO_VERS,
  L.DENUMIRE,
--  L.CUATM,
--  L.CFP,
  L.CAEM2
--  L.IDNO  

FROM
(
 SELECT 
         TRIM(L.CUIIO)  CUIIO,
         TRIM(L.CUIIO_VERS) CUIIO_VERS,
         TRIM(L.DENUMIRE) DENUMIRE,
--         TRIM(L.CUATM)  CUATM,
--         TRIM(L.CFP)    CFP,
         TRIM(L.CAEM2)  CAEM2
        -- TRIM(L.IDNO)   IDNO
            FROM USER_BANCU.KAT_5_CI_1047 L
            
            
--             LEFT   JOIN  CIS2.VW_CL_CUATM C ON TRIM(C.CODUL) = TRIM(L.CUATM)  
--             
--             WHERE 
--             C.CODUL IS NOT NULL 
             
             ) L
             
              LEFT   JOIN  CIS2.VW_CL_CAEM2 CA ON CA.CODUL = TRIM(L.CAEM2)  
              
              
              WHERE 
              CA.CODUL IS NOT  NULL 
              
              