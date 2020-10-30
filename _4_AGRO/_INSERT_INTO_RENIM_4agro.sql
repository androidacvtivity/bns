


--             INSERT INTO CIS2.RENIM (
--             CUIIO,
--             CUIIO_VERS,
--             DENUMIRE,
--             EDIT_USER,
--             STATUT,  
--             CUATM,
--             CFP,
--             CFOJ,
--             COCM,
--             CAEM,
--             BUGET,
--             TIP,
--             PROD,
--             FOR_CUB,
--             GENMUZEE,
--             TIPMUZEE,
--             TIP_LOCAL,
--             TIP_INST,
--             CAEM2,
--             N85_NTL,
--             N85_NTIIP,
--             N85_NDIIP,
--             N85_NPDS,
--             N85_NRIIP,
--             N85_NSIIP,
--             GENMUZEE2,
--             NFI,
--             NTII,
--             NPDS,
--             ORGANE,
--             TIP_INV,
--             RENIM_PERS,
--             ORGANE_COND,
--             GEN_INSTITUTIE 
--             )
--



--            SELECT 
--            
--             CUIIO,
--             2007 CUIIO_VERS,
--             DENUMIRE,
--             EDIT_USER,
--             STATUT,  
--             CUATM,
--             CFP,
--             CFOJ,
--             COCM,
--             CAEM,
--             BUGET,
--             TIP,
--             PROD,
--             FOR_CUB,
--             GENMUZEE,
--             TIPMUZEE,
--             TIP_LOCAL,
--             TIP_INST,
--             CAEM2,
--             N85_NTL,
--             N85_NTIIP,
--             N85_NDIIP,
--             N85_NPDS,
--             N85_NRIIP,
--             N85_NSIIP,
--             GENMUZEE2,
--             NFI,
--             NTII,
--             NPDS,
--             ORGANE,
--             TIP_INV,
--             RENIM_PERS,
--             ORGANE_COND,
--             GEN_INSTITUTIE    




--------------------------------------------------------------------------------

INSERT INTO CIS2.FORM_CUIIO

(

 CUIIO,
 CUIIO_VERS,
 FORM,
 FORM_VERS,
 STATUT

)



           SELECT 

   CUIIO,
   CUIIO_VERS,
   43 FORM,
   2000 FORM_VERS,
   '1' STATUT

           FROM    USER_BANCU.VW_MAX_RENIM_CIS2
           
           
           WHERE 
           
           CUIIO IN (
         
           35902324,
36727324,
36954324,
38587781,
38878981,
4057575603,
40587788,
40605316,
40707241,
40756156,
40803465,
40985566,
41033589,
41069274,
41141698,
41145518,
41208586,
41236341,
41243654,
41267079,
41267133,
41267235,
41267241,
41267258,
41267287,
41267293,
292881210,
3738649214,
4023225210

           
    )
           
    
        AND CUIIO_VERS  IN (2007)