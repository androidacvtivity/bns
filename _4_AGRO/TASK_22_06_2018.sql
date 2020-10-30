

--            INSERT INTO cis2.renim
--            (
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

            

           FROM  USER_BANCU.VW_MAX_RENIM_CIS2
           
           
           WHERE 
            
            
            CUIIO IN (
            
            40362351,
40476286,
40354334,
41021847,
40937194,
40371396,
37784396,
40100183,
41167961

            )
            
            
                AND CUIIO_VERS <> 2008






























 
          
     ORDER BY 
     
     CUIIO