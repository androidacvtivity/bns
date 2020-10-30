

       
            SELECT 
              L.CUIIO,
              L.CUIIO_VERS,
              L.DENUMIREA,
              L.CUATM,
              L.CAEM2,
              L.CFP
              
            FROM USER_BANCU.VW_EI_78_1036  L
            
--                       LEFT JOIN CIS2.RENIM R ON (R.CUIIO = L.CUIIO AND R.CUIIO_VERS = L.CUIIO_VERS)
--                       
--                       WHERE 
--                       
--                       R.CUIIO IS  NOT  NULL;
             
            
            ;












--------------------------------------------------------------------------------
UPDATE  CATALOG_1036 L

   SET L.CUIIO_VERS  = 1036;


;
--------------------------------------------------------------------------------
SELECT 
           L.CUIIO,
           L.CUIIO_VERS,
           L.DENUMIREA,
           L.CUATM,
           L.CAEM2,
           L.CFP
           FROM


(

SELECT 
           L.CUIIO,
           L.CUIIO_VERS,
           L.DENUMIREA,
           L.CUATM,
           L.CAEM2,
           L.CFP
           FROM
      (
       SELECT 
           L.CUIIO,
           L.CUIIO_VERS,
           L.DENUMIREA,
           CASE WHEN LENGTH(L.CUATM) = 6 THEN '0'||L.CUATM ELSE L.CUATM END CUATM, 
           L.CAEM2,
           L.CFP
          
          FROM USER_BANCU.CATALOG_1036 L
           
                    
        ) L
        
        
                    LEFT JOIN CIS2.VW_CL_CUATM C ON TRIM(C.CODUL) = TRIM(L.CUATM)
                    
         WHERE 
          1=1
          
          AND TRIM(C.CODUL) IS NOT NULL    
          
          ) L
          
          
            LEFT JOIN CIS2.VW_CL_CAEM2 C ON (TRIM(C.CODUL) = TRIM(L.CAEM2)
             
            
            
            )
          
          
          
            WHERE 
            1=1
          
     --     AND TRIM(C.CODUL) IS  NULL    
          
          AND LENGTH(L.CAEM2) = 3
          AND L.CAEM2 NOT IN ('N/A')
          
          ;  --END SQL

-------------------------------------------------------------------------------
    SELECT 
           L.CUIIO,
           L.CUIIO_VERS,
           L.DENUMIREA,
           L.CUATM,
           L.CAEM2,
           L.CFP
           FROM
      (
       SELECT 
           L.CUIIO,
           L.CUIIO_VERS,
           L.DENUMIREA,
           CASE WHEN LENGTH(L.CUATM) = 6 THEN '0'||L.CUATM ELSE L.CUATM END CUATM, 
           L.CAEM2,
           L.CFP
          
          FROM USER_BANCU.CATALOG_1036 L
           
                    
        ) L
        
        
                    LEFT JOIN CIS2.VW_CL_CUATM C ON TRIM(C.CODUL) = TRIM(L.CUATM)
                    
         WHERE 
          1=1
          
          AND TRIM(C.CODUL) IS NOT NULL    
          
          
          
          
          
          
          
          
          ;  --END SQL

--------------------------------------------------------------------------------



 SELECT 
           L.CUIIO,
           L.CUIIO_VERS,
           L.DENUMIREA,
           L.CUATM,
           TRIM(C.CODUL) CUATM_CODUL,
           L.CAEM2,
           L.CFP
          
          FROM USER_BANCU.CATALOG_1036 L
          
                     LEFT JOIN CIS2.VW_CL_CUATM C ON TRIM(C.CODUL) = TRIM(L.CUATM)
          
          
          
          WHERE 
          1=1
          
          AND TRIM(C.CODUL) IS NULL
          
          
          ORDER BY 
          CUIIO DESC;



---------------------------------------------------------------------------------
          SELECT 
           CUIIO,
           CUIIO_VERS,
           DENUMIREA,
           CUATM,
           CAEM2,
           CFP
          
          FROM USER_BANCU.CATALOG_1036
          
          ORDER BY 
          CUIIO DESC
          
          ;
          
          DELETE
          FROM USER_BANCU.CATALOG_1036;
          
          

-------------------------------------------------------------------------------
        --RENAME TABLE

        RENAME ADD_KATALOG_1_TR_AUTO TO CATALOG_1036;
        
        
        