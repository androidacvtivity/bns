﻿SELECT  
'Rind.' ||D.RIND||' : '||
CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1112') AND D.RIND BETWEEN ('010') AND ('030') AND  D.PERIOADA=:PERIOADA  THEN NVAL(D.COL1)  ELSE NULL END)) || '>'||     
CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1111') AND D.RIND BETWEEN ('010') AND ('030')  AND P.NUM = 2  THEN NVAL(D.COL1)  ELSE NULL END))
  AS REZULTAT

FROM
  CIS2.VW_DATA_ALL_GC D         
  
  INNER JOIN
         (
           SELECT P.PERIOADA, 
            P.NUM 
           FROM CIS2.VW_MD_PERIOADA P INNER JOIN CIS2.VW_MD_PERIOADA T ON(P.ANUL=T.ANUL AND P.TIP_PERIOADA=5) 
           WHERE T.PERIOADA = :PERIOADA
   
        ) P ON(D.PERIOADA=P.PERIOADA)
  WHERE
  (D.NR_GOSP=:NR_GOSP           OR :NR_GOSP = -1) AND
  (D.UNIT_CODE_VERS=:UNIT_CODE_VERS    OR :UNIT_CODE_VERS = -1) AND
  (D.FORM = :FORM               OR :FORM = -1) AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (:CAPITOL=:CAPITOL            OR :CAPITOL <> :CAPITOL) AND
  (:CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS <>:CAPITOL_VERS) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
  D.FORM IN (61)  
  GROUP BY 
  
  D.RIND
HAVING
CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1112') AND D.RIND BETWEEN ('010') AND ('030')  AND  P.PERIOADA=:PERIOADA  THEN NVAL(D.COL1)  ELSE NULL END)) >   
CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1111') AND D.RIND BETWEEN ('010') AND ('030') AND P.NUM = 2    THEN NVAL(D.COL1)  ELSE NULL END))