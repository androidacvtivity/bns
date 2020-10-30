






        SELECT 
        
            D.CUIIO,
            D.CUATM,
            D.COL1,
            D.COL2,
            D.COL3,
            D.COL4
            
             FROM CIS.VW_DATA_ALL D 
             
             WHERE 
             D.PERIOADA IN (:PERIOADA)
             AND D.FORM IN (6)
             AND D.CUIIO IN (4496535)