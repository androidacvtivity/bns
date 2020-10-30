INSERT INTO CIS2.FORM_CUIIO

(

 CUIIO,
 CUIIO_VERS,
 FORM,
 FORM_VERS,
 STATUT

)



        SELECT 
        
                CUIIO,
                CUIIO_VERS,
                43 FORM,
                2000 FORM_VERS,
                '1' STATUT  
        
        
        FROM CIS2.RENIM
        
        WHERE 
        
       CUIIO IN (
 
41267264,
40837268,
41244122,
41267301,
4047641603,
--41069274,
34976952,
841740,
41189021,
33989528,
--31949791,
34029522,
33957520,
33741520
)
    
AND CUIIO_VERS IN (2007)