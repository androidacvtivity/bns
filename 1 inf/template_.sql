CREATE TABLE DATA_ALL_1_INF_2017
                
                AS 
                
                SELECT  * 

                    FROM CIS2.DATA_ALL
                    
                    WHERE
                    
                    FORM = 2
                    AND PERIOADA = 2006
                    
                    
                    ORDER BY 
                    DATA_REG DESC
                    ;    
            



---------------------------------------------------------------------------------


;
                UPDATE USER_BANCU.ADD_KATALOG_1_TR_AUTO
                
                SET CUIIO_VERS = 2006;
                
                
                    

    
                SELECT *
                FROM USER_BArNCU.VW_1_INF_2006;