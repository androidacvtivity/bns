


   SELECT  
          
            L.CUIIO ANUL_CUIIO,
            L.DENUMIRE,
            R.CUIIO TRIM_CUIIO,
            L.CUATM ANUL_CUATM,
            R.CUATM TRIM_CUATM
     
            FROM   USER_BANCU.VW_KATALOG_EI_78_2007 L
            
                        
                                    LEFT JOIN   USER_BANCU.VW_KATALOG_EI_78_1036 R ON R.CUIIO = L.CUIIO-- AND R.CUATM = L.CUATM
                                    
                                    
                                    
                                    WHERE 
                                    
                                    1=1
                                    
                                    
                                  --  R.CUIIO IS NOT  NULL
                                     
                                    AND  R.CUATM <> L.CUATM    
            

    UNION 
    
    
SELECT  
            'TRIM II ' AS PERIOADA,
             L.CUIIO ANUL_CUIIO,
             L.DENUMIRE,
            R.CUIIO TRIM_CUIIO,
            L.CUATM ANUL_CUATM,
            R.CUATM TRIM_CUATM
     
            FROM   USER_BANCU.VW_KATALOG_EI_78_2007 L
            
                        
                                    LEFT JOIN   USER_BANCU.VW_KATALOG_EI_78_1037 R ON R.CUIIO = L.CUIIO-- AND R.CUATM = L.CUATM
                                    
                                    
                                    
                                    WHERE 
                                    
                                    1=1
                                    
                                    
                                  --  R.CUIIO IS NOT  NULL
                                     
                                    AND  R.CUATM <> L.CUATM  




UNION 
    
    
SELECT  
            'TRIM III ' AS PERIOADA,
             L.CUIIO ANUL_CUIIO,
             L.DENUMIRE,
            R.CUIIO TRIM_CUIIO,
            L.CUATM ANUL_CUATM,
            R.CUATM TRIM_CUATM
     
            FROM   USER_BANCU.VW_KATALOG_EI_78_2007 L
            
                        
                                    LEFT JOIN   USER_BANCU.VW_KATALOG_EI_78_1038 R ON R.CUIIO = L.CUIIO-- AND R.CUATM = L.CUATM
                                    
                                    
                                    
                                    WHERE 
                                    
                                    1=1
                                    
                                    
                                  --  R.CUIIO IS NOT  NULL
                                     
                                    AND  R.CUATM <> L.CUATM  



UNION 
    
    
SELECT  
            'TRIM IV ' AS PERIOADA,
             L.CUIIO ANUL_CUIIO,
             L.DENUMIRE,
            R.CUIIO TRIM_CUIIO,
            L.CUATM ANUL_CUATM,
            R.CUATM TRIM_CUATM
     
            FROM   USER_BANCU.VW_KATALOG_EI_78_2007 L
            
                        
                                    LEFT JOIN   USER_BANCU.VW_KATALOG_EI_78_1039 R ON R.CUIIO = L.CUIIO-- AND R.CUATM = L.CUATM
                                    
                                    
                                    
                                    WHERE 
                                    
                                    1=1
                                    
                                    
                                  --  R.CUIIO IS NOT  NULL
                                     
                                    AND  R.CUATM <> L.CUATM  

;

//-----------------------------------------------------

 SELECT  
            
            CUIIO,
            CUATM
            
     
            FROM  USER_BANCU.VW_KATALOG_EI_78_1039;





//-----------------------------------------------------------

            SELECT  
            
            CUIIO,
            CUATM
            
     
            FROM   USER_BANCU.VW_KATALOG_EI_78_2007;
            
            
            