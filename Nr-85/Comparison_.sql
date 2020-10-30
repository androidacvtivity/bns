SELECT 
   
    A.*,   
    B.GENMUZEE2  B_GENMUZEE2 
FROM
(
SELECT R.*
FROM ( 
SELECT FC.* 
   FROM CIS2.FORM_CUIIO FC
   INNER JOIN (
           SELECT 
           CUIIO,
            MAX(CUIIO_VERS)   CUIIO_VERS
            
            FROM CIS2.FORM_CUIIO
            
            
            WHERE 
            
            FORM IN (17)
            
            AND CUIIO_VERS <= 2006
            
            GROUP BY 
            CUIIO ) BB ON (BB.CUIIO=FC.CUIIO AND BB.CUIIO_VERS=FC.CUIIO_VERS )
            
            
            
    WHERE
    
    FC.FORM IN (17)         
    
    AND FC.STATUT <> '3'
    ) FC INNER JOIN CIS2.RENIM R ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
    
    
    WHERE 
    1=1   
   
    )  A 
    
    
    LEFT JOIN (
    
    
    SELECT 
    A.*
FROM
(
SELECT R.*
FROM ( 
SELECT FC.* 
   FROM CIS2.FORM_CUIIO FC
   INNER JOIN (
           SELECT 
           CUIIO,
            MAX(CUIIO_VERS)   CUIIO_VERS
            
            FROM CIS2.FORM_CUIIO
            
            
            WHERE 
            
            FORM IN (17)
            
            AND CUIIO_VERS <= 2006
            
            GROUP BY 
            CUIIO ) BB ON (BB.CUIIO=FC.CUIIO AND BB.CUIIO_VERS=FC.CUIIO_VERS )
            
            
            
    WHERE
    
    FC.FORM IN (17)         
    
    AND FC.STATUT <> '3'
    ) FC INNER JOIN CIS2.RENIM R ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
    
    
    WHERE 
    1=1   
   
    )  A 
    
    
    )  B ON (B.CUIIO = A.CUIIO
    
   AND SVAL(B.N85_NTL)               = SVAL(A.N85_NTL) 
   AND SVAL(B.N85_NTIIP)             = SVAL(A.N85_NTIIP)
   AND SVAL(B.N85_NDIIP)             = A.N85_NDIIP
   AND SVAL(B.N85_NPDS)              = SVAL(A.N85_NPDS)
   AND SVAL(B.N85_NRIIP)             = SVAL(A.N85_NRIIP)
   AND SVAL(B.N85_NSIIP)             = SVAL(A.N85_NSIIP)
   AND NVL(TO_CHAR(B.GENMUZEE2),'0') = NVL(TO_CHAR(A.GENMUZEE2),'0')
   AND NVL(TO_CHAR(B.NFI),'0')       = NVL(TO_CHAR(A.NFI),'0')
   AND NVL(TO_NUMBER(B.NTII),0)      = NVL(TO_NUMBER(A.NTII), 0)
   AND NVL(TO_CHAR(B.NPDS),'0')      = NVL(TO_CHAR(A.NPDS),'0')
   AND NVL(TO_CHAR(B.ORGANE),'0')    = NVL(TO_CHAR(A.ORGANE),'0')   
   AND NVL(TO_CHAR(B.TIP_INV),'0')   = NVL(TO_CHAR(A.TIP_INV),'0')   
   AND NVL(TO_NUMBER(B.RENIM_PERS),0)  = NVL(TO_NUMBER(A.RENIM_PERS), 0)
   AND NVL(TO_CHAR(B.ORGANE_COND),'0')  = NVL(TO_CHAR(A.ORGANE_COND),'0')   
   )
    
    
    WHERE 
    B.CUIIO IS NOT   NULL
    
     
    
    
    
    
    
    
    
    
    
    
    
    
   