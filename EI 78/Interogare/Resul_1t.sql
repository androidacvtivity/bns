SELECT 
           DISTINCT  D.CUIIO 
             FROM CIS2.VW_DATA_ALL D 
            WHERE 
            D.PERIOADA = 2006
            AND D.FORM = 46   
            AND D.CAPITOL = 404 
            AND D.RIND = '05'
            
            AND D.COL1 = 1