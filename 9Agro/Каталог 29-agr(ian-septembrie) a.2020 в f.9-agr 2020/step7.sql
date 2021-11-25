--update CIS2.FORM_CUIIO VB
SET 
(

VB.STATUT 
)
= (
SELECT 
    '3' STATUT 
    FROM 

(
 
 
 SELECT FC.CUIIO,
       FC.CUIIO_VERS,
       FC.FORM,
       FC.FORM_VERS,
       FC.STATUT
       
       FROM 
   (
   
   SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (39) AND CUIIO_VERS <= 2010
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (39) AND FC.STATUT <> '3')  FC
             
                                                LEFT JOIN RENIM_2010 R ON R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS 
                                                
                                                WHERE 
                                                
                                                R.CUIIO IS NULL 
                                                
                                                
                                                
                                                
                                                )  L 
                                                
                                                
                                                WHERE 
                                                
                                                 VB.CUIIO             =  L.CUIIO          AND 
                                                 VB.CUIIO_VERS        =  L.CUIIO_VERS     AND 
                                                 VB.FORM              =  L.FORM           AND 
                                                 VB.FORM_VERS         =  L.FORM_VERS
                                                )
                                                
                                                 WHERE EXISTS  
                                                 (
                                                 
                                                 SELECT 
    L.* 
    FROM 

(



 SELECT FC.CUIIO,
       FC.CUIIO_VERS,
       FC.FORM,
       FC.FORM_VERS,
       FC.STATUT
       
       FROM 
   (
   
   SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (39) AND CUIIO_VERS <= 2010
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (39) AND FC.STATUT <> '3')  FC
             
                                                LEFT JOIN RENIM_2010 R ON R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS 
                                                
                                                WHERE 
                                                
                                                R.CUIIO IS NULL 
                                                
                                                
                                                
                                                )  L 
                                                 
                                                 )