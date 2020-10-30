


CREATE OR REPLACE FORCE VIEW ALL_APP.VW_REGISTRU_MODIF_19_10_2018
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
                  REPLACE (DEN_COM, 'Societatea cu Raspundere Limitata', 'SRL')
               WHEN DEN_COM LIKE '%GOSPODARIA TARANEASCA%'
               THEN
                  REPLACE (DEN_COM, 'GOSPODARIA TARANEASCA', 'GŢ')
               ---------------------------------------------------------------------

               WHEN DEN_COM LIKE '%SOCIETATEA CU RASPUNDERE LIMITATA%'
               THEN
                  REPLACE (DEN_COM, 'SOCIETATEA CU RASPUNDERE LIMITATA', 'SRL')
               --------------------------------------------------------------------

               WHEN DEN_COM LIKE '%GOSPODARIE TARANEASCA%'
               THEN
                  REPLACE (DEN_COM, 'GOSPODARIE TARANEASCA', 'GŢ')
               ---------------------------------------------------------------------
               WHEN DEN_COM LIKE '%COOPERATIVA AGRICOLA DE PRODUCTIE%'
               THEN
                  REPLACE (DEN_COM, 'COOPERATIVA AGRICOLA DE PRODUCTIE', 'CAP')
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

               WHEN DEN_COM LIKE '%Societatea cu Răspundere Limitată%'
               THEN
                  REPLACE (DEN_COM,
                           'Societatea cu Răspundere Limitată',
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
                  REPLACE (DEN_COM, 'SOCIETATEA CU RASPUNDRE LIMITATA', 'SRL')
               ----------------------------------------------------------------------


               WHEN DEN_COM LIKE '%SOCIETATII CU RASPUNDEREA LIMITATA%'
               THEN
                  REPLACE (DEN_COM,
                           'SOCIETATII CU RASPUNDEREA LIMITATA',
                           'SRL')
               -----------------------------------------------------------------------

               WHEN DEN_COM LIKE '%SOCIETATEA CU RĂSPUNDERE LIMITATĂ%'
               THEN
                  REPLACE (DEN_COM,
                           'SOCIETATEA CU RĂSPUNDERE LIMITATĂ',
                           'SRL')
               -------------------------------------------------

               WHEN DEN_COM LIKE '%SOCIETATE CU RASPUNDERE LIMITATA%'
               THEN
                  REPLACE (DEN_COM, 'SOCIETATE CU RASPUNDERE LIMITATA', 'SRL')
               ---------------------------------------------------------



               WHEN DEN_COM LIKE '%SOCIETATEA CU RESPONSABILITATE LIMITATA%'
               THEN
                  REPLACE (DEN_COM,
                           'SOCIETATEA CU RESPONSABILITATE LIMITATA',
                           'SRL')
               ---------------------------------------------------------



               WHEN DEN_COM LIKE '%SOCIETATEA CU RESPUNDERE LIMITATA%'
               THEN
                  REPLACE (DEN_COM, 'SOCIETATEA CU RESPUNDERE LIMITATA', 'SRL')
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

               WHEN DEN_COM LIKE '%SOCIETATEA CU RĂSRUNDERE LIMITATĂ%'
               THEN
                  REPLACE (DEN_COM,
                           'SOCIETATEA CU RĂSRUNDERE LIMITATĂ',
                           'SRL')
               ---------------------------------------------------------

               WHEN DEN_COM LIKE '%SOCIETATEA CU RĂSPUNDERE LIMTATĂ%'
               THEN
                  REPLACE (DEN_COM,
                           'SOCIETATEA CU RĂSRUNDERE LIMITATĂ',
                           'SRL')
               ---------------------------------------------------------
               WHEN DEN_COM LIKE '%SOCIETATEA CU RĂPUNDERE LIMITATĂ%'
               THEN
                  REPLACE (DEN_COM,
                           'SOCIETATEA CU RĂPUNDERE LIMITATĂ',
                           'SRL')
               ----------------------------------------------------------
               WHEN DEN_COM LIKE '%ЯSOCIETATEA RESPONSABILITATE LIMITATA%'
               THEN
                  REPLACE (DEN_COM,
                           'ЯSOCIETATEA RESPONSABILITATE LIMITATA',
                           'SRL')
               --
               WHEN DEN_COM LIKE '%SOCIETATEA COMERCIALĂ%'
               THEN
                  REPLACE (DEN_COM, 'SOCIETATEA COMERCIALĂ', 'SC')
               --------------------------------------------------------

               --
               WHEN DEN_COM LIKE '%Societatea cu Responsabilitate Limitată%'
               THEN
                  REPLACE (DEN_COM,
                           'Societatea cu Responsabilitate Limitată',
                           'SC')
               ---------------------------------------------------------


               --------------------------------------------------------

               --
               WHEN DEN_COM LIKE '%SOCIETTE CU RASPUNDERE LIMITATA%'
               THEN
                  REPLACE (DEN_COM, 'SOCIETTE CU RASPUNDERE LIMITATA', 'SRL')
               ---------------------------------------------------------


               WHEN DEN_COM LIKE '%SOCIETETEA CU RASPUNDERE LIMITATA%'
               THEN
                  REPLACE (DEN_COM, 'SOCIETETEA CU RASPUNDERE LIMITATA', 'SRL')
               ---------------------------------------------------------

               WHEN DEN_COM LIKE '%SOCIETETA CU RASPUNDERE LIMITATA%'
               THEN
                  REPLACE (DEN_COM, 'SOCIETETA CU RASPUNDERE LIMITATA', 'SRL')
               ---------------------------------------------------------

               ---------------------------------------------------------

               WHEN DEN_COM LIKE '%SOCIETEA CU RASPUNDERE LUMUTATA%'
               THEN
                  REPLACE (DEN_COM, 'SOCIETEA CU RASPUNDERE LUMUTATA', 'SRL')
               ---------------------------------------------------------

               ---------------------------------------------------------

               WHEN DEN_COM LIKE '%SOCIETEA CU RASPUNDERE LIMITATA%'
               THEN
                  REPLACE (DEN_COM, 'SOCIETEA CU RASPUNDERE LIMITATA', 'SRL')
               ---------------------------------------------------------


               ---------------------------------------------------------
               --1
               WHEN DEN_COM LIKE '%SOCIETATII CU RESPUNDERE LIMITATA%'
               THEN
                  REPLACE (DEN_COM, 'SOCIETATII CU RESPUNDERE LIMITATA', 'SRL')
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
               WHEN DEN_COM LIKE '%SOCIETATЕ CU RASPUNDERE LIMITATA%'
               THEN
                  REPLACE (DEN_COM, 'SOCIETATЕ CU RASPUNDERE LIMITATA', 'SRL')
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
                  REPLACE (DEN_COM, 'SOCIETATII CU RASPUNDERE LIMITATA', 'SRL')
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
                  REPLACE (DEN_COM, 'SOCIETATIA CU RASPUNDERE LIMITATA', 'SRL')
               ---------------------------------------------------------


               ---------------------------------------------------------
               --1
               WHEN DEN_COM LIKE '%SOCIETATEА CU RELATII LIMITATE%'
               THEN
                  REPLACE (DEN_COM, 'SOCIETATEА CU RELATII LIMITATE', 'SRL')
               ---------------------------------------------------------

               ---------------------------------------------------------
               --2
               WHEN DEN_COM LIKE '%SOCIETATEА CU RASРUNDERE LIMITATA%'
               THEN
                  REPLACE (DEN_COM,
                           'SOCIETATEА CU RASРUNDERE LIMITATA',
                           'SRL')
               ---------------------------------------------------------



               ELSE
                  DEN_COM
            END
               DEN_COM,
            --------------------------------------------------------------------------------


            CASE
               WHEN FORMA_ORG LIKE '%Societate cu răspundere limitată%'
               THEN
                  REPLACE (FORMA_ORG,
                           'Societate cu răspundere limitată',
                           'SRL')
               ----------------------------------------------------------------



               ELSE
                  FORMA_ORG
            END
               FORMA_ORG,
            ----------------------------------------------------
            ADRESA,
            LIST_COND,
            LISTA_FOND,
            GEN_ACT_NE_LIC,
            GEN_ACT_LIC,
            STATUTUL
       FROM ALL_APP.VW_REGISTRU_10_2018
      WHERE 1 = 1
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
