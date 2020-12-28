
this.ChangeCheckbox_1134 = function (itemId) {
//function ChangeCheckbox_1081(itemId){
    var isChecked = document.getElementById(itemId).checked;
    //$.messager.alert("Warning", document.getElementById("56_1081_41988_Q3_1").value, "warning");
    //Q1
    if(itemId == "17_1134_62010_1.1_1" && isChecked == true){
        document.getElementById("17_1134_62011_1.2_1").checked = false;
        document.getElementById("17_1134_62012_1.3_1").checked = false;
        document.getElementById("17_1134_62013_1.4_1").checked = false;
        document.getElementById("17_1134_62014_1.5_1").checked = false;
       
    }
    
    else  if(itemId == "17_1134_62010_1.2_1" && isChecked == true){
        document.getElementById("17_1134_62011_1.1_1").checked = false;
        document.getElementById("17_1134_62012_1.3_1").checked = false;
        document.getElementById("17_1134_62013_1.4_1").checked = false;
        document.getElementById("17_1134_62014_1.5_1").checked = false;
       
    }
    
    
}