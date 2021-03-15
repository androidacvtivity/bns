SELECT 
           L.CAPITOL E_CAPITOL,
           L.CAPITOL CIS2_CAPITOL,
           L.CAPITOL_VERS  E_CAPITOL_VERS, 
           R.CAPITOL_VERS  CIS2_CAPITOL_VERS, 
           L.RIND E_RIND,
           R.RIND CIS2_RIND,
           L.RIND_VERS E_RIND_VERS, 
           R.RIND_VERS CIS2_RIND_VERS, 
           L.ID_MD E_ID_MD,
           R.ID_MD CIS2_ID_MD,
           
           L.COL1 AS E_COL1,
           R.COL1 AS CIS2_COL1,
           
           L.COL2 AS E_COL2,
           R.COL2 AS CIS2_COL2  
           FROM 

(
SELECT  
           L.CAPITOL,
           L.CAPITOL_VERS,
           L.RIND,
           L.RIND_VERS,
           L.ID_MD,
           L.COL1,
           L.COL2
          

           FROM USER_EREPORTING.VW_DATA_ALL_FR_PRIMIT L
           
           WHERE 
           
           L.CUIIO IN (

41275387
)

AND L.FORM = 63
AND L.PERIOADA = 2009
 AND L.CAPITOL = 1119
 ) L LEFT JOIN (
 
 SELECT  
            L.CAPITOL,
           L.CAPITOL_VERS,
           L.RIND,
           L.RIND_VERS,
           L.ID_MD,
           L.COL1,
           L.COL2
          

           FROM CIS2.VW_DATA_ALL_FR L
           
           WHERE 
           
           L.CUIIO IN (

41275387
)

AND L.FORM = 63
AND L.PERIOADA = 2009
 AND L.CAPITOL = 1119
 
 ) R ON L.ID_MD = R.ID_MD 
 
 
 ORDER BY 
 L.RIND