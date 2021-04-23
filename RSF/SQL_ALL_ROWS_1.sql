SELECT 


FROM 

(
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
           
           
           ORDER BY
           MC.CAPITOL
           )
           
        WHERE    
           
           (

instr(COL1, chr(13)) > 0
OR 
instr(COL1, chr(10)) > 0
OR 
instr(COL1, chr(11)) > 0

)



OR 

(
instr(COL2, chr(13)) > 0
OR 
instr(COL2, chr(10)) > 0
OR 
instr(COL2, chr(11)) > 0

)


OR 

-----------------------------------
REGEXP_LIKE (COL1, '[[:alpha:]]')
OR 
REGEXP_LIKE (COL2, '[[:alpha:]]')

OR 
REGEXP_LIKE (COL3, '[[:alpha:]]')
OR 
REGEXP_LIKE (COL4, '[[:alpha:]]')