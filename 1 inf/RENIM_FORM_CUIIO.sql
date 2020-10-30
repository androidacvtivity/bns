 SELECT L.*,
        R.*
 FROM
 (
 SELECT 
      R.CUIIO  CUIIO,
      R.CUIIO_VERS CUIIO_VERS
FROM USER_BANCU.VW_1_INF_2006_FINAL A 
         LEFT JOIN CIS2.RENIM R ON (R.CUIIO = A.CUIIO  AND R.CUIIO_VERS = A.CUIIO_VERS) 
                
           WHERE 
               R.CUIIO IS NOT NULL 
               
               
               ) L 
               
               LEFT JOIN (
               
               SELECT 
        FC.CUIIO,
        FC.CUIIO_VERS,
        FC.FORM,
        FC.FORM_VERS,
        FC.STATUT
 
   FROM CIS2.FORM_CUIIO FC
   INNER JOIN (
           
           
           SELECT 
           CUIIO,
            MAX(CUIIO_VERS)   CUIIO_VERS
            
            FROM CIS2.FORM_CUIIO
            
            
            WHERE 
            
            FORM IN (:pFORM)
            
            AND CUIIO_VERS <= :pPERIOADA
            
            GROUP BY 
            CUIIO 
            
            
            
            ) BB ON (BB.CUIIO=FC.CUIIO AND BB.CUIIO_VERS=FC.CUIIO_VERS )
            
            
            
    WHERE
    
    FC.FORM IN (:pFORM)         
    
    AND FC.STATUT <> '3'
    
    AND FC.CUIIO_VERS = 2006
               
               ) R ON (R.CUIIO = L.CUIIO AND R.CUIIO_VERS = L.CUIIO_VERS)
               
               
               WHERE 
               R.CUIIO IS NOT  NULL