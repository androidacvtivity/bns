








            SELECT 
             CUIIO,
             MAX(CUIIO_VERS)  CUIIO_VERS,
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
             
             FROM CIS2.RENIM
             
             GROUP BY 
             CUIIO,
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