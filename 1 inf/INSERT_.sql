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
   A.CUIIO,
   A.CUIIO_VERS,
   A.DENUMIREA DENUMIRE,
   1   EDIT_USER,
  '1' STATUT,
   A.CUATM,
   A.CFP,
   NULL CFOJ,
   NULL COCM,
   NULL CAEM,
   '0' BUGET,
   '0'  TIP,
   R.PROD,
   R.FOR_CUB,
   R.GENMUZEE,
   R.TIPMUZEE,
   R.TIP_LOCAL,
   R.TIP_INST,
   A.CAEM2,
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
   A.CUIIO,
   A.CUIIO_VERS,
   A.DENUMIREA,
   A.CUATM,
   A.CAEM2,
   A.CFP    

    FROM USER_BANCU.VW_1_INF_2006_FINAL A 
    
                LEFT  JOIN CIS2.RENIM R ON (R.CUIIO = A.CUIIO AND R.CUIIO_VERS = A.CUIIO_VERS)
                
                WHERE 
                1=1 AND 
                R.CUIIO IS NULL
                
                
                ) A
                
                   LEFT JOIN  USER_BANCU.VW_MAX_RENIM_CIS2 R ON (R.CUIIO = A.CUIIO)
                
                WHERE 
                R.CUIIO IS  NULL;