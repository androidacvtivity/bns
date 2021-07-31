var from = "";
var msgErr = "Nu ati introdus o valoare corecta in coloana.";

$(document).ready(function () {
    form = $("#formDenShort").val();
    fCBGC_Cap7();
});
$(function () {
    $("input:not([type='button']):not([disabled])").on("change", function (e) {
        fCBGC_Cap7();
    });
});

function fCBGC_Cap7() { 


    var R1_C1 = $("#68_1150_63178_1_1");
    var R2_C1 = $("#68_1150_63179_2_1");
    var R3_C1 = $("#68_1150_63180_3_1");
    var R4_C1 = $("#68_1150_63181_4_1");
   

   //  var R18_1_C1 = $("#68_1144_63115_18\\.1_1");
     
     
    var R5_1_C1 = $("#68_1150_63183_5\\.1_1");
    
    var R5_2_C1 = $("#68_1150_63184_5\\.2_1");
    var R5_3_C1 = $("#68_1150_63185_5\\.3_1"); 
    var R5_4_C1 = $("#68_1150_63186_5\\.4_1"); 
    var R6_1_C1 = $("#68_1150_63188_6\\.1_1");
    var R6_2_C1 = $("#68_1150_63189_6\\.2_1");
    var R6_3_C1 = $("#68_1150_63190_6\\.3_1");



    
    

 //var a = rows.length;
 //alert(a.val());

 




if(R1_C1.val() != "" && R1_C1.val() < 1 || R1_C1.val() > 5){R1_C1.val("");$.messager.alert("Eroare",msgErr + "1","error");}
if(R2_C1.val() != "" && R2_C1.val() < 1 || R2_C1.val() > 5){R1_C1.val("");$.messager.alert("Eroare",msgErr + "1","error");}


if(R3_C1.val() != "" && R3_C1.val() < 1 || R3_C1.val() > 99999){R3_C1.val("");$.messager.alert("Eroare",msgErr + "1","error");}
if(R3_C1.val().length >  5 ){R3_C1.val("");$.messager.alert("Eroare",msgErr + "1","error");}



if(R4_C1.val() != "" && R4_C1.val() < 1 || R4_C1.val() > 99999){R4_C1.val("");$.messager.alert("Eroare",msgErr + "1","error");}
if(R4_C1.val().length >  5 ){R4_C1.val("");$.messager.alert("Eroare",msgErr + "1","error");}

if(R5_1_C1.val() != "" && R5_1_C1.val() < 1 || R5_1_C1.val() > 3){R5_1_C1.val("");$.messager.alert("Eroare",msgErr + "1","error");}
if(R5_2_C1.val() != "" && R5_2_C1.val() < 1 || R5_2_C1.val() > 3){R5_2_C1.val("");$.messager.alert("Eroare",msgErr + "1","error");}
if(R5_3_C1.val() != "" && R5_3_C1.val() < 1 || R5_3_C1.val() > 3){R5_3_C1.val("");$.messager.alert("Eroare",msgErr + "1","error");}
if(R5_4_C1.val() != "" && R5_4_C1.val() < 1 || R5_4_C1.val() > 3){R5_4_C1.val("");$.messager.alert("Eroare",msgErr + "1","error");}

if(R6_1_C1.val() != "" && R6_1_C1.val() < 1 || R6_1_C1.val() > 3){R6_1_C1.val("");$.messager.alert("Eroare",msgErr + "1","error");}
if(R6_2_C1.val() != "" && R6_2_C1.val() < 1 || R6_2_C1.val() > 3){R6_2_C1.val("");$.messager.alert("Eroare",msgErr + "1","error");}
if(R6_3_C1.val() != "" && R6_3_C1.val() < 1 || R6_3_C1.val() > 3){R6_3_C1.val("");$.messager.alert("Eroare",msgErr + "1","error");}


 //var a = R3_C1.length;
 

 //alert(R4_C1.val());
 //alert(R5_1_C1.val());


}



