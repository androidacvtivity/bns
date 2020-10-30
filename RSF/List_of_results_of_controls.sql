







    SELECT 
    
            CUIIO,
            CONTROL,
            REZULTAT,
            DATA_REG
    
    
    
        FROM CIS2.CONTROL

            WHERE

                    FORM = 57
 AND REZULTAT <> 'OK'
 
 AND PERIOADA  = 2007
 
 
 ORDER bY 
 
 DATA_REG DESC 