        SELECT 
                DISTINCT 
                D.CUIIO,
                MAX(DATA_REG) DATA_REG
                
                
            FROM USER_EREPORTING.VW_DATA_ALL_FR_PRIMIT D
            
            WHERE
            D.PERIOADA = 2010
            AND D.FORM = 67
            
            GROUP BY
            D.CUIIO
            
            ORDER BY
            DATA_REG  DESC        