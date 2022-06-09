
SELECT 

DISTINCT D.CUIIO

FROM 

   
   (
   SELECT 
      D.CUIIO,
      D.CUIIO_VERS,
      D.RIND,
      D.COL1
    FROM VW_DATA_ALL_CALC D
    WHERE D.PERIOADA = :pPERIOADA     
      AND D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%'
      AND D.FORM       IN(10)
      AND D.CAPITOL    IN(46)
      
      GROUP BY 
          D.CUIIO,
      D.CUIIO_VERS,
      D.RIND,
      D.COL1
      
      ORDER BY 
      D.COL1 DESC
      
      ) D