--------------------------------------------------------------------------

--37604974
(
--There are data. 

SELECT *

   FROM USER_EREPORTING.DATA_ALL_PRIMIT
   
   WHERE
   
   CUIIO IN (37604974)
AND FORM IN (1)
AND PERIOADA IN (1035)
);
--There are data
SELECT *

  FROM CIS.FORM_CUIIO 
  
  WHERE    
   
   CUIIO IN (37604974)
AND FORM IN (1)
AND CUIIO_VERS IN (1035);


--But here There are not  data. 
SELECT *

   FROM CIS.DATA_ALL
   
   WHERE
   
   CUIIO IN (37604974)
AND FORM IN (1)
AND PERIOADA IN (1035)

--------------------------------------------------------------------------