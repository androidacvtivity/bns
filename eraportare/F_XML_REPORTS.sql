﻿



SELECT 
    COUNT (DISTINCT FORMID) AS CNT
FROM USER_EREPORTING.F_XML_FORMS

WHERE 
STATUS = 0
--Numarul de id  cu status = 0, este = 2389 