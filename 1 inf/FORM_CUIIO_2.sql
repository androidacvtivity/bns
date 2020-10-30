

DROP TABLE USER_BANCU.BACKUP_FORM_CUIIO_CIS2 CASCADE CONSTRAINTS;

--INSERT INTO USER_BANCU.FORM_CUIIO_1_INF
--
--(
--        CUIIO,
--        CUIIO_VERS,
--        FORM,
--        FORM_VERS,
--        STATUT
--
--
--)


SELECT 
        FC.CUIIO,
        FC.CUIIO_VERS,
        FC.FORM,
        FC.FORM_VERS,
        '3' STATUT
 
   FROM (


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
    
  
   ) FC  LEFT JOIN USER_BANCU.VW_1_INF_2006_FINAL R ON (R.CUIIO = FC.CUIIO AND  R.CUIIO_VERS = FC.CUIIO_VERS)
   
   
   WHERE 
   R.CUIIO IS NULL 
  -- AND FC.CUIIO_VERS <> 2006