﻿

SELECT *
FROM USER_BANCU.TR_AUTO_2020;


UPDATE  USER_BANCU.TR_AUTO_2020

 SET CUIIO_VERS = 2009;
 
 
 UPDATE  USER_BANCU.TR_AUTO_2020

 SET CUATM  = TRIM(REPLACE (CUATM,'O','0'));