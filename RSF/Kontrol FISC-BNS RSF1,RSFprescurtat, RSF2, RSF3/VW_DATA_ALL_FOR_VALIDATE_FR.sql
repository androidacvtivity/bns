
CREATE OR REPLACE FORCE VIEW USER_BANCU.FOR_VALIDATE_FR
(
    PERIOADA,
    ANUL,
    NUM,
    CUIIO,
    CUIIO_VERS,
    CUATM,
    CUATM_FULL,
    CFP,
    CFOJ,
    COCM,
    CAEM,
    CAEM2,
    BUGET,
    TIP,
    PACHET,
    FORM,
    FORM_VERS,
    FORM_DEN,
    T_XML_FORM_ID,
    CAPITOL,
    CAPITOL_VERS,
    CAPITOL_DEN,
    TAB,
    ID_MD,
    RIND,
    RIND_VERS,
    ID_USER,
    USER_NAME,
    DATA_REG,
    ID_SCHEMA,
    COL1,
    COL2,
    COL3,
    COL4,
    COL5,
    COL6,
    COL7,
    COL8,
    COL9,
    COL10,
    COL11,
    COL12,
    COL13,
    COL14,
    COL15,
    COL16,
    COL17,
    COL18,
    COL19,
    COL20,
    COL21,
    COL22,
    COL23,
    COL24,
    COL25,
    COL26,
    COL27,
    COL28,
    COL29,
    COL30
)
AS
    SELECT D.PERIOADA,
           MP.ANUL,
           MP.NUM,
           D.CUIIO,
           D.CUIIO_VERS,
           RN.CUATM,
           NULL                  AS CUATM_FULL,
           RN.CFP,
           RN.CFOJ,
           RN.COCM,
           RN.CAEM,
           RN.CAEM2,
           RN.BUGET,
           RN.TIP,
           D.PACHET,
           MR.FORM,
           MR.FORM_VERS,
           MF.DEN_SHORT          AS FORM_DEN,
           D.T_XML_FORM_ID,
           MC.CAPITOL,
           MC.CAPITOL_VERS,
           MC.DEN_SHORT          AS CAPITOL_DEN,
           MC.TAB,
           D.ID_MD,
           MR.RIND,
           MR.RIND_VERS,
           D.ID_USER,
           'USER_EREPORTING'     AS USER_NAME,
           D.DATA_REG,
           D.ID_SCHEMA,
           D.COL1,
           D.COL2,
           D.COL3,
           D.COL4,
           D.COL5,
           D.COL6,
           D.COL7,
           D.COL8,
           D.COL9,
           D.COL10,
           D.COL11,
           D.COL12,
           D.COL13,
           D.COL14,
           D.COL15,
           D.COL16,
           D.COL17,
           D.COL18,
           D.COL19,
           D.COL20,
           D.COL21,
           D.COL22,
           D.COL23,
           D.COL24,
           D.COL25,
           D.COL26,
           D.COL27,
           D.COL28,
           D.COL29,
           D.COL30
      FROM USER_BANCU.DATA_ALL_FOR_VALIDATE_FR  D
           LEFT JOIN CIS2.RENIM RN
               ON     D.CUIIO = RN.CUIIO
                  AND D.CUIIO_VERS = RN.CUIIO_VERS
               --   AND D.ID_SCHEMA = RN.ID_SCHEMA
           --                           LEFT JOIN
           --                              VW_CL_CUATM CT
           --                           ON RN.CUATM = CT.CODUL
           LEFT JOIN CIS2.MD_RIND MR
               ON D.ID_MD = MR.ID_MD 
               
               ---AND D.ID_SCHEMA = MR.ID_SCHEMA
           LEFT JOIN CIS2.MD_FORM MF
               ON     MR.FORM = MF.FORM
                  AND MR.FORM_VERS = MF.FORM_VERS
                --  AND D.ID_SCHEMA = MF.ID_SCHEMA
           LEFT JOIN CIS2.MD_CAPITOL MC
               ON     MR.CAPITOL = MC.CAPITOL
                  --AND D.ID_SCHEMA = MC.ID_SCHEMA
                  AND MR.CAPITOL_VERS = MC.CAPITOL_VERS
           LEFT JOIN CIS2.MD_PERIOADA MP ON D.PERIOADA = MP.PERIOADA


