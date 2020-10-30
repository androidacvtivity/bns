--
-- 
--             INSERT INTO CIS2.RENIM (
--             CUIIO,
--             CUIIO_VERS,
--             DENUMIRE,
--             EDIT_USER,
--             STATUT,  
--             CUATM,
--             CFP,
--             CFOJ,
--             COCM,
--             CAEM,
--             BUGET,
--             TIP,
--             PROD,
--             FOR_CUB,
--             GENMUZEE,
--             TIPMUZEE,
--             TIP_LOCAL,
--             TIP_INST,
--             CAEM2,
--             N85_NTL,
--             N85_NTIIP,
--             N85_NDIIP,
--             N85_NPDS,
--             N85_NRIIP,
--             N85_NSIIP,
--             GENMUZEE2,
--             NFI,
--             NTII,
--             NPDS,
--             ORGANE,
--             TIP_INV,
--             RENIM_PERS,
--             ORGANE_COND,
--             GEN_INSTITUTIE 
--             )

          -- SELECT 
          
          INSERT INTO CIS2.FORM_CUIIO

  (
  
     CUIIO,
     CUIIO_VERS,
     FORM,
     FORM_VERS,
     STATUT
  
  ) 

           
  SELECT 

      CUIIO,
      CUIIO_VERS,
      43 FORM,
      2000 FORM_VERS,
      '1' STATUT
           
--             CUIIO,
--             CUIIO_VERS,
--             DENUMIRE,
--             EDIT_USER,
--             STATUT,  
--             CUATM,
--             CFP,
--             CFOJ,
--             COCM,
--             CAEM,
--             BUGET,
--             TIP,
--             PROD,
--             FOR_CUB,
--             GENMUZEE,
--             TIPMUZEE,
--             TIP_LOCAL,
--             TIP_INST,
--             CAEM2,
--             N85_NTL,
--             N85_NTIIP,
--             N85_NDIIP,
--             N85_NPDS,
--             N85_NRIIP,
--             N85_NSIIP,
--             GENMUZEE2,
--             NFI,
--             NTII,
--             NPDS,
--             ORGANE,
--             TIP_INV,
--             RENIM_PERS,
--             ORGANE_COND,
--             GEN_INSTITUTIE    

           FROM  USER_BANCU.VW_MAX_RENIM_CIS2
           
           
           WHERE
          

            CUIIO IN (
41230249,
41135982,
41149151,
40920453,
41197109,
40912260,
41208089,
41242761,
41166534,
40467216,
41228264,
41188493,
41188903,
41047700,
--408287439601,
40813925,
41215089,
40959758,
--40497884,
40449098,
41095768,
37534759,
35542746,
41069015,
41124151,
407084769603,
40640376,
--407802269603,
41267100,
37758039,
41093686,
41070432,
40013478,
41212760,
41097201,
41233325,
40904450,
41125794,
41215630,
41190113,
41262373,
40983969,
41262835,
4080089736,
40497387
)



        AND CUIIO_VERS  IN (2007)

































 
          
     ORDER BY 
     
     CUIIO