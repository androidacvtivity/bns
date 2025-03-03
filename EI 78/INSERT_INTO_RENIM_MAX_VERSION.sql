﻿--
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
  ORGANE_COND
 

)




SELECT 
              L.CUIIO,
              L.CUIIO_VERS,
              L.DENUMIREA DENUMIRE,
              R.EDIT_USER, 
              R.STATUT,
              L.CUATM,
              L.CFP,
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
              L.CAEM2,
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

              FROM


       (
            SELECT 
              L.CUIIO,
              L.CUIIO_VERS,
              L.DENUMIREA,
              L.CUATM,
              L.CAEM2,
              L.CFP
              
            FROM USER_BANCU.VW_EI_78_1036  L
            
                       LEFT JOIN CIS2.RENIM R ON (R.CUIIO = L.CUIIO AND R.CUIIO_VERS = L.CUIIO_VERS)
                       
                       WHERE 
                       
                       R.CUIIO IS    NULL
                       AND 
                       R.CUIIO_VERS IS NULL
                       
                       
                        ) L   LEFT JOIN (SELECT R.CUIIO,
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
          
                        
                        FROM USER_BANCU.VW_MAX_RENIM_CIS2 R
                        
                        WHERE 
                        R.CUIIO_VERS < 1036
                        
                        ORDER BY 
                         CUIIO DESC) R ON (L.CUIIO = R.CUIIO ) 
                       
                       WHERE 
                       R.CUIIO IS   NULL