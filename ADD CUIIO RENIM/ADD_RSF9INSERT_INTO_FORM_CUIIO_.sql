--INSERT INTO CIS2.FORM_CUIIO
--            
--             (
--            
--                   CUIIO,
--                   CUIIO_VERS,
--                   FORM,
--                   FORM_VERS,
--                   STATUT 
--            
--            )



                    SELECT 

                    R.CUIIO,
                    R.CUIIO_VERS,
                    37 FORM,
                    1800 FORM_VERS,
                    '1' STATUT 
                
                    FROM  RENIM R
                    
                    WHERE 
                    
           CUIIO IN (
875968,
38845384,
38861555,
40127265,
40757368,
40965635,
41232774,
41371725,
41559860,
455126597,
503479571,
3758340453,
4049911917,
4107862310
)

AND CUIIO_VERS IN  (1824)

AND CUIIO NOT IN (
41371725,
4107862310


)