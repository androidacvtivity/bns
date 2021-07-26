var from = "";
var msgErr = "Nu ati introdus o valoare corecta in rundul.";

$(document).ready(function () {
    form = $("#formDenShort").val();
    fCBGC_Cap2();
});
$(function () {
    $("input:not([type='button']):not([disabled])").on("change", function (e) {
        fCBGC_Cap2();
    });
});
function fCBGC_Cap2() {
    var R1_C1 = $("#68_1145_63120_1_1");
    var R2_C1 = $("#68_1145_63121_2_1");
    var R3_C1 = $("#68_1145_63122_3_1");
    var R4_C1 = $("#68_1145_63123_4_1");
    var R5_C1 = $("#68_1145_63124_5_1");
    var R6_C1 = $("#68_1145_63125_6_1"); 
    
    if(R1_C1.val() < 1 || R1_C1.val() > 2){$.messager.alert("Eroare",msgErr + "1","error");
    R1_C1.focus();}
    else{
        if(R1_C1.val() == "2"){
            //----------clear input --------------------------
            R2_C1.val("");
            R3_C1.val("");
            R4_C1.val("");
            //----------readOnly input -----------------------
            R2_C1.prop("readonly", true);
            R3_C1.prop("readonly", true);
            R4_C1.prop("readonly", true);
        }
        else{
            //----------readOnly input -----------------------
            R2_C1.prop("readonly", false);
            R3_C1.prop("readonly", false);
            R4_C1.prop("readonly", false);
        }
    }
    
    if(R2_C1.val() != "" && (R2_C1.val() < 1 || R2_C1.val() > 99999)){R2_C1.val("");$.messager.alert("Eroare",msgErr + "2","error");}
    if(R3_C1.val() != "" && (R3_C1.val() < 1 || R3_C1.val() > 99999)){R3_C1.val("");$.messager.alert("Eroare",msgErr + "3","error");}
    if(R4_C1.val() != "" && (R4_C1.val() < 1 || R4_C1.val() > 99999)){R4_C1.val("");$.messager.alert("Eroare",msgErr + "4","error");}
    if(R5_C1.val() != "" && (R5_C1.val() < 1 || R5_C1.val() > 2)){R5_C1.val("");$.messager.alert("Eroare",msgErr + "5","error");}
    if(R6_C1.val() != "" && (R6_C1.val() < 1 || R6_C1.val() > 2)){R6_C1.val("");$.messager.alert("Eroare",msgErr + "6","error");}
}
