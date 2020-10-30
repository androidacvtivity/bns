

--          INSERT INTO CIS2.RENIM (
--          CUIIO,
--   CUIIO_VERS,
--   DENUMIRE,
--   EDIT_USER,
--   STATUT,
--   CUATM,
--   CFP,
--   CFOJ,
--   COCM,
--   CAEM,
--   BUGET,
--   TIP,
--   PROD,
--   FOR_CUB,
--   GENMUZEE,
--   TIPMUZEE,
--   TIP_LOCAL,
--   TIP_INST,
--   CAEM2,
--   N85_NTL,
--   N85_NTIIP,
--   N85_NDIIP,
--   N85_NPDS,
--   N85_NRIIP,
--   N85_NSIIP,
--   GENMUZEE2,
--   NFI,
--   NTII,
--   NPDS,
--   ORGANE,
--   TIP_INV,
--   RENIM_PERS,
--   ORGANE_COND,
--   GEN_INSTITUTIE
--          
--          
--          )


        SELECT 
          R.CUIIO,
          2007 CUIIO_VERS,
          R.DENUMIREA,
          L.EDIT_USER,
          L.STATUT,
          C.CODUL CUATM,
          R.CFP,
          R.CFOJ,  
          L.COCM,
          L.CAEM,
          L.BUGET,
          L.TIP,
          L.PROD,
          L.FOR_CUB,
          L.GENMUZEE,
          L.TIPMUZEE,
          L.TIP_LOCAL,
          L.TIP_INST,
          R.CAEM2,
          L.N85_NTL,
          L.N85_NTIIP,
          L.N85_NDIIP,
          L.N85_NPDS,
          L.N85_NRIIP,
          L.N85_NSIIP,
          L.GENMUZEE2,
          L.NFI,
          L.NTII,
          L.NPDS,
          L.ORGANE,
          L.TIP_INV,
          L.RENIM_PERS,
          L.ORGANE_COND,
          L.GEN_INSTITUTIE
          
        FROM USER_BANCU.INSERT_4AGRO R
                     
                         LEFT JOIN 
                         
                         (
                         SELECT *
                         FROM USER_BANCU.VW_MAX_RENIM_CIS2
                         
                                        
                         
                         WHERE 
                         1=1 
                         
                         
                         )  
                         
                         
                         L ON (L.CUIIO = R. CUIIO) 
                         
                         LEFT JOIN CIS2.VW_CL_CUATM C ON TRIM(R.CUATM) = C.CODUL 
                         
                       WHERE 
                       
                       L.CUIIO_VERS NOT IN (2007)
                   
        
                   