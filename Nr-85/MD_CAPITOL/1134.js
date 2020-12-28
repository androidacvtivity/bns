$(document).ready(function() {
   document.getElementById("56_1081_41988_Q3_1").maxLength = 4;
   document.getElementById("56_1081_41981_Q1.2_2").maxLength = 2;
});
this.ChangeCheckbox_1081 = function (itemId) {
//function ChangeCheckbox_1081(itemId){
    var isChecked = document.getElementById(itemId).checked;
    //$.messager.alert("Warning", document.getElementById("56_1081_41988_Q3_1").value, "warning");
    //Q1
    if(itemId == "56_1081_41980_Q1.1_1" && isChecked == true){
        document.getElementById("56_1081_41981_Q1.2_1").checked = false;
        document.getElementById("56_1081_41982_Q1.3_1").checked = false;
        document.getElementById("56_1081_41982_Q1.3_2").disabled = true;
        document.getElementById("56_1081_41982_Q1.3_2").value = "";
        document.getElementById("56_1081_41983_Q1.4_1").checked = false;
        document.getElementById("56_1081_41983_Q1.4_2").disabled = true;
        document.getElementById("56_1081_41983_Q1.4_2").value = "";
        document.getElementById("56_1081_42247_Q1.5_1").checked = false;
    }
    else if (itemId == "56_1081_41981_Q1.2_1" && isChecked == true){
        document.getElementById("56_1081_41980_Q1.1_1").checked = false;
        document.getElementById("56_1081_41982_Q1.3_1").checked = false;
        document.getElementById("56_1081_41982_Q1.3_2").disabled = true;
        document.getElementById("56_1081_41982_Q1.3_2").value = "";
        document.getElementById("56_1081_41983_Q1.4_1").checked = false;
        document.getElementById("56_1081_41983_Q1.4_2").disabled = true;
        document.getElementById("56_1081_41983_Q1.4_2").value = "";
        document.getElementById("56_1081_42247_Q1.5_1").checked = false;
    }
    else if (itemId == "56_1081_41982_Q1.3_1" && isChecked == true){
        document.getElementById("56_1081_41980_Q1.1_1").checked = false;
        document.getElementById("56_1081_41981_Q1.2_1").checked = false;
        document.getElementById("56_1081_41982_Q1.3_2").disabled = false;
        document.getElementById("56_1081_41983_Q1.4_1").checked = false;
        document.getElementById("56_1081_41983_Q1.4_2").disabled = true;
        document.getElementById("56_1081_41983_Q1.4_2").value = "";
        document.getElementById("56_1081_42247_Q1.5_1").checked = false;
    }
    else if (itemId == "56_1081_41983_Q1.4_1" && isChecked == true){
        document.getElementById("56_1081_41980_Q1.1_1").checked = false;
        document.getElementById("56_1081_41981_Q1.2_1").checked = false;
        document.getElementById("56_1081_41982_Q1.3_1").checked = false;
        document.getElementById("56_1081_41982_Q1.3_2").disabled = true;
        document.getElementById("56_1081_41982_Q1.3_2").value = "";
        document.getElementById("56_1081_41983_Q1.4_2").disabled = false;
        document.getElementById("56_1081_42247_Q1.5_1").checked = false;
    }
    else if (itemId == "56_1081_42247_Q1.5_1" && isChecked == true){
        document.getElementById("56_1081_41981_Q1.2_1").checked = false;
        document.getElementById("56_1081_41982_Q1.3_1").checked = false;
        document.getElementById("56_1081_41982_Q1.3_2").disabled = true;
        document.getElementById("56_1081_41982_Q1.3_2").value = "";
        document.getElementById("56_1081_41983_Q1.4_1").checked = false;
        document.getElementById("56_1081_41983_Q1.4_2").disabled = true;
        document.getElementById("56_1081_41983_Q1.4_2").value = "";
        document.getElementById("56_1081_41980_Q1.1_1").checked = false;
    }
    //Q2
    else if (itemId == "56_1081_41986_Q2.1_1" && isChecked == true){
        document.getElementById("56_1081_41987_Q2.2_1").checked = false;
    }
    else if (itemId == "56_1081_41987_Q2.2_1" && isChecked == true){
        document.getElementById("56_1081_41986_Q2.1_1").checked = false;
    }
    //Q3
    var Q3 = document.getElementById("56_1081_41988_Q3_1").value;
    if (Q3 >= 2000){
        document.getElementById("56_1081_41996_Q4.7_1").checked = false;
        document.getElementById("56_1081_41997_Q4.8_1").checked = false;
        document.getElementById("56_1081_41998_Q4.9_1").checked = false;
        document.getElementById("56_1081_41996_Q4.7_1").disabled = true;
        document.getElementById("56_1081_41997_Q4.8_1").disabled = true;
        document.getElementById("56_1081_41998_Q4.9_1").disabled = true;
    }
    else{
        document.getElementById("56_1081_41996_Q4.7_1").disabled = false;
        document.getElementById("56_1081_41997_Q4.8_1").disabled = false;
        document.getElementById("56_1081_41998_Q4.9_1").disabled = false;
    }
    //Q4
    if (itemId == "56_1081_41990_Q4.1_1" && isChecked == true){
        document.getElementById("56_1081_41991_Q4.2_1").checked = false;
        document.getElementById("56_1081_41992_Q4.3_1").checked = false;
        document.getElementById("56_1081_41993_Q4.4_1").checked = false;
        document.getElementById("56_1081_41994_Q4.5_1").checked = false;
        document.getElementById("56_1081_41995_Q4.6_1").checked = false;
        document.getElementById("56_1081_41996_Q4.7_1").checked = false;
        document.getElementById("56_1081_41997_Q4.8_1").checked = false;
        document.getElementById("56_1081_41998_Q4.9_1").checked = false;
    }
    else if (itemId == "56_1081_41991_Q4.2_1" && isChecked == true){
        document.getElementById("56_1081_41990_Q4.1_1").checked = false;
        document.getElementById("56_1081_41992_Q4.3_1").checked = false;
        document.getElementById("56_1081_41993_Q4.4_1").checked = false;
        document.getElementById("56_1081_41994_Q4.5_1").checked = false;
        document.getElementById("56_1081_41995_Q4.6_1").checked = false;
        document.getElementById("56_1081_41996_Q4.7_1").checked = false;
        document.getElementById("56_1081_41997_Q4.8_1").checked = false;
        document.getElementById("56_1081_41998_Q4.9_1").checked = false;
    }
    else if (itemId == "56_1081_41992_Q4.3_1" && isChecked == true){
        document.getElementById("56_1081_41990_Q4.1_1").checked = false;
        document.getElementById("56_1081_41991_Q4.2_1").checked = false;
        document.getElementById("56_1081_41993_Q4.4_1").checked = false;
        document.getElementById("56_1081_41994_Q4.5_1").checked = false;
        document.getElementById("56_1081_41995_Q4.6_1").checked = false;
        document.getElementById("56_1081_41996_Q4.7_1").checked = false;
        document.getElementById("56_1081_41997_Q4.8_1").checked = false;
        document.getElementById("56_1081_41998_Q4.9_1").checked = false;
    }
    else if (itemId == "56_1081_41993_Q4.4_1" && isChecked == true){
        document.getElementById("56_1081_41990_Q4.1_1").checked = false;
        document.getElementById("56_1081_41991_Q4.2_1").checked = false;
        document.getElementById("56_1081_41992_Q4.3_1").checked = false;
        document.getElementById("56_1081_41994_Q4.5_1").checked = false;
        document.getElementById("56_1081_41995_Q4.6_1").checked = false;
        document.getElementById("56_1081_41996_Q4.7_1").checked = false;
        document.getElementById("56_1081_41997_Q4.8_1").checked = false;
        document.getElementById("56_1081_41998_Q4.9_1").checked = false;
    }
    else if (itemId == "56_1081_41994_Q4.5_1" && isChecked == true){
        document.getElementById("56_1081_41990_Q4.1_1").checked = false;
        document.getElementById("56_1081_41991_Q4.2_1").checked = false;
        document.getElementById("56_1081_41992_Q4.3_1").checked = false;
        document.getElementById("56_1081_41993_Q4.4_1").checked = false;
        document.getElementById("56_1081_41995_Q4.6_1").checked = false;
        document.getElementById("56_1081_41996_Q4.7_1").checked = false;
        document.getElementById("56_1081_41997_Q4.8_1").checked = false;
        document.getElementById("56_1081_41998_Q4.9_1").checked = false;
    }
    else if (itemId == "56_1081_41995_Q4.6_1" && isChecked == true){
        document.getElementById("56_1081_41990_Q4.1_1").checked = false;
        document.getElementById("56_1081_41991_Q4.2_1").checked = false;
        document.getElementById("56_1081_41992_Q4.3_1").checked = false;
        document.getElementById("56_1081_41993_Q4.4_1").checked = false;
        document.getElementById("56_1081_41994_Q4.5_1").checked = false;
        document.getElementById("56_1081_41996_Q4.7_1").checked = false;
        document.getElementById("56_1081_41997_Q4.8_1").checked = false;
        document.getElementById("56_1081_41998_Q4.9_1").checked = false;
    }
    else if (itemId == "56_1081_41996_Q4.7_1" && isChecked == true){
        document.getElementById("56_1081_41990_Q4.1_1").checked = false;
        document.getElementById("56_1081_41991_Q4.2_1").checked = false;
        document.getElementById("56_1081_41992_Q4.3_1").checked = false;
        document.getElementById("56_1081_41993_Q4.4_1").checked = false;
        document.getElementById("56_1081_41994_Q4.5_1").checked = false;
        document.getElementById("56_1081_41995_Q4.6_1").checked = false;
        document.getElementById("56_1081_41997_Q4.8_1").checked = false;
        document.getElementById("56_1081_41998_Q4.9_1").checked = false;
    }
    else if (itemId == "56_1081_41997_Q4.8_1" && isChecked == true){
        document.getElementById("56_1081_41990_Q4.1_1").checked = false;
        document.getElementById("56_1081_41991_Q4.2_1").checked = false;
        document.getElementById("56_1081_41992_Q4.3_1").checked = false;
        document.getElementById("56_1081_41993_Q4.4_1").checked = false;
        document.getElementById("56_1081_41994_Q4.5_1").checked = false;
        document.getElementById("56_1081_41995_Q4.6_1").checked = false;
        document.getElementById("56_1081_41996_Q4.7_1").checked = false;
        document.getElementById("56_1081_41998_Q4.9_1").checked = false;
    }
    else if (itemId == "56_1081_41998_Q4.9_1" && isChecked == true){
        document.getElementById("56_1081_41990_Q4.1_1").checked = false;
        document.getElementById("56_1081_41991_Q4.2_1").checked = false;
        document.getElementById("56_1081_41992_Q4.3_1").checked = false;
        document.getElementById("56_1081_41993_Q4.4_1").checked = false;
        document.getElementById("56_1081_41994_Q4.5_1").checked = false;
        document.getElementById("56_1081_41995_Q4.6_1").checked = false;
        document.getElementById("56_1081_41996_Q4.7_1").checked = false;
        document.getElementById("56_1081_41997_Q4.8_1").checked = false;
    }
    //Q5
    else if (itemId == "56_1081_42000_Q5.1_1" && isChecked == true){
        document.getElementById("56_1081_42001_Q5.2_1").checked = false;
        document.getElementById("56_1081_42002_Q5.3_1").checked = false;
        document.getElementById("56_1081_42003_Q5.4_1").checked = false;
        document.getElementById("56_1081_42004_Q5.5_1").checked = false;
    }
    else if (itemId == "56_1081_42001_Q5.2_1" && isChecked == true){
        document.getElementById("56_1081_42000_Q5.1_1").checked = false;
        document.getElementById("56_1081_42002_Q5.3_1").checked = false;
        document.getElementById("56_1081_42003_Q5.4_1").checked = false;
        document.getElementById("56_1081_42004_Q5.5_1").checked = false;
    }
    else if (itemId == "56_1081_42002_Q5.3_1" && isChecked == true){
        document.getElementById("56_1081_42000_Q5.1_1").checked = false;
        document.getElementById("56_1081_42001_Q5.2_1").checked = false;
        document.getElementById("56_1081_42003_Q5.4_1").checked = false;
        document.getElementById("56_1081_42004_Q5.5_1").checked = false;
    }
    else if (itemId == "56_1081_42003_Q5.4_1" && isChecked == true){
        document.getElementById("56_1081_42000_Q5.1_1").checked = false;
        document.getElementById("56_1081_42001_Q5.2_1").checked = false;
        document.getElementById("56_1081_42002_Q5.3_1").checked = false;
        document.getElementById("56_1081_42004_Q5.5_1").checked = false;
    }
    else if (itemId == "56_1081_42004_Q5.5_1" && isChecked == true){
        document.getElementById("56_1081_42000_Q5.1_1").checked = false;
        document.getElementById("56_1081_42001_Q5.2_1").checked = false;
        document.getElementById("56_1081_42002_Q5.3_1").checked = false;
        document.getElementById("56_1081_42003_Q5.4_1").checked = false;
    }
    //Q6
    else if (itemId == "56_1081_42006_Q6.1_1" && isChecked == true){
        document.getElementById("56_1081_42007_Q6.2_1").checked = false;
        document.getElementById("42008").style.display = "";
        document.getElementById("42009").style.display = "";
        document.getElementById("42010").style.display = "";
        document.getElementById("42011").style.display = "";
        document.getElementById("42012").style.display = "";
        document.getElementById("42013").style.display = "";
        document.getElementById("42014").style.display = "";
    }
    else if (itemId == "56_1081_42007_Q6.2_1" && isChecked == true){
        document.getElementById("56_1081_42006_Q6.1_1").checked = false;
        document.getElementById("42008").style.display = "none";
        document.getElementById("42009").style.display = "none";
        document.getElementById("42010").style.display = "none";
        document.getElementById("42011").style.display = "none";
        document.getElementById("42012").style.display = "none";
        document.getElementById("42013").style.display = "none";
        document.getElementById("42014").style.display = "none";
        document.getElementById("56_1081_42009_Q7.1_1").checked = false;
        document.getElementById("56_1081_42010_Q7.2_1").checked = false;
        document.getElementById("56_1081_42011_Q7.3_1").checked = false;
        document.getElementById("56_1081_42012_Q7.4_1").checked = false;
        document.getElementById("56_1081_42013_Q7.5_1").checked = false;
        document.getElementById("56_1081_42014_Q7.6_1").checked = false;
        document.getElementById("56_1081_42014_Q7.6_32").value = "";
    }
    //Q7
    if(document.getElementById("56_1081_42014_Q7.6_1").checked == true){
        document.getElementById("56_1081_42014_Q7.6_32").disabled = false;
    }
    else {
        document.getElementById("56_1081_42014_Q7.6_32").disabled = true;
        document.getElementById("56_1081_42014_Q7.6_32").value = "";
    }
}