





 SELECT 
         L.CUIIO,
         L.CUIIO_VERS
    
        FROM USER_BANCU.NAME_2_INVEST_ANUL L
             
                              LEFT  JOIN CIS2.RENIM R ON ( R.CUIIO       = L.CUIIO 
                                                          AND R.CUIIO_VERS  = L.CUIIO_VERS  )
                                                          
                                                          
                                                          WHERE
                                                          R.CUIIO IS NOT  NULL 
                                                          
                                                                  
        
        
        
        
        
        ;


-------------------------------------------------------------------------------
  SELECT 
  
       COUNT (DISTINCT CUIIO) AS CNT,
         CUIIO_VERS
    
        FROM USER_BANCU.NAME_2_INVEST_ANUL
        
        GROUP BY 
        
         CUIIO,
         CUIIO_VERS
    
        
        HAVING 
        
        COUNT (DISTINCT CUIIO) = 1
        ;

-------------------------------------------------------------------------------

   SELECT *
    
        FROM USER_BANCU.NAME_2_INVEST_ANUL;





-----------------------------------------------------------------------------
         UPDATE USER_BANCU.NAME_2_INVEST_ANUL
         
         
         SET CUIIO_VERS = 2006;


    

        SELECT *
    
        FROM USER_BANCU.NAME_2_INVEST_ANUL;