             INSERT INTO CIS2.RENIM (
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
             ORGANE_COND,
             GEN_INSTITUTIE 
             )

         


   SELECT 
            
             CUIIO,
             2007 CUIIO_VERS,
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
             ORGANE_COND,
             GEN_INSTITUTIE    



   FROM    USER_BANCU.VW_MAX_RENIM_CIS2
     
     WHERE 
           
           CUIIO IN (
         
31949791,
962203550303,
962712896020,
972501559195,
40986761,
4087886417,
4054300617,
4000184817,
5453345,
7744979,
2001015046379,
3077346,
9216340,
980103153569,
10072344,
41215847


)
           
    
   AND CUIIO_VERS NOT  IN (2007)