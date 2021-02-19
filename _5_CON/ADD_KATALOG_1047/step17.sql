SELECT 
DISTINCT CUIIO 

    FROM CIS2.VW_DATA_ALL 
    
    WHERE 
    
    FORM = 18 
    AND CUIIO IN (
    


SELECT 

FC.CUIIO

FROM 

(
SELECT FC.CUIIO,
       FC.CUIIO_VERS
                  
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (18) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (18) AND FC.STATUT <> '3' ) FC 
             
             
                                  LEFT  JOIN USER_BANCU.KAT_5_CON_1047_F R ON R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS 
                                  
                                  
                                  WHERE 
                                  
                                  R.CUIIO IS  NULL
                                  
                              --    AND R.CUIIO_VERS = 1047 
    )
    
    
    AND PERIOADA = 1047 AND FORM = 18