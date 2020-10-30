    SELECT R.*,
           BNS.* 
    
      FROM USER_BANCU.VW_AO R 
      
                LEFT JOIN USER_BANCU.ENTERPRISE BNS ON (BNS.STAT_ID = R.CUIIO)
                
                
                
               WHERE 
               R.CUIIO_VERS > 1036
                
                ;
                
                
                
                
                ---------------------------------------------------------------
                
                
                
                SELECT *
                FROM USER_BANCU.VW_REGISTRU; 
      
             