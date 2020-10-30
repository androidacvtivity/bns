CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_CL_CUATM_DENUMIRE
(
    CODUL,
    DENUMIRE,
    GRUPA,
    ORDINE,
    FULL_CODE,
    FULL_DENUMIRE,
    PRGS
)
AS

SELECT c.codul,
             c.denumire,
             c.grupa,
             c.ordine,
             c.full_code,
             c.full_denumire,
             c.prgs
        FROM (
SELECT c1.codul,
                     c1.denumire,
                     c1.grupa,
                     c1.ordine,
                     c1.prgs,
                        TO_CHAR (c6.codul)
                     || ';'
                     || DECODE (c6.codul,
                                c5.codul, '',
                                TO_CHAR (c5.codul) || ';')
                     || DECODE (c5.codul,
                                c4.codul, '',
                                TO_CHAR (c4.codul) || ';')
                     || DECODE (c4.codul,
                                c3.codul, '',
                                TO_CHAR (c3.codul) || ';')
                     || DECODE (c3.codul,
                                c2.codul, '',
                                TO_CHAR (c2.codul) || ';')
                     || DECODE (c2.codul,
                                c1.codul, '',
                                TO_CHAR (c1.codul) || ';')
                         AS full_code,
                         ----------------------------
                         
                         TO_CHAR (c6.denumire)
                     || ';'
                     || DECODE (c6.denumire,
                                c5.denumire, '',
                                TO_CHAR (c5.denumire) || ';')
                     || DECODE (c5.denumire,
                                c4.denumire, '',
                                TO_CHAR (c4.denumire) || ';')
                     || DECODE (c4.codul,
                                c3.codul, '',
                                TO_CHAR (c3.codul) || ';')
                     || DECODE (c3.denumire,
                                c2.denumire, '',
                                TO_CHAR (c2.denumire) || ';')
                     || DECODE (c2.denumire,
                                c1.denumire, '',
                                TO_CHAR (c1.denumire) || ';')
                         AS full_denumire
                         
                         
                         
                         
                         
                         
                FROM CIS2.cl_cuatm c1
                     INNER JOIN CIS2.cl_cuatm c2 ON (c1.grupa = c2.codul)
                     INNER JOIN CIS2.cl_cuatm c3 ON (c2.grupa = c3.codul)
                     INNER JOIN CIS2.cl_cuatm c4 ON (c3.grupa = c4.codul)
                     INNER JOIN CIS2.cl_cuatm c5 ON (c4.grupa = c5.codul)
                     INNER JOIN CIS2.cl_cuatm c6 ON (c5.grupa = c6.codul)
                     
                     ) c
                     
                     
    ORDER BY c.ordine, c.full_code
    
    ;