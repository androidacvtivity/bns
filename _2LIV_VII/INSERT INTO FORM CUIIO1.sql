--
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
37465937,
38987084,
40113702,
40227340,
40350951,
40419660,
40430331,
40582029,
40600224,
40749972,
40902379,
40967522,
40976805,
41190751,
41342089,
41407191,
41478329,
4129625492


)

AND CUIIO_VERS IN (1823)