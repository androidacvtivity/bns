--       INSERT INTO CIS2.RENIM  
--    
--            (
--               CUIIO,
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
--               )



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

2733327,
2733505,
2751224,
15848612,
20300773,
20478608,
40135616,
40192699,
40265027,
40286590,
40287626,
40354305,
40528231,
40528395,
40547197,
40588977,
40757339,
40781496,
40781556,
41021729,
41055786,
41119055,
41121158,
41195978,
41209737,
41209781,
41210815,
41210821,
41229849,
41229950,
41229950,
41231088,
41231119,
41231183,
41241632,
41243482,
41243528,
41243588,
41243588,
41255918,
41258041,
41258041,
41258058,
41258124,
41259224,
41259342,
41260227,
41260339,
41260351,
41282140,
41282252,
41284127,
41284392
)

AND CUIIO_VERS   =   2007

---------------------

    ORDER BY 
    CUIIO



 --AND CUIIO_VERS =   2007