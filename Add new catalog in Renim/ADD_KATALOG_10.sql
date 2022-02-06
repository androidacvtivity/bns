      SELECT 
--             CUIIO,
--             IDNO,
             CUIIO||'-'||IDNO  AS CNT,
            COUNT (CUIIO||'-'||IDNO) AS COUNT_
            FROM --USER_BANCU.KAT_2010_1_INVEST
                       USER_BANCU.KAT_5_CON_1051
            
            
            GROUP BY 
            CUIIO||'-'||IDNO 
--            CUIIO,
--            IDNO
            
            HAVING 
--            
--           COUNT  (CUIIO)  = 1

COUNT (CUIIO||'-'||IDNO) > 1