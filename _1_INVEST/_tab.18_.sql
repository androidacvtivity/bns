SELECT
       T.NR_SECTIE,
       T.NUME_SECTIE,
       T.NR_ROW,
       T.NUME_ROW,
       T.ORDINE,
       ROUND((T.COL1*100)/(
                           SELECT
                              NOZERO(T1.COL1)
                            FROM
                              TABLE_OUT T1
                            WHERE
                              (T1.FORM=:pFORM) AND
                             (T1.FORM_VERS=:pFORM_VERS) AND
                             (T1.ID_MDTABLE=:pID_MDTABLE) AND
                             T1.COD_CUATM IN (:pCOD_CUATM) AND   
                              T1.PERIOADA IN :pPERIOADA AND
                             T1.NR_ROW IN ('00000') AND
                              T1.NR_SECTIE IN (T.NR_SECTIE)
       ),1) AS COL4
    FROM 
      TABLE_OUT T
    WHERE
      (T.FORM=:pFORM) AND
      (T.FORM_VERS=:pFORM_VERS) AND
      (T.ID_MDTABLE=:pID_MDTABLE) AND
      T.COD_CUATM IN (:pCOD_CUATM) AND   
      T.PERIOADA IN :pPERIOADA
      
   