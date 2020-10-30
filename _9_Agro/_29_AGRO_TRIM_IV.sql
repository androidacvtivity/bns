
 INSERT INTO USER_BANCU.RENIM_9_AGRO (
 
           CUIIO,
           CUIIO_VERS,
           DENUMIRE,
         
           CUATM,
           CFP,
           CFOJ
      
 
  )

    SELECT R.CUIIO,
           2008 CUIIO_VERS,
           R.DENUMIRE,
         
           R.CUATM,
           R.CFP,
           R.CFOJ
           
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (45) AND CUIIO_VERS <= 1043
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (45) AND FC.STATUT <> '3') FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
               
               WHERE 
               
               R.CFOJ NOT IN  ('685') 