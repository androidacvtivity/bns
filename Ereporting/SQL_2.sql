SELECT
 
       COUNT(COL1) AS COL1
       
       FROM
(
SELECT
       DISTINCT  CASE WHEN (
         SELECT TO_NUMBER(EXTRACT(XMLTYPE(XML), '/dec/DataSet/Header/IDNO/text()'))||'_'||
                                    TO_NUMBER(EXTRACT(XMLTYPE(XML), '/dec/DataSet/Header/CUIIO/text()')) 
                                    
                                    
                                    FROM F_XML_FORMS WHERE FORMID IN (16080942) 
        ) IS NOT NULL THEN (
         SELECT TO_NUMBER(EXTRACT(XMLTYPE(XML), '/dec/DataSet/Header/IDNO/text()'))||'_'||
                                    TO_NUMBER(EXTRACT(XMLTYPE(XML), '/dec/DataSet/Header/CUIIO/text()')) 
                                    
                                    
                                     FROM F_XML_FORMS WHERE FORMID IN (16080942)
        ) ELSE NULL END AS COL1
      FROM 
        IDNO_CUIIO_CIS2
        )