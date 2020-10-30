SELECT 
                 L.CUIIO,
                 L.CUIIO_VERS,
                 L.DENUMIRE,
                 L.CUATM,
                 L.CFP,
                 L.CFOJ,
                 R.CODUL CAEM2
                 
                 FROM  

(
            SELECT 
                 CUIIO,
                 2008 CUIIO_VERS,
                 DENUMIRE,
                 REPLACE (CUATM,'O','0') CUATM,
                 CFP,
                 CFOJ,
                 CAEM2   
            
                FROM USER_BANCU.RENIM_1_TR_AUTO 
                ) L 
                
                
                         LEFT JOIN CIS2.VW_CL_CAEM2  R ON R.NUM_CODE = L.CAEM2
                         
                         
                         WHERE 
                         R.NUM_CODE IS NOT NULL 
                         