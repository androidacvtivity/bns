
--INSERT INTO CIS2.FORM_CUIIO (
--
--            CUIIO,
--            CUIIO_VERS,
--            FORM,
--            FORM_VERS,
--            STATUT
--            
--
--
--)



           SELECT 
            CUIIO,
            CUIIO_VERS,
            37 FORM,
            1800 FORM_VERS,
            '1' STATUT
            
                FROM CIS2.RENIM
                
                WHERE 
                
               
                
                        CUIIO IN (
2733110,
2933279,
5922267,
12910552,
37745574,
38572408,
38785156,
38988304,
40104376,
40277562,
40409348,
40489695,
40502036,
40936059,
40952578,
40958440,
41073198,
41091078,
41153690,
41204677,
41231846,
41243720,
41266945,
450530038,
2046655189,
4087835687
) 


AND CUIIO_VERS IN  (1823)