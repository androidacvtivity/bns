




            SELECT *
            FROM USER_BANCU.VW_KATALOG_2_ACHIZ_2017
            
            WHERE 
            
            CUIIO IN (
            9779580,
38929000,
40323859,
40008187,
40932073,
20212038,
37780346,
40089889,
40737437,
41009088,
37757867,
40664402,
40851110,
20274969

  )
         --  AND CUIIO_VERS IN (2006) 
         
         ORDER BY 
         CUIIO_VERS
            ;