
CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_MAX_RENIM_M53
(
  CUIIO,        
  CUIIO_VERS,   
  DENUMIRE,     
  EDIT_USER,    
  STATUT,       
  CUATM,        
  CFP,          
  CFOJ,         
  CAEM,         
  COCM,         
  LANG,         
  SPEC,         
  TIP_INV,      
  TIP_INV_DEG,  
  TIP_LOCAL,    
  CUATM4,       
  CFP1,         
  AP_BUGET,     
  CAEM2 
)
AS
    SELECT
    
  R.CUIIO,        
  R.CUIIO_VERS,   
  R.DENUMIRE,     
  R.EDIT_USER,    
  R.STATUT,       
  R.CUATM,        
  R.CFP,          
  R.CFOJ,         
  R.CAEM,         
  R.COCM,         
  R.LANG,         
  R.SPEC,         
  R.TIP_INV,      
  R.TIP_INV_DEG,  
  R.TIP_LOCAL,    
  R.CUATM4,       
  R.CFP1,         
  R.AP_BUGET,     
  R.CAEM2        
      FROM M53.RENIM  R
           INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) AS CUIIO_VERS
                           FROM M53.RENIM
                       GROUP BY CUIIO) A
               ON (A.CUIIO = R.CUIIO AND A.CUIIO_VERS = R.CUIIO_VERS);
