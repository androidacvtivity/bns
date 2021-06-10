--     
--     
--     
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
--               GEN_INSTITUTIE,
--               IDNO  
--        
--        
--        )     

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

11104,
  820631,
 1589414,
 2048904,
 2562274,
 4511453,
 5699832,
15847021,
20153272,
20169557,
20170448,
20297019,
37748621,
37779931,
37782374,
38341643,
38346698,
38395314,
38403218,
38519029,
38796042,
38926214,
38977230,
38978369,
39074948,
40078532,
40081669,
40106837,
40120501,
40133515,
40182732,
40186948,
40222199,
40232223,
40412304,
40438551,
40440982,
40444238,
40536957,
40544744,
40667234,
40688236,
40688242,
40688271,
40688495,
40689744,
40689750,
40689796,
40754594,
40788431,
40850949,
40861982,
40869340,
40888627,
40889756,
40896803,
40966646,
40972492,
41267815,
41283487,
41290748,
41298738,
41303764,
41441957,
41444230,
41478920,
41478943,
41478959,
41479026,
41479173

)
  
AND  (CUIIO_VERS <> 2009 AND CUIIO_VERS <> 2010 ) 


