


SELECT 
DISTINCT 
D.CUIIO,
R.CUATM,
R.DENUMIRE,
D.RIND,
SUM(D.COL1) AS COL1

 FROM CIS2.VW_DATA_ALL   D
 INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND 
                            D.CUIIO_VERS = R.CUIIO_VERS
                            
                            WHERE 
                            
                            D.FORM = 18
                            
                            AND D.PERIOADA = :pPERIOADA
                            
                            AND D.capitol=1009  AND  D.capitol_vers = 1032
                            
                            AND D.RIND = '310'
                            
                            GROUP BY
                            D.CUIIO,
R.DENUMIRE,
D.RIND,
R.CUATM