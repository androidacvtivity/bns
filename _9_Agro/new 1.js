var from = "";

$(document).ready(function () {
    form = $("#formDenShort").val();
    f19_AGR();
});

$(function () {
    // OnKeyPress ```````````````````````````````````````````````````````````````````````````````
    $("input:not([type='button']):not([readonly]):not([disabled])").on("change", function (e) {
        f19_AGR();
    });
});


function f19_AGR() {


    var R25_C2 = $("#39_394_64591_25_2");
	var R26_C2 = $("#39_394_64594_26_2");
	var R27_C2 = $("#39_394_64592_27_2");
    var R28_C2 = $("#39_394_64589_28_2");
    var R29_C2 = $("#39_394_64590_29_2");	
	var R30_C2 = $("#39_394_64593_30_2");
    


//--------------readOnly input -----------------------

    R25_C2.prop("readonly", true);

    
  
    //------------------------------------------------------------------------------------

     R25_C2.val(Number(parseFloat(Number(R26_C2.val())) + parseFloat(Number(R27_C2.val())) +  parseFloat(Number(R28_C2.val())) + parseFloat(Number(R29_C2.val())) + parseFloat(Number(R30_C2.val())) ).toFixed(2));       
    
	
	// R25_C2.val(Number(parseFloat(Number(R26_C2.val())) + parseFloat(Number(R27_C2.val()))).toFixed(5));     
     
    //R001_C3.val(parseFloat(Number(R001_C1.val()).toFixed(5)) + parseFloat(Number(R001_C2.val()).toFixed(5)));
    
 
    
     R25_C2.val(parseInt(R26_C2.val() * 1 + R27_C2.val() * 1));

  

}
