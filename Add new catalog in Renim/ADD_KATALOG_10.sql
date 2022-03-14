     
UPDATE USER_BANCU.AGRO_34

SET CUIIO_vers = 2010;

select * FROM 

USER_BANCU.AGRO_34;

select cuiio  FROM 

USER_BANCU.AGRO_34;







 SELECT 

             CUIIO 
            
            FROM 
                       USER_BANCU.AGRO_34
            
            
            GROUP BY 
            CUIIO

            
            HAVING
            
            
COUNT (CUIIO) > 1;


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