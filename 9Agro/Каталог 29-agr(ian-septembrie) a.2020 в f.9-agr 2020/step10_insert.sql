--1.  3830
--2.  3830
--3. (R.CUIIO = L.CUIIO AND  R.CUIIO_VERS = L.CUIIO_VERS AND R.FORM =  39 AND STATUT = '1')   = 36

--INSERT INTO CIS2.FORM_CUIIO  (
--
--    CUIIO,
--    CUIIO_VERS,
--    FORM,
--    FORM_VERS,
--    STATUT 
--
--
--)

SELECT 
    L.CUIIO,
    L.CUIIO_VERS,
    39 FORM,
    2000 FORM_VERS,
    '1' STATUT 
FROM 
(
SELECT 
    L.CUIIO,
    L.CUIIO_VERS
FROM RENIM_2010 L 

        LEFT JOIN CIS2.RENIM R ON R.CUIIO = L.CUIIO AND R.CUIIO_VERS = L.CUIIO_VERS 
        
        ) L  LEFT JOIN (
        
         SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (39) AND CUIIO_VERS <= 2010
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (39) 
             AND FC.STATUT <> '3'
        
        ) R ON (R.CUIIO = L.CUIIO AND  R.CUIIO_VERS = L.CUIIO_VERS AND R.FORM =  39)  
        
        
        WHERE 
        R.CUIIO IS NOT NULL 
        
;