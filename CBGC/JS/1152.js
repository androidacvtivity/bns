var from = "";
var msgErr = "Nu ati introdus o valoare corecta in coloana.";

$(document).ready(function () {
    form = $("#formDenShort").val();
    fCBGC_Cap8_1();
});
$(function () {
    $("input:not([type='button']):not([disabled])").on("change", function (e) {
        fCBGC_Cap8_1();
    });
});

function fCBGC_Cap8_1() { 


    var Ra_C1 = $("#68_1152_63197_a_1");
    var Rb_C1 = $("#68_1152_63198_b_1");
    var R1_C1 = $("#68_1152_63199_1_1");
    var R1_C2 = $("#68_1152_63199_1_2");
    var R1_C3 = $("#68_1152_63199_1_3");
    var R1_C4 = $("#68_1152_63199_1_4");
    var R1_C5 = $("#68_1152_63199_1_5");
    var R1_C6 = $("#68_1152_63199_1_6");

    
    
  
 

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













}



