﻿ SELECT DISTINCT A.CUIIO,
                 A.CUIIO_VERS,
                 A.CUATM 
   
   FROM  USER_BANCU.VW_2_DESEURI_2017 A 
   
                    INNER JOIN CIS2.VW_CL_CUATM C ON (C.CODUL = A.CUATM)
                    INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')
   
   WHERE 
   1=1 
   
   AND 
   CC.CODUL LIKE '0300000%'
   
  AND A.CUIIO IN (
40086885,
40923594,
2730381,
15846576,
40396580,
313558003,
40574745,
40265027,
38685489,
15860197,
40024708,
4517504,
4742187,
300114103,
37722716,
38556409,
2045393303,
2751147,
2746436,
2166851,
2734019,
20164235,
37462592,
40870936

)
--AND A.CUIIO_VERS  = 2006

ORDER BY 
A.CUIIO