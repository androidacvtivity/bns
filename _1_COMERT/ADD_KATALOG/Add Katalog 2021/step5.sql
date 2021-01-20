--INSERT INTO  CIS2.RENIM
--
--(
--
--CUIIO,
--    CUIIO_VERS,
--    DENUMIRE,
--    EDIT_USER,
--    STATUT,
--    CUATM,
--    CFP,
--    CFOJ,
--    COCM,
--    CAEM,
--    BUGET,
--    TIP,
--    PROD,
--    FOR_CUB,
--    GENMUZEE,
--    TIPMUZEE,
--    TIP_LOCAL,
--    TIP_INST,
--    CAEM2,
--    N85_NTL,
--    N85_NTIIP,
--    N85_NDIIP,
--    N85_NPDS,
--    N85_NRIIP,
--    N85_NSIIP,
--    GENMUZEE2,
--    NFI,
--    NTII,
--    NPDS,
--    ORGANE,
--    TIP_INV,
--    RENIM_PERS,
--    ORGANE_COND,
--    GEN_INSTITUTIE
--)


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

FROM USER_BANCU.VW_MAX_RENIM_CIS2  
--USER_BANCU.VW_MAX_RENIM_299_CIS2
       --  USER_BANCU.VW_MAX_RENIM_TRIM_CIS2
WHERE 

CUIIO IN (
SELECT 
  L.CUIIO
 


FROM USER_BANCU.KAT_1_COMERT_2009_FINAL  L 

                LEFT JOIN CIS2.RENIM R ON R.CUIIO = L.CUIIO AND R.CUIIO_VERS  = L.CUIIO_VERS 
                
                WHERE 
                R.CUIIO IS  NOT  NULL
) 


--AND CUIIO_VERS <>  2009
--AND CUIIO <> 7028102