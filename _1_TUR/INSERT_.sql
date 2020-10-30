
--            INSERT INTO CIS2.FORM_CUIIO (
--            CUIIO,
--            CUIIO_VERS,
--            FORM,
--            FORM_VERS,
--            STATUT 
--             )
--
--




        select
        
            CUIIO,
            CUIIO_VERS,
            6     FORM,
            1004 FORM_VERS,
            '1'  STATUT 
    
        FROM CIS2.RENIM
        
        WHERE




    CUIIO IN (
41146299,
40750656,
38469294,
41221262,
41248580,
41275536,
41274264,
41279267,
41288007,
41284666,
41017076

)

  AND CUIIO_VERS  = 1039