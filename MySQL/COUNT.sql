

SELECT COUNT(*) CNT
  FROM registru_md_19_02_2018;
  


SELECT *
  FROM registru_md_19_02_2018
  limit 0, 100
 ;




  

  SELECT COUNT(*) decembrie_22_2014
  FROM decembrie_22_2014;
  
  SELECT COUNT(*) CNT,
  'decembrie_22_2014' date_
  
  FROM decembrie_22_2014
  
  UNION ALL 
  
  SELECT COUNT(*) CNT,
  'februarie_09_2015' date_
  FROM februarie_09_2015
  
  
  UNION ALL 
  
  SELECT COUNT(*) CNT,
  'martie_09_2015' date_
  FROM martie_09_2015
  
  ;
  
  
  