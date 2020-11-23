SELECT D.PERIOADA,
           MP.ANUL,
           MP.NUM,
           D.UNIT_CODE,
           D.UNIT_CODE_VERS,
           D.NR_GOSP,
           D.NR_MAPS,
           RN.CUATM,
           CT.FULL_CODE     AS CUATM_FULL,
           RN.ADDRESS_1,
           RN.ADDRESS_2,
           RN.ADDRESS_3,
           RN.ADDRESS_4,
           RN.ENVIRONMENT,
           D.PACHET,
           MR.FORM,
           MR.FORM_VERS,
           MF.DEN_SHORT     AS FORM_DEN,
           MC.CAPITOL,
           MC.CAPITOL_VERS,
           MC.DEN_SHORT     AS CAPITOL_DEN,
           MC.TAB,
           D.ID_MD,
           MR.RIND,
           MR.RIND_VERS,
           D.ID_USER,
           US.USER_NAME,
           D.DATA_REG,
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
      FROM DATA_ALL_GC  D
           LEFT JOIN REG_UNIT_GC RN
               ON     D.UNIT_CODE = RN.UNIT_CODE
                  AND D.UNIT_CODE_VERS = RN.UNIT_CODE_VERS
                  AND D.NR_GOSP = RN.NR_GOSP
                  AND D.NR_MAPS = RN.NR_MAPS
           LEFT JOIN VW_CL_CUATM CT ON RN.CUATM = CT.CODUL
           LEFT JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
           LEFT JOIN MD_FORM MF
               ON MR.FORM = MF.FORM AND MR.FORM_VERS = MF.FORM_VERS
           LEFT JOIN MD_CAPITOL MC
               ON     MR.CAPITOL = MC.CAPITOL
                  AND MR.CAPITOL_VERS = MC.CAPITOL_VERS
           LEFT JOIN MD_PERIOADA MP ON D.PERIOADA = MP.PERIOADA
           LEFT JOIN SYS_USER US ON D.ID_USER = US.ID_USER