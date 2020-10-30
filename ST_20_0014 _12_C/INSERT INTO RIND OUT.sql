INSERT INTO CIS2.MD_RIND_OUT
(

  ID_MDTABLE,
  RINDOUT_VERS,
  RINDOUT,
  DENUMIRE,
  STATUT,
  ORDINE,
  DATA_REG,
  RIND     
)



SELECT 
            
            9075 ID_MDTABLE,
            2000 RINDOUT_VERS,
            
            c.codul RINDOUT,
            CASE WHEN c.grupa IS NULL THEN    '777'||c.denumire  ELSE    c.grupa||c.denumire  END DENUMIRE,
            '1'  STATUT,
            
            NULL  ORDINE,
            SYSDATE DATA_REG,
            CASE WHEN c.full_code IS NULL THEN '777' ELSE c.full_code END   RIND
            FROM
            (


SELECT 
            c.codul,
            c.denumire,
            c.grupa,
            c.ordine,
            c.full_code

FROM

(
            
     SELECT c.codul,
            c.denumire,
            c.grupa,
            c.ordine,
            c.full_code
       FROM (SELECT c1.codul,
                    c1.denumire,
                    c1.grupa,
                    c1.ordine,
                       TRIM (TO_CHAR (c6.codul, '000'))
                    || ';'
                    || DECODE (c6.codul,
                               c5.codul, '',
                               TRIM (TO_CHAR (c5.codul, '000')) || ';')
                    || DECODE (c5.codul,
                               c4.codul, '',
                               TRIM (TO_CHAR (c4.codul, '000')) || ';')
                    || DECODE (c4.codul,
                               c3.codul, '',
                               TRIM (TO_CHAR (c3.codul, '000')) || ';')
                    || DECODE (c3.codul,
                               c2.codul, '',
                               TRIM (TO_CHAR (c2.codul, '000')) || ';')
                    || DECODE (c2.codul,
                               c1.codul, '',
                               TRIM (TO_CHAR (c1.codul, '000')) || ';')
                       AS full_code
               FROM GEN_INSTITUTII c1
                    INNER JOIN GEN_INSTITUTII c2 ON (c1.grupa = c2.codul)
                    INNER JOIN GEN_INSTITUTII c3 ON (c2.grupa = c3.codul)
                    INNER JOIN GEN_INSTITUTII c4 ON (c3.grupa = c4.codul)
                    INNER JOIN GEN_INSTITUTII c5 ON (c4.grupa = c5.codul)
                    INNER JOIN GEN_INSTITUTII c6 ON (c5.grupa = c6.codul)) c
   ORDER BY c.ordine, c.full_code
   
   ) C
   
   
   UNION ALL 
   
       SELECT
           '8'  codul,
           'Organizatii concertistice de impresariat' denumire,
            NULL grupa,
            NULL ordine,
            NULL full_code
   
     FROM DUAL
     
     
     UNION ALL
     
       SELECT
           '9'  codul,
           'Organizatii concertistice' denumire,
            NULL grupa,
            NULL ordine,
            NULL full_code
   
     FROM DUAL
     
     
     
     UNION ALL
     
       SELECT
           '10'  codul,
           'Circ' denumire,
            NULL grupa,
            NULL ordine,
            NULL full_code
   
     FROM DUAL
     
     ) C
     