﻿SELECT 
DISTINCT CUIIO,
DATA_REG

FROM CIS.VW_DATA_ALL
WHERE 

FORM =:pFORM  AND  PERIOADA = :pPERIOADA


ORDER BY 
DATA_REG DESC