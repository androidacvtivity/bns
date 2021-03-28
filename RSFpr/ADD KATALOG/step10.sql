--INSERT INTO CIS2.FORM_CUIIO (
--
--                   CUIIO,
--                   CUIIO_VERS,
--                   FORM,
--                   FORM_VERS,
--                   STATUT
--
--) 



--Eu am adaugat 972 de CUIIO pentru 2020 - cu CUIIO_VERS = 2009.
--SQL de ma jos demonstreaza ca ele sunt in FORM_CUIIO si pentru FORMA 57 si 63 
-- BUG-ul consta in aceea ca pentru FORM = 63  toate acestea CUIIO care am adugat in catalog sunt in CIS2 pe web 
--dar pentru from = 57  nu sunt. 



  SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                  
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM
              (
 
 SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= 2009
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3'
             ) FC  RIGHT JOIN USER_BANCU.KAT_RSF_NEW R ON 
             
             R.CUIIO = FC.CUIIO AND
             R.CUIIO_VERS = FC.CUIIO_VERS  
             
             
             WHERE 
             
             FC.CUIIO IS  NOT NULL
             
             --:pFORM 57 AND 63
             --972 
             
             