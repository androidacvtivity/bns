



  SELECT *
  
  FROM registru_19_10_2017
  
  ORDER BY 
  DATA_REG;
  
  
  update registru_19_10_2017 
  set  DEN_COM = REPLACE(REPLACE(DEN_COM,'�', 'I'),'�','i');
  
  

  SELECT IDNO, DATA_REG, REPLACE(REPLACE(DEN_COM,'�', 'I'),'�','i') DEN_COM
    
      FROM registru_19_10_2017
      ORDER BY 
      DATA_REG;