



  SELECT *
  
  FROM registru_19_10_2017
  
  ORDER BY 
  DATA_REG;
  
  
  update registru_19_10_2017 
  set  DEN_COM = REPLACE(REPLACE(DEN_COM,'Î', 'I'),'î','i');
  
  

  SELECT IDNO, DATA_REG, REPLACE(REPLACE(DEN_COM,'Î', 'I'),'î','i') DEN_COM
    
      FROM registru_19_10_2017
      ORDER BY 
      DATA_REG;