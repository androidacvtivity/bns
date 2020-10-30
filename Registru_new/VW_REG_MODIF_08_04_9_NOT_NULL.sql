DROP VIEW ALL_APP_DB.VW_REG_MODIF_08_04_2019;

/* Formatted on 27/04/2019 14:45:52 (QP5 v5.336) */
CREATE OR REPLACE FORCE VIEW ALL_APP_DB.VW_REG_MODIF_08_04_9_NOT_NULL
(
    IDNO,
    DATA_REG,
    DEN_COM,
    FORMA_ORG,
    ADRESA,
    LIST_COND,
    LISTA_FOND,
    GEN_ACT_NE_LIC,
    GEN_ACT_LIC,
    STATUTUL
)
AS
      SELECT IDNO,
             DATA_REG,
             CASE
                 WHEN DEN_COM LIKE '%Societatea cu Raspundere Limitata%'
                 THEN
                     REPLACE (DEN_COM,
                              'Societatea cu Raspundere Limitata',
                              'SRL')
                 WHEN DEN_COM LIKE '%GOSPODARIA TARANEASCA%'
                 THEN
                     REPLACE (DEN_COM, 'GOSPODARIA TARANEASCA', 'GT')
                 ---------------------------------------------------------------------

                 WHEN DEN_COM LIKE '%SOCIETATEA CU RASPUNDERE LIMITATA%'
                 THEN
                     REPLACE (DEN_COM,
                              'SOCIETATEA CU RASPUNDERE LIMITATA',
                              'SRL')
                 --------------------------------------------------------------------

                 WHEN DEN_COM LIKE '%GOSPODARIE TARANEASCA%'
                 THEN
                     REPLACE (DEN_COM, 'GOSPODARIE TARANEASCA', 'GT')
                 ---------------------------------------------------------------------
                 WHEN DEN_COM LIKE '%COOPERATIVA AGRICOLA DE PRODUCTIE%'
                 THEN
                     REPLACE (DEN_COM,
                              'COOPERATIVA AGRICOLA DE PRODUCTIE',
                              'CAP')
                 ----------------------------------------------------------------
                 WHEN DEN_COM LIKE '%SOCIETATEA PE ACTIUNI%'
                 THEN
                     REPLACE (DEN_COM, 'SOCIETATEA PE ACTIUNI', 'SA')
                 ----------------------------------------------------------------

                 ----------------------------------------------------------------
                 WHEN DEN_COM LIKE '%SOCIETATEA COMERCIALA%'
                 THEN
                     REPLACE (DEN_COM, 'SOCIETATEA COMERCIALA', 'SC')
                 ----------------------------------------------------------------


                 ----------------------------------------------------------------
                 WHEN DEN_COM LIKE '%INTREPRINDEREA INDIVIDUALA%'
                 THEN
                     REPLACE (DEN_COM, 'INTREPRINDEREA INDIVIDUALA', 'II')
                 ----------------------------------------------------------------
                 ----------------------------------------------------------------
                 WHEN DEN_COM LIKE '%Intreprinderea Individuala%'
                 THEN
                     REPLACE (DEN_COM, 'Intreprinderea Individuala', 'II')
                 ----------------------------------------------------------------
                 ----------------------------------------------------------------
                 WHEN DEN_COM LIKE '%Intreprinderea Mixta%'
                 THEN
                     REPLACE (DEN_COM, 'Intreprinderea Mixta', 'IM')
                 ----------------------------------------------------------------


                 ----------------------------------------------------------------
                 WHEN DEN_COM LIKE '%INTREPRINDEREA MIXTA%'
                 THEN
                     REPLACE (DEN_COM, 'INTREPRINDEREA MIXTA', 'IM')
                 ----------------------------------------------------------------

                 ----------------------------------------------------------------
                 WHEN DEN_COM LIKE '%SOCIETATE COMERCIALA%'
                 THEN
                     REPLACE (DEN_COM, 'SOCIETATE COMERCIALA', 'SC')
                 ----------------------------------------------------------------

                 ----------------------------------------------------------------
                 WHEN DEN_COM LIKE '%SOCIETATEA  CU RASPUNDERE LIMITATA%'
                 THEN
                     REPLACE (DEN_COM,
                              'SOCIETATEA  CU RASPUNDERE LIMITATA',
                              'SRL')
                 ----------------------------------------------------------------

                 ----------------------------------------------------------------
                 WHEN DEN_COM LIKE '%Societatea Comerciala%'
                 THEN
                     REPLACE (DEN_COM, 'Societatea Comerciala', 'SC')
                 ----------------------------------------------------------------

                 WHEN DEN_COM LIKE '%Societatea cu Raspundere Limitata%'
                 THEN
                     REPLACE (DEN_COM,
                              'Societatea cu Raspundere Limitata',
                              'SRL')
                 ----------------------------------------------------------------



                 WHEN DEN_COM LIKE '%SOCITATE CU RESPONSIBILITATE LIMITATA%'
                 THEN
                     REPLACE (DEN_COM,
                              'SOCITATE CU RESPONSIBILITATE LIMITATA',
                              'SRL')
                 -----------------------------------------------------------------------


                 WHEN DEN_COM LIKE '%SOCIETATEA CU RASPUNDRE LIMITATA%'
                 THEN
                     REPLACE (DEN_COM,
                              'SOCIETATEA CU RASPUNDRE LIMITATA',
                              'SRL')
                 ----------------------------------------------------------------------


                 WHEN DEN_COM LIKE '%SOCIETATII CU RASPUNDEREA LIMITATA%'
                 THEN
                     REPLACE (DEN_COM,
                              'SOCIETATII CU RASPUNDEREA LIMITATA',
                              'SRL')
                 -----------------------------------------------------------------------

                 WHEN DEN_COM LIKE '%SOCIETATEA CU RASPUNDERE LIMITATA%'
                 THEN
                     REPLACE (DEN_COM,
                              'SOCIETATEA CU RASPUNDERE LIMITATA',
                              'SRL')
                 -------------------------------------------------

                 WHEN DEN_COM LIKE '%SOCIETATE CU RASPUNDERE LIMITATA%'
                 THEN
                     REPLACE (DEN_COM,
                              'SOCIETATE CU RASPUNDERE LIMITATA',
                              'SRL')
                 ---------------------------------------------------------



                 WHEN DEN_COM LIKE '%SOCIETATEA CU RESPONSABILITATE LIMITATA%'
                 THEN
                     REPLACE (DEN_COM,
                              'SOCIETATEA CU RESPONSABILITATE LIMITATA',
                              'SRL')
                 ---------------------------------------------------------



                 WHEN DEN_COM LIKE '%SOCIETATEA CU RESPUNDERE LIMITATA%'
                 THEN
                     REPLACE (DEN_COM,
                              'SOCIETATEA CU RESPUNDERE LIMITATA',
                              'SRL')
                 ---------------------------------------------------------


                 WHEN DEN_COM LIKE '%SOCIETATE CU RESPONSADILITATE LIMITATA%'
                 THEN
                     REPLACE (DEN_COM,
                              'SOCIETATE CU RESPONSADILITATE LIMITATA',
                              'SRL')
                 ---------------------------------------------------------

                 WHEN DEN_COM LIKE '%SOCIETATEA CU RASPUNDEREA LIMITATA%'
                 THEN
                     REPLACE (DEN_COM,
                              'SOCIETATEA CU RASPUNDEREA LIMITATA',
                              'SRL')
                 ---------------------------------------------------------

                 WHEN DEN_COM LIKE '%SOCIETATEA CU RASRUNDERE LIMITATA%'
                 THEN
                     REPLACE (DEN_COM,
                              'SOCIETATEA CU RASRUNDERE LIMITATA',
                              'SRL')
                 ---------------------------------------------------------

                 WHEN DEN_COM LIKE '%SOCIETATEA CU RASPUNDERE LIMTATA%'
                 THEN
                     REPLACE (DEN_COM,
                              'SOCIETATEA CU RASRUNDERE LIMITATA',
                              'SRL')
                 ---------------------------------------------------------
                 WHEN DEN_COM LIKE '%SOCIETATEA CU RAPUNDERE LIMITATA%'
                 THEN
                     REPLACE (DEN_COM,
                              'SOCIETATEA CU RAPUNDERE LIMITATA',
                              'SRL')
                 ----------------------------------------------------------
                 WHEN DEN_COM LIKE '%?SOCIETATEA RESPONSABILITATE LIMITATA%'
                 THEN
                     REPLACE (DEN_COM,
                              '?SOCIETATEA RESPONSABILITATE LIMITATA',
                              'SRL')
                 --
                 WHEN DEN_COM LIKE '%SOCIETATEA COMERCIALA%'
                 THEN
                     REPLACE (DEN_COM, 'SOCIETATEA COMERCIALA', 'SC')
                 --------------------------------------------------------

                 --
                 WHEN DEN_COM LIKE '%Societatea cu Responsabilitate Limitata%'
                 THEN
                     REPLACE (DEN_COM,
                              'Societatea cu Responsabilitate Limitata',
                              'SC')
                 ---------------------------------------------------------


                 --------------------------------------------------------

                 --
                 WHEN DEN_COM LIKE '%SOCIETTE CU RASPUNDERE LIMITATA%'
                 THEN
                     REPLACE (DEN_COM,
                              'SOCIETTE CU RASPUNDERE LIMITATA',
                              'SRL')
                 ---------------------------------------------------------


                 WHEN DEN_COM LIKE '%SOCIETETEA CU RASPUNDERE LIMITATA%'
                 THEN
                     REPLACE (DEN_COM,
                              'SOCIETETEA CU RASPUNDERE LIMITATA',
                              'SRL')
                 ---------------------------------------------------------

                 WHEN DEN_COM LIKE '%SOCIETETA CU RASPUNDERE LIMITATA%'
                 THEN
                     REPLACE (DEN_COM,
                              'SOCIETETA CU RASPUNDERE LIMITATA',
                              'SRL')
                 ---------------------------------------------------------

                 ---------------------------------------------------------

                 WHEN DEN_COM LIKE '%SOCIETEA CU RASPUNDERE LUMUTATA%'
                 THEN
                     REPLACE (DEN_COM,
                              'SOCIETEA CU RASPUNDERE LUMUTATA',
                              'SRL')
                 ---------------------------------------------------------

                 ---------------------------------------------------------

                 WHEN DEN_COM LIKE '%SOCIETEA CU RASPUNDERE LIMITATA%'
                 THEN
                     REPLACE (DEN_COM,
                              'SOCIETEA CU RASPUNDERE LIMITATA',
                              'SRL')
                 ---------------------------------------------------------


                 ---------------------------------------------------------
                 --1
                 WHEN DEN_COM LIKE '%SOCIETATII CU RESPUNDERE LIMITATA%'
                 THEN
                     REPLACE (DEN_COM,
                              'SOCIETATII CU RESPUNDERE LIMITATA',
                              'SRL')
                 ---------------------------------------------------------

                 ---------------------------------------------------------
                 --2
                 WHEN DEN_COM LIKE '%SOCIETATII CU RESPOSABILITATE%'
                 THEN
                     REPLACE (DEN_COM, 'SOCIETATII CU RESPOSABILITATE', 'SRL')
                 ---------------------------------------------------------
                 --3
                 WHEN DEN_COM LIKE '%SOCIETATII CU RESPONSABILITATE LIMITATA%'
                 THEN
                     REPLACE (DEN_COM,
                              'SOCIETATII CU RESPONSABILITATE LIMITATA',
                              'SRL')
                 ---------------------------------------------------------

                 --1
                 WHEN DEN_COM LIKE '%SOCIETAT? CU RASPUNDERE LIMITATA%'
                 THEN
                     REPLACE (DEN_COM,
                              'SOCIETAT? CU RASPUNDERE LIMITATA',
                              'SRL')
                 ---------------------------------------------------------
                 --2
                 WHEN DEN_COM LIKE '%SOCIETATYEA CU RASPUNDERE LIMITATA%'
                 THEN
                     REPLACE (DEN_COM,
                              'SOCIETATYEA CU RASPUNDERE LIMITATA',
                              'SRL')
                 ---------------------------------------------------------


                 ---------------------------------------------------------
                 --1
                 WHEN DEN_COM LIKE '%SOCIETATII CU RESPONSABILITATE LIMITAT%'
                 THEN
                     REPLACE (DEN_COM,
                              'SOCIETATII CU RESPONSABILITATE LIMITAT',
                              'SRL')
                 ---------------------------------------------------------
                 ---------------------------------------------------------
                 --2
                 WHEN DEN_COM LIKE '%SOCIETATII CU RESPENSABILITATE LIMITATA%'
                 THEN
                     REPLACE (DEN_COM,
                              'SOCIETATII CU RESPENSABILITATE LIMITATA',
                              'SRL')
                 ---------------------------------------------------------
                 --3
                 WHEN DEN_COM LIKE '%SOCIETATII CU RASPUNDERER LIMITATA%'
                 THEN
                     REPLACE (DEN_COM,
                              'SOCIETATII CU RASPUNDERER LIMITATA',
                              'SRL')
                 ---------------------------------------------------------
                 ---------------------------------------------------------
                 --4
                 WHEN DEN_COM LIKE '%SOCIETATII CU RASPUNDERE LIMITATA%'
                 THEN
                     REPLACE (DEN_COM,
                              'SOCIETATII CU RASPUNDERE LIMITATA',
                              'SRL')
                 ---------------------------------------------------------
                 ---------------------------------------------------------
                 --1
                 WHEN DEN_COM LIKE '%SOCIETATIA CU RESPONSABILITATE LIMITATA%'
                 THEN
                     REPLACE (DEN_COM,
                              'SOCIETATIA CU RESPONSABILITATE LIMITATA',
                              'SRL')
                 ---------------------------------------------------------

                 ---------------------------------------------------------
                 --2
                 WHEN DEN_COM LIKE '%SOCIETATIA CU RASPUNDERE LIMITATA%'
                 THEN
                     REPLACE (DEN_COM,
                              'SOCIETATIA CU RASPUNDERE LIMITATA',
                              'SRL')
                 ---------------------------------------------------------


                 ---------------------------------------------------------
                 --1
                 WHEN DEN_COM LIKE '%SOCIETATE? CU RELATII LIMITATE%'
                 THEN
                     REPLACE (DEN_COM,
                              'SOCIETATE? CU RELATII LIMITATE',
                              'SRL')
                 ---------------------------------------------------------

                 ---------------------------------------------------------
                 --2
                 WHEN DEN_COM LIKE '%SOCIETATE? CU RAS?UNDERE LIMITATA%'
                 THEN
                     REPLACE (DEN_COM,
                              'SOCIETATE? CU RAS?UNDERE LIMITATA',
                              'SRL')
                 ---------------------------------------------------------

                 WHEN DEN_COM LIKE '%Întreprindere individuala%'
                 THEN
                     REPLACE (DEN_COM, 'Întreprindere individuala', 'II')
                 WHEN DEN_COM LIKE '%Întreprindere individual%'
                 THEN
                     REPLACE (DEN_COM, 'Întreprindere individual', 'II')
                 ELSE
                     DEN_COM
             -----------------------------------------
             END    DEN_COM,
             --------------------------------------------------------------------------------


             CASE
                 WHEN FORMA_ORG LIKE '%Societate cu raspundere limitata%'
                 THEN
                     REPLACE (FORMA_ORG,
                              'Societate cu raspundere limitata',
                              'SRL')
                 ----------------------------------------------------------------



                 ELSE
                     FORMA_ORG
             END    FORMA_ORG,
             ----------------------------------------------------
             ADRESA,
             LIST_COND,
             LISTA_FOND,
             GEN_ACT_NE_LIC,
             GEN_ACT_LIC,
             STATUTUL
        FROM (SELECT VB.IDNO,
                     VB.DATA_REG,
                     VB.DEN_COM,
                     VB.FORMA_ORG,
                     VB.ADRESA,
                     VB.LIST_COND                             AS LIST_COND,
                     VB.LISTA_FOND,
                     REPLACE (VB.GEN_ACT_NE_LIC, ' ', '')     GEN_ACT_NE_LIC,
                     REPLACE (VB.GEN_ACT_LIC, ' ', '')        GEN_ACT_LIC,
                     VB.STATUTUL
                FROM (SELECT TRIM (VB.IDNO)               AS IDNO,
                             VB.DATA_REG                  AS DATA_REG,
                             TRIM (VB.DEN_COM)            AS DEN_COM,
                             TRIM (VB.FORMA_ORG)          AS FORMA_ORG,
                             TRIM (VB.ADRESA)             AS ADRESA,
                             TRIM (VB.LIST_COND)          AS LIST_COND,
                             TRIM (VB.LISTA_FOND)         AS LISTA_FOND,
                             TRIM (VB.GEN_ACT_NE_LIC)     AS GEN_ACT_NE_LIC,
                             TRIM (VB.GEN_ACT_LIC)        AS GEN_ACT_LIC,
                             TRIM (VB.STATUTUL)           AS STATUTUL
                        FROM REGISTRU_MD_08_04_2019 VB --ORDER BY VB.DATA_REG DESC
                                                      ) VB)
       WHERE 1 = 1
       AND 
       
       IDNO IS NOT NULL
    --      --
    --
    --    AND DEN_COM NOT  LIKE '%Societatea cu Raspundere Limitata%'
    --
    --       AND DEN_COM NOT LIKE '%SOCIETATEA CU RASPUNDERE LIMITATA%'
    --
    --       AND DEN_COM NOT  LIKE '%GOSPODARIA TARANEASCA%'
    --
    --       AND DEN_COM   NOT LIKE '%GOSPODARIE TARANEASCA%'
    --
    --       AND DEN_COM   NOT  LIKE '%COOPERATIVA AGRICOLA DE PRODUCTIE%'
    --
    --       AND DEN_COM   NOT  LIKE '%SOCIETATEA PE ACTIUNI%'
    --
    --       AND DEN_COM   NOT   LIKE '%SOCIETATEA COMERCIALA%'
    --
    --       AND DEN_COM    NOT   LIKE '%INTREPRINDEREA INDIVIDUALA%'
    --
    --       AND DEN_COM     NOT   LIKE '%Intreprinderea Individuala%'
    --
    --       AND DEN_COM     NOT   LIKE '%Intreprinderea Mixta%'
    --
    --       AND DEN_COM    NOT   LIKE '%INTREPRINDEREA MIXTA%'
    --
    --       AND DEN_COM     NOT   LIKE '%SOCIETATE COMERCIALA%'
    --
    --       AND DEN_COM     NOT    LIKE '%SOCIETATEA  CU RASPUNDERE LIMITATA%'
    --
    --       AND DEN_COM      NOT   LIKE '%Societatea Comerciala%'


    ORDER BY DATA_REG DESC;


GRANT SELECT ON ALL_APP_DB.VW_REG_MODIF_08_04_2019 TO BACKUP_DB WITH GRANT OPTION;
GRANT DELETE, INSERT, UPDATE ON ALL_APP_DB.VW_REG_MODIF_08_04_2019 TO BACKUP_DB;
