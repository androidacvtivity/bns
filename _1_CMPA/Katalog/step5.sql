SELECT 
      L.UNIT_CODE,
      L.UNIT_CODE_VERS,
      L.NAME        
       
       FROM  USER_BANCU.REG_UNIT_GC_CMPA1 L 
       
                 INNER JOIN CIS2.REG_UNIT_GC R  ON L.UNIT_CODE = R.UNIT_CODE 
                                                   AND L.UNIT_CODE_VERS = R.UNIT_CODE_VERS; 