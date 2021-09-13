SELECT 


        DISTINCT 
        D.CUIIO,
        D.CUATM

        FROM USER_EREPORTING.VW_DATA_ALL_FR_PRIMIT D
        
                    INNER JOIN cis2.RENIM R on R.cuiio = D.cuiio AND R.cuiio_vers = D.cuiio_vers 
                    
                    inner JOIN  CIS2.VW_CL_CUATM c on C.codul = D.cuatm 
        
        
        WHERE
        
        D.ANUL = 2020
        AND C.FULL_CODE LIKE  '%'||:pCOD_CUATM||';%' 