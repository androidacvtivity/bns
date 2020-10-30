INSERT INTO USER_BANCU.FORM_CUIIO_INSERT
(
  CUIIO,
  CUIIO_VERS,
  FORM,        
  FORM_VERS,
  STATUT   
)
                SELECT
                
                       L.CUIIO,
                       L.CUIIO_VERS,     
                       4 FORM,
                       2000 FORM_VERS,
                       '1' STATUT
                        
                  FROM USER_BANCU.KATALOG L
                    
                                        LEFT JOIN CIS2.FORM_CUIIO R ON R.CUIIO = L.CUIIO AND R.CUIIO_VERS = L.CUIIO_VERS AND R.FORM = 4 AND R.FORM_VERS = 2000
                                        AND  R.STATUT = '1'
                                        
                                        
                                     WHERE 
                                     R.CUIIO IS NOT NULL 
                                        
                                         
                                        
                                         
                  
                  
                  ;
                
                                            


                SELECT *
                FROM USER_BANCU.FORM_CUIIO_INSERT;
                
                DELETE
                FROM USER_BANCU.FORM_CUIIO_INSERT;
                