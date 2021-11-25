SELECT
      SUM(DI.COL1) AS COL1

    FROM VW_DATA_ALL DI
      
    WHERE
      DI.FORM = 100            AND
      DI.CAPITOL = 36          AND 
      DI.CUIIO = 2             AND 
      DI.PERIOADA = :pPERIOADA AND
      DI.RIND = '02';