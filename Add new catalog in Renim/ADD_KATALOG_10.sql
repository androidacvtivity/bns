      SELECT 

             CUIIO 
            
            FROM 
                       USER_BANCU."UPDATE"
            
            
            GROUP BY 
            CUIIO

            
            HAVING
            
            
COUNT (CUIIO) = 1;


--SELECT *
DELETE

FROM USER_BANCU."UPDATE"

WHERE 
ROWID NOT IN (

SELECT MIN (ROWID)
FROM USER_BANCU."UPDATE"
GROUP BY 
CUIIO
  
)