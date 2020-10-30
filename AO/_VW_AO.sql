--CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_AO
--(
--        CUIIO,
--        CUIIO_VERS,
--        DENUMIRE,
--        CUATM,
--        CODUL,
--        CAEM2_DEN
--)
--AS


SELECT 

        CUIIO,
        CUIIO_VERS,
        DENUMIRE,
        CUATM,
        CODUL,
        CAEM2_DEN
       

 FROM

(
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
            
           (C.CODUL LIKE 'Q%'
           
           AND R.DENUMIRE LIKE 'ASOCIATIA OBSTEASCA%' )
        
           
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
           
           
           ORDER BY
           CUIIO
           )
           
           
           GROUP BY 
           CUIIO,
        CUIIO_VERS,
        DENUMIRE,
        CUATM,
        CODUL,
        CAEM2_DEN
        
        ORDER BY 
        CUIIO