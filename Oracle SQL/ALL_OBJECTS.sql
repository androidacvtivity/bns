﻿SELECT *
FROM all_tables

WHERE 

owner = 'USER_BANCU'

;


SELECT DISTINCT OWNER, OBJECT_NAME 
  FROM DBA_OBJECTS
 WHERE OBJECT_TYPE = 'TABLE'
   AND OWNER = 'USER_BANCU';
   
   
   SELECT *
  FROM ALL_OBJECTS
 WHERE OBJECT_TYPE = 'TABLE'
   AND OWNER = 'USER_BANCU'
   
   AND OBJECT_NAME = 'TEST_ID';
   
   
   DESCRIBE ALL_OBJECTS;