


             INSERT INTO CIS2.RENIM (
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
             2007 CUIIO_VERS,
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




----------------------------------------------------------------------------------
--
--INSERT INTO CIS2.FORM_CUIIO
--
--(
--
-- CUIIO,
-- CUIIO_VERS,
-- FORM,
-- FORM_VERS,
-- STATUT
--
--)



      --     SELECT *
--
--   CUIIO,
--   CUIIO_VERS,
--   43 FORM,
--   2000 FORM_VERS,
--   '1' STATUT

           FROM    USER_BANCU.VW_MAX_RENIM_CIS2
           
           
           WHERE 
           
           CUIIO IN (

40675311,
41069819,
41216962,
41265733,
40982777,
41153891,
4092450114,
40760962,
41153891,
11014320,
4092450114,
41190544,
2001027418193,
41044191,
41191383,
40904071,
41189133,
34642886,
41266460,
41231958,
40965486,
2004047043608,
40914402

)
           
    
        AND CUIIO_VERS  NOT IN (2007)