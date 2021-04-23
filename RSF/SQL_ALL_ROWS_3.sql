
INSERT INTO USER_BANCU.RSF_PR_v1 (

  CUIIO,
 
  DENUMIRE,
  CUATM,
  CAEM2,
 
  CAPITOL_DEN,
  RIND,
  COL1,
  COL2,
  COL3,
  COL4 

)


SELECT 


 TRIM(translate(CUIIO, chr(10)||chr(11)||chr(13), '    ')) CUIIO,
 TRIM(translate(DENUMIRE, chr(10)||chr(11)||chr(13), '    ')) DENUMIRE,
 TRIM(translate(CUATM, chr(10)||chr(11)||chr(13), '    ')) CUATM,
 TRIM(translate(CAEM2, chr(10)||chr(11)||chr(13), '    ')) CAEM2,
 TRIM(translate(CAPITOL_DEN, chr(10)||chr(11)||chr(13), '    ')) CAPITOL_DEN,
 TRIM(translate(RIND, chr(10)||chr(11)||chr(13), '    ')) RIND,

 TRIM(translate(COL1, chr(10)||chr(11)||chr(13), '    ')) COL1,
 TRIM(translate(COL2, chr(10)||chr(11)||chr(13), '    ')) COL2, 
 TRIM(translate(COL3, chr(10)||chr(11)||chr(13), '    ')) COL3,
 TRIM(translate(COL4, chr(10)||chr(11)||chr(13), '    ')) COL4
 
FROM USER_BANCU.RSF_PR