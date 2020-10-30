




 SELECT *
  
  FROM registru_md_19_02_2018
  
  ORDER BY DATA_REG DESC;



SELECT COUNT(*) CNT,
  'decembrie_22_2014' date_
  
  FROM decembrie_22_2014
  
  UNION ALL 
  
  SELECT COUNT(*) CNT,
  'februarie_09_2015' date_
  FROM februarie_09_2015
  
  ;
  
  SELECT *
  
  FROM decembrie_22_2014
  
  ORDER BY DATA_REG DESC;
  