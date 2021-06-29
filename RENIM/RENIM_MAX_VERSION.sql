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

          FROM -- USER_BANCU.VW_MAX_RENIM_CIS2 
          USER_BANCU.VW_MAX_RENIM_TRIM_CIS2
          
          
          WHERE 
          
      
        

--CUIIO_VERS >= 2009  AND 

CUIIO IN (
20159300,
40504957,
40782797,
40994619,
41048007,
41190751,
41265911,
38878704,

41266856,
41191319,
41232975,
41265957,
41172457,
41190627,
41236074,
41265934,
41149731,
40924978,
40965227,
40983248,
41223200,
41321905,
41151308,
40730553,
41289662,
41054976,
980307183120,
40152174,
41149719,
41231680,
41243022,
41265667,
41265673,
41265688,
41478529,
41342089,
41190691,
40976805,
41151076,
41342480,
41390208,
41003683,
41009111,
41033035,
41124623,
41191845,
41392710

)
--AND  (CUIIO_VERS <> 2009 AND CUIIO_VERS <> 2010 ) 

--AND CUIIO_VERS = 2010
