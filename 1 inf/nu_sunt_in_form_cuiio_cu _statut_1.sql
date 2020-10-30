SELECT 
 D.CUIIO,
 D.CUIIO_VERS
 FROM
(
SELECT 
 D.CUIIO,
 D.CUIIO_VERS
 FROM

(
SELECT 
  DISTINCT D.CUIIO,
  D.CUIIO_VERS

FROM CIS2.VW_DATA_ALL D


 WHERE  
 (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.PERIOADA = :pPERIOADA AND
  D.FORM = 2 
  ) D
  
  WHERE 
  D.CUIIO_VERS NOT IN  (2006)) D
  
  
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
  
  ) A  ON (A.CUIIO = D.CUIIO AND A.CUIIO_VERS = D.CUIIO_VERS )
  
  WHERE 
  A.CUIIO IS NULL 