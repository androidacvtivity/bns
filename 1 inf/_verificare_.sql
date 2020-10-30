




    
    SELECT 
      A.CUIIO  A_CUIIO,
      R.CUIIO  R_CUIIO,
      A.CUIIO_VERS A_CUIIO_VERS,
      R.CUIIO_VERS R_CUIIO_VERS,
      A.DENUMIRE    A_DENUMIRE,
      R.DENUMIRE    R_DENUMIRE,
      A.CUATM       A_CUATM,
      R.CUATM       R_CUATM,
      A.CAEM2       A_CAEM2,
      R.CAEM2       R_CAEM2,
      A.CFP         A_CFP,
      R.CFP         R_CFP

    
    
    FROM USER_BANCU.VW_1_INF_2006_FINAL A 
    
    
                LEFT JOIN CIS2.RENIM R ON (R.CUIIO = A.CUIIO  AND R.CUIIO_VERS = A.CUIIO_VERS) 
                
                
                
                WHERE 
                
                
                R.CUIIO IS NOT NULL
                
                
                AND     
                
                
                (
                
--                A.CUATM <> R.CUATM 
--                
--                
--                OR   A.CAEM2 <> R.CAEM2 
--                
--                
--                OR 
                
--                A.CFP  =  R.CFP 
--                
--                
--                AND  
                
                A.DENUMIRE  <>  R.DENUMIRE 
                
                ) 
                