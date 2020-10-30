

         COMMIT;
         
         
            DELETE

            FROM USER_BANCU.REGISTRU_MD_19_05_2018;

-------------------------------------------------------------------------------
        DELETE
        FROM USER_BANCU.TABLE_OUT_TEST;




        CREATE TABLE USER_BANCU.TABLE_OUT_TEMP
        AS  

       SELECT *
       
        FROM CIS2.TABLE_OUT;  



INSERT INTO USER_BANCU.TABLE_OUT_TEST

(

  PERIOADA,
  FORM,
  FORM_VERS,
  ID_MDTABLE,
  COD_CUATM,
  NR_SECTIE,
  NUME_SECTIE,
  NR_SECTIE1,
  NUME_SECTIE1,
  NR_SECTIE2,    
  NUME_SECTIE2,
  NR_ROW,
  ORDINE,
  DECIMAL_POS,
  NUME_ROW,
  COL1,
  COL2,
  COL3,
  COL4,
  COL5,
  COL6,
  COL7,
  COL8,
  COL9,
  COL10,
  COL11,
  COL12,
  COL13,
  COL14,
  COL15,
  COL16,
  COL17,
  COL18,
  COL19,
  COL20,
  COL21,
  COL22,
  COL23,
  COL24,
  COL25,
  COL26,
  COL27,
  COL28,
  COL29,
  COL30,
  COL31,
  COL32,
  COL33,
  COL34,
  COL35,
  COL36,
  COL37,
  COL38,
  COL39,
  COL40,
  COL41,
  COL42,
  COL43,
  COL44,
  COL45,
  COL46,
  COL47,
  COL48,
  COL49,
  COL50,
  DATA_CREATE  
  )


  SELECT
  PERIOADA,
  FORM,
  FORM_VERS,
  ID_MDTABLE,
  COD_CUATM,
  NR_SECTIE,
  NUME_SECTIE,
  NR_SECTIE1,
  NUME_SECTIE1,
  NR_SECTIE2,    
  NUME_SECTIE2,
  NR_ROW,
  ORDINE,
  DECIMAL_POS,
  NUME_ROW,
  COL1,
  COL2,
  COL3,
  COL4,
  COL5,
  COL6,
  COL7,
  COL8,
  COL9,
  COL10,
  COL11,
  COL12,
  COL13,
  COL14,
  COL15,
  COL16,
  COL17,
  COL18,
  COL19,
  COL20,
  COL21,
  COL22,
  COL23,
  COL24,
  COL25,
  COL26,
  COL27,
  COL28,
  COL29,
  COL30,
  COL31,
  COL32,
  COL33,
  COL34,
  COL35,
  COL36,
  COL37,
  COL38,
  COL39,
  COL40,
  COL41,
  COL42,
  COL43,
  COL44,
  COL45,
  COL46,
  COL47,
  COL48,
  COL49,
  COL50,
  DATA_CREATE  
  
         FROM CIS2.TABLE_OUT;  
         
         
         
         SELECT COUNT (*) AS CNT
            
                  FROM CIS2.TABLE_OUT; 
                  
                  
          SELECT COUNT (*) AS CNT
            
                  FROM CIS2.DATA_ALL; 