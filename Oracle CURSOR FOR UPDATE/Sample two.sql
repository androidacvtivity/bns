DECLARE -- ====================================================================

  CURSOR C IS
        SELECT
          D.PERIOADA,
          D.FORM,
          D.CUIIO,
          D.RIND,
          D.ID_MD,
          R.ID_MD AS ID_MD_NEW
        FROM
          VW_DATA_ALL D
          LEFT JOIN (
            SELECT
              R.ID_MD,
              R.FORM,
              R.RIND
            FROM
              MD_RIND R
              INNER JOIN
            (
            SELECT
              R.FORM,
              R.RIND,
              MAX(R.RIND_VERS) AS RIND_VERS
            FROM
              MD_RIND R
            WHERE
              R.CAPITOL IN (100) AND
              R.RIND_VERS <= :pPERIOADA
            GROUP BY
              R.FORM,
              R.RIND
            ) RR ON (R.FORM=RR.FORM AND R.RIND=RR.RIND AND R.RIND_VERS=RR.RIND_VERS)
            WHERE
              R.CAPITOL IN (100) AND
              R.CAPITOL_VERS IN (2009) AND
              R.STATUT <> '3'
            ORDER BY
              R.FORM,
              R.RIND
          ) R ON (D.FORM=R.FORM AND D.RIND=R.RIND)
        WHERE
          D.PERIOADA IN (2009) AND
        --  D.FORM IN (12) AND
          D.CAPITOL IN (100) AND
          D.CAPITOL_VERS NOT IN (2009)
  ;

BEGIN -- ======================================================================
  FOR CR IN C
  LOOP
    UPDATE DATA_ALL SET 
      ID_MD = CR.ID_MD_NEW
    WHERE 
      PERIOADA = CR.PERIOADA AND
      FORM = CR.FORM AND
      CUIIO = CR.CUIIO AND
      ID_MD = CR.ID_MD
    ;
  END LOOP;
END; -- =======================================================================