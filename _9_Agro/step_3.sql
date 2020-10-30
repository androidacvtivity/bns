
--INSERT INTO CIS2.RENIM (
--  
--   CUIIO,
--   CUIIO_VERS,
--   DENUMIRE,
--   EDIT_USER,
--   STATUT,
--   CUATM,
--   CFP,
--   CFOJ,
--   COCM,
--   CAEM,
--   BUGET,
--   TIP,
--   PROD,
--   FOR_CUB,
--   GENMUZEE,
--   TIPMUZEE,
--   TIP_LOCAL,
--   TIP_INST,
--   CAEM2,
--   N85_NTL,
--   N85_NTIIP,
--   N85_NDIIP,
--   N85_NPDS,
--   N85_NRIIP,
--   N85_NSIIP,
--   GENMUZEE2,
--   NFI,
--   NTII,
--   NPDS,
--   ORGANE,
--   TIP_INV,
--   RENIM_PERS,
--   ORGANE_COND
--  
--  )
--
--



       SELECT 
          R.CUIIO,
          R.CUIIO_VERS,
          R.DENUMIRE,
          R.EDIT_USER,
          R.STATUT,
          R.CUATM,
          R.CFP,
          R.CFOJ,
          R.COCM,
          R.CAEM,
          R.BUGET,
          R.TIP,
          R.PROD,
          R.FOR_CUB,
          R.GENMUZEE,
          R.TIPMUZEE,
          R.TIP_LOCAL,
          R.TIP_INST,
          R.CAEM2,
          R.N85_NTL,
          R.N85_NTIIP,
          R.N85_NDIIP,
          R.N85_NPDS,
          R.N85_NRIIP,
          R.N85_NSIIP,
          R.GENMUZEE2,
          R.NFI,
          R.NTII,
          R.NPDS,
          R.ORGANE,
          R.TIP_INV,
          R.RENIM_PERS,
          R.ORGANE_COND
    
        
        
        FROM USER_BANCU.VW_KATALOG_21_VINZARI_1039  R 
        
                            INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        
        
        WHERE
        
        
        
        C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%' 
        
        
        AND R.CUIIO_VERS  IN (1039)