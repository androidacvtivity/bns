--INSERT INTO CIS2.FORM_CUIIO
--(
--  CUIIO,
--  CUIIO_VERS,
--  FORM,
--  FORM_VERS,
--  STATUT    
--)

SELECT 

   L.CUIIO,
   1039 CUIIO_VERS,
   26 FORM,
   1004 FORM_VERS,
   '1' STATUT 
   
   
   FROM
   
 
(
                 
     SELECT 
        
          R.CUIIO,
          R.CUIIO_VERS,
          R.DENUMIRE,
          R.EDIT_USER,
          R.STATUT,
          R.CUATM,
          R.CFP,
          R.CFOJ,
          R.COCM,
          R.CAEM,
          R.BUGET,
          R.TIP,
          R.PROD,
          R.FOR_CUB,
          R.GENMUZEE,
          R.TIPMUZEE,
          R.TIP_LOCAL,
          R.TIP_INST,
          R.CAEM2,
          R.N85_NTL,
          R.N85_NTIIP,
          R.N85_NDIIP,
          R.N85_NPDS,
          R.N85_NRIIP,
          R.N85_NSIIP,
          R.GENMUZEE2,
          R.NFI,
          R.NTII,
          R.NPDS,
          R.ORGANE,
          R.TIP_INV,
          R.RENIM_PERS,
          R.ORGANE_COND
        
        
        FROM USER_BANCU.VW_KATALOG_9_AGRO_2007  R 
        
                            INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        
        
        WHERE
        
        
        
        C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%' 
        
        
        AND R.CUIIO_VERS IN (2007) ) L LEFT JOIN (
        
        
        SELECT *
        FROM USER_BANCU.VW_KATALOG_21_VINZARI_1039
        
        ) R ON  R.CUIIO = L.CUIIO
        
        
        
        WHERE
        R.CUIIO IS NULL