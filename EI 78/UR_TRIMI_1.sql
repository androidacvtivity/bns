






          SELECT 
       
       '0' ORDINE,
       'Numarul intreprinderilor (total):' DENUMIRE,
       
        (
        
        SELECT 
       COUNT ( F.CUIIO)  AS CNT

        
   
   
     FROM CIS2.FORM_CUIIO F
     
        INNER JOIN 
      (
      SELECT 
        CUIIO, 
        MAX(CUIIO_VERS) AS CUIIO_VERS 

         
      FROM CIS2.FORM_CUIIO FC
      
      WHERE  
      1=1 
      
      AND FC.FORM IN (:pFORM)
      
      AND FC.CUIIO_VERS <= :pPERIOADA
      
      GROUP BY 
      CUIIO 
      ) FF ON (FF.CUIIO = F.CUIIO AND F.CUIIO_VERS = FF.CUIIO_VERS)
      
      
      
      LEFT  JOIN CIS2.RENIM R ON (R.CUIIO  = F.CUIIO  
        
                                   AND  R.CUIIO_VERS   = F.CUIIO_VERS )
      LEFT JOIN CIS2.VW_CL_CUATM CT ON (R.CUATM = CT.CODUL)    
      
      WHERE 
      
      F.FORM IN (:pFORM)
      AND F.STATUT <> '3'
      AND CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%'  ) COL1,
      
      (SELECT 
       COUNT ( F.CUIIO)  AS CNT

        
   
   
     FROM CIS2.FORM_CUIIO F
     
        INNER JOIN 
      (
      SELECT 
        CUIIO, 
        MAX(CUIIO_VERS) AS CUIIO_VERS 

         
      FROM CIS2.FORM_CUIIO FC
      
      WHERE  
      1=1 
      
      AND FC.FORM IN (:pFORM)
      
      AND FC.CUIIO_VERS <= :pPERIOADA - 1
      
      GROUP BY 
      CUIIO 
      ) FF ON (FF.CUIIO = F.CUIIO AND F.CUIIO_VERS = FF.CUIIO_VERS)
      
      
      
      LEFT  JOIN CIS2.RENIM R ON (R.CUIIO  = F.CUIIO  
        
                                   AND  R.CUIIO_VERS   = F.CUIIO_VERS )
      LEFT JOIN CIS2.VW_CL_CUATM CT ON (R.CUATM = CT.CODUL)    
      
      WHERE 
      
      F.FORM IN (:pFORM)
      AND F.STATUT <> '3'
      AND CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%'  ) COL2
       
      FROM DUAL 







            