select * 
            
            FROM CIS2.VW_DATA_ALL
            where 
            
            ID_MD IN (
            
SELECT 

ID_MD

FROM CIS2.MD_RIND

WHERE 

FORM = 8 
AND CAPITOL = 327
AND CAPITOL_VERS = 2009
            )
            