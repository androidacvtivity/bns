SELECT
      DECODE(CS.CODUL, 
      '00000','01',
      'B0000','02',
      'B0500','03'
      
     )
      AS NR_ROW,
      CS.DENUMIRE AS NUME_ROW,
      CS.CODUL AS CS_CUATM
    FROM
      CIS2.VW_CL_CAEM2 CS
    WHERE
      CS.CODUL 
      IN(
         '00000', 'B0000','B0500'
        
         
         )