


--INSERT INTO CIS2.FORM_CUIIO
--
--(
--CUIIO,
--CUIIO_VERS,
--FORM,
--FORM_VERS,
--STATUT
--)


SELECT 
L.NEW_CUIIO AS CUIIO,
2010 CUIIO_VERS,
39 FORM,
2000 FORM_VERS,
'1' STATUT


FROM 


(
select 
CUIIO,
NEW_CUIIO

   
   from USER_BANCU.KAT_9_AGRO
   
   WHERE 
   
   cuiio NOT in (
   
   SELECT 
        distinct CUIIO
        
            FROM data_all
            
            WHERE 
            
            perioada IN (2010)
            
            and form = 39
            
            AND cuiio IN (
            
            SELECT 
L.CUIIO


FROM USER_BANCU.KAT_9_AGRO L
            )
   )
   
   ) L LEFT JOIN (
   
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
             WHERE FC.FORM IN (39) AND FC.STATUT <> '3'
   ) R ON R.CUIIO = L.NEW_CUIIO
   
   WHERE 
   R.CUIIO IS  NOT NULL
   
   