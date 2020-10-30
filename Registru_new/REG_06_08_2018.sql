   CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_REGISTRU
   
(
   IDNO,
   DATA_REG,
   DEN_COM,
   FORMA_ORG,
   ADRESA,
   LIST_COND,
   LISTA_FOND,
   GEN_ACT_NE_LIC,
   GEN_ACT_LIC,
   STATUTUL
)
AS
   SELECT VB.IDNO,
          VB.DATA_REG,
          VB.DEN_COM,
          VB.FORMA_ORG,
          VB.ADRESA,
          VB.LIST_COND AS LIST_COND,
          VB.LISTA_FOND,
          REPLACE (VB.GEN_ACT_NE_LIC, ' ', '') GEN_ACT_NE_LIC,
          REPLACE (VB.GEN_ACT_LIC, ' ', '') GEN_ACT_LIC,
          VB.STATUTUL
     FROM (  SELECT TRIM (VB.IDNO) AS IDNO,
                    VB.DATA_REG AS DATA_REG,
                    TRIM (VB.DEN_COM) AS DEN_COM,
                    TRIM (VB.FORMA_ORG) AS FORMA_ORG,
                    TRIM (VB.ADRESA) AS ADRESA,
                    TRIM (VB.LIST_COND) AS LIST_COND,
                    TRIM (VB.LISTA_FOND) AS LISTA_FOND,
                    TRIM (VB.GEN_ACT_NE_LIC) AS GEN_ACT_NE_LIC,
                    TRIM (VB.GEN_ACT_LIC) AS GEN_ACT_LIC,
                    TRIM (VB.STATUTUL) AS STATUTUL
               FROM USER_BANCU.REGISTRU_MD_19_07_2018 VB
           ORDER BY VB.DATA_REG) VB;

--------------------------------------------------------------------









    SELECT *
        
        FROM USER_BANCU.VW_REGISTRU
        
        WHERE 
        
        (DEN_COM LIKE '%ALINASOFT%'
        
        OR 
        
        DEN_COM LIKE '%alinasoft%'
        

        OR 
        
        DEN_COM LIKE '%Alinasoft%'
        
        
        OR 
        
        DEN_COM LIKE '%ALINA'
        )
        
        AND 
        
        STATUTUL IS NOT NULL
        
        
        
        
        ORDER BY
        DATA_REG DESC 
        ;





