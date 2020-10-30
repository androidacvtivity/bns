--INSERT INTO  USER_BANCU.RENIM_1_INF_2017_OLD
--(
--   CUIIO,
--   CUIIO_VERS,
--   DENUMIRE,
--   EDIT_USER,
--   STATUT,
--   CUATM,
--   CFP,
--   CFOJ,
--   COCM,
--   CAEM,
--   BUGET,
--   TIP,
--   PROD,
--   FOR_CUB,
--   GENMUZEE,
--   TIPMUZEE,
--   TIP_LOCAL,
--   TIP_INST,
--   CAEM2,
--   N85_NTL,
--   N85_NTIIP,
--   N85_NDIIP,
--   N85_NPDS,
--   N85_NRIIP,
--   N85_NSIIP,
--   GENMUZEE2,
--   NFI,
--   NTII,
--   NPDS,
--   ORGANE,
--   TIP_INV,
--   RENIM_PERS,
--   ORGANE_COND
--)
--


SELECT 
   CUIIO,
   CUIIO_VERS,
   DENUMIRE,
   EDIT_USER,
   STATUT,
   CUATM,
   CFP,
   CFOJ,
   COCM,
   CAEM,
   BUGET,
   TIP,
   PROD,
   FOR_CUB,
   GENMUZEE,
   TIPMUZEE,
   TIP_LOCAL,
   TIP_INST,
   CAEM2,
   N85_NTL,
   N85_NTIIP,
   N85_NDIIP,
   N85_NPDS,
   N85_NRIIP,
   N85_NSIIP,
   GENMUZEE2,
   NFI,
   NTII,
   NPDS,
   ORGANE,
   TIP_INV,
   RENIM_PERS,
   ORGANE_COND
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
            
            FORM IN (2)
            
            AND CUIIO_VERS <= 2006
            
            GROUP BY 
            CUIIO ) BB ON (BB.CUIIO=FC.CUIIO AND BB.CUIIO_VERS=FC.CUIIO_VERS )
            
            
            
    WHERE
    
    FC.FORM IN (2)         
    
    AND FC.STATUT <> '3'
    ) FC INNER JOIN CIS2.RENIM R ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
    
    
    WHERE 
    1=1   
   
    );
    
    
    
    
    
    
    
    
    
    
    
         DELETE    RENIM_1_INF_2017_OLD;
         
    
    
    CREATE TABLE RENIM_1_INF_2017_OLD
                
                AS 
                
                SELECT  * 

                    FROM CIS2.RENIM
                    
                    WHERE
                     1=1 
                   
                    
                  
                    ;   
    
    
    
    
    
    
     
    