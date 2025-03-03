﻿
                 SELECT  
                   L.CUIIO,
                   L.CUIIO_VERS,
                   R.CUIIO_VERS R_CUIIO_VERS, 
                   L.FORM,
                   L.FORM_VERS,
                   L.STATUT

FROM 
(

    SELECT         FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (4) AND CUIIO_VERS <= :pPERIOADA 
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (4) AND FC.STATUT <> '3'
             
             ) L LEFT JOIN (
             
                   SELECT 
      D.CUIIO,
      D.CUIIO_VERS
 
     FROM    CIS.VW_DATA_ALL D
     
     WHERE
     
     D.FORM  = 4
     AND D.PERIOADA = :pPERIOADA 
     
             )  R ON L.CUIIO = R.CUIIO AND L.CUIIO_VERS = R.CUIIO_VERS 
             
             
             WHERE 
             
             R.CUIIO IS NULL 