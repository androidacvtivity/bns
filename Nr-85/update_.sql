

    UPDATE CIS2.RENIM VB
        
 SET     (
 
  VB.N85_NTL,                     --20
  VB.N85_NTIIP,                   --21
  VB.N85_NDIIP,                   --22
  VB.N85_NPDS,                    --23
  VB.N85_NRIIP,                   --24
  VB.N85_NSIIP
                  --26
  ) 
            = 
  (          
  SELECT 
                   --19
  C.N85_NTL,                     --20
  C.N85_NTIIP,                   --21
  C.N85_NDIIP,                   --22
  C.N85_NPDS,                    --23
  C.N85_NRIIP,                   --24
  C.N85_NSIIP
                    --26
  
  FROM USER_BANCU.VW_KATALOG_85_2007 C
       WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                   
                )   
                WHERE EXISTS  
                
                (
                    SELECT *
                    FROM USER_BANCU.VW_KATALOG_85_2007 C
                   WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                );
    