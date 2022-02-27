        SELECT 
                DISTINCT 
                D.CUIIO,
                MAX(DATA_REG) DATA_REG
                
                
            FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
            
            WHERE
            D.PERIOADA = 2010
            AND D.FORM = 64
            
            GROUP BY
            D.CUIIO
            
            ORDER BY
            DATA_REG  DESC        