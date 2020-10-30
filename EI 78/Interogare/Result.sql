     SELECT 
            
           DISTINCT    D.CUIIO 
        
            
            FROM CIS2.VW_DATA_ALL D  
            
                        
            
            
            WHERE 
           
            
            
            
            D.CUIIO IN (
            SELECT 
            
            D.CUIIO 
        
            
            FROM CIS2.VW_DATA_ALL D 
            
            
            
            WHERE 
            D.PERIOADA = 1040
            AND D.FORM = 44   
            AND D.CAPITOL = 1 
            AND D.RIND = '05'
            
            AND D.COL1 = 1
            
) AND D.CUIIO IN (

SELECT 
            D.CUIIO 
             FROM CIS2.VW_DATA_ALL D 
            WHERE 
            D.PERIOADA = 1040
            AND D.FORM = 44   
            AND D.CAPITOL = 14 
            AND D.RIND = '05'
            
            AND D.COL1 = 1
) 

----


AND D.CUIIO IN (
            SELECT 
            
            D.CUIIO 
        
            
            FROM CIS2.VW_DATA_ALL D 
            
            
            
            WHERE 
            D.PERIOADA = 1041
            AND D.FORM = 44   
            AND D.CAPITOL = 1 
            AND D.RIND = '05'
            
            AND D.COL1 = 1
            
) AND D.CUIIO IN (

SELECT 
            D.CUIIO 
             FROM CIS2.VW_DATA_ALL D 
            WHERE 
            D.PERIOADA = 1041
            AND D.FORM = 44   
            AND D.CAPITOL = 14 
            AND D.RIND = '05'
            
            AND D.COL1 = 1
) 


----


AND D.CUIIO IN (
            SELECT 
            
            D.CUIIO 
        
            
            FROM CIS2.VW_DATA_ALL D 
            
            
            
            WHERE 
            D.PERIOADA = 1042
            AND D.FORM = 44   
            AND D.CAPITOL = 1 
            AND D.RIND = '05'
            
            AND D.COL1 = 1
            
) AND D.CUIIO IN (

SELECT 
            D.CUIIO 
             FROM CIS2.VW_DATA_ALL D 
            WHERE 
            D.PERIOADA = 1043
            AND D.FORM = 44   
            AND D.CAPITOL = 14 
            AND D.RIND = '05'
            
            AND D.COL1 = 1
) 


--- 

AND D.CUIIO IN (
    SELECT 
           DISTINCT  D.CUIIO 
             FROM CIS2.VW_DATA_ALL D 
            WHERE 
            D.PERIOADA = 2006
            AND D.FORM = 46   
            AND D.CAPITOL = 1 
            AND D.RIND = '05'
            
            AND D.COL1 = 1
)


AND D.CUIIO IN (
    SELECT 
           DISTINCT  D.CUIIO 
             FROM CIS2.VW_DATA_ALL D 
            WHERE 
            D.PERIOADA = 2006
            AND D.FORM = 46   
            AND D.CAPITOL = 404 
            AND D.RIND = '05'
            
            AND D.COL1 = 1
)

--------------------------------



AND D.CUIIO IN (
    SELECT 
           DISTINCT  D.CUIIO 
             FROM CIS2.VW_DATA_ALL D 
            WHERE 
            D.PERIOADA = 2007
            AND D.FORM = 46   
            AND D.CAPITOL = 1 
            AND D.RIND = '05'
            
            AND D.COL1 = 1
)


