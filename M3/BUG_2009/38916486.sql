




SELECT 
    D.CUIIO,
    D.RIND,
    D.CAPITOL,
    D.COL1

    FROM CIS2.VW_DATA_ALL D

WHERE
CUIIO IN (

--38916486
--39029409

--40569551
)

AND FORM = 3
AND PERIOADA = 2009
 --AND CAPITOL = 303
 
 
 GROUP BY 
 
 D.CUIIO,
    D.RIND,
    D.CAPITOL,
    D.COL1