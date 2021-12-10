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


37787986,
38679035,
38998521,
38999288,
40530771,
40840715,
3876497048,
3887936017,
4070390631,
4071264464,
971407895413


)