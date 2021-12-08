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
--             GEN_INSTITUTIE,
--             IDNO 
--             )
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
            
            
            FROM USER_BANCU.VW_MAX_RENIM_2LIVII
            
            
            WHERE 
            
            CUIIO IN(


37465937,
38987084,
40113702,
40227340,
40350951,
40419660,
40430331,
40582029,
40600224,
40749972,
40902379,
40967522,
40976805,
41190751,
41342089,
41407191,
41478329,
4129625492

)