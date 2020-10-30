UPDATE USER_BANCU.RENIM_BACK_UP VB
        
 SET     (
--  VB.CUIIO,                       --1       
--  VB.CUIIO_VERS,                  --2
  VB.DENUMIRE,                    --3
--  VB.EDIT_USER,                   --4
--  VB.STATUT,                      --5
  VB.CUATM,                       --6
  VB.CFP,                         --7
--  VB.CFOJ,                        --8
--  VB.COCM,                        --9
--  VB.CAEM,                        --10
--  VB.BUGET,                       --11
--  VB.TIP,                         --12 
--  VB.PROD,                        --13
--  VB.FOR_CUB,                     --14
--  VB.GENMUZEE,                    --15
--  VB.TIPMUZEE,                    --16
--  VB.TIP_LOCAL,                   --17 
--  VB.TIP_INST,                    --18
  VB.CAEM2                       --19
--  VB.N85_NTL,                     --20
--  VB.N85_NTIIP,                   --21
--  VB.N85_NDIIP,                   --22
--  VB.N85_NPDS,                    --23
--  VB.N85_NRIIP,                   --24
--  VB.N85_NSIIP,                   --25
--  VB.GENMUZEE2                    --26
  ) 
            = 
  (          
  SELECT 
--  C.CUIIO,                       --1       
--  C.CUIIO_VERS,                  --2
  C.DENUMIRE,                    --3
--  C.EDIT_USER,                   --4
--  C.STATUT,                      --5
  C.CUATM,                       --6
  C.CFP,                         --7
--  C.CFOJ,                        --8
--  C.COCM,                        --9
--  C.CAEM,                        --10
--  C.BUGET,                       --11
--  C.TIP,                         --12 
--  C.PROD,                        --13
--  C.FOR_CUB,                     --14
--  C.GENMUZEE,                    --15
--  C.TIPMUZEE,                    --16
--  C.TIP_LOCAL,                   --17 
--  C.TIP_INST,                    --18
  C.CAEM2                       --19
--  C.N85_NTL,                     --20
--  C.N85_NTIIP,                   --21
--  C.N85_NDIIP,                   --22
--  C.N85_NPDS,                    --23
--  C.N85_NRIIP,                   --24
--  C.N85_NSIIP,                   --25
--  C.GENMUZEE2                    --26
  
  FROM CIS2.RENIM C
       WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                   
                )   
                WHERE EXISTS  
                
                (
                    SELECT *
                    FROM CIS2.RENIM C
                   WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                );