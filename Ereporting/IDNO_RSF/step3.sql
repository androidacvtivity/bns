



SELECT 
L.CUIIO     EREPORT_CUIIO ,
L.IDNO      EREPORT_IDNO,

R.CUIIO     RENIM_CUIIO,
R.IDNO      RENIM_IDNO
from USER_EREPORTING.IDNO_CUIIO L LEFT JOIN   

(
SELECT     
           R.CUIIO,
           R.CUIIO_VERS,
           R.DENUMIRE,
           R.IDNO
           
           
           
      FROM (SELECT FC.CUIIO,
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
             WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3') FC
                        INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)

) R ON 

--TRIM(R.CUIIO) = TRIM(L.CUIIO)  AND TRIM(R.IDNO) = TRIM(L.IDNO)

 TRIM(R.IDNO) =  TRIM(L.IDNO) -- 115765

WHERE 

R.CUIIO IS  NULL 

AND L.IDNO = 0



