var from = "";
var msgErr = "Nu ati introdus o valoare corecta";

$(document).ready(function () {
    form = $("#formDenShort").val();
    //fCBGC_Cap1();
});
$(function () {
    $("input:not([type='button']):not([readonly]):not([disabled])").on("change", function (e) {
        fCBGC_Cap1();
    });
});
function fCBGC_Cap1() {
    
    var R1_C1 = $("#68_1144_63086_1_1");
    var R2_C1 = $("#68_1144_63091_2_1");
    var R3_C1 = $("#68_1144_63095_3_1");
    var R4_C1 = $("#68_1144_63100_4_1");
    var R5_C1 = $("#68_1144_63101_5_1");
    var R6_C1 = $("#68_1144_63102_6_1");
    var R7_C1 = $("#68_1144_63103_7_1");
    var R8_C1 = $("#68_1144_63104_8_1");
    var R9_C1 = $("#68_1144_63105_9_1");
    var R10_C1 = $("#68_1144_63106_10_1");
    var R11_C1 = $("#68_1144_63107_11_1");
    var R12_C1 = $("#68_1144_63108_12_1");
    var R13_C1 = $("#68_1144_63109_13_1");
    var R14_C1 = $("#68_1144_63110_14_1");
    var R15_C1 = $("#68_1144_63111_15_1");
    var R16_C1 = $("#68_1144_63112_16_1");
    var R17_C1 = $("#68_1144_63113_17_1");
    var R18_1_C1 = $("#68_1144_63115_18\\.1_1");
    var R18_2_C1 = $("#68_1144_63116_18\\.2_1");
    var R18_3_C1 = $("#68_1144_63117_18\\.3_1");
    var R19_C1 = $("#68_1144_63118_19_1");
    var R20_C1 = $("#68_1144_63119_20_1");
        
    if(R1_C1.val() != "" && (R1_C1.val() < 1 || R1_C1.val() > 4)){R1_C1.val("");$.messager.alert("Eroare",msgErr,"error");R1_C1.focus();}  
    if(R2_C1.val() != "" && (R2_C1.val() < 1 || R2_C1.val() > 3)){R2_C1.val("");$.messager.alert("Eroare",msgErr,"error");}  
    if(R3_C1.val() != "" && (R3_C1.val() < 1 || R3_C1.val() > 4)){R3_C1.val("");$.messager.alert("Eroare",msgErr,"error");}
    if(R4_C1.val() != "" && (R4_C1.val() < 1 || R4_C1.val() > 5)){R4_C1.val("");$.messager.alert("Eroare",msgErr,"error");}
    if(R5_C1.val() != "" && (R5_C1.val() < 0 || R5_C1.val() > 99)){R5_C1.val("");$.messager.alert("Eroare",msgErr,"error");}
    if(R6_C1.val() != "" && (R6_C1.val() < 0 || R6_C1.val() > 999)){R6_C1.val("");$.messager.alert("Eroare",msgErr,"error");}
    if(R7_C1.val() != "" && (R7_C1.val() < 0 || R7_C1.val() > 999)){R7_C1.val("");$.messager.alert("Eroare",msgErr,"error");}
    if(R8_C1.val() != "" && (R8_C1.val() < 1 || R8_C1.val() > 2)){R8_C1.val("");$.messager.alert("Eroare",msgErr,"error");}
    if(R9_C1.val() != "" && (R9_C1.val() < 1 || R9_C1.val() > 3)){R9_C1.val("");$.messager.alert("Eroare",msgErr,"error");}
    if(R10_C1.val() != "" && (R10_C1.val() < 1 || R10_C1.val() > 3)){R10_C1.val("");$.messager.alert("Eroare",msgErr,"error");}
    if(R11_C1.val() != "" && (R11_C1.val() < 1 || R11_C1.val() > 3)){R11_C1.val("");$.messager.alert("Eroare",msgErr,"error");}
    if(R12_C1.val() != "" && (R12_C1.val() < 1 || R12_C1.val() > 3)){R12_C1.val("");$.messager.alert("Eroare",msgErr,"error");}
    if(R13_C1.val() != "" && (R13_C1.val() < 1 || R13_C1.val() > 3)){R13_C1.val("");$.messager.alert("Eroare",msgErr,"error");}
    if(R14_C1.val() != "" && (R14_C1.val() < 1 || R14_C1.val() > 3)){R14_C1.val("");$.messager.alert("Eroare",msgErr,"error");}
    if(R15_C1.val() != "" && (R15_C1.val() < 1 || R15_C1.val() > 6)){R15_C1.val("");$.messager.alert("Eroare",msgErr,"error");}
    if(R16_C1.val() != "" && (R16_C1.val() < 1 || R16_C1.val() > 4)){R16_C1.val("");$.messager.alert("Eroare",msgErr,"error");}
    if(R17_C1.val() != "" && (R17_C1.val() < 1 || R17_C1.val() > 2)){R17_C1.val("");$.messager.alert("Eroare",msgErr,"error");}
    if(R18_1_C1.val() != "" && (R18_1_C1.val() < 1 || R18_1_C1.val() > 2)){R18_1_C1.val("");$.messager.alert("Eroare",msgErr,"error");}
    if(R18_2_C1.val() != "" && (R18_2_C1.val() < 1 || R18_2_C1.val() > 2)){R18_2_C1.val("");$.messager.alert("Eroare",msgErr,"error");}
    if(R18_3_C1.val() != "" && (R18_3_C1.val() < 1 || R18_3_C1.val() > 2)){R18_3_C1.val("");$.messager.alert("Eroare",msgErr,"error");}
    if(R19_C1.val() != "" && (R19_C1.val() < 0 || R19_C1.val() > 999999)){R19_C1.val("");$.messager.alert("Eroare",msgErr,"error");}
    if(R20_C1.val() != "" && (R20_C1.val() < 0 || R20_C1.val() > 999999)){R20_C1.val("");$.messager.alert("Eroare",msgErr,"error");}
    
}

