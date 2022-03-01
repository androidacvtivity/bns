
SELECT D.CUIIO,
D.CAEM2
FROM USER_BANCU.VW_KATALOG_ASA_2010 D


WHERE 
1=1
AND 
        (
                SUBSTR(D.CAEM2,2,5) LIKE '45%'
                OR 
                SUBSTR(D.CAEM2,2,5) LIKE '46%'
                OR 
                SUBSTR(D.CAEM2,2,5) LIKE '47%'
)