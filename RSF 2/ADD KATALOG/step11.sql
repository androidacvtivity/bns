SELECT 
  CUIIO


    FROM USER_BANCU.KAT_2_INVEST_ANUL
    
    ORDER BY 
    
    CUIIO 
    ;

SELECT 
CUIIO,
COUNT (CUIIO) AS CNT

    FROM USER_BANCU.CIS2_RENIM
    
    GROUP BY 
    CUIIO 
    
    HAVING 
    COUNT (CUIIO) > 1  ; --1127
    
    
    
    Select CUIIO
       , count(*) as Occurrences
from USER_BANCU.CIS2_RENIM
HAVING count(*) > 1
group by CUIIO;  --1127


 Select IDNO
       , count(*) as Occurrences
from USER_BANCU.CIS2_RENIM
HAVING count(*) > 1
group by IDNO;  --1127