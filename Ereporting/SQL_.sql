SELECT
        COUNT(CUIIO) --INTO vCNT_CUIIO
      FROM
        IDNO_CUIIO_CIS2
      WHERE
        IDNO||'_'||CUIIO IN (
        
        SELECT TO_NUMBER(EXTRACT(XMLTYPE(XML), '/dec/DataSet/Header/IDNO/text()'))||'_'||
                                    TO_NUMBER(EXTRACT(XMLTYPE(XML), '/dec/DataSet/Header/CUIIO/text()')) FROM F_XML_FORMS WHERE FORMID IN (16080942)
                                    
                                    
                                    )