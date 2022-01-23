SELECT *
FROM USER_BANCU.KAT_1_CC

WHERE 
CUIIO IN (

       SELECT 
        DISTINCT CUIIO
        
            FROM DATA_ALL 
            
            WHERE 
            
            PERIOADA = 2010
            AND FORM = 12 
            
            AND CUIIO NOT IN (
            SELECT CUIIO
FROM USER_BANCU.KAT_1_CC
            )
)



;

UPDATE USER_BANCU.KAT_1_CC

 SET CUIIO_VERS  =  2010;