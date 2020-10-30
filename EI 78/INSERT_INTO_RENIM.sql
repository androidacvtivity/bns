
          SELECT 
              L.CUIIO,
              L.CUIIO_VERS,
              L.DENUMIREA,
              L.CUATM,
              L.CAEM2,
              L.CFP
              FROM


       (
            SELECT 
              L.CUIIO,
              L.CUIIO_VERS,
              L.DENUMIREA,
              L.CUATM,
              L.CAEM2,
              L.CFP
              
            FROM USER_BANCU.VW_EI_78_1036  L
            
                       LEFT JOIN CIS2.RENIM R ON (R.CUIIO = L.CUIIO AND R.CUIIO_VERS = L.CUIIO_VERS)
                       
                       WHERE 
                       
                       R.CUIIO IS    NULL
                       AND 
                       R.CUIIO_VERS IS NULL
                       
                       
                        ) L   LEFT JOIN (SELECT R.CUIIO,
          R.CUIIO_VERS,
          R.DENUMIRE,
          R.EDIT_USER,
          R.STATUT,
          R.CUATM,
          R.CFP,
          R.CFOJ,
          R.COCM,
          R.CAEM,
          R.BUGET,
          R.TIP,
          R.PROD,
          R.FOR_CUB,
          R.GENMUZEE,
          R.TIPMUZEE,
          R.TIP_LOCAL,
          R.TIP_INST,
          R.CAEM2,
          R.N85_NTL,
          R.N85_NTIIP,
          R.N85_NDIIP,
          R.N85_NPDS,
          R.N85_NRIIP,
          R.N85_NSIIP,
          R.GENMUZEE2,
          R.NFI,
          R.NTII,
          R.NPDS,
          R.ORGANE,
          R.TIP_INV,
          R.RENIM_PERS,
          R.ORGANE_COND
                        
                        FROM USER_BANCU.VW_MAX_RENIM_CIS2 R
                        
                        WHERE 
                        R.CUIIO_VERS < 1036
                        
                        ORDER BY 
                         CUIIO DESC) R ON (L.CUIIO = R.CUIIO ) 
                       
                       WHERE 
                       R.CUIIO IS NOT   NULL