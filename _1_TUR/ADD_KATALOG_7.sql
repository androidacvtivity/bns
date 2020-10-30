SELECT     R.CUIIO,
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
           R.ORGANE_COND,
           R.GEN_INSTITUTIE
      FROM CIS2.RENIM  R
--           INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) AS CUIIO_VERS
--                           FROM CIS2.RENIM
--                       GROUP BY CUIIO) A
--               ON (A.CUIIO = R.CUIIO AND A.CUIIO_VERS = R.CUIIO_VERS)
               
               
               
               WHERE 
               R.CUIIO IN (
               
               SELECT 
                                          A.CUIIO
                                         
                                            
              FROM   USER_BANCU.KAT_1_INF_1 A LEFT JOIN CIS2.RENIM R ON R.CUIIO = A.CUIIO AND R.CUIIO_VERS = A.CUIIO_VERS 
              
              
             WHERE 
             
             R.CUIIO IS   NULL 
               
               )
               
               