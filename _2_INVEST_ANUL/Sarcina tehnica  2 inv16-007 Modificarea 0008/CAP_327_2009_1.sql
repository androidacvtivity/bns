


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
            
--            PERIOADA = 2009
--            AND FORM = 8 
--            
--            AND CAPITOL = 327
--            
            AND RIND IN ('80','81','82','83','90','91','92','94','95','96','97','98','100')
--            
            
            