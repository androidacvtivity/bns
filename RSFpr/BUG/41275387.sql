SELECT  
           L.RIND E_RIND,
           R.RIND CIS2_RIND,
           L.ID_MD E_ID_MD,
           R.ID_MD CIS2_ID_MD

           FROM  USER_EREPORTING.VW_DATA_ALL_FR_PRIMIT L  
           
                                        LEFT JOIN (
                                        
                                        SELECT  
           L.RIND,
           
           L.ID_MD
          

           FROM CIS2.VW_DATA_ALL_FR L
           
           WHERE 
           
           L.CUIIO IN (

41275387
)

AND L.FORM = 63
AND L.PERIOADA = 2009
 AND L.CAPITOL = 1119
                                        
                                        ) R ON L.ID_MD = R.ID_MD AND L.FORM  =  8
                                        
 
 
 WHERE 
 
 
 L.CUIIO IN (

41275387
)

AND L.FORM = 63
AND L.PERIOADA = 2009
 AND L.CAPITOL = 1119
 
 
 ORDER BY 
 L.RIND