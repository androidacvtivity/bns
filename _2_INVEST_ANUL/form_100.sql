  SELECT DISTINCT
  COL1 
  
FROM 
  VW_DATA_ALL D
  
WHERE 
  D.FORM = 100 AND
  D.CUIIO = 2 AND
  D.PERIOADA IN :pPERIOADA AND
  D.CAPITOL = 330 AND
  D.RIND IN '01' 
  
  
  ) P;
  
  
--------------------------

               SELECT 
               
                    D.COL1  
                     
                     
                     FROM CIS2.DATA_ALL D
                
                       INNER JOIN CIS2.MD_RIND MR ON (MR.ID_MD=D.ID_MD)
                       INNER JOIN CIS2.RENIM RR ON (RR.CUIIO = D.CUIIO AND RR.CUIIO_VERS = D.CUIIO_VERS)
                    

                     WHERE 
                     D.FORM=100 AND
                     D.PERIOADA IN :pPERIOADA AND
                     MR.CAPITOL = 330 AND
                     MR.RIND IN '01'                 
                       