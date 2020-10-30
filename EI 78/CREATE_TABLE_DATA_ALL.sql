  
DROP TABLE USER_BANCU.DATA_ALL_1036 CASCADE CONSTRAINTS;


 CREATE TABLE DATA_ALL_1036
            
            AS 

             SELECT *
                
                FROM CIS2.DATA_ALL
                 
                 WHERE 
                 
                 FORM IN (44)
                 AND PERIOADA IN (1036); 