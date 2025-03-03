
SELECT 
DISTINCT D.UNIT_CODE,
      R.RIND,
      R.COL1      

FROM 

(

SELECT
          distinct  D.UNIT_CODE       
        
FROM
  VW_DATA_ALL_GC  D
  INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
  
  INNER  JOIN VW_CL_CUATM C ON D.CUATM = C.CODUL 
 
  
  
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
--  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (58)  AND
  D.CAPITOL IN (416)
 
  
  GROUP BY 
  D.UNIT_CODE 
  
  HAVING 
 SUM (CASE WHEN D.RIND NOT IN('010','011','012', '013','014','015')  THEN  NVAL(D.COL1) +  NVAL(D.COL2) +  NVAL(D.COL3) +  NVAL(D.COL4) +  NVAL(D.COL5) +  NVAL(D.COL6)
+  NVAL(D.COL7) +  NVAL(D.COL8) +  NVAL(D.COL9) +  NVAL(D.COL10) +  NVAL(D.COL11) +  NVAL(D.COL2) +  NVAL(D.COL13) +  NVAL(D.COL14)
+  NVAL(D.COL15) +  NVAL(D.COL16) +  NVAL(D.COL17) +  NVAL(D.COL18) + NVAL(D.COL19) ELSE  0 END  ) = 0 



) D INNER JOIN (






    SELECT 
      distinct  D.UNIT_CODE,
      D.RIND,
      D.COL1   

FROM
  VW_DATA_ALL_GC  D

WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
--  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (58)  AND
  D.CAPITOL IN (419)
 
  
  GROUP BY 
  D.UNIT_CODE,
  D.RIND,
  D.COL1    

) R ON R.UNIT_CODE = D.UNIT_CODE 

WHERE 

R.UNIT_CODE IS NOT  NULL 


ORDER BY 
D.UNIT_CODE,
      R.RIND,
      R.COL1 