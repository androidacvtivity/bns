--INSERT INTO CIS2.RENIM (
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
--   ORGANE_COND,
--   GEN_INSTITUTIE
--
--)
--
--        
              
              SELECT 
   A.CUIIO,
   A.CUIIO_VERS,
   A.DENUMIRE,
   A.EDIT_USER,
   A.STATUT,
   A.CUATM,
   A.CFP,
   A.CFOJ,
   A.COCM,
   A.CAEM,
   A.BUGET,
   A.TIP,
   A.PROD,
   A.FOR_CUB,
   A.GENMUZEE,
   A.TIPMUZEE,
   A.TIP_LOCAL,
   A.TIP_INST,
   A.CAEM2,
   A.N85_NTL,
   A.N85_NTIIP,
   A.N85_NDIIP,
   A.N85_NPDS,
   A.N85_NRIIP,
   A.N85_NSIIP,
   A.GENMUZEE2,
   A.NFI,
   A.NTII,
   A.NPDS,
   A.ORGANE,
   A.TIP_INV,
   A.RENIM_PERS,
   A.ORGANE_COND,
   A.GEN_INSTITUTIE
       
                   FROM  USER_BANCU.VW_MAX_RENIM_CIS2 A 
                   
                               
                             WHERE 
                             
                   
A.CUIIO IN (

SELECT 
  L.CUIIO
 

FROM USER_BANCU.INFFINAL L

          LEFT JOIN (
          
           SELECT             
                   FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
                  
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (2) AND CUIIO_VERS <= 2009
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (2) 
             
             AND FC.STATUT <> '3'
             
          --   AND FC.CUIIO_VERS = 2009
          
          ) R ON L.CUIIO = R.CUIIO  AND L.CUIIO_VERS  = R.CUIIO_VERS
          
          WHERE 
          
          R.CUIIO IS   NULL 
)
                   
                   
AND    A.CUIIO_VERS = 2009