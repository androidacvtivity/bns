var from = "";
var msgErr = "Nu ati introdus o valoare corecta in coloana.";

$(document).ready(function () {
    form = $("#formDenShort").val();
    fCBGC_Cap5();
});
$(function () {
    $("input:not([type='button']):not([disabled])").on("change", function (e) {
        fCBGC_Cap5();
    });
});

function fCBGC_Cap5() { 


    var R1_C1 = $("#68_1150_63178_1_1");
    var R2_C1 = $("#68_1150_63179_2_1");
    var R3_C1 = $("#68_1150_63180_3_1");
    var R4_C1 = $("#68_1150_63181_4_1");
   
    var R5_1_C1 = $("#68_1150_63183_5.1_1");
    var R5_2_C1 = $("#68_1150_63184_5.2_1");
    var R5_3_C1 = $("#68_1150_63184_5.3_1");
    var R5_4_C1 = $("#68_1150_63184_5.4_1");
    var R6_1_C1 = $("#68_1150_63188_6.1_1");
    var R6_2_C1 = $("#68_1150_63188_6.2_1");
    var R6_3_C1 = $("#68_1150_63188_6.3_1");



    
    

 //var a = rows.length;
 //alert(a.val());

 




if(R1_C1.val() != "" && R1_C1.val() < 1 || R1_C1.val() > 5){R1_C1.val("");$.messager.alert("Eroare",msgErr + "1","error");}





}



