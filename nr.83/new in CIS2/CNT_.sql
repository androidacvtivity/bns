﻿SELECT 

COUNT (DISTINCT D.CUIIO) AS COL1  
FROM
   VW_DATA_ALL D
  INNER JOIN  MD_RIND RD ON (D.ID_MD=RD.ID_MD)
  INNER JOIN RENIM R ON (R.CUIIO= D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS)
  
  WHERE
  (D.PERIOADA=:pPERIOADA) AND
  (:pFORM=:pFORM) AND
  (:pFORM_VERS=:pFORM_VERS) AND
  (:pID_MDTABLE=:pID_MDTABLE) AND
  RD.FORM IN (69) AND
  RD.FORM_VERS = :pFORM_VERS AND    
  RD.CAPITOL IN (1171) 