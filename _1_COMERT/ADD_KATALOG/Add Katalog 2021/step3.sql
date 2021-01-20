--INSERT INTO USER_BANCU.KAT_1_COMERT_2009_FINAL 
--(
--  CUIIO,
--  CUIIO_VERS,
--  DENUMIRE,
--  CUATM,
--  CFP,
--  CAEM2  
--  
--  )
--  
  SELECT 
  L.CUIIO,
  L.CUIIO_VERS,
  L.DENUMIRE,
  L.CUATM,
  L.CFP,
  CA.CODUL CAEM2  
  
  FROM 
  
 
 (


  SELECT 
  L.CUIIO,
  L.CUIIO_VERS,
  L.DENUMIRE,
  L.CUATM,
  L.CFP,
  L.CAEM2  
  
  FROM 
  
 
 (
 
 
 SELECT 
  L.CUIIO,
  L.CUIIO_VERS,
  L.DENUMIRE,
 CASE 
                   
                   WHEN LENGTH(L.CUATM) = 6  AND SUBSTR(L.CUATM,1,1) =  '1' THEN '0'||L.CUATM 
                   
                   
                   WHEN LENGTH(L.CUATM) = 6  AND SUBSTR(L.CUATM,1,1) =  '3' THEN '0'||L.CUATM 
                   
                   ELSE  L.CUATM END  CUATM,
  L.CFP,
  L.CAEM2  
  
  FROM USER_BANCU.KAT_1_COMERT_2009 L
  
  )  L  LEFT   JOIN  CIS2.VW_CL_CUATM C ON C.CODUL = L.CUATM 
  
  WHERE 
  
  C.CODUL IS NOT   NULL 
  --40758505  -- 2701000
  ) L  
  
    LEFT   JOIN  CIS2.VW_CL_CAEM2 CA ON CA.NUM_CODE = TRIM(L.CAEM2)  
    INNER  JOIN  CIS2.VW_CL_CFP CFP  ON CFP.CODUL = L.CFP
--    
    WHERE 
    CFP.CODUL IS NOT NULL 
 AND    CA.NUM_CODE IS  NOT   NULL 