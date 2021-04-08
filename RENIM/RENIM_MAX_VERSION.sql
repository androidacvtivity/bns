     
     
     
--        INSERT INTO CIS2.RENIM (
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
--               GEN_INSTITUTIE  
--        
--        
--        )     
--
--
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
               GEN_INSTITUTIE,
               IDNO   

          FROM  USER_BANCU.VW_MAX_RENIM_CIS2 
          
          
          WHERE 
          
      
          CUIIO IN (

40192469,
40746293,
40853468,
41031260,
41091115,
41091138,
41120590,
41125736,
41232585,
41232917,
41232946,
41236022,
41266193,
41266879,
41266885,
41315000,
41343019


)
    --AND CUIIO_VERS  = 2007




   AND CUIIO_VERS =  2009