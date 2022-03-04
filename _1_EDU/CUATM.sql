
       SELECT  
       C.CODUL,
       SUBSTR(C.CODUL,1,2) AS CODUL_MODIF,
       C.DENUMIRE
       FROM  CIS2.VW_CL_CUATM C
       
       WHERE 
       C.PRGS IN ('2')
       AND C.CODUL NOT IN '0000000'
       