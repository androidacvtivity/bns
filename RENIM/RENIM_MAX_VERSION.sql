--INSERT INTO CIS2.RENIM (
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
          
      
        

--CUIIO_VERS >= 2009  AND 

CUIIO IN (
 2929303,
15793680,
37439481,
37717307,
37760421,
38884792,
38950684,
40014294,
40076496,
40431218,
40464011,
40535946,
40545809,
40582992,
40642547,
40688420,
40693295,
40704343,
40732670,
40936556,
41096443,
41298164


)
--AND  (CUIIO_VERS <> 2009 AND CUIIO_VERS <> 2010 ) 


