--              INSERT INTO CIS2.FORM_CUIIO  
--              
--              (
--              
--                   CUIIO,
--                   CUIIO_VERS,
--                   FORM,
--                   FORM_VERS,
--                   STATUT
--              )



SELECT 
  L.CUIIO,
  L.CUIIO_VERS,
  2 FORM,
  2000 FORM_VERS,
  '1' STATUT
  
  FROM 
  (

SELECT 
   A.CUIIO,
   A.CUIIO_VERS
  
       
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

) L