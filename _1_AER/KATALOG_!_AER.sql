 SELECT DISTINCT A.CUIIO,
                 A.CUIIO_VERS,
                 A.CUATM 
   
   FROM  USER_BANCU.VW_KATALOG_2_ACHIZ_2017  A 
   
                    INNER JOIN CIS2.VW_CL_CUATM C ON (C.CODUL = A.CUATM)
                    INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')
   
   WHERE 
   1=1 
   
   AND 
   CC.CODUL LIKE '3100000%'
   
   AND A.CUIIO IN (
                  
                    15847080,
                    38429728,
                    28350285,
                    38812143,
                    41116482,
                    37726223,
                    38825051,
                    40925145,
                    40204592,
                    38857424,
                    40205350,
                    37759323,
                    40962878,
                    40844475,
                    20186538    

   
   )
   
   AND CUIIO_VERS <> 2006

ORDER BY 
A.CUIIO