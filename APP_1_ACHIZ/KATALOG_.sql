


    SELECT *
    
     FROM CIS2.SYS_USER
     
     
     ORDER BY 
     ID_USER DESC
     ;
     
     




 
-------------------------------------------------------------------------------------- 
 SELECT DISTINCT A.CUIIO,
                 A.CUIIO_VERS,
                 A.CUATM 
   
   FROM  USER_BANCU.VW_KATALOG_1_ACHIZ_2017  A   --24053 --22213
   
                    INNER JOIN CIS2.VW_CL_CUATM C ON (C.CODUL = A.CUATM)
                    INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')
   
   WHERE 
   
   CC.CODUL LIKE '2900000%'
   
  AND 
  
  A.CUIIO IN (
  
  15860748,
1846973,
40025441,
37744965,
38961216,
40334937,
38606828

  
  )
    

--AND A.CUIIO_VERS <> 2006


ORDER BY 
A.CUIIO 

--) )



