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
         -- USER_BANCU.VW_MAX_RENIM_TRIM_CIS2
          
          
          WHERE 
          
      
        

CUIIO IN  (

15796683,
26844016,
26844017,
40095909,
41098318,
37662996014,
37662996015,
37662996018,
37662996019,
376629960110,
376629960111,
376629960112,
376629960113,
376629960114,
376629960115,
376629960116,
376629960117,
376629960118,
376629960119,
376629960120,
376629960121,
376629960122,
376629960123,
376629960124,
389156300114,
389156300115

) 

--AND ( CUIIO_VERS <> 2009 AND CUIIO_VERS <> 2010 )