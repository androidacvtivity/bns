
 INSERT INTO  CIS2.TABLE_OUT
    (
      PERIOADA,
      FORM,
      FORM_VERS,
      ID_MDTABLE,
      COD_CUATM,
      NR_SECTIE,
      NUME_SECTIE,
      NR_SECTIE1,
      NUME_SECTIE1,
      NR_SECTIE2,
      NUME_SECTIE2,
      NR_ROW,
      ORDINE,
      DECIMAL_POS,
      NUME_ROW,
       
      COL1, COL2--, COL3,  COL4, COL5, COL6, COL7, COL8, COL9
    )








SELECT
    :pPERIOADA AS PERIOADA,
    :pFORM AS FORM,
    :pFORM_VERS AS FORM_VERS,
    :pID_MDTABLE AS ID_MDTABLE,
    :pCOD_CUATM AS COD_CUATM,
    '0' AS NR_SECTIE,
    '0' AS NUME_SECTIE,
    '0' AS NR_SECTIE1,
    '0' AS NUME_SECTIE1,
    '0' AS NR_SECTIE2,
    '0' AS NUME_SECTIE2,
     1 AS NR_ROW,   
     1 ORDINE,
    '00' AS DECIMAL_POS,
    'TEST' NUME_ROW,
     2  COL1,
     3  COL2
--     4  COL3,
--     5  COL4,
--     6  COL5,
--     7  COL6,
--     8  COL7,
--     9  COL8,
--     10  COL9

FROM  DUAL