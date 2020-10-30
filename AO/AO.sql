SELECT 

             AO.CUIIO,
             AO.CUIIO_VERS,
             AO.DENUMIRE,
             AO.CUATM,
             AO.CODUL,
             AO.CAEM2_DEN

FROM 

(
SELECT 
            
             DISTINCT  R.CUIIO,
             R.CUIIO_VERS,
             R.DENUMIRE,
             R.CUATM,
             C.CODUL,
             C.DENUMIRE CAEM2_DEN
            
            
            FROM USER_BANCU.VW_MAX_RENIM_CIS R 
            
            INNER JOIN    CIS2.VW_CL_CAEM2  C ON R.CAEM2=C.CODUL 
            
            WHERE
            
           C.CODUL LIKE 'Q%'
           
           AND R.DENUMIRE LIKE 'ASOCIATIA OBSTEASCA%'
           
           ORDER BY 
           C.CODUL
           
           
           
           ) AO
           
   UNION ALL        
           
    SELECT 

             AO.CUIIO,
             AO.CUIIO_VERS,
             AO.DENUMIRE,
             AO.CUATM,
             AO.CODUL,
             AO.CAEM2_DEN

FROM 

(
SELECT 
            
             DISTINCT  R.CUIIO,
             R.CUIIO_VERS,
             R.DENUMIRE,
             R.CUATM,
             C.CODUL,
             C.DENUMIRE CAEM2_DEN
            
            
            FROM USER_BANCU.VW_MAX_RENIM_CIS2 R 
            
            INNER JOIN    CIS2.VW_CL_CAEM2  C ON R.CAEM2=C.CODUL 
            
            WHERE
            
           C.CODUL LIKE 'Q%'
           
           AND R.DENUMIRE LIKE 'ASOCIATIA OBSTEASCA%'
           
           ORDER BY 
           C.CODUL
           
           
           
           ) AO       
           
           
           
           
           
           
           
           
           
           
           
           
----------------------------------------------------------------------------------------           
           
           ; 




;
----------------------------------------------------------------------------------

SELECT 

             AO.CUIIO,
             AO.CUIIO_VERS,
             AO.DENUMIRE,
             AO.CUATM,
             AO.CODUL,
             AO.CAEM2_DEN

FROM 

(
SELECT 
            
             DISTINCT  R.CUIIO,
             R.CUIIO_VERS,
             R.DENUMIRE,
             R.CUATM,
             C.CODUL,
             C.DENUMIRE CAEM2_DEN
            
            
            FROM USER_BANCU.VW_MAX_RENIM_CIS2 R 
            
            INNER JOIN    CIS2.VW_CL_CAEM2  C ON R.CAEM2=C.CODUL 
            
            WHERE
            
           C.CODUL LIKE 'Q%'
           
           AND R.DENUMIRE LIKE 'ASOCIATIA OBSTEASCA%'
           
           ORDER BY 
           C.CODUL
           
           
           
           ) AO; 



---------------------------------------------------------------------------------

            SELECT *
            

            FROM USER_BANCU.VW_REGISTRU
            
            
            
            WHERE 
            
            
            1=1
            
            
        
        --   AND    ','||GEN_ACT_NE_LIC||',' LIKE '%,'||5610||',%'
            
            AND DEN_COM LIKE '%ASOCIATIA%'
            
            
            ;


            ------------------------------------------------  



            SELECT 
            
             DISTINCT  R.CUIIO,
             R.CUIIO_VERS,
             R.DENUMIRE,
             R.CUATM,
             C.CODUL,
             C.DENUMIRE CAEM2_DEN
            
            
            FROM USER_BANCU.VW_MAX_RENIM_CIS2 R 
            
            INNER JOIN    CIS2.VW_CL_CAEM2  C ON R.CAEM2=C.CODUL 
            
            WHERE
            
           C.CODUL LIKE 'Q%'
           
           AND R.DENUMIRE LIKE 'ASOCIATIA OBSTEASCA%'
           
           ORDER BY 
           C.CODUL
           
           
           ;