

SELECT

  CUIIO,
  CUIIO_VERS

FROM 
(
SELECT 

  CUIIO,
  CUIIO_VERS
  
  FROM CIS2.FORM_CUIIO
  WHERE
FORM  IN (44)

AND CUIIO_VERS IN (1036)

) L  LEFT JOIN  (


SELECT

  CUIIO,
  CUIIO_VERS

FROM 
(
SELECT 

  CUIIO,
  CUIIO_VERS
  
  FROM CIS2.FORM_CUIIO
  WHERE
FORM  IN (44)

AND CUIIO_VERS NOT IN (1036)

) R ON (R.CUIIO = L.CUIIO)

;



--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

        SELECT 
        
        DISTINCT 
        D.CUIIO
        
        
         FROM CIS2.VW_DATA_ALL D

          WHERE 
          D.FORM IN (44)
          AND PERIOADA IN (:pPERIOADA)
          AND D.CUIIO_VERS IN (1036)
        
;

--------------------------------------------------------------------------------

       SELECT *
        
        FROM USER_BANCU.VW_KATALOG_EI_78_1036
        
        
        WHERE 
        CUIIO_VERS IN (1036);




        SELECT *
        
        FROM USER_BANCU.VW_KATALOG_EI_78_1035
        
        
        WHERE 
        CUIIO_VERS IN (1036);
        