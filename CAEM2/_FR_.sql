
    SELECT 
       DISTINCT
           L.CUIIO,
           L.IDNO,
           L.CUATM,
           L.DENUMIRE,
           
           L.CAEM2,
           R.DENUMIRE DEN_CAEM2 
    
    FROM USER_BANCU.VW_KATALOG_RSF_2010 L INNER JOIN (
    

SELECT *

FROM CIS.VW_CL_CAEM2


WHERE 
1=1
AND CODUL LIKE 'C24%'
    ) R ON R.CODUL = L.CAEM2