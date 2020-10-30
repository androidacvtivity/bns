--             INSERT INTO CIS2.RENIM (
--             
--             CUIIO,
--               CUIIO_VERS,
--               DENUMIRE,
--               EDIT_USER,
--               STATUT,
--               CUATM,
--               CFP,
--               CFOJ,
--               COCM,
--               CAEM,
--               BUGET,
--               TIP,
--               PROD,
--               FOR_CUB,
--               GENMUZEE,
--               TIPMUZEE,
--               TIP_LOCAL,
--               TIP_INST,
--               CAEM2,
--               N85_NTL,
--               N85_NTIIP,
--               N85_NDIIP,
--               N85_NPDS,
--               N85_NRIIP,
--               N85_NSIIP,
--               GENMUZEE2,
--               NFI,
--               NTII,
--               NPDS,
--               ORGANE,
--               TIP_INV,
--               RENIM_PERS,
--               ORGANE_COND,
--               GEN_INSTITUTIE
--             )
--             
             
             SELECT 
               CUIIO,
               CUIIO_VERS,
               DENUMIRE,
               EDIT_USER,
               STATUT,
               CUATM,
               CFP,
               CFOJ,
               COCM,
               CAEM,
               BUGET,
               TIP,
               PROD,
               FOR_CUB,
               GENMUZEE,
               TIPMUZEE,
               TIP_LOCAL,
               TIP_INST,
               CAEM2,
               N85_NTL,
               N85_NTIIP,
               N85_NDIIP,
               N85_NPDS,
               N85_NRIIP,
               N85_NSIIP,
               GENMUZEE2,
               NFI,
               NTII,
               NPDS,
               ORGANE,
               TIP_INV,
               RENIM_PERS,
               ORGANE_COND,
               GEN_INSTITUTIE  
                
                    
                    FROM USER_BANCU.VW_MAX_RENIM_CIS2
                    
                            WHERE 
                            
                            CUIIO IN (
                            
                            SELECT 
                 L.CUIIO
                
                 
                 
                 FROM  
                 (

SELECT 
                 L.CUIIO,
                 2008 CUIIO_VERS,
                 L.DENUMIRE,
                 L.CUATM,
                 L.CFP,
                 L.CFOJ,
                 R.CODUL CAEM2
                 
                 FROM  

(
            SELECT 
                 CUIIO,
                 CUIIO_VERS,
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
                         ) L   
                            
                            )
                    
                    
               
               AND  CUIIO_VERS =  2008

