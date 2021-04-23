-- 
--INSERT INTO USER_BANCU.RSF_PR (
--
--  CUIIO,
-- 
--  DENUMIRE,
--  CUATM,
--  CAEM2,
-- 
--  CAPITOL_DEN,
--  RIND,
--  COL1,
--  COL2,
--  COL3,
--  COL4 
--
--)

SELECT           
           D.CUIIO,
           RN.DENUMIRE,
           RN.CUATM,
       
           RN.CAEM2,
--           MC.CAPITOL,
--           MC.CAPITOL_VERS,
           MC.DEN_SHORT     AS CAPITOL_DEN,
--           D.ID_MD,
           MR.RIND,
           REPLACE(REPLACE(MR.DENUMIRE,'<b>',''),'</b>','') DENUMIRE, 
      --     MR.RIND_VERS,
         --  D.COL1,
           TRIM(translate(D.COL1, chr(10)||chr(11)||chr(13), '    ')) COL1,
           TRIM(translate(D.COL2, chr(10)||chr(11)||chr(13), '    ')) COL2,
           TRIM(translate(D.COL3, chr(10)||chr(11)||chr(13), '    ')) COL3,
           TRIM(translate(D.COL4, chr(10)||chr(11)||chr(13), '    ')) COL4
           
--           D.COL2,
--           D.COL3,
--           D.COL4
          
      FROM DATA_ALL_FR  D
           LEFT JOIN RENIM RN
               ON D.CUIIO = RN.CUIIO AND D.CUIIO_VERS = RN.CUIIO_VERS
           LEFT JOIN VW_CL_CUATM CT ON RN.CUATM = CT.CODUL
           LEFT JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
            LEFT JOIN MD_CAPITOL MC
               ON     MR.CAPITOL = MC.CAPITOL
           
           
           
           WHERE 
           
           D.PERIOADA = 2009 
           AND D.FORM = 63
           AND 
           
           (
           
           (MC.CAPITOL  = 1119 AND MR.RIND NOT IN ('8')) 
           
           OR 
           
           (MC.CAPITOL  <>  1119)
           )  
           
           
          -- AND D.CUIIO = 22237
           
           ORDER BY
           D.CUIIO,
           MC.CAPITOL,
           MR.RIND
           