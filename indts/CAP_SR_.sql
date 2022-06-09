SELECT 
L.CUIIO,
R.CUIIO 
FROM 
(
  SELECT 
        DISTINCT CUIIO 
    
    FROM CIS.VW_DATA_ALL
    
        WHERE 
        PERIOADA = 2010
        AND FORM = 10
        
--        AND CAPITOL IN (46) 
        
        
        ) L RIGHT JOIN (
        
          SELECT 
        DISTINCT CUIIO 
    
    FROM CIS.VW_DATA_ALL
    
        WHERE 
        PERIOADA = 2010
        AND FORM = 10
        
        AND CAPITOL NOT IN (46) 
        
        
        ) R ON L.CUIIO = R.CUIIO 
    
    WHERE 
    L.CUIIO IS NOT  NULL 