/* Formatted on 6/4/2022 7:57:10 AM (QP5 v5.326) */
SELECT COD_GOSPODARIE,
       NR_GOSP,
       NR_MAPS,
       CUATM,
       USER_NAME,
       RIND,
       DENUMIRE,
       COL1,
       COL2,
       COL3
       

  FROM (  SELECT DISTINCT
                 D.UNIT_CODE
                     COD_GOSPODARIE,
                 D.NR_GOSP,
                 RN.NR_MAPS,
                 D.CUATM,
                 C.FULL_CODE,
                 D.USER_NAME,
                 MR.RIND,
                 REPLACE (
                     REPLACE (
                         REPLACE (REPLACE (MR.DENUMIRE, 'emsp;', ''), '&', ''),
                         '<b>',
                         ''),
                     '</b>',
                     '')
                     DENUMIRE,
                 SUM (D.COL1)
                     AS COL1,
                 SUM (REPLACE (D.COL2, '.', ''))
                     AS COL2,
                     
                      SUM (REPLACE (D.COL3, '.', ''))
                     AS COL3
            FROM CIS2.VW_DATA_ALL_GC D
                 LEFT JOIN REG_UNIT_GC RN
                     ON     D.UNIT_CODE = RN.UNIT_CODE
                        AND D.UNIT_CODE_VERS = RN.UNIT_CODE_VERS
                        AND D.NR_GOSP = RN.NR_GOSP
                        AND D.NR_MAPS = RN.NR_MAPS
                 INNER JOIN VW_CL_CUATM C ON C.CODUL = D.CUATM
                 INNER JOIN CIS2.MD_CAPITOL MC
                     ON     MC.CAPITOL = D.CAPITOL
                        AND MC.CAPITOL_VERS = D.CAPITOL_VERS
                 INNER JOIN MD_RIND MR ON MR.ID_MD = D.ID_MD
           WHERE D.FORM = 72 AND D.PERIOADA = 2010 AND MC.CAPITOL IN (1190)
        GROUP BY D.UNIT_CODE,
                 D.NR_GOSP,
                 RN.NR_MAPS,
                 D.USER_NAME,
                 D.CUATM,
                 C.FULL_CODE,
                 MR.RIND,
                 MR.DENUMIRE
        ORDER BY C.FULL_CODE, D.UNIT_CODE)