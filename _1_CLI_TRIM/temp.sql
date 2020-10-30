






SELECT  
    V.CODUL AS CODE, 
    V.PRGS AS PRGS, 
    V.DENUMIRE AS DEN_CUATM

FROM VW_CL_CUATM V

WHERE 
V.FULL_CODE LIKE '%'||:pCOD_CUATM||';%' 


 ORDER BY 
 V.FULL_CODE
; 




-------------------------------------------------------------------------------


       SELECT 
        ROWNUM NR_ROW,
        DENUMIRE NUME_ROW,
        CODUL  CUATM
        
         
       FROM CIS2.VW_CL_CUATM
       
       
       ORDER BY 
       
       FULL_CODE;
       
       
       