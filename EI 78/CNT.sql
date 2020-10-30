

  SELECT 
     L.CUIIO,
     R.CUIIO,
     L.CUIIO_VERS
    
    FROM USER_BANCU.VW_KATALOG_EI_78_2006  L
    
                   LEFT JOIN USER_BANCU.VW_KATALOG_EI_78_1035 R ON (L.CUIIO = R.CUIIO) 
                   
                   WHERE 
                   
                   R.CUIIO IS NOT NULL;
                   
    
    
    ;
    
    
    

    SELECT 
     CUIIO,
     CUIIO_VERS
     
    FROM USER_BANCU.VW_KATALOG_EI_78_1035;
    
    