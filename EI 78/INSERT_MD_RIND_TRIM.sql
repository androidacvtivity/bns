    INSERT INTO CIS2.MD_RIND (
        ID_MD,--         NUMBER                          NOT NULL,
        FORM,--          NUMBER,
        FORM_VERS,--     NUMBER,
        CAPITOL,--       NUMBER,
        CAPITOL_VERS,--  NUMBER,
        RIND,--          VARCHAR2(20 BYTE)               NOT NULL,
        RIND_VERS,--     NUMBER,
        DENUMIRE,--      VARCHAR2(500 BYTE),
        DECIMAL_POS,--   VARCHAR2(35 BYTE)               DEFAULT '0',
        COL_ACTIV,--     VARCHAR2(35 BYTE),
        ORDINE,--        NUMBER,
        DATA_REG,--      DATE,
        STATUT,--        VARCHAR2(1 BYTE),
        DINAMIC --      VARCHAR2(1 BYTE)
        )



        SELECT 
        ID_MD,--         NUMBER                          NOT NULL,
        44 FORM,--          NUMBER,
        1004 FORM_VERS,--     NUMBER,
        408 CAPITOL,--       NUMBER,
        1004 CAPITOL_VERS,--  NUMBER,
        RIND,--          VARCHAR2(20 BYTE)               NOT NULL,
        1037 RIND_VERS,--     NUMBER,
        DENUMIRE,--      VARCHAR2(500 BYTE),
        DECIMAL_POS,--   VARCHAR2(35 BYTE)               DEFAULT '0',
        COL_ACTIV,--     VARCHAR2(35 BYTE),
        ORDINE,--        NUMBER,
        SYSDATE  DATA_REG,--      DATE,
        STATUT,--        VARCHAR2(1 BYTE),
        DINAMIC --      VARCHAR2(1 BYTE)
        
        FROM CIS2.MD_RIND
        
        
        
         WHERE 
         
         FORM = 46
         
          AND CAPITOL  IN (403)
          
          
          ORDER BY 
          
          ORDINE
        
        
        
        
        
        
        
        
        