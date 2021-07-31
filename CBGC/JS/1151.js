var from = "";
var msgErr = "Nu ati introdus o valoare corecta in coloana.";

$(document).ready(function () {
    form = $("#formDenShort").val();
    fCBGC_Cap8();
});
$(function () {
    $("input:not([type='button']):not([disabled])").on("change", function (e) {
        fCBGC_Cap8();
    });
});

function fCBGC_Cap8() { 


    var R1_C1 = $("#68_1151_63191_1_1");
    var R1_C2 = $("#68_1151_63191_1_2");
    var R2_C1 = $("#68_1151_63192_2_1");
    var R2_C2 = $("#68_1151_63192_2_2");
    var R3_C1 = $("#68_1151_63193_3_1");
    var R3_C2 = $("#68_1151_63193_3_2");
    var R4_C1 = $("#68_1151_63194_4_1");
    var R4_C2 = $("#68_1151_63194_4_2");
    var R5_C1 = $("#68_1151_63195_5_1");
    var R5_C2 = $("#68_1151_63195_5_2");
    var R6_C1 = $("#68_1151_63196_6_1");
    var R6_C2 = $("#68_1151_63196_6_1");

 //var a = rows.length;
 //alert(a.val());

 
 if(R1_C1.val() == "2"){
    //----------clear input --------------------------
    
    eval(R1_C2.val(""));
     //----------readOnly input -----------------------
    eval(R1_C2.prop("readonly", true));
    }  
       else{
     eval(R1_C2.prop("readonly", false));
    }
      


 
    if(R2_C1.val() == "2"){
        //----------clear input --------------------------
        
        eval(R2_C2.val(""));
         //----------readOnly input -----------------------
        eval(R2_C2.prop("readonly", true));
        }  
           else{
         eval(R2_C2.prop("readonly", false));
        }



if(R1_C1.val() != "" && R1_C1.val() < 1 || R1_C1.val() > 2){R1_C1.val("");$.messager.alert("Eroare",msgErr + "1","error");}





}



