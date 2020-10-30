
--        INSERT INTO FORM_CUIIO 
--        (
--        CUIIO,
--        CUIIO_VERS,
--        FORM,
--        FORM_VERS,
--        STATUT
--        
--        )
           
      --  SELECT  *
--             CUIIO,
--             CUIIO_VERS,
--             45 FORM,
--             1004 FORM_VERS,
--             '1'  STATUT 
            

--------------------------------------------------------------------------------
            INSERT INTO CIS2.RENIM 
 

           (
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
             )
           
        SELECT 
             CUIIO,
             1037 CUIIO_VERS,
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
           
--------------------------------------------------------------------------------

            

           FROM  USER_BANCU.VW_MAX_RENIM_TRIM_CIS2
           
           
           WHERE
          

           
CUIIO IN (
3596982,
389870849601,
40092213,
4004247480,
100608468,
41243651,
40874536,
40872885,
40844334,
40092213

)

      AND CUIIO_VERS NOT IN (1037)

































 
          
     ORDER BY 
     
     CUIIO