﻿--INSERT INTO CIS2.RENIM (
--        
--        CUIIO,
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
--               GEN_INSTITUTIE,
--               IDNO  
--        
--        
--        )     


     
     
     
     
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
               GEN_INSTITUTIE,
               IDNO   

          FROM  USER_BANCU.VW_MAX_RENIM_TRIM_CIS2
         -- USER_BANCU.VW_MAX_RENIM_TRIM_CIS2
          
          
          WHERE 
          
      
        

CUIIO IN  (

22160,
94438,
20372896,
32769344,
575973,
1111311,
40135916,
37783801,
10055340,
22250,
38945074

) 

--AND ( CUIIO_VERS <> 1050 ) --AND CUIIO_VERS <> 2010 )