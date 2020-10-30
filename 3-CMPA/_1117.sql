var from = "";

$(document).ready(function () {
    form = $("#formDenShort").val();
    fCMPA_TAB3();
});

$(function () {
    // OnKeyPress ```````````````````````````````````````````````````````````````````````````````
    $("input:not([type='button']):not([readonly]):not([disabled])").on("change", function (e) {
        fCMPA_TAB3();
    });
});

function fCMPA_TAB3() {

    var R0110_C1 = $("#62_1117_46322_0110_1");
    var R0110_C2 = $("#62_1117_46322_0110_2");
    var R0110_C3 = $("#62_1117_46322_0110_3");
    var R0110_C4 = $("#62_1117_46322_0110_4");
    var R0110_C5 = $("#62_1117_46322_0110_5");
    var R0110_C6 = $("#62_1117_46322_0110_6");
    var R0110_C7 = $("#62_1117_46322_0110_7");
    var R0110_C8 = $("#62_1117_46322_0110_8");
    var R0110_C9 = $("#62_1117_46322_0110_9");
    var R0110_C10 = $("#62_1117_46322_0110_10");
    var R0110_C11 = $("#62_1117_46322_0110_11");
    var R0110_C12 = $("#62_1117_46322_0110_12");
    var R0110_C13 = $("#62_1117_46322_0110_13");   



    var R0120_C1 = $("#62_1117_46323_0120_1");
    var R0120_C2 = $("#62_1117_46323_0120_2");
    var R0120_C3 = $("#62_1117_46323_0120_3");
    var R0120_C4 = $("#62_1117_46323_0120_4");
    var R0120_C5 = $("#62_1117_46323_0120_5");
    var R0120_C6 = $("#62_1117_46323_0120_6");
    var R0120_C7 = $("#62_1117_46323_0120_7");
    var R0120_C8 = $("#62_1117_46323_0120_8");
    var R0120_C9 = $("#62_1117_46323_0120_9");
    var R0120_C10 = $("#62_1117_46323_0120_10");
    var R0120_C11 = $("#62_1117_46323_0120_11");
    var R0120_C12 = $("#62_1117_46323_0120_12");
    var R0120_C13 = $("#62_1117_46323_0120_13");   




    var R0131_C1 = $("#62_1117_46324_0131_1");
    var R0131_C2 = $("#62_1117_46324_0131_2");
    var R0131_C3 = $("#62_1117_46324_0131_3");
    var R0131_C4 = $("#62_1117_46324_0131_4");
    var R0131_C5 = $("#62_1117_46324_0131_5");
    var R0131_C6 = $("#62_1117_46324_0131_6");
    var R0131_C7 = $("#62_1117_46324_0131_7");
    var R0131_C8 = $("#62_1117_46324_0131_8");
    var R0131_C9 = $("#62_1117_46324_0131_9");
    var R0131_C10 = $("#62_1117_46324_0131_10");
    var R0131_C11 = $("#62_1117_46324_0131_11");
    var R0131_C12 = $("#62_1117_46324_0131_12");
    var R0131_C13 = $("#62_1117_46324_0131_13");   


 
    var R0145_C1 = $("#62_1117_46325_0145_1");
    var R0145_C2 = $("#62_1117_46325_0145_2");
    var R0145_C3 = $("#62_1117_46325_0145_3");
    var R0145_C4 = $("#62_1117_46325_0145_4");
    var R0145_C5 = $("#62_1117_46325_0145_5");
    var R0145_C6 = $("#62_1117_46325_0145_6");
    var R0145_C7 = $("#62_1117_46325_0145_7");
    var R0145_C8 = $("#62_1117_46325_0145_8");
    var R0145_C9 = $("#62_1117_46325_0145_9");
    var R0145_C10 = $("#62_1117_46325_0145_10");
    var R0145_C11 = $("#62_1117_46325_0145_11");
    var R0145_C12 = $("#62_1117_46325_0145_12");
    var R0145_C13 = $("#62_1117_46325_0145_13");   



    var R0160_C1 = $("#62_1117_46326_0160_1");
    var R0160_C2 = $("#62_1117_46326_0160_2");
    var R0160_C3 = $("#62_1117_46326_0160_3");
    var R0160_C4 = $("#62_1117_46326_0160_4");
    var R0160_C5 = $("#62_1117_46326_0160_5");
    var R0160_C6 = $("#62_1117_46326_0160_6");
    var R0160_C7 = $("#62_1117_46326_0160_7");
    var R0160_C8 = $("#62_1117_46326_0160_8");
    var R0160_C9 = $("#62_1117_46326_0160_9");
    var R0160_C10 = $("#62_1117_46326_0160_10");
    var R0160_C11 = $("#62_1117_46326_0160_11");
    var R0160_C12 = $("#62_1117_46326_0160_12");
    var R0160_C13 = $("#62_1117_46326_0160_13");   



    var R0210_C1 = $("#62_1117_46327_0210_1");
    var R0210_C2 = $("#62_1117_46327_0210_2");
    var R0210_C3 = $("#62_1117_46327_0210_3");
    var R0210_C4 = $("#62_1117_46327_0210_4");
    var R0210_C5 = $("#62_1117_46327_0210_5");
    var R0210_C6 = $("#62_1117_46327_0210_6");
    var R0210_C7 = $("#62_1117_46327_0210_7");
    var R0210_C8 = $("#62_1117_46327_0210_8");
    var R0210_C9 = $("#62_1117_46327_0210_9");
    var R0210_C10 = $("#62_1117_46327_0210_10");
    var R0210_C11 = $("#62_1117_46327_0210_11");
    var R0210_C12 = $("#62_1117_46327_0210_12");
    var R0210_C13 = $("#62_1117_46327_0210_13");   

    var R2510_C1 = $("#62_1117_46328_2510_1");
    var R2510_C2 = $("#62_1117_46328_2510_2");
    var R2510_C3 = $("#62_1117_46328_2510_3");
    var R2510_C4 = $("#62_1117_46328_2510_4");
    var R2510_C5 = $("#62_1117_46328_2510_5");
    var R2510_C6 = $("#62_1117_46328_2510_6");
    var R2510_C7 = $("#62_1117_46328_2510_7");
    var R2510_C8 = $("#62_1117_46328_2510_8");
    var R2510_C9 = $("#62_1117_46328_2510_9");
    var R2510_C10 = $("#62_1117_46328_2510_10");
    var R2510_C11 = $("#62_1117_46328_2510_11");
    var R2510_C12 = $("#62_1117_46328_2510_12");
    var R2510_C13 = $("#62_1117_46328_2510_13");   



    var R2520_C1 = $("#62_1117_46329_2520_1");
    var R2520_C2 = $("#62_1117_46329_2520_2");
    var R2520_C3 = $("#62_1117_46329_2520_3");
    var R2520_C4 = $("#62_1117_46329_2520_4");
    var R2520_C5 = $("#62_1117_46329_2520_5");
    var R2520_C6 = $("#62_1117_46329_2520_6");
    var R2520_C7 = $("#62_1117_46329_2520_7");
    var R2520_C8 = $("#62_1117_46329_2520_8");
    var R2520_C9 = $("#62_1117_46329_2520_9");
    var R2520_C10 = $("#62_1117_46329_2520_10");
    var R2520_C11 = $("#62_1117_46329_2520_11");
    var R2520_C12 = $("#62_1117_46329_2520_12");
    var R2520_C13 = $("#62_1117_46329_2520_13");   

    
    var R0240_C1 = $("#62_1117_46330_0240_1");
    var R0240_C2 = $("#62_1117_46330_0240_2");
    var R0240_C3 = $("#62_1117_46330_0240_3");
    var R0240_C4 = $("#62_1117_46330_0240_4");
    var R0240_C5 = $("#62_1117_46330_0240_5");
    var R0240_C6 = $("#62_1117_46330_0240_6");
    var R0240_C7 = $("#62_1117_46330_0240_7");
    var R0240_C8 = $("#62_1117_46330_0240_8");
    var R0240_C9 = $("#62_1117_46330_0240_9");
    var R0240_C10 = $("#62_1117_46330_0240_10");
    var R0240_C11 = $("#62_1117_46330_0240_11");
    var R0240_C12 = $("#62_1117_46330_0240_12");
    var R0240_C13 = $("#62_1117_46330_0240_13");   


    var R0300_C1 = $("#62_1117_46331_0300_1");
    var R0300_C2 = $("#62_1117_46331_0300_2");
    var R0300_C3 = $("#62_1117_46331_0300_3");
    var R0300_C4 = $("#62_1117_46331_0300_4");
    var R0300_C5 = $("#62_1117_46331_0300_5");
    var R0300_C6 = $("#62_1117_46331_0300_6");
    var R0300_C7 = $("#62_1117_46331_0300_7");
    var R0300_C8 = $("#62_1117_46331_0300_8");
    var R0300_C9 = $("#62_1117_46331_0300_9");
    var R0300_C10 = $("#62_1117_46331_0300_10");
    var R0300_C11 = $("#62_1117_46331_0300_11");
    var R0300_C12 = $("#62_1117_46331_0300_12");
    var R0300_C13 = $("#62_1117_46331_0300_13");
    
    
    
    var R0400_C1 = $("#62_1117_46332_0400_1");
    var R0400_C2 = $("#62_1117_46332_0400_2");
    var R0400_C3 = $("#62_1117_46332_0400_3");
    var R0400_C4 = $("#62_1117_46332_0400_4");
    var R0400_C5 = $("#62_1117_46332_0400_5");
    var R0400_C6 = $("#62_1117_46332_0400_6");
    var R0400_C7 = $("#62_1117_46332_0400_7");
    var R0400_C8 = $("#62_1117_46332_0400_8");
    var R0400_C9 = $("#62_1117_46332_0400_9");
    var R0400_C10 = $("#62_1117_46332_0400_10");
    var R0400_C11 = $("#62_1117_46332_0400_11");
    var R0400_C12 = $("#62_1117_46332_0400_12");
    var R0400_C13 = $("#62_1117_46332_0400_13");
    
    
    
     
    var R1600_C1 = $("#62_1117_46333_1600_1");
    var R1600_C2 = $("#62_1117_46333_1600_2");
    var R1600_C3 = $("#62_1117_46333_1600_3");
    var R1600_C4 = $("#62_1117_46333_1600_4");
    var R1600_C5 = $("#62_1117_46333_1600_5");
    var R1600_C6 = $("#62_1117_46333_1600_6");
    var R1600_C7 = $("#62_1117_46333_1600_7");
    var R1600_C8 = $("#62_1117_46333_1600_8");
    var R1600_C9 = $("#62_1117_46333_1600_9");
    var R1600_C10 = $("#62_1117_46333_1600_10");
    var R1600_C11 = $("#62_1117_46333_1600_11");
    var R1600_C12 = $("#62_1117_46333_1600_12");
    var R1600_C13 = $("#62_1117_46333_1600_13");
    
    
    var R0700_C1 = $("#62_1117_46334_0700_1");
    var R0700_C2 = $("#62_1117_46334_0700_2");
    var R0700_C3 = $("#62_1117_46334_0700_3");
    var R0700_C4 = $("#62_1117_46334_0700_4");
    var R0700_C5 = $("#62_1117_46334_0700_5");
    var R0700_C6 = $("#62_1117_46334_0700_6");
    var R0700_C7 = $("#62_1117_46334_0700_7");
    var R0700_C8 = $("#62_1117_46334_0700_8");
    var R0700_C9 = $("#62_1117_46334_0700_9");
    var R0700_C10 = $("#62_1117_46334_0700_10");
    var R0700_C11 = $("#62_1117_46334_0700_11");
    var R0700_C12 = $("#62_1117_46334_0700_12");
    var R0700_C13 = $("#62_1117_46334_0700_13");
    
	
	var R1700_C1 = $("#62_1117_46335_1700_1");
    var R1700_C2 = $("#62_1117_46335_1700_2");
    var R1700_C3 = $("#62_1117_46335_1700_3");
    var R1700_C4 = $("#62_1117_46335_1700_4");
    var R1700_C5 = $("#62_1117_46335_1700_5");
    var R1700_C6 = $("#62_1117_46335_1700_6");
    var R1700_C7 = $("#62_1117_46335_1700_7");
    var R1700_C8 = $("#62_1117_46335_1700_8");
    var R1700_C9 = $("#62_1117_46335_1700_9");
    var R1700_C10 = $("#62_1117_46335_1700_10");
    var R1700_C11 = $("#62_1117_46335_1700_11");
    var R1700_C12 = $("#62_1117_46335_1700_12");
    var R1700_C13 = $("#62_1117_46335_1700_13");
    
   
    var R1800_C1 = $("#62_1117_46336_1800_1");
    var R1800_C2 = $("#62_1117_46336_1800_2");
    var R1800_C3 = $("#62_1117_46336_1800_3");
    var R1800_C4 = $("#62_1117_46336_1800_4");
    var R1800_C5 = $("#62_1117_46336_1800_5");
    var R1800_C6 = $("#62_1117_46336_1800_6");
    var R1800_C7 = $("#62_1117_46336_1800_7");
    var R1800_C8 = $("#62_1117_46336_1800_8");
    var R1800_C9 = $("#62_1117_46336_1800_9");
    var R1800_C10 = $("#62_1117_46336_1800_10");
    var R1800_C11 = $("#62_1117_46336_1800_11");
    var R1800_C12 = $("#62_1117_46336_1800_12");
    var R1800_C13 = $("#62_1117_46336_1800_13");
    
	
    var R1900_C1 = $("#62_1117_46337_1900_1");
    var R1900_C2 = $("#62_1117_46337_1900_2");
    var R1900_C3 = $("#62_1117_46337_1900_3");
    var R1900_C4 = $("#62_1117_46337_1900_4");
    var R1900_C5 = $("#62_1117_46337_1900_5");
    var R1900_C6 = $("#62_1117_46337_1900_6");
    var R1900_C7 = $("#62_1117_46337_1900_7");
    var R1900_C8 = $("#62_1117_46337_1900_8");
    var R1900_C9 = $("#62_1117_46337_1900_9");
    var R1900_C10 = $("#62_1117_46337_1900_10");
    var R1900_C11 = $("#62_1117_46337_1900_11");
    var R1900_C12 = $("#62_1117_46337_1900_12");
    var R1900_C13 = $("#62_1117_46337_1900_13");
    

    var R2000_C1 = $("#62_1117_46338_2000_1");
    var R2000_C2 = $("#62_1117_46338_2000_2");
    var R2000_C3 = $("#62_1117_46338_2000_3");
    var R2000_C4 = $("#62_1117_46338_2000_4");
    var R2000_C5 = $("#62_1117_46338_2000_5");
    var R2000_C6 = $("#62_1117_46338_2000_6");
    var R2000_C7 = $("#62_1117_46338_2000_7");
    var R2000_C8 = $("#62_1117_46338_2000_8");
    var R2000_C9 = $("#62_1117_46338_2000_9");
    var R2000_C10 = $("#62_1117_46338_2000_10");
    var R2000_C11 = $("#62_1117_46338_2000_11");
    var R2000_C12 = $("#62_1117_46338_2000_12");
    var R2000_C13 = $("#62_1117_46338_2000_13");
    

    var R2310_C1 = $("#62_1117_46340_2310_1");
    var R2310_C2 = $("#62_1117_46340_2310_2");
    var R2310_C3 = $("#62_1117_46340_2310_3");
    var R2310_C4 = $("#62_1117_46340_2310_4");
    var R2310_C5 = $("#62_1117_46340_2310_5");
    var R2310_C6 = $("#62_1117_46340_2310_6");
    var R2310_C7 = $("#62_1117_46340_2310_7");
    var R2310_C8 = $("#62_1117_46340_2310_8");
    var R2310_C9 = $("#62_1117_46340_2310_9");
    var R2310_C10 = $("#62_1117_46340_2310_10");
    var R2310_C11 = $("#62_1117_46340_2310_11");
    var R2310_C12 = $("#62_1117_46340_2310_12");
    var R2310_C13 = $("#62_1117_46340_2310_13");


    var R2100_C1 = $("#62_1117_46339_2100_1");
    var R2100_C2 = $("#62_1117_46339_2100_2");
    var R2100_C3 = $("#62_1117_46339_2100_3");
    var R2100_C4 = $("#62_1117_46339_2100_4");
    var R2100_C5 = $("#62_1117_46339_2100_5");
    var R2100_C6 = $("#62_1117_46339_2100_6");
    var R2100_C7 = $("#62_1117_46339_2100_7");
    var R2100_C8 = $("#62_1117_46339_2100_8");
    var R2100_C9 = $("#62_1117_46339_2100_9");
    var R2100_C10 = $("#62_1117_46339_2100_10");
    var R2100_C11 = $("#62_1117_46339_2100_11");
    var R2100_C12 = $("#62_1117_46339_2100_12");
    var R2100_C13 = $("#62_1117_46339_2100_13");


    var R2320_C1 = $("#62_1117_46344_2320_1");
    var R2320_C2 = $("#62_1117_46344_2320_2");
    var R2320_C3 = $("#62_1117_46344_2320_3");
    var R2320_C4 = $("#62_1117_46344_2320_4");
    var R2320_C5 = $("#62_1117_46344_2320_5");
    var R2320_C6 = $("#62_1117_46344_2320_6");
    var R2320_C7 = $("#62_1117_46344_2320_7");
    var R2320_C8 = $("#62_1117_46344_2320_8");
    var R2320_C9 = $("#62_1117_46344_2320_9");
    var R2320_C10 = $("#62_1117_46344_2320_10");
    var R2320_C11 = $("#62_1117_46344_2320_11");
    var R2320_C12 = $("#62_1117_46344_2320_12");
    var R2320_C13 = $("#62_1117_46344_2320_13");


    var R2400_C1 = $("#62_1117_46341_2400_1");
    var R2400_C2 = $("#62_1117_46341_2400_2");
    var R2400_C3 = $("#62_1117_46341_2400_3");
    var R2400_C4 = $("#62_1117_46341_2400_4");
    var R2400_C5 = $("#62_1117_46341_2400_5");
    var R2400_C6 = $("#62_1117_46341_2400_6");
    var R2400_C7 = $("#62_1117_46341_2400_7");
    var R2400_C8 = $("#62_1117_46341_2400_8");
    var R2400_C9 = $("#62_1117_46341_2400_9");
    var R2400_C10 = $("#62_1117_46341_2400_10");
    var R2400_C11 = $("#62_1117_46341_2400_11");
    var R2400_C12 = $("#62_1117_46341_2400_12");
    var R2400_C13 = $("#62_1117_46341_2400_13");

    var R4230_C1 = $("#62_1117_46342_4230_1");
    var R4230_C2 = $("#62_1117_46342_4230_2");
    var R4230_C3 = $("#62_1117_46342_4230_3");
    var R4230_C4 = $("#62_1117_46342_4230_4");
    var R4230_C5 = $("#62_1117_46342_4230_5");
    var R4230_C6 = $("#62_1117_46342_4230_6");
    var R4230_C7 = $("#62_1117_46342_4230_7");
    var R4230_C8 = $("#62_1117_46342_4230_8");
    var R4230_C9 = $("#62_1117_46342_4230_9");
    var R4230_C10 = $("#62_1117_46342_4230_10");
    var R4230_C11 = $("#62_1117_46342_4230_11");
    var R4230_C12 = $("#62_1117_46342_4230_12");
    var R4230_C13 = $("#62_1117_46342_4230_13");


    var R4240_C1 = $("#62_1117_46343_4240_1");
    var R4240_C2 = $("#62_1117_46343_4240_2");
    var R4240_C3 = $("#62_1117_46343_4240_3");
    var R4240_C4 = $("#62_1117_46343_4240_4");
    var R4240_C5 = $("#62_1117_46343_4240_5");
    var R4240_C6 = $("#62_1117_46343_4240_6");
    var R4240_C7 = $("#62_1117_46343_4240_7");
    var R4240_C8 = $("#62_1117_46343_4240_8");
    var R4240_C9 = $("#62_1117_46343_4240_9");
    var R4240_C10 = $("#62_1117_46343_4240_10");
    var R4240_C11 = $("#62_1117_46343_4240_11");
    var R4240_C12 = $("#62_1117_46343_4240_12");
    var R4240_C13 = $("#62_1117_46343_4240_13");


    var R5120_C1 = $("#62_1117_46321_5120_1");
    var R5120_C2 = $("#62_1117_46321_5120_2");
    var R5120_C3 = $("#62_1117_46321_5120_3");
    var R5120_C4 = $("#62_1117_46321_5120_4");
    var R5120_C5 = $("#62_1117_46321_5120_5");
    var R5120_C6 = $("#62_1117_46321_5120_6");
    var R5120_C7 = $("#62_1117_46321_5120_7");
    var R5120_C8 = $("#62_1117_46321_5120_8");
    var R5120_C9 = $("#62_1117_46321_5120_9");
    var R5120_C10 = $("#62_1117_46321_5120_10");
    var R5120_C11 = $("#62_1117_46321_5120_11");
    var R5120_C12 = $("#62_1117_46321_5120_12");
    var R5120_C13 = $("#62_1117_46321_5120_13");
    
  R0110_C13.prop("readonly", true);
  R0120_C13.prop("readonly", true);
  R0131_C13.prop("readonly", true);
  R0145_C13.prop("readonly", true);
  R0160_C13.prop("readonly", true);
  R0210_C13.prop("readonly", true);
  R2510_C13.prop("readonly", true);
  R2520_C13.prop("readonly", true);
  R0240_C13.prop("readonly", true);
  R0240_C13.prop("readonly", true);
  R0300_C13.prop("readonly", true);
  R0400_C13.prop("readonly", true);
  R1600_C13.prop("readonly", true);
  R0700_C13.prop("readonly", true);
  R1700_C13.prop("readonly", true);
  R1800_C13.prop("readonly", true);
  R1900_C13.prop("readonly", true);
  R2000_C13.prop("readonly", true);
  R2100_C13.prop("readonly", true);
  R2310_C13.prop("readonly", true);
  R2320_C13.prop("readonly", true);
  R2400_C13.prop("readonly", true);
  R4230_C13.prop("readonly", true);
  R4240_C13.prop("readonly", true);
  R5120_C13.prop("readonly", true);


R5120_C13.val(Number(    parseFloat(Number(R5120_C1.val())) + 
                         parseFloat(Number(R5120_C2.val())) + 
                         parseFloat(Number(R5120_C3.val())) + 
                         parseFloat(Number(R5120_C4.val())) + 
                         parseFloat(Number(R5120_C5.val())) -
                         parseFloat(Number(R5120_C6.val())) -  
                       //  parseFloat(Number(R5120_C7.val())) -  
                         parseFloat(Number(R5120_C8.val())) -
                         parseFloat(Number(R5120_C9.val())) -
                         parseFloat(Number(R5120_C10.val())) -  
                         parseFloat(Number(R5120_C11.val())) -
                         parseFloat(Number(R5120_C12.val())) 
                        
                        
                       ).toFixed(3)); 

R4240_C13.val(Number(    parseFloat(Number(R4240_C1.val())) + 
                         parseFloat(Number(R4240_C2.val())) + 
                         parseFloat(Number(R4240_C3.val())) + 
                         parseFloat(Number(R4240_C4.val())) + 
                         parseFloat(Number(R4240_C5.val())) -
                         parseFloat(Number(R4240_C6.val())) -  
                       //  parseFloat(Number(R4240_C7.val())) -  
                       //  parseFloat(Number(R4240_C8.val())) -
                         parseFloat(Number(R4240_C9.val())) -
                       //  parseFloat(Number(R4240_C10.val())) -  
                         parseFloat(Number(R4240_C11.val())) -
                         parseFloat(Number(R4240_C12.val())) 
                        
                        
                       ).toFixed(3)); 


R4230_C13.val(Number(    parseFloat(Number(R4230_C1.val())) + 
                         parseFloat(Number(R4230_C2.val())) + 
                         parseFloat(Number(R4230_C3.val())) + 
                         parseFloat(Number(R4230_C4.val())) + 
                         parseFloat(Number(R4230_C5.val())) -
                         parseFloat(Number(R4230_C6.val())) -  
                       //  parseFloat(Number(R4230_C7.val())) -  
                       //  parseFloat(Number(R4230_C8.val())) -
                         parseFloat(Number(R4230_C9.val())) -
                       //  parseFloat(Number(R4230_C10.val())) -  
                         parseFloat(Number(R4230_C11.val())) -
                         parseFloat(Number(R4230_C12.val())) 
                        
                        
                       ).toFixed(3)); 




R2400_C13.val(Number(    parseFloat(Number(R2400_C1.val())) + 
                         parseFloat(Number(R2400_C2.val())) + 
                         parseFloat(Number(R2400_C3.val())) + 
                         parseFloat(Number(R2400_C4.val())) + 
                         parseFloat(Number(R2400_C5.val())) -
                         parseFloat(Number(R2400_C6.val())) -  
                         parseFloat(Number(R2400_C7.val())) -  
                         parseFloat(Number(R2400_C8.val())) -
                         parseFloat(Number(R2400_C9.val())) -
                         parseFloat(Number(R2400_C10.val())) -  
                         parseFloat(Number(R2400_C11.val())) -
                         parseFloat(Number(R2400_C12.val())) 
                        
                        
                       ).toFixed(3)); 


R2320_C13.val(Number(    parseFloat(Number(R2320_C1.val())) + 
                         parseFloat(Number(R2320_C2.val())) + 
                         parseFloat(Number(R2320_C3.val())) + 
                         parseFloat(Number(R2320_C4.val())) + 
                         parseFloat(Number(R2320_C5.val())) -
                         parseFloat(Number(R2320_C6.val())) -  
                       //  parseFloat(Number(R2320_C7.val())) -  
                         parseFloat(Number(R2320_C8.val())) -
                         parseFloat(Number(R2320_C9.val())) -
                         parseFloat(Number(R2320_C10.val())) -  
                         parseFloat(Number(R2320_C11.val())) -
                         parseFloat(Number(R2320_C12.val())) 
                        
                        
                       ).toFixed(3)); 

R2310_C13.val(Number(    parseFloat(Number(R2310_C1.val())) + 
                         parseFloat(Number(R2310_C2.val())) + 
                         parseFloat(Number(R2310_C3.val())) + 
                         parseFloat(Number(R2310_C4.val())) + 
                         parseFloat(Number(R2310_C5.val())) -
                         parseFloat(Number(R2310_C6.val())) -  
                       //  parseFloat(Number(R2310_C7.val())) -  
                         parseFloat(Number(R2310_C8.val())) -
                         parseFloat(Number(R2310_C9.val())) -
                         parseFloat(Number(R2310_C10.val())) -  
                         parseFloat(Number(R2310_C11.val())) -
                         parseFloat(Number(R2310_C12.val())) 
                        
                        
                       ).toFixed(3)); 

R2100_C13.val(Number(    parseFloat(Number(R2100_C1.val())) + 
                         parseFloat(Number(R2100_C2.val())) + 
                         parseFloat(Number(R2100_C3.val())) + 
                         parseFloat(Number(R2100_C4.val())) + 
                         parseFloat(Number(R2100_C5.val())) -
                         parseFloat(Number(R2100_C6.val())) -  
                       //  parseFloat(Number(R2100_C7.val())) -  
                       //  parseFloat(Number(R2100_C8.val())) -
                         parseFloat(Number(R2100_C9.val())) -
                         parseFloat(Number(R2100_C10.val())) -  
                         parseFloat(Number(R2100_C11.val())) -
                         parseFloat(Number(R2100_C12.val())) 
                        
                        
                       ).toFixed(3)); 

R2000_C13.val(Number(    parseFloat(Number(R2000_C1.val())) + 
                         parseFloat(Number(R2000_C2.val())) + 
                         parseFloat(Number(R2000_C3.val())) + 
                         parseFloat(Number(R2000_C4.val())) + 
                         parseFloat(Number(R2000_C5.val())) -
                         parseFloat(Number(R2000_C6.val())) -  
                       //  parseFloat(Number(R2000_C7.val())) -  
                       //  parseFloat(Number(R2000_C8.val())) -
                         parseFloat(Number(R2000_C9.val())) -
                         parseFloat(Number(R2000_C10.val())) -  
                         parseFloat(Number(R2000_C11.val())) -
                         parseFloat(Number(R2000_C12.val())) 
                        
                        
                       ).toFixed(3)); 

R1900_C13.val(Number(    parseFloat(Number(R1900_C1.val())) + 
                         parseFloat(Number(R1900_C2.val())) + 
                         parseFloat(Number(R1900_C3.val())) + 
                         parseFloat(Number(R1900_C4.val())) + 
                         parseFloat(Number(R1900_C5.val())) -
                         parseFloat(Number(R1900_C6.val())) -  
                       //  parseFloat(Number(R1900_C7.val())) -  
                       //  parseFloat(Number(R1900_C8.val())) -
                         parseFloat(Number(R1900_C9.val())) -
                         parseFloat(Number(R1900_C10.val())) -  
                         parseFloat(Number(R1900_C11.val())) -
                         parseFloat(Number(R1900_C12.val())) 
                        
                        
                       ).toFixed(3));  

  
   R1800_C13.val(Number( //parseFloat(Number(R1800_C1.val())) + 
                         parseFloat(Number(R1800_C2.val())) + 
                         parseFloat(Number(R1800_C3.val())) + 
                         parseFloat(Number(R1800_C4.val())) + 
                         parseFloat(Number(R1800_C5.val())) -
                         parseFloat(Number(R1800_C6.val())) -  
                       //  parseFloat(Number(R1800_C7.val())) -  
                         parseFloat(Number(R1800_C8.val())) -
                         parseFloat(Number(R1800_C9.val())) -
                         parseFloat(Number(R1800_C10.val())) -  
                         parseFloat(Number(R1800_C11.val())) -
                         parseFloat(Number(R1800_C12.val())) 
                        
                        
                       ).toFixed(3));  
  
  R1700_C13.val(Number( parseFloat(Number(R1700_C1.val())) + 
                         parseFloat(Number(R1700_C2.val())) + 
                         parseFloat(Number(R1700_C3.val())) + 
                         parseFloat(Number(R1700_C4.val())) + 
                         parseFloat(Number(R1700_C5.val())) -
                         parseFloat(Number(R1700_C6.val())) -  
                       //  parseFloat(Number(R1700_C7.val())) -  
                         parseFloat(Number(R1700_C8.val())) -
                         parseFloat(Number(R1700_C9.val())) -
                         parseFloat(Number(R1700_C10.val())) -  
                         parseFloat(Number(R1700_C11.val())) -
                         parseFloat(Number(R1700_C12.val())) 
                        
                        
                       ).toFixed(3));  
  

  
    R0700_C13.val(Number( parseFloat(Number(R0700_C1.val())) + 
                         parseFloat(Number(R0700_C2.val())) + 
                         parseFloat(Number(R0700_C3.val())) + 
                         parseFloat(Number(R0700_C4.val())) + 
                         parseFloat(Number(R0700_C5.val())) -
                         parseFloat(Number(R0700_C6.val())) -  
                       //  parseFloat(Number(R0700_C7.val())) -  
                         parseFloat(Number(R0700_C8.val())) -
                         parseFloat(Number(R0700_C9.val())) -
                         parseFloat(Number(R0700_C10.val())) -  
                         parseFloat(Number(R0700_C11.val())) -
                         parseFloat(Number(R0700_C12.val())) 
                        
                        
                       ).toFixed(3));  
  
  
   R1600_C13.val(Number( parseFloat(Number(R1600_C1.val())) + 
                         parseFloat(Number(R1600_C2.val())) + 
                         parseFloat(Number(R1600_C3.val())) + 
                         parseFloat(Number(R1600_C4.val())) + 
                         parseFloat(Number(R1600_C5.val())) -
                         parseFloat(Number(R1600_C6.val())) -  
                       //  parseFloat(Number(R1600_C7.val())) -  
                         parseFloat(Number(R1600_C8.val())) -
                         parseFloat(Number(R1600_C9.val())) -
                         parseFloat(Number(R1600_C10.val())) -  
                         parseFloat(Number(R1600_C11.val())) -
                         parseFloat(Number(R1600_C12.val())) 
                        
                        
                       ).toFixed(3));  
  

  
  
    R0400_C13.val(Number( parseFloat(Number(R0400_C1.val())) + 
                        parseFloat(Number(R0400_C2.val())) + 
                        parseFloat(Number(R0400_C3.val())) + 
                        parseFloat(Number(R0400_C4.val())) + 
                        parseFloat(Number(R0400_C5.val())) -
                        parseFloat(Number(R0400_C6.val())) -  
                        parseFloat(Number(R0400_C7.val())) -  
                        parseFloat(Number(R0400_C8.val())) -
                        parseFloat(Number(R0400_C9.val())) -
                        parseFloat(Number(R0400_C10.val())) -  
                        parseFloat(Number(R0400_C11.val())) -
                        parseFloat(Number(R0400_C12.val())) 
                        
                        
                       ).toFixed(3));  
  
   R0300_C13.val(Number( parseFloat(Number(R0300_C1.val())) + 
                        parseFloat(Number(R0300_C2.val())) + 
                        parseFloat(Number(R0300_C3.val())) + 
                        parseFloat(Number(R0300_C4.val())) + 
                        parseFloat(Number(R0300_C5.val())) -
                        parseFloat(Number(R0300_C6.val())) -  
                        parseFloat(Number(R0300_C7.val())) -  
                        parseFloat(Number(R0300_C8.val())) -
                        parseFloat(Number(R0300_C9.val())) -
                        parseFloat(Number(R0300_C10.val())) -  
                        parseFloat(Number(R0300_C11.val())) -
                        parseFloat(Number(R0300_C12.val())) 
                        
                        
                       ).toFixed(3));  
                       
  
  

  R0110_C13.val(Number( parseFloat(Number(R0110_C1.val())) + 
                        parseFloat(Number(R0110_C2.val())) + 
                        parseFloat(Number(R0110_C3.val())) + 
                        parseFloat(Number(R0110_C4.val())) + 
                        parseFloat(Number(R0110_C5.val())) -
                        parseFloat(Number(R0110_C6.val())) -  
                        parseFloat(Number(R0110_C7.val())) -  
                        parseFloat(Number(R0110_C8.val())) -
                        parseFloat(Number(R0110_C9.val())) - 
                         
                        parseFloat(Number(R0110_C11.val())) -
                        parseFloat(Number(R0110_C12.val())) 
                        
                        
                       ).toFixed(3));      
                       
                       
  
                
 R0120_C13.val(Number( parseFloat(Number(R0120_C1.val())) + 
                        parseFloat(Number(R0120_C2.val())) + 
                        parseFloat(Number(R0120_C3.val())) + 
                        parseFloat(Number(R0120_C4.val())) + 
                        parseFloat(Number(R0120_C5.val())) -
                        parseFloat(Number(R0120_C6.val())) -  
                        parseFloat(Number(R0120_C7.val())) -  
                        parseFloat(Number(R0120_C8.val())) -
                        parseFloat(Number(R0120_C9.val())) -
                        parseFloat(Number(R0120_C10.val())) -  
                        parseFloat(Number(R0120_C11.val())) -
                        parseFloat(Number(R0120_C12.val())) 
                        
                        
                       ).toFixed(3));  
                       
                       
                       
  R0131_C13.val(Number( parseFloat(Number(R0131_C1.val())) + 
                        parseFloat(Number(R0131_C2.val())) + 
                        parseFloat(Number(R0131_C3.val())) + 
                        parseFloat(Number(R0131_C4.val())) + 
                        parseFloat(Number(R0131_C5.val())) -
                        parseFloat(Number(R0131_C6.val())) -  
                        parseFloat(Number(R0131_C7.val())) -  
                        parseFloat(Number(R0131_C8.val())) -
                        parseFloat(Number(R0131_C9.val())) - 
                         
                        parseFloat(Number(R0131_C11.val())) -
                        parseFloat(Number(R0131_C12.val())) 
                        
                        
                       ).toFixed(3));                   

      

 R0145_C13.val(Number( parseFloat(Number(R0145_C1.val())) + 
                        parseFloat(Number(R0145_C2.val())) + 
                        parseFloat(Number(R0145_C3.val())) + 
                        parseFloat(Number(R0145_C4.val())) + 
                        parseFloat(Number(R0145_C5.val())) -
                        parseFloat(Number(R0145_C6.val())) -  
                        parseFloat(Number(R0145_C7.val())) -  
                        parseFloat(Number(R0145_C8.val())) -
                      //  parseFloat(Number(R0145_C9.val())) -
                        parseFloat(Number(R0145_C10.val())) -  
                        parseFloat(Number(R0145_C11.val())) -
                        parseFloat(Number(R0145_C12.val())) 
                        
                        
                       ).toFixed(3));         



  
 R0160_C13.val(Number( parseFloat(Number(R0160_C1.val())) + 
                        parseFloat(Number(R0160_C2.val())) + 
                        parseFloat(Number(R0160_C3.val())) + 
                        parseFloat(Number(R0160_C4.val())) + 
                        parseFloat(Number(R0160_C5.val())) -
                        parseFloat(Number(R0160_C6.val())) -  
                        parseFloat(Number(R0160_C7.val())) -  
                        parseFloat(Number(R0160_C8.val())) -
                        parseFloat(Number(R0160_C9.val())) - 
                         
                        parseFloat(Number(R0160_C11.val())) -
                        parseFloat(Number(R0160_C12.val())) 
                        
                        
                       ).toFixed(3));      
                       



R0210_C13.val(Number(  parseFloat(Number(R0210_C1.val())) + 
                        parseFloat(Number(R0210_C2.val())) + 
                        parseFloat(Number(R0210_C3.val())) + 
                        parseFloat(Number(R0210_C4.val())) + 
                        parseFloat(Number(R0210_C5.val())) -
                        parseFloat(Number(R0210_C6.val())) -  
                        parseFloat(Number(R0210_C7.val())) -  
                        parseFloat(Number(R0210_C8.val())) -
                        parseFloat(Number(R0210_C9.val())) -
                        parseFloat(Number(R0210_C10.val())) -  
                        parseFloat(Number(R0210_C11.val())) -
                        parseFloat(Number(R0210_C12.val())) 
                        
                        
                       ).toFixed(3));  

      
         
         
         

R2510_C13.val(Number(  parseFloat(Number(R2510_C1.val())) + 
                        parseFloat(Number(R2510_C2.val())) + 
                        parseFloat(Number(R2510_C3.val())) + 
                        parseFloat(Number(R2510_C4.val())) + 
                        parseFloat(Number(R2510_C5.val())) -
                        parseFloat(Number(R2510_C6.val())) -  
                       // parseFloat(Number(R2510_C7.val())) -  
                        parseFloat(Number(R2510_C8.val())) -
                        parseFloat(Number(R2510_C9.val())) -
                        parseFloat(Number(R2510_C10.val())) -  
                        parseFloat(Number(R2510_C11.val())) -
                        parseFloat(Number(R2510_C12.val())) 
                        
                        
                       ).toFixed(3));         
         

R2520_C13.val(Number(  parseFloat(Number(R2520_C1.val())) + 
                        parseFloat(Number(R2520_C2.val())) + 
                        parseFloat(Number(R2520_C3.val())) + 
                        parseFloat(Number(R2520_C4.val())) + 
                        parseFloat(Number(R2520_C5.val())) -
                        parseFloat(Number(R2520_C6.val())) -  
                       // parseFloat(Number(R2520_C7.val())) -  
                        parseFloat(Number(R2520_C8.val())) -
                        parseFloat(Number(R2520_C9.val())) -
                        parseFloat(Number(R2520_C10.val())) -  
                        parseFloat(Number(R2520_C11.val())) -
                        parseFloat(Number(R2520_C12.val())) 
                        
                        
                       ).toFixed(3));         
         
R0240_C13.val(Number(  parseFloat(Number(R0240_C1.val())) + 
                        parseFloat(Number(R0240_C2.val())) + 
                        parseFloat(Number(R0240_C3.val())) + 
                        parseFloat(Number(R0240_C4.val())) + 
                        parseFloat(Number(R0240_C5.val())) -
                        parseFloat(Number(R0240_C6.val())) -  
                        parseFloat(Number(R0240_C7.val())) -  
                       // parseFloat(Number(R0240_C8.val())) -
                        parseFloat(Number(R0240_C9.val())) -
                        parseFloat(Number(R0240_C10.val())) -  
                        parseFloat(Number(R0240_C11.val())) -
                        parseFloat(Number(R0240_C12.val())) 
                        
                        
                       ).toFixed(3));    


         
         
         
}
