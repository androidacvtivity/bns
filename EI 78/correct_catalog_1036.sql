


INSERT INTO CIS2.FORM_CUIIO 

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
    44 FORM,
    1004 FORM_VERS,
    '3' STATUT
    
    FROM



(
 SELECT 
    L.CUIIO,
    L.CUIIO_VERS
    
    FROM



  (    
    SELECT 
    R.CUIIO,
    1036 CUIIO_VERS
    
    FROM USER_BANCU.VW_EI_78_1036  L 
    
                   RIGHT JOIN USER_BANCU.VW_KATALOG_EI_78_1036 R ON R.CUIIO = L.CUIIO 
                                                                    AND  R.CUIIO_VERS = L.CUIIO_VERS
                                                                    
     WHERE 
     
     L.CUIIO  IS NULL
     AND R.CUIIO_VERS IN (1032) ) L    LEFT JOIN CIS2.RENIM R ON (R.CUIIO = L.CUIIO 
                                                                   AND R.CUIIO_VERS  = L.CUIIO_VERS ) 
                                                                   
                                               WHERE 
                                              R.CUIIO IS NOT NULL   ) L  LEFT JOIN CIS2.FORM_CUIIO F ON (F.CUIIO = L.CUIIO 
                                                                                                      AND F.CUIIO_VERS = L.CUIIO_VERS) 
                                              
                                                                                                                           
     
                                                       WHERE
                                                       1=1
                                                       AND F.CUIIO IS NOT NULL 
                                                     --  AND F.FORM IN (44)
    ;