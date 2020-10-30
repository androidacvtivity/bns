/////////////////////////////////////////////Mozila Firefox///////////////////////////////////////////////////////
//OnChange
	var form = document.getElementById('ctl00_Labe_Forma');
$(function () 
{
    // OnKeyPress ```````````````````````````````````````````````````````````````````````````````
		$("input:not([type='button']):not([readonly]):not([disabled])").live("change", function(e) 
		{
		
            if(form.innerHTML == "21-VINZ")
            {
                var capI = document.getElementById('367');
                var capII = document.getElementById('368');
                var URL = document.URL;
                var currentCAPI = URL.indexOf("capitol=" + capI.id);
                var currentCAPII = URL.indexOf("capitol=" + capII.id);
                if(currentCAPI == -1 && currentCAPII == -1)
                {
                    fCAPI();
                }
                if(currentCAPI != -1 )
                {
                    fCAPI();
                }
                if(currentCAPII != -1)
                {
                    fCAPII();
                }
            }
	 	});	
});
$(document).keydown(function(e){
   //alert(form.value);
    if(form.innerHTML == "21-VINZ")
            {
                var capI = document.getElementById('367');
                var capII = document.getElementById('368');
                var URL = document.URL;
                var currentCAPI = URL.indexOf("capitol=" + capI.id);
                var currentCAPII = URL.indexOf("capitol=" + capII.id);
                if(currentCAPI == -1 && currentCAPII == -1)
                {
                    fCAPI();
                }
                if(currentCAPI != -1 )
                {
                    fCAPI();
                }
                if(currentCAPII != -1)
                {
                    fCAPII();
                }
            }
});
$(document).ready(function() {
});

function fCAPI(){
    var R10_C1 = document.getElementById('26_367_10_1');
    var R10_C2 = document.getElementById('26_367_10_2');
    var R10_C3 = document.getElementById('26_367_10_3');
    var R10_C4 = document.getElementById('26_367_10_4');
    var R10_C5 = document.getElementById('26_367_10_5');
    var R10_C6 = document.getElementById('26_367_10_6');
    var R11_C1 = document.getElementById('26_367_11_1');
    var R11_C2 = document.getElementById('26_367_11_2');
    var R11_C3 = document.getElementById('26_367_11_3');
    var R11_C4 = document.getElementById('26_367_11_4');
    var R11_C5 = document.getElementById('26_367_11_5');
    var R11_C6 = document.getElementById('26_367_11_6');
    var R12_C1 = document.getElementById('26_367_12_1');
    var R12_C2 = document.getElementById('26_367_12_2');
    var R12_C3 = document.getElementById('26_367_12_3');
    var R12_C4 = document.getElementById('26_367_12_4');
    var R12_C5 = document.getElementById('26_367_12_5');
    var R12_C6 = document.getElementById('26_367_12_6');
    var R13_C1 = document.getElementById('26_367_13_1');
    var R13_C2 = document.getElementById('26_367_13_2');
    var R13_C3 = document.getElementById('26_367_13_3');
    var R13_C4 = document.getElementById('26_367_13_4');
    var R13_C5 = document.getElementById('26_367_13_5');
    var R13_C6 = document.getElementById('26_367_13_6');
    var R14_C1 = document.getElementById('26_367_14_1');
    var R14_C2 = document.getElementById('26_367_14_2');
    var R14_C3 = document.getElementById('26_367_14_3');
    var R14_C4 = document.getElementById('26_367_14_4');
    var R14_C5 = document.getElementById('26_367_14_5');
    var R14_C6 = document.getElementById('26_367_14_6');
    var R15_C1 = document.getElementById('26_367_15_1');
    var R15_C2 = document.getElementById('26_367_15_2');
    var R15_C3 = document.getElementById('26_367_15_3');
    var R15_C4 = document.getElementById('26_367_15_4');
    var R15_C5 = document.getElementById('26_367_15_5');
    var R15_C6 = document.getElementById('26_367_15_6');
    var R16_C1 = document.getElementById('26_367_16_1');
    var R16_C2 = document.getElementById('26_367_16_2');
    var R16_C3 = document.getElementById('26_367_16_3');
    var R16_C4 = document.getElementById('26_367_16_4');
    var R16_C5 = document.getElementById('26_367_16_5');
    var R16_C6 = document.getElementById('26_367_16_6');
    var R17_C1 = document.getElementById('26_367_17_1');
    var R17_C2 = document.getElementById('26_367_17_2');
    var R17_C3 = document.getElementById('26_367_17_3');
    var R17_C4 = document.getElementById('26_367_17_4');
    var R17_C5 = document.getElementById('26_367_17_5');
    var R17_C6 = document.getElementById('26_367_17_6');
    var R18_C1 = document.getElementById('26_367_18_1');
    var R18_C2 = document.getElementById('26_367_18_2');
    var R18_C3 = document.getElementById('26_367_18_3');
    var R18_C4 = document.getElementById('26_367_18_4');
    var R18_C5 = document.getElementById('26_367_18_5');
    var R18_C6 = document.getElementById('26_367_18_6');
    var R19_C1 = document.getElementById('26_367_19_1');
    var R19_C2 = document.getElementById('26_367_19_2');
    var R19_C3 = document.getElementById('26_367_19_3');
    var R19_C4 = document.getElementById('26_367_19_4');
    var R19_C5 = document.getElementById('26_367_19_5');
    var R19_C6 = document.getElementById('26_367_19_6');
    var R20_C1 = document.getElementById('26_367_20_1');
    var R20_C2 = document.getElementById('26_367_20_2');
    var R20_C3 = document.getElementById('26_367_20_3');
    var R20_C4 = document.getElementById('26_367_20_4');
    var R20_C5 = document.getElementById('26_367_20_5');
    var R20_C6 = document.getElementById('26_367_20_6');
    var R21_C1 = document.getElementById('26_367_21_1');
    var R21_C2 = document.getElementById('26_367_21_2');
    var R21_C3 = document.getElementById('26_367_21_3');
    var R21_C4 = document.getElementById('26_367_21_4');
    var R21_C5 = document.getElementById('26_367_21_5');
    var R21_C6 = document.getElementById('26_367_21_6');
    var R22_C1 = document.getElementById('26_367_22_1');
    var R22_C2 = document.getElementById('26_367_22_2');
    var R22_C3 = document.getElementById('26_367_22_3');
    var R22_C4 = document.getElementById('26_367_22_4');
    var R22_C5 = document.getElementById('26_367_22_5');
    var R22_C6 = document.getElementById('26_367_22_6');
    var R23_C1 = document.getElementById('26_367_23_1');
    var R23_C2 = document.getElementById('26_367_23_2');
    var R23_C3 = document.getElementById('26_367_23_3');
    var R23_C4 = document.getElementById('26_367_23_4');
    var R23_C5 = document.getElementById('26_367_23_5');
    var R23_C6 = document.getElementById('26_367_23_6');
    var R24_C1 = document.getElementById('26_367_24_1');
    var R24_C2 = document.getElementById('26_367_24_2');
    var R24_C3 = document.getElementById('26_367_24_3');
    var R24_C4 = document.getElementById('26_367_24_4');
    var R24_C5 = document.getElementById('26_367_24_5');
    var R24_C6 = document.getElementById('26_367_24_6');
    var R25_C1 = document.getElementById('26_367_25_1');
    var R25_C2 = document.getElementById('26_367_25_2');
    var R25_C3 = document.getElementById('26_367_25_3');
    var R25_C4 = document.getElementById('26_367_25_4');
    var R25_C5 = document.getElementById('26_367_25_5');
    var R25_C6 = document.getElementById('26_367_25_6');
    var R26_C1 = document.getElementById('26_367_26_1');
    var R26_C2 = document.getElementById('26_367_26_2');
    var R26_C3 = document.getElementById('26_367_26_3');
    var R26_C4 = document.getElementById('26_367_26_4');
    var R26_C5 = document.getElementById('26_367_26_5');
    var R26_C6 = document.getElementById('26_367_26_6');
    //-----------Culturi Tehnice------------------------
    
    var R27_C1 = document.getElementById('26_367_27_1');
    var R27_C2 = document.getElementById('26_367_27_2');
    var R27_C3 = document.getElementById('26_367_27_3');
    var R27_C4 = document.getElementById('26_367_27_4');
    var R27_C5 = document.getElementById('26_367_27_5');
    var R27_C6 = document.getElementById('26_367_27_6');
    var R28_C1 = document.getElementById('26_367_28_1');
    var R28_C2 = document.getElementById('26_367_28_2');
    var R28_C3 = document.getElementById('26_367_28_3');
    var R28_C4 = document.getElementById('26_367_28_4');
    var R28_C5 = document.getElementById('26_367_28_5');
    var R28_C6 = document.getElementById('26_367_28_6');
    var R29_C1 = document.getElementById('26_367_29_1');
    var R29_C2 = document.getElementById('26_367_29_2');
    var R29_C3 = document.getElementById('26_367_29_3');
    var R29_C4 = document.getElementById('26_367_29_4');
    var R29_C5 = document.getElementById('26_367_29_5');
    var R29_C6 = document.getElementById('26_367_29_6');
    var R30_C1 = document.getElementById('26_367_30_1');
    var R30_C2 = document.getElementById('26_367_30_2');
    var R30_C3 = document.getElementById('26_367_30_3');
    var R30_C4 = document.getElementById('26_367_30_4');
    var R30_C5 = document.getElementById('26_367_30_5');
    var R30_C6 = document.getElementById('26_367_30_6');
    var R31_C1 = document.getElementById('26_367_31_1');
    var R31_C2 = document.getElementById('26_367_31_2');
    var R31_C3 = document.getElementById('26_367_31_3');
    var R31_C4 = document.getElementById('26_367_31_4');
    var R31_C5 = document.getElementById('26_367_31_5');
    var R31_C6 = document.getElementById('26_367_31_6');
    var R32_C1 = document.getElementById('26_367_32_1');
    var R32_C2 = document.getElementById('26_367_32_2');
    var R32_C3 = document.getElementById('26_367_32_3');
    var R32_C4 = document.getElementById('26_367_32_4');
    var R32_C5 = document.getElementById('26_367_32_5');
    var R32_C6 = document.getElementById('26_367_32_6');
    var R33_C1 = document.getElementById('26_367_33_1');
    var R33_C2 = document.getElementById('26_367_33_2');
    var R33_C3 = document.getElementById('26_367_33_3');
    var R33_C4 = document.getElementById('26_367_33_4');
    var R33_C5 = document.getElementById('26_367_33_5');
    var R33_C6 = document.getElementById('26_367_33_6');
    //------------Culturi etero-oleaginoase - total-----
    var R34_C1 = document.getElementById('26_367_34_1');
    var R34_C2 = document.getElementById('26_367_34_2');
    var R34_C3 = document.getElementById('26_367_34_3');
    var R34_C4 = document.getElementById('26_367_34_4');
    var R34_C5 = document.getElementById('26_367_34_5');
    var R34_C6 = document.getElementById('26_367_34_6');
    var R35_C1 = document.getElementById('26_367_35_1');
    var R35_C2 = document.getElementById('26_367_35_2');
    var R35_C3 = document.getElementById('26_367_35_3');
    var R35_C4 = document.getElementById('26_367_35_4');
    var R35_C5 = document.getElementById('26_367_35_5');
    var R35_C6 = document.getElementById('26_367_35_6');
    var R36_C1 = document.getElementById('26_367_36_1');
    var R36_C2 = document.getElementById('26_367_36_2');
    var R36_C3 = document.getElementById('26_367_36_3');
    var R36_C4 = document.getElementById('26_367_36_4');
    var R36_C5 = document.getElementById('26_367_36_5');
    var R36_C6 = document.getElementById('26_367_36_6');
    var R37_C1 = document.getElementById('26_367_37_1');
    var R37_C2 = document.getElementById('26_367_37_2');
    var R37_C3 = document.getElementById('26_367_37_3');
    var R37_C4 = document.getElementById('26_367_37_4');
    var R37_C5 = document.getElementById('26_367_37_5');
    var R37_C6 = document.getElementById('26_367_37_6');
    var R38_C1 = document.getElementById('26_367_38_1');
    var R38_C2 = document.getElementById('26_367_38_2');
    var R38_C3 = document.getElementById('26_367_38_3');
    var R38_C4 = document.getElementById('26_367_38_4');
    var R38_C5 = document.getElementById('26_367_38_5');
    var R38_C6 = document.getElementById('26_367_38_6');
    var R39_C1 = document.getElementById('26_367_39_1');
    var R39_C2 = document.getElementById('26_367_39_2');
    var R39_C3 = document.getElementById('26_367_39_3');
    var R39_C4 = document.getElementById('26_367_39_4');
    var R39_C5 = document.getElementById('26_367_39_5');
    var R39_C6 = document.getElementById('26_367_39_6');
    var R40_C1 = document.getElementById('26_367_40_1');
    var R40_C2 = document.getElementById('26_367_40_2');
    var R40_C3 = document.getElementById('26_367_40_3');
    var R40_C4 = document.getElementById('26_367_40_4');
    var R40_C5 = document.getElementById('26_367_40_5');
    var R40_C6 = document.getElementById('26_367_40_6');
    //--------------------------------------------------
    var R41_C1 = document.getElementById('26_367_41_1');
    var R41_C2 = document.getElementById('26_367_41_2');
    var R41_C3 = document.getElementById('26_367_41_3');
    var R41_C4 = document.getElementById('26_367_41_4');
    var R41_C5 = document.getElementById('26_367_41_5');
    var R41_C6 = document.getElementById('26_367_41_6');
    var R42_C1 = document.getElementById('26_367_42_1');
    var R42_C2 = document.getElementById('26_367_42_2');
    var R42_C3 = document.getElementById('26_367_42_3');
    var R42_C4 = document.getElementById('26_367_42_4');
    var R42_C5 = document.getElementById('26_367_42_5');
    var R42_C6 = document.getElementById('26_367_42_6');
    var R43_C1 = document.getElementById('26_367_42_1');
    var R43_C2 = document.getElementById('26_367_43_2');
    var R43_C3 = document.getElementById('26_367_43_3');
    var R43_C4 = document.getElementById('26_367_43_4');
    var R43_C5 = document.getElementById('26_367_43_5');
    var R43_C6 = document.getElementById('26_367_43_6');
    var R44_C1 = document.getElementById('26_367_44_1');
    var R44_C2 = document.getElementById('26_367_44_2');
    var R44_C3 = document.getElementById('26_367_44_3');
    var R44_C4 = document.getElementById('26_367_44_4');
    var R44_C5 = document.getElementById('26_367_44_5');
    var R44_C6 = document.getElementById('26_367_44_6');
    var R45_C1 = document.getElementById('26_367_45_1');
    var R45_C2 = document.getElementById('26_367_45_2');
    var R45_C3 = document.getElementById('26_367_45_3');
    var R45_C4 = document.getElementById('26_367_45_4');
    var R45_C5 = document.getElementById('26_367_45_5');
    var R45_C6 = document.getElementById('26_367_45_6');
    //--Materiale saditor (butasi) mii bucati - total---
    var R46_C1 = document.getElementById('26_367_46_1');
    var R46_C2 = document.getElementById('26_367_46_2');
    var R46_C3 = document.getElementById('26_367_46_3');
    var R46_C4 = document.getElementById('26_367_46_4');
    var R46_C5 = document.getElementById('26_367_46_5');
    var R46_C6 = document.getElementById('26_367_46_6');
    var R47_C1 = document.getElementById('26_367_47_1');
    var R47_C2 = document.getElementById('26_367_47_2');
    var R47_C3 = document.getElementById('26_367_47_3');
    var R47_C4 = document.getElementById('26_367_47_4');
    var R47_C5 = document.getElementById('26_367_47_5');
    var R47_C6 = document.getElementById('26_367_47_6');
    var R48_C1 = document.getElementById('26_367_48_1');
    var R48_C2 = document.getElementById('26_367_48_2');
    var R48_C3 = document.getElementById('26_367_48_3');
    var R48_C4 = document.getElementById('26_367_48_4');
    var R48_C5 = document.getElementById('26_367_48_5');
    var R48_C6 = document.getElementById('26_367_48_6');
    //-Cartofi, legume şi culturi bostănoase alimentare-
    var R49_C1 = document.getElementById('26_367_49_1');
    var R49_C2 = document.getElementById('26_367_49_2');
    var R49_C3 = document.getElementById('26_367_49_3');
    var R49_C4 = document.getElementById('26_367_49_4');
    var R49_C5 = document.getElementById('26_367_49_5');
    var R49_C6 = document.getElementById('26_367_49_6');
    //-----Legume de cîmp – total-----------------------
    var R50_C1 = document.getElementById('26_367_50_1');
    var R50_C2 = document.getElementById('26_367_50_2');
    var R50_C3 = document.getElementById('26_367_50_3');
    var R50_C4 = document.getElementById('26_367_50_4');
    var R50_C5 = document.getElementById('26_367_50_5');
    var R50_C6 = document.getElementById('26_367_50_6');
    var R51_C1 = document.getElementById('26_367_51_1');
    var R51_C2 = document.getElementById('26_367_51_2');
    var R51_C3 = document.getElementById('26_367_51_3');
    var R51_C4 = document.getElementById('26_367_51_4');
    var R51_C5 = document.getElementById('26_367_51_5');
    var R51_C6 = document.getElementById('26_367_51_6');
    var R52_C1 = document.getElementById('26_367_52_1');
    var R52_C2 = document.getElementById('26_367_52_2');
    var R52_C3 = document.getElementById('26_367_52_3');
    var R52_C4 = document.getElementById('26_367_52_4');
    var R52_C5 = document.getElementById('26_367_52_5');
    var R52_C6 = document.getElementById('26_367_52_6');
    var R53_C1 = document.getElementById('26_367_53_1');
    var R53_C2 = document.getElementById('26_367_53_2');
    var R53_C3 = document.getElementById('26_367_53_3');
    var R53_C4 = document.getElementById('26_367_53_4');
    var R53_C5 = document.getElementById('26_367_53_5');
    var R53_C6 = document.getElementById('26_367_53_6');
    var R54_C1 = document.getElementById('26_367_54_1');
    var R54_C2 = document.getElementById('26_367_54_2');
    var R54_C3 = document.getElementById('26_367_54_3');
    var R54_C4 = document.getElementById('26_367_54_4');
    var R54_C5 = document.getElementById('26_367_54_5');
    var R54_C6 = document.getElementById('26_367_54_6');
    var R55_C1 = document.getElementById('26_367_55_1');
    var R55_C2 = document.getElementById('26_367_55_2');
    var R55_C3 = document.getElementById('26_367_55_3');
    var R55_C4 = document.getElementById('26_367_55_4');
    var R55_C5 = document.getElementById('26_367_55_5');
    var R55_C6 = document.getElementById('26_367_55_6');
    var R56_C1 = document.getElementById('26_367_56_1');
    var R56_C2 = document.getElementById('26_367_56_2');
    var R56_C3 = document.getElementById('26_367_56_3');
    var R56_C4 = document.getElementById('26_367_56_4');
    var R56_C5 = document.getElementById('26_367_56_5');
    var R56_C6 = document.getElementById('26_367_56_6');
    var R57_C1 = document.getElementById('26_367_57_1');
    var R57_C2 = document.getElementById('26_367_57_2');
    var R57_C3 = document.getElementById('26_367_57_3');
    var R57_C4 = document.getElementById('26_367_57_4');
    var R57_C5 = document.getElementById('26_367_57_5');
    var R57_C6 = document.getElementById('26_367_57_6');
    var R58_C1 = document.getElementById('26_367_58_1');
    var R58_C2 = document.getElementById('26_367_58_2');
    var R58_C3 = document.getElementById('26_367_58_3');
    var R58_C4 = document.getElementById('26_367_58_4');
    var R58_C5 = document.getElementById('26_367_58_5');
    var R58_C6 = document.getElementById('26_367_58_6');
    var R59_C1 = document.getElementById('26_367_59_1');
    var R59_C2 = document.getElementById('26_367_59_2');
    var R59_C3 = document.getElementById('26_367_59_3');
    var R59_C4 = document.getElementById('26_367_59_4');
    var R59_C5 = document.getElementById('26_367_59_5');
    var R59_C6 = document.getElementById('26_367_59_6');
    var R60_C1 = document.getElementById('26_367_60_1');
    var R60_C2 = document.getElementById('26_367_60_2');
    var R60_C3 = document.getElementById('26_367_60_3');
    var R60_C4 = document.getElementById('26_367_60_4');
    var R60_C5 = document.getElementById('26_367_60_5');
    var R60_C6 = document.getElementById('26_367_60_6');
    var R61_C1 = document.getElementById('26_367_61_1');
    var R61_C2 = document.getElementById('26_367_61_2');
    var R61_C3 = document.getElementById('26_367_61_3');
    var R61_C4 = document.getElementById('26_367_61_4');
    var R61_C5 = document.getElementById('26_367_61_5');
    var R61_C6 = document.getElementById('26_367_61_6');
    var R62_C1 = document.getElementById('26_367_62_1');
    var R62_C2 = document.getElementById('26_367_62_2');
    var R62_C3 = document.getElementById('26_367_62_3');
    var R62_C4 = document.getElementById('26_367_62_4');
    var R62_C5 = document.getElementById('26_367_62_5');
    var R62_C6 = document.getElementById('26_367_62_6');
    var R63_C1 = document.getElementById('26_367_63_1');
    var R63_C2 = document.getElementById('26_367_63_2');
    var R63_C3 = document.getElementById('26_367_63_3');
    var R63_C4 = document.getElementById('26_367_63_4');
    var R63_C5 = document.getElementById('26_367_63_5');
    var R63_C6 = document.getElementById('26_367_63_6');
    var R64_C1 = document.getElementById('26_367_64_1');
    var R64_C2 = document.getElementById('26_367_64_2');
    var R64_C3 = document.getElementById('26_367_64_3');
    var R64_C4 = document.getElementById('26_367_64_4');
    var R64_C5 = document.getElementById('26_367_64_5');
    var R64_C6 = document.getElementById('26_367_64_6');
    var R65_C1 = document.getElementById('26_367_65_1');
    var R65_C2 = document.getElementById('26_367_65_2');
    var R65_C3 = document.getElementById('26_367_65_3');
    var R65_C4 = document.getElementById('26_367_65_4');
    var R65_C5 = document.getElementById('26_367_65_5');
    var R65_C6 = document.getElementById('26_367_65_6');
    //--Legume de pe teren acoperit – total-------------
    var R66_C1 = document.getElementById('26_367_66_1');
    var R66_C2 = document.getElementById('26_367_66_2');
    var R66_C3 = document.getElementById('26_367_66_3');
    var R66_C4 = document.getElementById('26_367_66_4');
    var R66_C5 = document.getElementById('26_367_66_5');
    var R66_C6 = document.getElementById('26_367_66_6');
    var R67_C1 = document.getElementById('26_367_67_1');
    var R67_C2 = document.getElementById('26_367_67_2');
    var R67_C3 = document.getElementById('26_367_67_3');
    var R67_C4 = document.getElementById('26_367_67_4');
    var R67_C5 = document.getElementById('26_367_67_5');
    var R67_C6 = document.getElementById('26_367_67_6');
    var R68_C1 = document.getElementById('26_367_68_1');
    var R68_C2 = document.getElementById('26_367_68_2');
    var R68_C3 = document.getElementById('26_367_68_3');
    var R68_C4 = document.getElementById('26_367_68_4');
    var R68_C5 = document.getElementById('26_367_68_5');
    var R68_C6 = document.getElementById('26_367_68_6');
    var R69_C1 = document.getElementById('26_367_69_1');
    var R69_C2 = document.getElementById('26_367_69_2');
    var R69_C3 = document.getElementById('26_367_69_3');
    var R69_C4 = document.getElementById('26_367_69_4');
    var R69_C5 = document.getElementById('26_367_69_5');
    var R69_C6 = document.getElementById('26_367_69_6');
    //-----Culturi bostănoase alimentare – total--------
    var R70_C1 = document.getElementById('26_367_70_1');
    var R70_C2 = document.getElementById('26_367_70_2');
    var R70_C3 = document.getElementById('26_367_70_3');
    var R70_C4 = document.getElementById('26_367_70_4');
    var R70_C5 = document.getElementById('26_367_70_5');
    var R70_C6 = document.getElementById('26_367_70_6');
    var R71_C1 = document.getElementById('26_367_71_1');
    var R71_C2 = document.getElementById('26_367_71_2');
    var R71_C3 = document.getElementById('26_367_71_3');
    var R71_C4 = document.getElementById('26_367_71_4');
    var R71_C5 = document.getElementById('26_367_71_5');
    var R71_C6 = document.getElementById('26_367_71_6');
    var R72_C1 = document.getElementById('26_367_72_1');
    var R72_C2 = document.getElementById('26_367_72_2');
    var R72_C3 = document.getElementById('26_367_72_3');
    var R72_C4 = document.getElementById('26_367_72_4');
    var R72_C5 = document.getElementById('26_367_72_5');
    var R72_C6 = document.getElementById('26_367_72_6');
    //--------------------------------------------------
    var R73_C1 = document.getElementById('26_367_73_1');
    var R73_C2 = document.getElementById('26_367_73_2');
    var R73_C3 = document.getElementById('26_367_73_3');
    var R73_C4 = document.getElementById('26_367_73_4');
    var R73_C5 = document.getElementById('26_367_73_5');
    var R73_C6 = document.getElementById('26_367_73_6');
    var R74_C1 = document.getElementById('26_367_74_1');
    var R74_C2 = document.getElementById('26_367_74_2');
    var R74_C3 = document.getElementById('26_367_74_3');
    var R74_C4 = document.getElementById('26_367_74_4');
    var R74_C5 = document.getElementById('26_367_74_5');
    var R74_C6 = document.getElementById('26_367_74_6');
    var R75_C1 = document.getElementById('26_367_75_1');
    var R75_C2 = document.getElementById('26_367_75_2');
    var R75_C3 = document.getElementById('26_367_75_3');
    var R75_C4 = document.getElementById('26_367_75_4');
    var R75_C5 = document.getElementById('26_367_75_5');
    var R75_C6 = document.getElementById('26_367_75_6');
    var R130_C1 = document.getElementById('26_367_130_1');
    var R130_C2 = document.getElementById('26_367_130_2');
    var R130_C3 = document.getElementById('26_367_130_3');
    var R130_C4 = document.getElementById('26_367_130_4');
    var R130_C5 = document.getElementById('26_367_130_5');
    var R130_C6 = document.getElementById('26_367_130_6');
    var R131_C1 = document.getElementById('26_367_131_1');
    var R131_C2 = document.getElementById('26_367_131_2');
    var R131_C3 = document.getElementById('26_367_131_3');
    var R131_C4 = document.getElementById('26_367_131_4');
    var R131_C5 = document.getElementById('26_367_131_5');
    var R131_C6 = document.getElementById('26_367_131_6');
    var R76_C1 = document.getElementById('26_367_76_1');
    var R76_C2 = document.getElementById('26_367_76_2');
    var R76_C3 = document.getElementById('26_367_76_3');
    var R76_C4 = document.getElementById('26_367_76_4');
    var R76_C5 = document.getElementById('26_367_76_5');
    var R76_C6 = document.getElementById('26_367_76_6');
    //-----------Plantele de nutreţ---------------------
    var R77_C1 = document.getElementById('26_367_77_1');
    var R77_C2 = document.getElementById('26_367_77_2');
    var R77_C3 = document.getElementById('26_367_77_3');
    var R77_C4 = document.getElementById('26_367_77_4');
    var R77_C5 = document.getElementById('26_367_77_5');
    var R77_C6 = document.getElementById('26_367_77_6');
    var R78_C1 = document.getElementById('26_367_78_1');
    var R78_C2 = document.getElementById('26_367_78_2');
    var R78_C3 = document.getElementById('26_367_78_3');
    var R78_C4 = document.getElementById('26_367_78_4');
    var R78_C5 = document.getElementById('26_367_78_5');
    var R78_C6 = document.getElementById('26_367_78_6');
    var R79_C1 = document.getElementById('26_367_79_1');
    var R79_C2 = document.getElementById('26_367_79_2');
    var R79_C3 = document.getElementById('26_367_79_3');
    var R79_C4 = document.getElementById('26_367_79_4');
    var R79_C5 = document.getElementById('26_367_79_5');
    var R79_C6 = document.getElementById('26_367_79_6');
    var R80_C1 = document.getElementById('26_367_80_1');
    var R80_C2 = document.getElementById('26_367_80_2');
    var R80_C3 = document.getElementById('26_367_80_3');
    var R80_C4 = document.getElementById('26_367_80_4');
    var R80_C5 = document.getElementById('26_367_80_5');
    var R80_C6 = document.getElementById('26_367_80_6');
    var R81_C1 = document.getElementById('26_367_81_1');
    var R81_C2 = document.getElementById('26_367_81_2');
    var R81_C3 = document.getElementById('26_367_81_3');
    var R81_C4 = document.getElementById('26_367_81_4');
    var R81_C5 = document.getElementById('26_367_81_5');
    var R81_C6 = document.getElementById('26_367_81_6');
    var R82_C1 = document.getElementById('26_367_82_1');
    var R82_C2 = document.getElementById('26_367_82_2');
    var R82_C3 = document.getElementById('26_367_82_3');
    var R82_C4 = document.getElementById('26_367_82_4');
    var R82_C5 = document.getElementById('26_367_82_5');
    var R82_C6 = document.getElementById('26_367_82_6');
    var R83_C1 = document.getElementById('26_367_83_1');
    var R83_C2 = document.getElementById('26_367_83_2');
    var R83_C3 = document.getElementById('26_367_83_3');
    var R83_C4 = document.getElementById('26_367_83_4');
    var R83_C5 = document.getElementById('26_367_83_5');
    var R83_C6 = document.getElementById('26_367_83_6');
    var R84_C1 = document.getElementById('26_367_84_1');
    var R84_C2 = document.getElementById('26_367_84_2');
    var R84_C3 = document.getElementById('26_367_84_3');
    var R84_C4 = document.getElementById('26_367_84_4');
    var R84_C5 = document.getElementById('26_367_84_5');
    var R84_C6 = document.getElementById('26_367_84_6');
    var R85_C1 = document.getElementById('26_367_85_1');
    var R85_C2 = document.getElementById('26_367_85_2');
    var R85_C3 = document.getElementById('26_367_85_3');
    var R85_C4 = document.getElementById('26_367_85_4');
    var R85_C5 = document.getElementById('26_367_85_5');
    var R85_C6 = document.getElementById('26_367_85_6');
    var R86_C1 = document.getElementById('26_367_86_1');
    var R86_C2 = document.getElementById('26_367_86_2');
    var R86_C3 = document.getElementById('26_367_86_3');
    var R86_C4 = document.getElementById('26_367_86_4');
    var R86_C5 = document.getElementById('26_367_86_5');
    var R86_C6 = document.getElementById('26_367_86_6');
    var R87_C1 = document.getElementById('26_367_87_1');
    var R87_C2 = document.getElementById('26_367_87_2');
    var R87_C3 = document.getElementById('26_367_87_3');
    var R87_C4 = document.getElementById('26_367_87_4');
    var R87_C5 = document.getElementById('26_367_87_5');
    var R87_C6 = document.getElementById('26_367_87_6');
    var R88_C1 = document.getElementById('26_367_88_1');
    var R88_C2 = document.getElementById('26_367_88_2');
    var R88_C3 = document.getElementById('26_367_88_3');
    var R88_C4 = document.getElementById('26_367_88_4');
    var R88_C5 = document.getElementById('26_367_88_5');
    var R88_C6 = document.getElementById('26_367_88_6');
    var R89_C1 = document.getElementById('26_367_89_1');
    var R89_C2 = document.getElementById('26_367_89_2');
    var R89_C3 = document.getElementById('26_367_89_3');
    var R89_C4 = document.getElementById('26_367_89_4');
    var R89_C5 = document.getElementById('26_367_89_5');
    var R89_C6 = document.getElementById('26_367_89_6');
    var R90_C1 = document.getElementById('26_367_90_1');
    var R90_C2 = document.getElementById('26_367_90_2');
    var R90_C3 = document.getElementById('26_367_90_3');
    var R90_C4 = document.getElementById('26_367_90_4');
    var R90_C5 = document.getElementById('26_367_90_5');
    var R90_C6 = document.getElementById('26_367_90_6');
    var R91_C1 = document.getElementById('26_367_91_1');
    var R91_C2 = document.getElementById('26_367_91_2');
    var R91_C3 = document.getElementById('26_367_91_3');
    var R91_C4 = document.getElementById('26_367_91_4');
    var R91_C5 = document.getElementById('26_367_91_5');
    var R91_C6 = document.getElementById('26_367_91_6');
    var R92_C1 = document.getElementById('26_367_92_1');
    var R92_C2 = document.getElementById('26_367_92_2');
    var R92_C3 = document.getElementById('26_367_92_3');
    var R92_C4 = document.getElementById('26_367_92_4');
    var R92_C5 = document.getElementById('26_367_92_5');
    var R92_C6 = document.getElementById('26_367_92_6');
    var R93_C1 = document.getElementById('26_367_93_1');
    var R93_C2 = document.getElementById('26_367_93_2');
    var R93_C3 = document.getElementById('26_367_93_3');
    var R93_C4 = document.getElementById('26_367_93_4');
    var R93_C5 = document.getElementById('26_367_93_5');
    var R93_C6 = document.getElementById('26_367_93_6');
    var R94_C1 = document.getElementById('26_367_94_1');
    var R94_C2 = document.getElementById('26_367_94_2');
    var R94_C3 = document.getElementById('26_367_94_3');
    var R94_C4 = document.getElementById('26_367_94_4');
    var R94_C5 = document.getElementById('26_367_94_5');
    var R94_C6 = document.getElementById('26_367_94_6');
    var R95_C1 = document.getElementById('26_367_95_1');
    var R95_C2 = document.getElementById('26_367_95_2');
    var R95_C3 = document.getElementById('26_367_95_3');
    var R95_C4 = document.getElementById('26_367_95_4');
    var R95_C5 = document.getElementById('26_367_95_5');
    var R95_C6 = document.getElementById('26_367_95_6');
    var R96_C1 = document.getElementById('26_367_96_1');
    var R96_C2 = document.getElementById('26_367_96_2');
    var R96_C3 = document.getElementById('26_367_96_3');
    var R96_C4 = document.getElementById('26_367_96_4');
    var R96_C5 = document.getElementById('26_367_96_5');
    var R96_C6 = document.getElementById('26_367_96_6');
    var R97_C1 = document.getElementById('26_367_97_1');
    var R97_C2 = document.getElementById('26_367_97_2');
    var R97_C3 = document.getElementById('26_367_97_3');
    var R97_C4 = document.getElementById('26_367_97_4');
    var R97_C5 = document.getElementById('26_367_97_5');
    var R97_C6 = document.getElementById('26_367_97_6');
    var R98_C1 = document.getElementById('26_367_98_1');
    var R98_C2 = document.getElementById('26_367_98_2');
    var R98_C3 = document.getElementById('26_367_98_3');
    var R98_C4 = document.getElementById('26_367_98_4');
    var R98_C5 = document.getElementById('26_367_98_5');
    var R98_C6 = document.getElementById('26_367_98_6');
    var R99_C1 = document.getElementById('26_367_99_1');
    var R99_C2 = document.getElementById('26_367_99_2');
    var R99_C3 = document.getElementById('26_367_99_3');
    var R99_C4 = document.getElementById('26_367_99_4');
    var R99_C5 = document.getElementById('26_367_99_5');
    var R99_C6 = document.getElementById('26_367_99_6');
    var R132_C1 = document.getElementById('26_367_132_1');
    var R132_C2 = document.getElementById('26_367_132_2');
    var R132_C3 = document.getElementById('26_367_132_3');
    var R132_C4 = document.getElementById('26_367_132_4');
    var R132_C5 = document.getElementById('26_367_132_5');
    var R132_C6 = document.getElementById('26_367_132_6');
    var R133_C1 = document.getElementById('26_367_133_1');
    var R133_C2 = document.getElementById('26_367_133_2');
    var R133_C3 = document.getElementById('26_367_133_3');
    var R133_C4 = document.getElementById('26_367_133_4');
    var R133_C5 = document.getElementById('26_367_133_5');
    var R133_C6 = document.getElementById('26_367_133_6');
    var R134_C1 = document.getElementById('26_367_134_1');
    var R134_C2 = document.getElementById('26_367_134_2');
    var R134_C3 = document.getElementById('26_367_134_3');
    var R134_C4 = document.getElementById('26_367_134_4');
    var R134_C5 = document.getElementById('26_367_134_5');
    var R134_C6 = document.getElementById('26_367_134_6');
    var R100_C1 = document.getElementById('26_367_100_1');
    var R100_C2 = document.getElementById('26_367_100_2');
    var R100_C3 = document.getElementById('26_367_100_3');
    var R100_C4 = document.getElementById('26_367_100_4');
    var R100_C5 = document.getElementById('26_367_100_5');
    var R100_C6 = document.getElementById('26_367_100_6');
    var R101_C1 = document.getElementById('26_367_101_1');
    var R101_C2 = document.getElementById('26_367_101_2');
    var R101_C3 = document.getElementById('26_367_101_3');
    var R101_C4 = document.getElementById('26_367_101_4');
    var R101_C5 = document.getElementById('26_367_101_5');
    var R101_C6 = document.getElementById('26_367_101_6');
    var R102_C1 = document.getElementById('26_367_102_1');
    var R102_C2 = document.getElementById('26_367_102_2');
    var R102_C3 = document.getElementById('26_367_102_3');
    var R102_C4 = document.getElementById('26_367_102_4');
    var R102_C5 = document.getElementById('26_367_102_5');
    var R102_C6 = document.getElementById('26_367_102_6');
    var R103_C1 = document.getElementById('26_367_103_1');
    var R103_C2 = document.getElementById('26_367_103_2');
    var R103_C3 = document.getElementById('26_367_103_3');
    var R103_C4 = document.getElementById('26_367_103_4');
    var R103_C5 = document.getElementById('26_367_103_5');
    var R103_C6 = document.getElementById('26_367_103_6');
	
    var R136_C1 = document.getElementById('26_367_136_1');
    var R136_C2 = document.getElementById('26_367_136_2');
    var R136_C3 = document.getElementById('26_367_136_3');
    var R136_C4 = document.getElementById('26_367_136_4');
    var R136_C5 = document.getElementById('26_367_136_5');
    var R136_C6 = document.getElementById('26_367_136_6');
	
    var R104_C1 = document.getElementById('26_367_104_1');
    var R104_C2 = document.getElementById('26_367_104_2');
    var R104_C3 = document.getElementById('26_367_104_3');
    var R104_C4 = document.getElementById('26_367_104_4');
    var R104_C5 = document.getElementById('26_367_104_5');
    var R104_C6 = document.getElementById('26_367_104_6');
    var R105_C1 = document.getElementById('26_367_105_1');
    var R105_C2 = document.getElementById('26_367_105_2');
    var R105_C3 = document.getElementById('26_367_105_3');
    var R105_C4 = document.getElementById('26_367_105_4');
    var R105_C5 = document.getElementById('26_367_105_5');
    var R105_C6 = document.getElementById('26_367_105_6');
    var R106_C1 = document.getElementById('26_367_106_1');
    var R106_C2 = document.getElementById('26_367_106_2');
    var R106_C3 = document.getElementById('26_367_106_3');
    var R106_C4 = document.getElementById('26_367_106_4');
    var R106_C5 = document.getElementById('26_367_106_5');
    var R106_C6 = document.getElementById('26_367_106_6');
    var R107_C1 = document.getElementById('26_367_107_1');
    var R107_C2 = document.getElementById('26_367_107_2');
    var R107_C3 = document.getElementById('26_367_107_3');
    var R107_C4 = document.getElementById('26_367_107_4');
    var R107_C5 = document.getElementById('26_367_107_5');
    var R107_C6 = document.getElementById('26_367_107_6');
    var R108_C1 = document.getElementById('26_367_108_1');
    var R108_C2 = document.getElementById('26_367_108_2');
    var R108_C3 = document.getElementById('26_367_108_3');
    var R108_C4 = document.getElementById('26_367_108_4');
    var R108_C5 = document.getElementById('26_367_108_5');
    var R108_C6 = document.getElementById('26_367_108_6');
    var R109_C1 = document.getElementById('26_367_109_1');
    var R109_C2 = document.getElementById('26_367_109_2');
    var R109_C3 = document.getElementById('26_367_109_3');
    var R109_C4 = document.getElementById('26_367_109_4');
    var R109_C5 = document.getElementById('26_367_109_5');
    var R109_C6 = document.getElementById('26_367_109_6');
    var R110_C1 = document.getElementById('26_367_110_1');
    var R110_C2 = document.getElementById('26_367_110_2');
    var R110_C3 = document.getElementById('26_367_110_3');
    var R110_C4 = document.getElementById('26_367_110_4');
    var R110_C5 = document.getElementById('26_367_110_5');
    var R110_C6 = document.getElementById('26_367_110_6');
    var R135_C1 = document.getElementById('26_367_135_1');
    var R135_C2 = document.getElementById('26_367_135_2');
    var R135_C3 = document.getElementById('26_367_135_3');
    var R135_C4 = document.getElementById('26_367_135_4');
    var R135_C5 = document.getElementById('26_367_135_5');
    var R135_C6 = document.getElementById('26_367_135_6');
	
    
    //--------------readOnly input -----------------------
    R10_C1.readOnly = true;
    R10_C2.readOnly = true;
    R10_C3.readOnly = true;
    R10_C4.readOnly = true;
    R10_C5.readOnly = true;
    R10_C6.readOnly = true;
    R11_C3.readOnly = true;
    R11_C6.readOnly = true;
    R12_C3.readOnly = true;
    R12_C6.readOnly = true;
    R13_C3.readOnly = true;
    R13_C6.readOnly = true;
    R14_C3.readOnly = true;
    R14_C6.readOnly = true;
    R15_C3.readOnly = true;
    R15_C6.readOnly = true;
    R16_C3.readOnly = true;
    R16_C6.readOnly = true;
    R17_C3.readOnly = true;
    R17_C6.readOnly = true;
    R18_C3.readOnly = true;
    R18_C6.readOnly = true;
    R19_C3.readOnly = true;
    R19_C6.readOnly = true;
    R20_C3.readOnly = true;
    R20_C6.readOnly = true;
    R21_C3.readOnly = true;
    R21_C6.readOnly = true;
    R22_C3.readOnly = true;
    R22_C6.readOnly = true;
    R23_C3.readOnly = true;
    R23_C6.readOnly = true;
    R24_C3.readOnly = true;
    R24_C6.readOnly = true;
    R25_C3.readOnly = true;
    R25_C6.readOnly = true;
    R26_C3.readOnly = true;
    R26_C6.readOnly = true;
    R27_C3.readOnly = true;
    R27_C6.readOnly = true;
    R28_C3.readOnly = true;
    R28_C6.readOnly = true;
    R29_C3.readOnly = true;
    R29_C6.readOnly = true;
    R30_C3.readOnly = true;
    R30_C6.readOnly = true;
    R31_C3.readOnly = true;
    R31_C6.readOnly = true;
    R32_C3.readOnly = true;
    R32_C6.readOnly = true;
    R33_C3.readOnly = true;
    R33_C6.readOnly = true;
    R34_C1.readOnly = true;
    R34_C2.readOnly = true;
    R34_C3.readOnly = true;
    R34_C4.readOnly = true;
    R34_C5.readOnly = true;
    R34_C6.readOnly = true;
    R35_C3.readOnly = true;
    R35_C6.readOnly = true;
    R36_C3.readOnly = true;
    R36_C6.readOnly = true;
    R37_C3.readOnly = true;
    R37_C6.readOnly = true;
    R38_C3.readOnly = true;
    R38_C6.readOnly = true;
    R39_C3.readOnly = true;
    R39_C6.readOnly = true;
    R40_C3.readOnly = true;
    R40_C6.readOnly = true;
    R41_C3.readOnly = true;
    R41_C6.readOnly = true;
    R42_C3.readOnly = true;
    R42_C6.readOnly = true;
    R43_C3.readOnly = true;
    R43_C6.readOnly = true;
    R44_C3.readOnly = true;
    R44_C6.readOnly = true;
    R45_C3.readOnly = true;
    R45_C6.readOnly = true;
    R46_C3.readOnly = true;
    R46_C6.readOnly = true;
    R47_C3.readOnly = true;
    R47_C6.readOnly = true;
    R48_C3.readOnly = true;
    R48_C6.readOnly = true;
    R49_C3.readOnly = true;
    R49_C6.readOnly = true;
    R50_C1.readOnly = true;
    R50_C2.readOnly = true;
    R50_C3.readOnly = true;
    R50_C4.readOnly = true;
    R50_C5.readOnly = true;
    R50_C6.readOnly = true;
    R51_C3.readOnly = true;
    R51_C6.readOnly = true;
    R52_C3.readOnly = true;
    R52_C6.readOnly = true;
    R53_C3.readOnly = true;
    R53_C6.readOnly = true;
    R54_C3.readOnly = true;
    R54_C6.readOnly = true;
    R55_C3.readOnly = true;
    R55_C6.readOnly = true;
    R56_C3.readOnly = true;
    R56_C6.readOnly = true;
    R57_C3.readOnly = true;
    R57_C6.readOnly = true;
    R58_C3.readOnly = true;
    R58_C6.readOnly = true;
    R59_C3.readOnly = true;
    R59_C6.readOnly = true;
    R60_C3.readOnly = true;
    R60_C6.readOnly = true;
    R61_C3.readOnly = true;
    R61_C6.readOnly = true;
    R62_C3.readOnly = true;
    R62_C6.readOnly = true;
    R63_C3.readOnly = true;
    R63_C6.readOnly = true;
    R64_C3.readOnly = true;
    R64_C6.readOnly = true;
    R65_C3.readOnly = true;
    R65_C6.readOnly = true;
    R66_C1.readOnly = true;
    R66_C2.readOnly = true;
    R66_C3.readOnly = true;
    R66_C4.readOnly = true;
    R66_C5.readOnly = true;
    R66_C6.readOnly = true;
    R67_C3.readOnly = true;
    R67_C6.readOnly = true;
    R68_C3.readOnly = true;
    R68_C6.readOnly = true;
    R69_C3.readOnly = true;
    R69_C6.readOnly = true;
    R70_C1.readOnly = true;
    R70_C2.readOnly = true;
    R70_C3.readOnly = true;
    R70_C4.readOnly = true;
    R70_C5.readOnly = true;
    R70_C6.readOnly = true;
    R71_C3.readOnly = true;
    R71_C6.readOnly = true;
    R72_C3.readOnly = true;
    R72_C6.readOnly = true;
    R73_C3.readOnly = true;
    R73_C6.readOnly = true;
    R74_C3.readOnly = true;
    R74_C6.readOnly = true;
    R75_C3.readOnly = true;
    R75_C6.readOnly = true;
    R130_C3.readOnly = true;
    R130_C6.readOnly = true;
    R131_C3.readOnly = true;
    R131_C6.readOnly = true;
    R76_C3.readOnly = true;
    R76_C6.readOnly = true;
    R77_C3.readOnly = true;
    R77_C6.readOnly = true;
    R78_C3.readOnly = true;
    R78_C6.readOnly = true;
    R79_C3.readOnly = true;
    R79_C6.readOnly = true;
    R80_C3.readOnly = true;
    R80_C6.readOnly = true;
    R81_C3.readOnly = true;
    R81_C6.readOnly = true;
    R82_C3.readOnly = true;
    R82_C6.readOnly = true;
    R83_C3.readOnly = true;
    R83_C6.readOnly = true;
    R84_C3.readOnly = true;
    R84_C6.readOnly = true;
    R85_C3.readOnly = true;
    R85_C6.readOnly = true;
    R86_C1.readOnly = true;
    R86_C2.readOnly = true;
    R86_C3.readOnly = true;
    R86_C4.readOnly = true;
    R86_C5.readOnly = true;
    R86_C6.readOnly = true;
    R87_C1.readOnly = true;
    R87_C2.readOnly = true;
    R87_C3.readOnly = true;
    R87_C4.readOnly = true;
    R87_C5.readOnly = true;
    R87_C6.readOnly = true;
    R88_C3.readOnly = true;
    R88_C6.readOnly = true;
    R89_C3.readOnly = true;
    R89_C6.readOnly = true;
    R90_C3.readOnly = true;
    R90_C6.readOnly = true;
    R91_C3.readOnly = true;
    R91_C6.readOnly = true;
    R92_C3.readOnly = true;
    R92_C6.readOnly = true;
    R93_C3.readOnly = true;
    R93_C6.readOnly = true;
    R94_C1.readOnly = true;
    R94_C2.readOnly = true;
    R94_C3.readOnly = true;
    R94_C4.readOnly = true;
    R94_C5.readOnly = true;
    R94_C6.readOnly = true;
    R95_C3.readOnly = true;
    R95_C6.readOnly = true;
    R96_C3.readOnly = true;
    R96_C6.readOnly = true;
    R97_C3.readOnly = true;
    R97_C6.readOnly = true;
    R98_C3.readOnly = true;
    R98_C6.readOnly = true;
    R99_C1.readOnly = true;
    R99_C2.readOnly = true;
    R99_C3.readOnly = true;
    R99_C4.readOnly = true;
    R99_C5.readOnly = true;
    R99_C6.readOnly = true;
    R132_C3.readOnly = true;
    R132_C6.readOnly = true;
    R133_C3.readOnly = true;
    R133_C6.readOnly = true;
    R134_C3.readOnly = true;
    R134_C6.readOnly = true;
    R100_C1.readOnly = true;
    R100_C2.readOnly = true;
    R100_C3.readOnly = true;
    R100_C4.readOnly = true;
    R100_C5.readOnly = true;
    R100_C6.readOnly = true;
    R101_C3.readOnly = true;
    R101_C6.readOnly = true;
    R102_C3.readOnly = true;
    R102_C6.readOnly = true;
    R103_C1.readOnly = true;
    R103_C2.readOnly = true;
    R103_C3.readOnly = true;
    R103_C4.readOnly = true;
    R103_C5.readOnly = true;
    R103_C6.readOnly = true;
    R136_C3.readOnly = true;
    R136_C6.readOnly = true;
    R104_C3.readOnly = true;
    R104_C6.readOnly = true;
    R105_C3.readOnly = true;
    R105_C6.readOnly = true;
    R106_C3.readOnly = true;
    R106_C6.readOnly = true;
    R107_C3.readOnly = true;
    R107_C6.readOnly = true;
    R108_C3.readOnly = true;
    R108_C6.readOnly = true;
    R109_C3.readOnly = true;
    R109_C6.readOnly = true;
    R110_C3.readOnly = true;
    R110_C6.readOnly = true;
    R135_C3.readOnly = true;
    R135_C6.readOnly = true;
    
//-------------------------------Rind 10------------------------------------------------------
    R10_C1.value = parseInt(R11_C1.value*1 + R12_C1.value*1 + R13_C1.value*1 + R14_C1.value*1 + R15_C1.value*1 + R16_C1.value*1 + R17_C1.value*1 + R18_C1.value*1+ 
                   R19_C1.value*1 + R20_C1.value*1 + R21_C1.value*1 + R22_C1.value*1 + R23_C1.value*1 + R24_C1.value*1 + R25_C1.value*1 + R26_C1.value*1);
    R10_C2.value = parseInt(R11_C2.value*1 + R12_C2.value*1 + R13_C2.value*1 + R14_C2.value*1 + R15_C2.value*1 + R16_C2.value*1 + R17_C2.value*1 + R18_C2.value*1+ 
                   R19_C2.value*1 + R20_C2.value*1 + R21_C2.value*1 + R22_C2.value*1 + R23_C2.value*1 + R24_C2.value*1 + R25_C2.value*1 + R26_C2.value*1);
    if(R10_C1.value != "" || R10_C2.value != ""){
        R10_C3.value = Math.round(R10_C2.value/R10_C1.value*Math.pow(10,2))/Math.pow(10,2);} 
    if((R10_C1.value == "" && R10_C2.value == "") || (R10_C1.value == 0 && R10_C2.value == 0)){
        R10_C3.value = "";R10_C2.value = "";R10_C1.value = "";} 
    R10_C4.value = parseInt(R11_C4.value*1 + R12_C4.value*1 + R13_C4.value*1 + R14_C4.value*1 + R15_C4.value*1 + R16_C4.value*1 + R17_C4.value*1 + R18_C4.value*1+ 
                   R19_C4.value*1 + R20_C4.value*1 + R21_C4.value*1 + R22_C4.value*1 + R23_C4.value*1 + R24_C4.value*1 + R25_C4.value*1 + R26_C4.value*1);
    R10_C5.value = parseInt(R11_C5.value*1 + R12_C5.value*1 + R13_C5.value*1 + R14_C5.value*1 + R15_C5.value*1 + R16_C5.value*1 + R17_C5.value*1 + R18_C5.value*1+ 
                   R19_C5.value*1 + R20_C5.value*1 + R21_C5.value*1 + R22_C5.value*1 + R23_C5.value*1 + R24_C5.value*1 + R25_C5.value*1 + R26_C5.value*1);
    if(R10_C4.value != "" || R10_C5.value != ""){
        R10_C6.value = Math.round(R10_C5.value/R10_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if((R10_C4.value == "" && R10_C5.value == "") || (R10_C4.value == 0 && R10_C5.value == 0)){
        R10_C6.value = "";R10_C5.value = "";R10_C4.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 11------------------------------------------------------
    if(R11_C1.value != "" || R11_C2.value != ""){
        R11_C3.value = Math.round(R11_C2.value/R11_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R11_C1.value == "" && R11_C2.value == ""){
        R11_C3.value = "";} 
    if(R11_C4.value != "" || R11_C5.value != ""){
        R11_C6.value = Math.round(R11_C5.value/R11_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R11_C4.value == "" && R11_C5.value == ""){
        R11_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 12------------------------------------------------------
    if(R12_C1.value != "" || R12_C2.value != ""){
        R12_C3.value = Math.round(R12_C2.value/R12_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R12_C1.value == "" && R12_C2.value == ""){
        R12_C3.value = "";} 
    if(R12_C4.value != "" || R12_C5.value != ""){
        R12_C6.value = Math.round(R12_C5.value/R12_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R12_C4.value == "" && R12_C5.value == ""){
        R12_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 13------------------------------------------------------
    if(R13_C1.value != "" || R13_C2.value != ""){
        R13_C3.value = Math.round(R13_C2.value/R13_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R13_C1.value == "" && R13_C2.value == ""){
        R13_C3.value = "";} 
    if(R13_C4.value != "" || R13_C5.value != ""){
        R13_C6.value = Math.round(R13_C5.value/R13_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R13_C4.value == "" && R13_C5.value == ""){
        R13_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 14------------------------------------------------------
    if(R14_C1.value != "" || R14_C2.value != ""){
        R14_C3.value = Math.round(R14_C2.value/R14_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R14_C1.value == "" && R14_C2.value == ""){
        R14_C3.value = "";} 
    if(R14_C4.value != "" || R14_C5.value != ""){
        R14_C6.value = Math.round(R14_C5.value/R14_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R14_C4.value == "" && R14_C5.value == ""){
        R14_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 15------------------------------------------------------
    if(R15_C1.value != "" || R15_C2.value != ""){
        R15_C3.value = Math.round(R15_C2.value/R15_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R15_C1.value == "" && R15_C2.value == ""){
        R15_C3.value = "";} 
    if(R15_C4.value != "" || R15_C5.value != ""){
        R15_C6.value = Math.round(R15_C5.value/R15_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R15_C4.value == "" && R15_C5.value == ""){
        R15_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 16------------------------------------------------------
    if(R16_C1.value != "" || R16_C2.value != ""){
        R16_C3.value = Math.round(R16_C2.value/R16_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R16_C1.value == "" && R16_C2.value == ""){
        R16_C3.value = "";} 
    if(R16_C4.value != "" || R16_C6.value != ""){
        R16_C6.value = Math.round(R16_C5.value/R16_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R16_C4.value == "" && R16_C5.value == ""){
        R16_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 17------------------------------------------------------
    if(R17_C1.value != "" || R17_C2.value != ""){
        R17_C3.value = Math.round(R17_C2.value/R17_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R17_C1.value == "" && R17_C2.value == ""){
        R17_C3.value = "";} 
    if(R17_C4.value != "" || R17_C6.value != ""){
        R17_C6.value = Math.round(R17_C5.value/R17_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R17_C4.value == "" && R17_C5.value == ""){
        R17_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 18------------------------------------------------------
    if(R18_C1.value != "" || R18_C2.value != ""){
        R18_C3.value = Math.round(R18_C2.value/R18_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R18_C1.value == "" && R18_C2.value == ""){
        R18_C3.value = "";} 
    if(R18_C4.value != "" || R18_C6.value != ""){
        R18_C6.value = Math.round(R18_C5.value/R18_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R18_C4.value == "" && R18_C5.value == ""){
        R18_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 19------------------------------------------------------
    if(R19_C1.value != "" || R19_C2.value != ""){
        R19_C3.value = Math.round(R19_C2.value/R19_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R19_C1.value == "" && R19_C2.value == ""){
        R19_C3.value = "";} 
    if(R19_C4.value != "" || R19_C6.value != ""){
        R19_C6.value = Math.round(R19_C5.value/R19_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R19_C4.value == "" && R19_C5.value == ""){
        R19_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 20------------------------------------------------------
    if(R20_C1.value != "" || R20_C2.value != ""){
        R20_C3.value = Math.round(R20_C2.value/R20_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R20_C1.value == "" && R20_C2.value == ""){
        R20_C3.value = "";} 
    if(R20_C4.value != "" || R20_C6.value != ""){
        R20_C6.value = Math.round(R20_C5.value/R20_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R20_C4.value == "" && R20_C5.value == ""){
        R20_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 21------------------------------------------------------
    if(R21_C1.value != "" || R21_C2.value != ""){
        R21_C3.value = Math.round(R21_C2.value/R21_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R21_C1.value == "" && R21_C2.value == ""){
        R21_C3.value = "";} 
    if(R21_C4.value != "" || R21_C6.value != ""){
        R21_C6.value = Math.round(R21_C5.value/R21_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R21_C4.value == "" && R21_C5.value == ""){
        R21_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 22------------------------------------------------------
    if(R22_C1.value != "" || R22_C2.value != ""){
        R22_C3.value = Math.round(R22_C2.value/R22_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R22_C1.value == "" && R22_C2.value == ""){
        R22_C3.value = "";} 
    if(R22_C4.value != "" || R22_C6.value != ""){
        R22_C6.value = Math.round(R22_C5.value/R22_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R22_C4.value == "" && R22_C5.value == ""){
        R22_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 23------------------------------------------------------
    if(R23_C1.value != "" || R23_C2.value != ""){
        R23_C3.value = Math.round(R23_C2.value/R23_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R23_C1.value == "" && R23_C2.value == ""){
        R23_C3.value = "";} 
    if(R23_C4.value != "" || R23_C6.value != ""){
        R23_C6.value = Math.round(R23_C5.value/R23_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R23_C4.value == "" && R23_C5.value == ""){
        R23_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 24------------------------------------------------------
    if(R24_C1.value != "" || R24_C2.value != ""){
        R24_C3.value = Math.round(R24_C2.value/R24_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R24_C1.value == "" && R24_C2.value == ""){
        R24_C3.value = "";} 
    if(R24_C4.value != "" || R24_C6.value != ""){
        R24_C6.value = Math.round(R24_C5.value/R24_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R24_C4.value == "" && R24_C5.value == ""){
        R24_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 25------------------------------------------------------
    if(R25_C1.value != "" || R25_C2.value != ""){
        R25_C3.value = Math.round(R25_C2.value/R25_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R25_C1.value == "" && R25_C2.value == ""){
        R25_C3.value = "";} 
    if(R25_C4.value != "" || R25_C6.value != ""){
        R25_C6.value = Math.round(R25_C5.value/R25_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R25_C4.value == "" && R25_C5.value == ""){
        R25_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 26------------------------------------------------------
    if(R26_C1.value != "" || R26_C2.value != ""){
        R26_C3.value = Math.round(R26_C2.value/R26_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R26_C1.value == "" && R26_C2.value == ""){
        R26_C3.value = "";} 
    if(R26_C4.value != "" || R26_C6.value != ""){
        R26_C6.value = Math.round(R26_C5.value/R26_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R26_C4.value == "" && R26_C5.value == ""){
        R26_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-----------------------------Culturi tehnice -----------------------------------------------
//-------------------------------Rind 27------------------------------------------------------
    if(R27_C1.value != "" || R27_C2.value != ""){
        R27_C3.value = Math.round(R27_C2.value/R27_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R27_C1.value == "" && R27_C2.value == ""){
        R27_C3.value = "";} 
    if(R27_C4.value != "" || R27_C6.value != ""){
        R27_C6.value = Math.round(R27_C5.value/R27_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R27_C4.value == "" && R27_C5.value == ""){
        R27_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 28------------------------------------------------------
    if(R28_C1.value != "" || R28_C2.value != ""){
        R28_C3.value = Math.round(R28_C2.value/R28_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R28_C1.value == "" && R28_C2.value == ""){
        R28_C3.value = "";} 
    if(R28_C4.value != "" || R28_C6.value != ""){
        R28_C6.value = Math.round(R28_C5.value/R28_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R28_C4.value == "" && R28_C5.value == ""){
        R28_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 29------------------------------------------------------
    if(R29_C1.value != "" || R29_C2.value != ""){
        R29_C3.value = Math.round(R29_C2.value/R29_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R29_C1.value == "" && R29_C2.value == ""){
        R29_C3.value = "";} 
    if(R29_C4.value != "" || R29_C6.value != ""){
        R29_C6.value = Math.round(R29_C5.value/R29_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R29_C4.value == "" && R29_C5.value == ""){
        R29_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 30------------------------------------------------------
    if(R30_C1.value != "" || R30_C2.value != ""){
        R30_C3.value = Math.round(R30_C2.value/R30_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R30_C1.value == "" && R30_C2.value == ""){
        R30_C3.value = "";} 
    if(R30_C4.value != "" || R30_C6.value != ""){
        R30_C6.value = Math.round(R30_C5.value/R30_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R30_C4.value == "" && R30_C5.value == ""){
        R30_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 31------------------------------------------------------
    if(R31_C1.value != "" || R31_C2.value != ""){
        R31_C3.value = Math.round(R31_C2.value/R31_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R31_C1.value == "" && R31_C2.value == ""){
        R31_C3.value = "";} 
    if(R31_C4.value != "" || R31_C6.value != ""){
        R31_C6.value = Math.round(R31_C5.value/R31_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R31_C4.value == "" && R31_C5.value == ""){
        R31_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 32------------------------------------------------------
    if(R32_C1.value != "" || R32_C2.value != ""){
        R32_C3.value = Math.round(R32_C2.value/R32_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R32_C1.value == "" && R32_C2.value == ""){
        R32_C3.value = "";} 
    if(R32_C4.value != "" || R32_C6.value != ""){
        R32_C6.value = Math.round(R32_C5.value/R32_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R32_C4.value == "" && R32_C5.value == ""){
        R32_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 33------------------------------------------------------
    if(R33_C1.value != "" || R33_C2.value != ""){
        R33_C3.value = Math.round(R33_C2.value/R33_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R33_C1.value == "" && R33_C2.value == ""){
        R33_C3.value = "";} 
    if(R33_C4.value != "" || R33_C6.value != ""){
        R33_C6.value = Math.round(R33_C5.value/R33_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R33_C4.value == "" && R33_C5.value == ""){
        R33_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//--------------------Culturi etero-oleaginoase - total---------------------------------------
//-------------------------------Rind 34------------------------------------------------------
    R34_C1.value = parseInt(R35_C1.value*1 + R36_C1.value*1 + R37_C1.value*1 + R38_C1.value*1 + R39_C1.value*1 + R40_C1.value*1);
    R34_C2.value = parseInt(R35_C2.value*1 + R36_C2.value*1 + R37_C2.value*1 + R38_C2.value*1 + R39_C2.value*1 + R40_C2.value*1);
    if(R34_C1.value != "" || R34_C2.value != ""){
        R34_C3.value = Math.round(R34_C2.value/R34_C1.value*Math.pow(10,2))/Math.pow(10,2);} 
    if((R34_C1.value == "" && R34_C2.value == "") || (R34_C1.value == 0 && R34_C2.value == 0)){
        R34_C3.value = "";R34_C2.value = "";R34_C1.value = "";} 
    R34_C4.value = parseInt(R35_C4.value*1 + R36_C4.value*1 + R37_C4.value*1 + R38_C4.value*1 + R39_C4.value*1 + R40_C4.value*1);
    R34_C5.value = parseInt(R35_C5.value*1 + R36_C5.value*1 + R37_C5.value*1 + R38_C5.value*1 + R39_C5.value*1 + R40_C5.value*1);
    if(R34_C4.value != "" || R34_C5.value != ""){
        R34_C6.value = Math.round(R34_C5.value/R34_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if((R34_C4.value == "" && R34_C5.value == "") || (R34_C4.value == 0 && R34_C5.value == 0)){
        R34_C6.value = "";R34_C5.value = "";R34_C4.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 35------------------------------------------------------
    if(R35_C1.value != "" || R35_C2.value != ""){
        R35_C3.value = Math.round(R35_C2.value/R35_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R35_C1.value == "" && R35_C2.value == ""){
        R35_C3.value = "";} 
    if(R35_C4.value != "" || R35_C6.value != ""){
        R35_C6.value = Math.round(R35_C5.value/R35_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R35_C4.value == "" && R35_C5.value == ""){
        R35_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 36------------------------------------------------------
    if(R36_C1.value != "" || R36_C2.value != ""){
        R36_C3.value = Math.round(R36_C2.value/R36_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R36_C1.value == "" && R36_C2.value == ""){
        R36_C3.value = "";} 
    if(R36_C4.value != "" || R36_C6.value != ""){
        R36_C6.value = Math.round(R36_C5.value/R36_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R36_C4.value == "" && R36_C5.value == ""){
        R36_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 37------------------------------------------------------
    if(R37_C1.value != "" || R37_C2.value != ""){
        R37_C3.value = Math.round(R37_C2.value/R37_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R37_C1.value == "" && R37_C2.value == ""){
        R37_C3.value = "";} 
    if(R37_C4.value != "" || R37_C6.value != ""){
        R37_C6.value = Math.round(R37_C5.value/R37_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R37_C4.value == "" && R37_C5.value == ""){
        R37_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 38------------------------------------------------------
    if(R38_C1.value != "" || R38_C2.value != ""){
        R38_C3.value = Math.round(R38_C2.value/R38_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R38_C1.value == "" && R38_C2.value == ""){
        R38_C3.value = "";} 
    if(R38_C4.value != "" || R38_C6.value != ""){
        R38_C6.value = Math.round(R38_C5.value/R38_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R38_C4.value == "" && R38_C5.value == ""){
        R38_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 39------------------------------------------------------
    if(R39_C1.value != "" || R39_C2.value != ""){
        R39_C3.value = Math.round(R39_C2.value/R39_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R39_C1.value == "" && R39_C2.value == ""){
        R39_C3.value = "";} 
    if(R39_C4.value != "" || R39_C6.value != ""){
        R39_C6.value = Math.round(R39_C5.value/R39_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R39_C4.value == "" && R39_C5.value == ""){
        R39_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 40------------------------------------------------------
    if(R40_C1.value != "" || R40_C2.value != ""){
        R40_C3.value = Math.round(R40_C2.value/R40_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R40_C1.value == "" && R40_C2.value == ""){
        R40_C3.value = "";} 
    if(R40_C4.value != "" || R40_C6.value != ""){
        R40_C6.value = Math.round(R40_C5.value/R40_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R40_C4.value == "" && R40_C5.value == ""){
        R40_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 41------------------------------------------------------
    if(R41_C1.value != "" || R41_C2.value != ""){
        R41_C3.value = Math.round(R41_C2.value/R41_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R41_C1.value == "" && R41_C2.value == ""){
        R41_C3.value = "";} 
    if(R41_C4.value != "" || R41_C6.value != ""){
        R41_C6.value = Math.round(R41_C5.value/R41_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R41_C4.value == "" && R41_C5.value == ""){
        R41_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 42------------------------------------------------------
    if(R42_C1.value != "" || R42_C2.value != ""){
        R42_C3.value = Math.round(R42_C2.value/R42_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R42_C1.value == "" && R42_C2.value == ""){
        R42_C3.value = "";} 
    if(R42_C4.value != "" || R42_C6.value != ""){
        R42_C6.value = Math.round(R42_C5.value/R42_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R42_C4.value == "" && R42_C5.value == ""){
        R42_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 43------------------------------------------------------
    if(R43_C1.value != "" || R43_C2.value != ""){
        R43_C3.value = Math.round(R43_C2.value/R43_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R43_C1.value == "" && R43_C2.value == ""){
        R43_C3.value = "";} 
    if(R43_C4.value != "" || R43_C6.value != ""){
        R43_C6.value = Math.round(R43_C5.value/R43_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R43_C4.value == "" && R43_C5.value == ""){
        R43_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 44------------------------------------------------------
    if(R44_C1.value != "" || R44_C2.value != ""){
        R44_C3.value = Math.round(R44_C2.value/R44_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R44_C1.value == "" && R44_C2.value == ""){
        R44_C3.value = "";} 
    if(R44_C4.value != "" || R44_C6.value != ""){
        R44_C6.value = Math.round(R44_C5.value/R44_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R44_C4.value == "" && R44_C5.value == ""){
        R44_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 45------------------------------------------------------
    if(R45_C1.value != "" || R45_C2.value != ""){
        R45_C3.value = Math.round(R45_C2.value/R45_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R45_C1.value == "" && R45_C2.value == ""){
        R45_C3.value = "";} 
    if(R45_C4.value != "" || R45_C6.value != ""){
        R45_C6.value = Math.round(R45_C5.value/R45_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R45_C4.value == "" && R45_C5.value == ""){
        R45_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 46------------------------------------------------------
    if(R46_C1.value != "" || R46_C2.value != ""){
        R46_C3.value = Math.round(R46_C2.value/R46_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R46_C1.value == "" && R46_C2.value == ""){
        R46_C3.value = "";} 
    if(R46_C4.value != "" || R46_C6.value != ""){
        R46_C6.value = Math.round(R46_C5.value/R46_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R46_C4.value == "" && R46_C5.value == ""){
        R46_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 47------------------------------------------------------
    if(R47_C1.value != "" || R47_C2.value != ""){
        R47_C3.value = Math.round(R47_C2.value/R47_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R47_C1.value == "" && R47_C2.value == ""){
        R47_C3.value = "";} 
    if(R47_C4.value != "" || R47_C6.value != ""){
        R47_C6.value = Math.round(R47_C5.value/R47_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R47_C4.value == "" && R47_C5.value == ""){
        R47_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 48------------------------------------------------------
    if(R48_C1.value != "" || R48_C2.value != ""){
        R48_C3.value = Math.round(R48_C2.value/R48_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R48_C1.value == "" && R48_C2.value == ""){
        R48_C3.value = "";} 
    if(R48_C4.value != "" || R48_C6.value != ""){
        R48_C6.value = Math.round(R48_C5.value/R48_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R48_C4.value == "" && R48_C5.value == ""){
        R48_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 49------------------------------------------------------
    if(R49_C1.value != "" || R49_C2.value != ""){
        R49_C3.value = Math.round(R49_C2.value/R49_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R49_C1.value == "" && R49_C2.value == ""){
        R49_C3.value = "";} 
    if(R49_C4.value != "" || R49_C6.value != ""){
        R49_C6.value = Math.round(R49_C5.value/R49_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R49_C4.value == "" && R49_C5.value == ""){
        R49_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------Legume de cimp - total---------------------------------------------------
//-------------------------------Rind 50------------------------------------------------------
    R50_C1.value = parseInt(R51_C1.value*1 + R52_C1.value*1 + R53_C1.value*1 + R54_C1.value*1 + R55_C1.value*1 + R56_C1.value*1 + R57_C1.value*1 + R58_C1.value*1+ 
                   R59_C1.value*1 + R60_C1.value*1 + R61_C1.value*1 + R62_C1.value*1 + R63_C1.value*1 + R64_C1.value*1 + R65_C1.value*1);
    R50_C2.value = parseInt(R51_C2.value*1 + R52_C2.value*1 + R53_C2.value*1 + R54_C2.value*1 + R55_C2.value*1 + R56_C2.value*1 + R57_C2.value*1 + R58_C2.value*1+ 
                   R59_C2.value*1 + R60_C2.value*1 + R61_C2.value*1 + R62_C2.value*1 + R63_C2.value*1 + R64_C2.value*1 + R65_C2.value*1);
    if(R50_C1.value != "" || R50_C2.value != ""){
        R50_C3.value = Math.round(R50_C2.value/R50_C1.value*Math.pow(10,2))/Math.pow(10,2);} 
    if((R50_C1.value == "" && R50_C2.value == "") || (R50_C1.value == 0 && R50_C2.value == 0)){
        R50_C3.value = "";R50_C2.value = "";R50_C1.value = "";} 
    R50_C4.value = parseInt(R51_C4.value*1 + R52_C4.value*1 + R53_C4.value*1 + R54_C4.value*1 + R55_C4.value*1 + R56_C4.value*1 + R57_C4.value*1 + R58_C4.value*1+ 
                   R59_C4.value*1 + R60_C4.value*1 + R61_C4.value*1 + R62_C4.value*1 + R63_C4.value*1 + R64_C4.value*1 + R65_C4.value*1);
    R50_C5.value = parseInt(R51_C5.value*1 + R52_C5.value*1 + R53_C5.value*1 + R54_C5.value*1 + R55_C5.value*1 + R56_C5.value*1 + R57_C5.value*1 + R58_C5.value*1+ 
                   R59_C5.value*1 + R60_C5.value*1 + R61_C5.value*1 + R62_C5.value*1 + R63_C5.value*1 + R64_C5.value*1 + R65_C5.value*1);
    if(R50_C4.value != "" || R50_C5.value != ""){
        R50_C6.value = Math.round(R50_C5.value/R50_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if((R50_C4.value == "" && R50_C5.value == "") || R50_C4.value == 0 && R50_C5.value == 0){
        R50_C6.value = ""; R50_C5.value = ""; R50_C4.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 51------------------------------------------------------
    if(R51_C1.value != "" || R51_C2.value != ""){
        R51_C3.value = Math.round(R51_C2.value/R51_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R51_C1.value == "" && R51_C2.value == ""){
        R51_C3.value = "";} 
    if(R51_C4.value != "" || R51_C6.value != ""){
        R51_C6.value = Math.round(R51_C5.value/R51_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R51_C4.value == "" && R51_C5.value == ""){
        R51_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 52------------------------------------------------------
    if(R52_C1.value != "" || R52_C2.value != ""){
        R52_C3.value = Math.round(R52_C2.value/R52_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R52_C1.value == "" && R52_C2.value == ""){
        R52_C3.value = "";} 
    if(R52_C4.value != "" || R52_C6.value != ""){
        R52_C6.value = Math.round(R52_C5.value/R52_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R52_C4.value == "" && R52_C5.value == ""){
        R52_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 53------------------------------------------------------
    if(R53_C1.value != "" || R53_C2.value != ""){
        R53_C3.value = Math.round(R53_C2.value/R53_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R53_C1.value == "" && R53_C2.value == ""){
        R53_C3.value = "";} 
    if(R53_C4.value != "" || R53_C6.value != ""){
        R53_C6.value = Math.round(R53_C5.value/R53_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R53_C4.value == "" && R53_C5.value == ""){
        R53_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 54------------------------------------------------------
    if(R54_C1.value != "" || R54_C2.value != ""){
        R54_C3.value = Math.round(R54_C2.value/R54_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R54_C1.value == "" && R54_C2.value == ""){
        R54_C3.value = "";} 
    if(R54_C4.value != "" || R54_C6.value != ""){
        R54_C6.value = Math.round(R54_C5.value/R54_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R54_C4.value == "" && R54_C5.value == ""){
        R54_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 55------------------------------------------------------
    if(R55_C1.value != "" || R55_C2.value != ""){
        R55_C3.value = Math.round(R55_C2.value/R55_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R55_C1.value == "" && R55_C2.value == ""){
        R55_C3.value = "";} 
    if(R55_C4.value != "" || R55_C6.value != ""){
        R55_C6.value = Math.round(R55_C5.value/R55_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R55_C4.value == "" && R55_C5.value == ""){
        R55_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 56------------------------------------------------------
    if(R56_C1.value != "" || R56_C2.value != ""){
        R56_C3.value = Math.round(R56_C2.value/R56_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R56_C1.value == "" && R56_C2.value == ""){
        R56_C3.value = "";} 
    if(R56_C4.value != "" || R56_C6.value != ""){
        R56_C6.value = Math.round(R56_C5.value/R56_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R56_C4.value == "" && R56_C5.value == ""){
        R56_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 57------------------------------------------------------
    if(R57_C1.value != "" || R57_C2.value != ""){
        R57_C3.value = Math.round(R57_C2.value/R57_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R57_C1.value == "" && R57_C2.value == ""){
        R57_C3.value = "";} 
    if(R57_C4.value != "" || R57_C6.value != ""){
        R57_C6.value = Math.round(R57_C5.value/R57_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R57_C4.value == "" && R57_C5.value == ""){
        R57_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 58------------------------------------------------------
    if(R58_C1.value != "" || R58_C2.value != ""){
        R58_C3.value = Math.round(R58_C2.value/R58_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R58_C1.value == "" && R58_C2.value == ""){
        R58_C3.value = "";} 
    if(R58_C4.value != "" || R58_C6.value != ""){
        R58_C6.value = Math.round(R58_C5.value/R58_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R58_C4.value == "" && R58_C5.value == ""){
        R58_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 59------------------------------------------------------
    if(R59_C1.value != "" || R59_C2.value != ""){
        R59_C3.value = Math.round(R59_C2.value/R59_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R59_C1.value == "" && R59_C2.value == ""){
        R59_C3.value = "";} 
    if(R59_C4.value != "" || R59_C6.value != ""){
        R59_C6.value = Math.round(R59_C5.value/R59_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R59_C4.value == "" && R59_C5.value == ""){
        R59_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 60------------------------------------------------------
    if(R60_C1.value != "" || R60_C2.value != ""){
        R60_C3.value = Math.round(R60_C2.value/R60_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R60_C1.value == "" && R60_C2.value == ""){
        R60_C3.value = "";} 
    if(R60_C4.value != "" || R60_C6.value != ""){
        R60_C6.value = Math.round(R60_C5.value/R60_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R60_C4.value == "" && R60_C5.value == ""){
        R60_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 61------------------------------------------------------
    if(R61_C1.value != "" || R61_C2.value != ""){
        R61_C3.value = Math.round(R61_C2.value/R61_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R61_C1.value == "" && R61_C2.value == ""){
        R61_C3.value = "";} 
    if(R61_C4.value != "" || R61_C6.value != ""){
        R61_C6.value = Math.round(R61_C5.value/R61_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R61_C4.value == "" && R61_C5.value == ""){
        R61_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 62------------------------------------------------------
    if(R62_C1.value != "" || R62_C2.value != ""){
        R62_C3.value = Math.round(R62_C2.value/R62_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R62_C1.value == "" && R62_C2.value == ""){
        R62_C3.value = "";} 
    if(R62_C4.value != "" || R62_C6.value != ""){
        R62_C6.value = Math.round(R62_C5.value/R62_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R62_C4.value == "" && R62_C5.value == ""){
        R62_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 63------------------------------------------------------
    if(R63_C1.value != "" || R63_C2.value != ""){
        R63_C3.value = Math.round(R63_C2.value/R63_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R63_C1.value == "" && R63_C2.value == ""){
        R63_C3.value = "";} 
    if(R63_C4.value != "" || R63_C6.value != ""){
        R63_C6.value = Math.round(R63_C5.value/R63_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R63_C4.value == "" && R63_C5.value == ""){
        R63_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 64------------------------------------------------------
    if(R64_C1.value != "" || R64_C2.value != ""){
        R64_C3.value = Math.round(R64_C2.value/R64_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R64_C1.value == "" && R64_C2.value == ""){
        R64_C3.value = "";} 
    if(R64_C4.value != "" || R64_C6.value != ""){
        R64_C6.value = Math.round(R64_C5.value/R64_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R64_C4.value == "" && R64_C5.value == ""){
        R64_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 65------------------------------------------------------
    if(R65_C1.value != "" || R65_C2.value != ""){
        R65_C3.value = Math.round(R65_C2.value/R65_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R65_C1.value == "" && R65_C2.value == ""){
        R65_C3.value = "";} 
    if(R65_C4.value != "" || R65_C6.value != ""){
        R65_C6.value = Math.round(R65_C5.value/R65_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R65_C4.value == "" && R65_C5.value == ""){
        R65_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//----------------Legume de pe teren acoperit – total-----------------------------------------
//-------------------------------Rind 66------------------------------------------------------
    R66_C1.value = parseInt(R67_C1.value*1 + R68_C1.value*1 + R69_C1.value*1);
    R66_C2.value = parseInt(R67_C2.value*1 + R68_C2.value*1 + R69_C2.value*1);
    if(R66_C1.value != "" || R66_C2.value != ""){
        R66_C3.value = Math.round(R66_C2.value/R66_C1.value*Math.pow(10,2))/Math.pow(10,2);} 
    if((R66_C1.value == "" && R66_C2.value == "") || (R66_C1.value == 0 && R66_C2.value == 0)){
        R66_C3.value = "";R66_C2.value = "";R66_C1.value = "";} 
    R66_C4.value = parseInt(R67_C4.value*1 + R68_C4.value*1 + R69_C4.value*1);
    R66_C5.value = parseInt(R67_C5.value*1 + R68_C5.value*1 + R69_C5.value*1);
    if(R66_C4.value != "" || R66_C5.value != ""){
        R66_C6.value = Math.round(R66_C5.value/R66_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if((R66_C4.value == "" && R66_C5.value == "") || (R66_C4.value == 0 && R66_C5.value == 0)){
        R66_C6.value = "";R66_C5.value = "";R66_C4.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 67------------------------------------------------------
    if(R67_C1.value != "" || R67_C2.value != ""){
        R67_C3.value = Math.round(R67_C2.value/R67_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R67_C1.value == "" && R67_C2.value == ""){
        R67_C3.value = "";} 
    if(R67_C4.value != "" || R67_C6.value != ""){
        R67_C6.value = Math.round(R67_C5.value/R67_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R67_C4.value == "" && R67_C5.value == ""){
        R67_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 68------------------------------------------------------
    if(R68_C1.value != "" || R68_C2.value != ""){
        R68_C3.value = Math.round(R68_C2.value/R68_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R68_C1.value == "" && R68_C2.value == ""){
        R68_C3.value = "";} 
    if(R68_C4.value != "" || R68_C6.value != ""){
        R68_C6.value = Math.round(R68_C5.value/R68_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R68_C4.value == "" && R68_C5.value == ""){
        R68_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 69------------------------------------------------------
    if(R69_C1.value != "" || R69_C2.value != ""){
        R69_C3.value = Math.round(R69_C2.value/R69_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R69_C1.value == "" && R69_C2.value == ""){
        R69_C3.value = "";} 
    if(R69_C4.value != "" || R69_C6.value != ""){
        R69_C6.value = Math.round(R69_C5.value/R69_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R69_C4.value == "" && R69_C5.value == ""){
        R69_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//------------------------Culturi bostănoase alimentare – total-------------------------------
//-------------------------------Rind 70------------------------------------------------------
    R70_C1.value = parseInt(R71_C1.value*1 + R72_C1.value*1);
    R70_C2.value = parseInt(R71_C2.value*1 + R72_C2.value*1);
    if(R70_C1.value != "" || R70_C2.value != ""){
        R70_C3.value = Math.round(R70_C2.value/R70_C1.value*Math.pow(10,2))/Math.pow(10,2);} 
    if((R70_C1.value == "" && R70_C2.value == "") || (R70_C1.value == 0 && R70_C2.value == 0)){
        R70_C3.value = "";R70_C2.value = "";R70_C1.value = "";} 
    R70_C4.value = parseInt(R71_C4.value*1 + R72_C4.value*1);
    R70_C5.value = parseInt(R71_C5.value*1 + R72_C5.value*1);
    if(R70_C4.value != "" || R70_C5.value != ""){
        R70_C6.value = Math.round(R70_C5.value/R70_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if((R70_C4.value == "" && R70_C5.value == "") || (R70_C4.value == 0 && R70_C5.value == 0)){
        R70_C6.value = "";R70_C5.value = "";R70_C4.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 71------------------------------------------------------
    if(R71_C1.value != "" || R71_C2.value != ""){
        R71_C3.value = Math.round(R71_C2.value/R71_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R71_C1.value == "" && R71_C2.value == ""){
        R71_C3.value = "";} 
    if(R71_C4.value != "" || R71_C6.value != ""){
        R71_C6.value = Math.round(R71_C5.value/R71_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R71_C4.value == "" && R71_C5.value == ""){
        R71_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 72------------------------------------------------------
    if(R72_C1.value != "" || R72_C2.value != ""){
        R72_C3.value = Math.round(R72_C2.value/R72_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R72_C1.value == "" && R72_C2.value == ""){
        R72_C3.value = "";} 
    if(R72_C4.value != "" || R72_C6.value != ""){
        R72_C6.value = Math.round(R72_C5.value/R72_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R72_C4.value == "" && R72_C5.value == ""){
        R72_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 73------------------------------------------------------
    if(R73_C1.value != "" || R73_C2.value != ""){
        R73_C3.value = Math.round(R73_C2.value/R73_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R73_C1.value == "" && R73_C2.value == ""){
        R73_C3.value = "";} 
    if(R73_C4.value != "" || R73_C6.value != ""){
        R73_C6.value = Math.round(R73_C5.value/R73_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R73_C4.value == "" && R73_C5.value == ""){
        R73_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 74------------------------------------------------------
    if(R74_C1.value != "" || R74_C2.value != ""){
        R74_C3.value = Math.round(R74_C2.value/R74_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R74_C1.value == "" && R74_C2.value == ""){
        R74_C3.value = "";} 
    if(R74_C4.value != "" || R74_C6.value != ""){
        R74_C6.value = Math.round(R74_C5.value/R74_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R74_C4.value == "" && R74_C5.value == ""){
        R74_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 75------------------------------------------------------
    if(R75_C1.value != "" || R75_C2.value != ""){
        R75_C3.value = Math.round(R75_C2.value/R75_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R75_C1.value == "" && R75_C2.value == ""){
        R75_C3.value = "";} 
    if(R75_C4.value != "" || R75_C6.value != ""){
        R75_C6.value = Math.round(R75_C5.value/R75_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R75_C4.value == "" && R75_C5.value == ""){
        R75_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 130-----------------------------------------------------
    if(R130_C1.value != "" || R130_C2.value != ""){
        R130_C3.value = Math.round(R130_C2.value/R130_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R130_C1.value == "" && R130_C2.value == ""){
        R130_C3.value = "";} 
    if(R130_C4.value != "" || R130_C6.value != ""){
        R130_C6.value = Math.round(R130_C5.value/R130_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R130_C4.value == "" && R130_C5.value == ""){
        R130_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 131-----------------------------------------------------
    if(R131_C1.value != "" || R131_C2.value != ""){
        R131_C3.value = Math.round(R131_C2.value/R131_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R131_C1.value == "" && R131_C2.value == ""){
        R131_C3.value = "";} 
    if(R131_C4.value != "" || R131_C6.value != ""){
        R131_C6.value = Math.round(R131_C5.value/R131_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R131_C4.value == "" && R131_C5.value == ""){
        R131_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 76------------------------------------------------------
    if(R76_C1.value != "" || R76_C2.value != ""){
        R76_C3.value = Math.round(R76_C2.value/R76_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R76_C1.value == "" && R76_C2.value == ""){
        R76_C3.value = "";} 
    if(R76_C4.value != "" || R76_C6.value != ""){
        R76_C6.value = Math.round(R76_C5.value/R76_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R76_C4.value == "" && R76_C5.value == ""){
        R76_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 77------------------------------------------------------
    if(R77_C1.value != "" || R77_C2.value != ""){
        R77_C3.value = Math.round(R77_C2.value/R77_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R77_C1.value == "" && R77_C2.value == ""){
        R77_C3.value = "";} 
    if(R77_C4.value != "" || R77_C6.value != ""){
        R77_C6.value = Math.round(R77_C5.value/R77_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R77_C4.value == "" && R77_C5.value == ""){
        R77_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 78------------------------------------------------------
    if(R78_C1.value != "" || R78_C2.value != ""){
        R78_C3.value = Math.round(R78_C2.value/R78_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R78_C1.value == "" && R78_C2.value == ""){
        R78_C3.value = "";} 
    if(R78_C4.value != "" || R78_C6.value != ""){
        R78_C6.value = Math.round(R78_C5.value/R78_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R78_C4.value == "" && R78_C5.value == ""){
        R78_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 79------------------------------------------------------
    if(R79_C1.value != "" || R79_C2.value != ""){
        R79_C3.value = Math.round(R79_C2.value/R79_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R79_C1.value == "" && R79_C2.value == ""){
        R79_C3.value = "";} 
    if(R79_C4.value != "" || R79_C6.value != ""){
        R79_C6.value = Math.round(R79_C5.value/R79_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R79_C4.value == "" && R79_C5.value == ""){
        R79_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 80------------------------------------------------------
    if(R80_C1.value != "" || R80_C2.value != ""){
        R80_C3.value = Math.round(R80_C2.value/R80_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R80_C1.value == "" && R80_C2.value == ""){
        R80_C3.value = "";} 
    if(R80_C4.value != "" || R80_C6.value != ""){
        R80_C6.value = Math.round(R80_C5.value/R80_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R80_C4.value == "" && R80_C5.value == ""){
        R80_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 81------------------------------------------------------
    if(R81_C1.value != "" || R81_C2.value != ""){
        R81_C3.value = Math.round(R81_C2.value/R81_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R81_C1.value == "" && R81_C2.value == ""){
        R81_C3.value = "";} 
    if(R81_C4.value != "" || R81_C6.value != ""){
        R81_C6.value = Math.round(R81_C5.value/R81_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R81_C4.value == "" && R81_C5.value == ""){
        R81_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 82------------------------------------------------------
    if(R82_C1.value != "" || R82_C2.value != ""){
        R82_C3.value = Math.round(R82_C2.value/R82_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R82_C1.value == "" && R82_C2.value == ""){
        R82_C3.value = "";} 
    if(R82_C4.value != "" || R82_C6.value != ""){
        R82_C6.value = Math.round(R82_C5.value/R82_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R82_C4.value == "" && R82_C5.value == ""){
        R82_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 83------------------------------------------------------
    if(R83_C1.value != "" || R83_C2.value != ""){
        R83_C3.value = Math.round(R83_C2.value/R83_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R83_C1.value == "" && R83_C2.value == ""){
        R83_C3.value = "";} 
    if(R83_C4.value != "" || R83_C6.value != ""){
        R83_C6.value = Math.round(R83_C5.value/R83_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R83_C4.value == "" && R83_C5.value == ""){
        R83_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 84------------------------------------------------------
    if(R84_C1.value != "" || R84_C2.value != ""){
        R84_C3.value = Math.round(R84_C2.value/R84_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R84_C1.value == "" && R84_C2.value == ""){
        R84_C3.value = "";} 
    if(R84_C4.value != "" || R84_C6.value != ""){
        R84_C6.value = Math.round(R84_C5.value/R84_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R84_C4.value == "" && R84_C5.value == ""){
        R84_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 85------------------------------------------------------
    if(R85_C1.value != "" || R85_C2.value != ""){
        R85_C3.value = Math.round(R85_C2.value/R85_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R85_C1.value == "" && R85_C2.value == ""){
        R85_C3.value = "";} 
    if(R85_C4.value != "" || R85_C6.value != ""){
        R85_C6.value = Math.round(R85_C5.value/R85_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R85_C4.value == "" && R85_C5.value == ""){
        R85_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//---------------------Fructe și pomuşoare de cultură – total---------------------------------
//-------------------------------Rind 86------------------------------------------------------
    R86_C1.value = parseInt(R87_C1.value*1 + R94_C1.value*1 + R99_C1.value*1);
    R86_C2.value = parseInt(R87_C2.value*1 + R94_C2.value*1 + R99_C2.value*1);
    if(R86_C1.value != "" || R86_C2.value != ""){
        R86_C3.value = Math.round(R86_C2.value/R86_C1.value*Math.pow(10,2))/Math.pow(10,2);} 
    if((R86_C1.value == "" && R86_C2.value == "") || (R86_C1.value == 0 && R86_C2.value == 0)){
        R86_C3.value = "";R86_C2.value = "";R86_C1.value = "";} 
    R86_C4.value = parseInt(R87_C4.value*1 + R94_C4.value*1 + R99_C4.value*1);
    R86_C5.value = parseInt(R87_C5.value*1 + R94_C5.value*1 + R99_C5.value*1);
    if(R86_C4.value != "" || R86_C5.value != ""){
        R86_C6.value = Math.round(R86_C5.value/R86_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if((R86_C4.value == "" && R86_C5.value == "") || (R86_C4.value == 0 && R86_C5.value == 0)){
        R86_C6.value = "";R86_C5.value = "";R86_C4.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 87------------------------------------------------------
    R87_C1.value = parseInt(R88_C1.value*1 + R89_C1.value*1 + R90_C1.value*1 + R91_C1.value*1 + R92_C1.value*1 + R93_C1.value*1);
    R87_C2.value = parseInt(R88_C2.value*1 + R89_C2.value*1 + R90_C2.value*1 + R91_C2.value*1 + R92_C2.value*1 + R93_C2.value*1);
    if(R87_C1.value != "" || R87_C2.value != ""){
        R87_C3.value = Math.round(R87_C2.value/R87_C1.value*Math.pow(10,2))/Math.pow(10,2);} 
    if((R87_C1.value == "" && R87_C2.value == "") || (R87_C1.value == 0 && R87_C2.value == 0)){
        R87_C3.value = "";R87_C2.value = "";R87_C1.value = "";} 
    R87_C4.value = parseInt(R88_C4.value*1 + R89_C4.value*1 + R90_C4.value*1 + R91_C4.value*1 + R92_C4.value*1 + R93_C4.value*1);
    R87_C5.value = parseInt(R88_C5.value*1 + R89_C5.value*1 + R90_C5.value*1 + R91_C5.value*1 + R92_C5.value*1 + R93_C5.value*1);
    if(R87_C4.value != "" || R87_C5.value != ""){
        R87_C6.value = Math.round(R87_C5.value/R87_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if((R87_C4.value == "" && R87_C5.value == "") || (R87_C4.value == 0 && R87_C5.value == 0)){
        R87_C6.value = "";R87_C5.value = "";R87_C4.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 88------------------------------------------------------
    if(R88_C1.value != "" || R88_C2.value != ""){
        R88_C3.value = Math.round(R88_C2.value/R88_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R88_C1.value == "" && R88_C2.value == ""){
        R88_C3.value = "";} 
    if(R88_C4.value != "" || R88_C6.value != ""){
        R88_C6.value = Math.round(R88_C5.value/R88_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R88_C4.value == "" && R88_C5.value == ""){
        R88_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 89------------------------------------------------------
    if(R89_C1.value != "" || R89_C2.value != ""){
        R89_C3.value = Math.round(R89_C2.value/R89_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R89_C1.value == "" && R89_C2.value == ""){
        R89_C3.value = "";} 
    if(R89_C4.value != "" || R89_C6.value != ""){
        R89_C6.value = Math.round(R89_C5.value/R89_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R89_C4.value == "" && R89_C5.value == ""){
        R89_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 90------------------------------------------------------
    if(R90_C1.value != "" || R90_C2.value != ""){
        R90_C3.value = Math.round(R90_C2.value/R90_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R90_C1.value == "" && R90_C2.value == ""){
        R90_C3.value = "";} 
    if(R90_C4.value != "" || R90_C6.value != ""){
        R90_C6.value = Math.round(R90_C5.value/R90_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R90_C4.value == "" && R90_C5.value == ""){
        R90_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 91------------------------------------------------------
    if(R91_C1.value != "" || R91_C2.value != ""){
        R91_C3.value = Math.round(R91_C2.value/R91_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R91_C1.value == "" && R91_C2.value == ""){
        R91_C3.value = "";} 
    if(R91_C4.value != "" || R91_C6.value != ""){
        R91_C6.value = Math.round(R91_C5.value/R91_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R91_C4.value == "" && R91_C5.value == ""){
        R91_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 92------------------------------------------------------
    if(R92_C1.value != "" || R92_C2.value != ""){
        R92_C3.value = Math.round(R92_C2.value/R92_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R92_C1.value == "" && R92_C2.value == ""){
        R92_C3.value = "";} 
    if(R92_C4.value != "" || R92_C6.value != ""){
        R92_C6.value = Math.round(R92_C5.value/R92_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R92_C4.value == "" && R92_C5.value == ""){
        R92_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 93------------------------------------------------------
    if(R93_C1.value != "" || R93_C2.value != ""){
        R93_C3.value = Math.round(R93_C2.value/R93_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R93_C1.value == "" && R93_C2.value == ""){
        R93_C3.value = "";} 
    if(R93_C4.value != "" || R93_C6.value != ""){
        R93_C6.value = Math.round(R93_C5.value/R93_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R93_C4.value == "" && R93_C5.value == ""){
        R93_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 94------------------------------------------------------
    R94_C1.value = parseInt(R95_C1.value*1 + R96_C1.value*1 + R97_C1.value*1 + R98_C1.value*1);
    R94_C2.value = parseInt(R95_C2.value*1 + R96_C2.value*1 + R97_C2.value*1 + R98_C2.value*1);
    if(R94_C1.value != "" || R94_C2.value != ""){
        R94_C3.value = Math.round(R94_C2.value/R94_C1.value*Math.pow(10,2))/Math.pow(10,2);} 
    if((R94_C1.value == "" && R94_C2.value == "") || (R94_C1.value == 0 && R94_C2.value == 0)){
        R94_C3.value = "";R94_C2.value = "";R94_C1.value = "";} 
    R94_C4.value = parseInt(R95_C4.value*1 + R96_C4.value*1 + R97_C4.value*1 + R98_C4.value*1);
    R94_C5.value = parseInt(R95_C5.value*1 + R96_C5.value*1 + R97_C5.value*1 + R98_C5.value*1);
    if(R94_C4.value != "" || R94_C5.value != ""){
        R94_C6.value = Math.round(R94_C5.value/R94_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if((R94_C4.value == "" && R94_C5.value == "") || (R94_C4.value == 0 && R94_C5.value == 0)){
        R94_C6.value = "";R94_C5.value = "";R94_C4.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 95------------------------------------------------------
    if(R95_C1.value != "" || R95_C2.value != ""){
        R95_C3.value = Math.round(R95_C2.value/R95_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R95_C1.value == "" && R95_C2.value == ""){
        R95_C3.value = "";} 
    if(R95_C4.value != "" || R95_C6.value != ""){
        R95_C6.value = Math.round(R95_C5.value/R95_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R95_C4.value == "" && R95_C5.value == ""){
        R95_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 96------------------------------------------------------
    if(R96_C1.value != "" || R96_C2.value != ""){
        R96_C3.value = Math.round(R96_C2.value/R96_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R96_C1.value == "" && R96_C2.value == ""){
        R96_C3.value = "";} 
    if(R96_C4.value != "" || R96_C6.value != ""){
        R96_C6.value = Math.round(R96_C5.value/R96_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R96_C4.value == "" && R96_C5.value == ""){
        R96_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 97------------------------------------------------------
    if(R97_C1.value != "" || R97_C2.value != ""){
        R97_C3.value = Math.round(R97_C2.value/R97_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R97_C1.value == "" && R97_C2.value == ""){
        R97_C3.value = "";} 
    if(R97_C4.value != "" || R97_C6.value != ""){
        R97_C6.value = Math.round(R97_C5.value/R97_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R97_C4.value == "" && R97_C5.value == ""){
        R97_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 98------------------------------------------------------
    if(R98_C1.value != "" || R98_C2.value != ""){
        R98_C3.value = Math.round(R98_C2.value/R98_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R98_C1.value == "" && R98_C2.value == ""){
        R98_C3.value = "";} 
    if(R98_C4.value != "" || R98_C6.value != ""){
        R98_C6.value = Math.round(R98_C5.value/R98_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R98_C4.value == "" && R98_C5.value == ""){
        R98_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//--------------------------------------------Pomuşoare de cultură – total--------------------
//-------------------------------Rind 99------------------------------------------------------
    R99_C1.value = parseInt(R132_C1.value*1 + R133_C1.value*1 + R134_C1.value*1);
    R99_C2.value = parseInt(R132_C2.value*1 + R133_C2.value*1 + R134_C2.value*1);
    if(R99_C1.value != "" || R99_C2.value != ""){
        R99_C3.value = Math.round(R99_C2.value/R99_C1.value*Math.pow(10,2))/Math.pow(10,2);} 
    if((R99_C1.value == "" && R99_C2.value == "") || (R99_C1.value == 0 && R99_C2.value == 0)){
        R99_C3.value = "";R99_C2.value = "";R99_C1.value = "";} 
    R99_C4.value = parseInt(R132_C4.value*1 + R133_C4.value*1 + R134_C4.value*1);
    R99_C5.value = parseInt(R132_C5.value*1 + R133_C5.value*1 + R134_C5.value*1);
    if(R99_C4.value != "" || R99_C5.value != ""){
        R99_C6.value = Math.round(R99_C5.value/R99_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if((R99_C4.value == "" && R99_C5.value == "") || (R99_C4.value == 0 && R99_C5.value == 0)){
        R99_C6.value = "";R99_C5.value = "";R99_C4.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 132-----------------------------------------------------
    if(R132_C1.value != "" || R132_C2.value != ""){
        R132_C3.value = Math.round(R132_C2.value/R132_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R132_C1.value == "" && R132_C2.value == ""){
        R132_C3.value = "";} 
    if(R132_C4.value != "" || R132_C6.value != ""){
        R132_C6.value = Math.round(R132_C5.value/R132_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R132_C4.value == "" && R132_C5.value == ""){
        R132_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 133-----------------------------------------------------
    if(R133_C1.value != "" || R133_C2.value != ""){
        R133_C3.value = Math.round(R133_C2.value/R133_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R133_C1.value == "" && R133_C2.value == ""){
        R133_C3.value = "";} 
    if(R133_C4.value != "" || R133_C6.value != ""){
        R133_C6.value = Math.round(R133_C5.value/R133_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R133_C4.value == "" && R133_C5.value == ""){
        R133_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 134-----------------------------------------------------
    if(R134_C1.value != "" || R134_C2.value != ""){
        R134_C3.value = Math.round(R134_C2.value/R134_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R134_C1.value == "" && R134_C2.value == ""){
        R134_C3.value = "";} 
    if(R134_C4.value != "" || R134_C6.value != ""){
        R134_C6.value = Math.round(R134_C5.value/R134_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R134_C4.value == "" && R134_C5.value == ""){
        R134_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//------------------------Struguri – total----------------------------------------------------
//-------------------------------Rind 100-----------------------------------------------------
    R100_C1.value = parseInt(R101_C1.value*1 + R102_C1.value*1);
    R100_C2.value = parseInt(R101_C2.value*1 + R102_C2.value*1);
    if(R100_C1.value != "" || R100_C2.value != ""){
        R100_C3.value = Math.round(R100_C2.value/R100_C1.value*Math.pow(10,2))/Math.pow(10,2);} 
    if((R100_C1.value == "" && R100_C2.value == "") || (R100_C1.value == 0 && R100_C2.value == 0)){
        R100_C3.value = "";R100_C2.value = "";R100_C1.value = "";} 
    R100_C4.value = parseInt(R101_C4.value*1 + R102_C4.value*1);
    R100_C5.value = parseInt(R101_C5.value*1 + R102_C5.value*1);
    if(R100_C4.value != "" || R100_C5.value != ""){
        R100_C6.value = Math.round(R100_C5.value/R100_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if((R100_C4.value == "" && R100_C5.value == "") || (R100_C4.value == 0 && R100_C5.value == 0)){
        R100_C6.value = "";R100_C5.value = "";R100_C4.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 101-----------------------------------------------------
    if(R101_C1.value != "" || R101_C2.value != ""){
        R101_C3.value = Math.round(R101_C2.value/R101_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R101_C1.value == "" && R101_C2.value == ""){
        R101_C3.value = "";} 
    if(R101_C4.value != "" || R101_C6.value != ""){
        R101_C6.value = Math.round(R101_C5.value/R101_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R101_C4.value == "" && R101_C5.value == ""){
        R101_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 102-----------------------------------------------------
    if(R102_C1.value != "" || R102_C2.value != ""){
        R102_C3.value = Math.round(R102_C2.value/R102_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R102_C1.value == "" && R102_C2.value == ""){
        R102_C3.value = "";} 
    if(R102_C4.value != "" || R102_C6.value != ""){
        R102_C6.value = Math.round(R102_C5.value/R102_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R102_C4.value == "" && R102_C5.value == ""){
        R102_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------Material săditor pentru livezi, vii și arbuști fructiferi, mii bucăţi----
//-------------------------------Rind 103-----------------------------------------------------
    R103_C1.value = parseInt(R136_C1.value*1 + R104_C1.value*1 + R105_C1.value*1 + R106_C1.value*1 + R107_C1.value*1 + R108_C1.value*1);
    R103_C2.value = parseInt(R136_C2.value*1 + R104_C2.value*1 + R105_C2.value*1 + R106_C2.value*1 + R107_C2.value*1 + R108_C2.value*1);
    if(R103_C1.value != "" || R103_C2.value != ""){
        R103_C3.value = Math.round(R103_C2.value/R103_C1.value*Math.pow(10,2))/Math.pow(10,2);} 
    if((R103_C1.value == "" && R103_C2.value == "") || (R103_C1.value == 0 && R103_C2.value == 0)){
        R103_C3.value = "";R103_C2.value = "";R103_C1.value = "";} 
    R103_C4.value = parseInt(R104_C4.value*1 + R105_C4.value*1 + R106_C4.value*1 + R107_C4.value*1 + R108_C4.value*1);
    R103_C5.value = parseInt(R104_C5.value*1 + R105_C5.value*1 + R106_C5.value*1 + R107_C5.value*1 + R108_C5.value*1);
    if(R103_C4.value != "" || R103_C5.value != ""){
        R103_C6.value = Math.round(R103_C5.value/R103_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if((R103_C4.value == "" && R103_C5.value == "") || (R103_C4.value == 0 && R103_C5.value == 0)){
        R103_C6.value = "";R103_C5.value = "";R103_C4.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 136-----------------------------------------------------
    if(R136_C1.value != "" || R136_C2.value != ""){
        R136_C3.value = Math.round(R136_C2.value/R136_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R136_C1.value == "" && R136_C2.value == ""){
        R136_C3.value = "";} 
    if(R136_C4.value != "" || R136_C6.value != ""){
        R136_C6.value = Math.round(R136_C5.value/R136_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R136_C4.value == "" && R136_C5.value == ""){
        R136_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 104-----------------------------------------------------
    if(R104_C1.value != "" || R104_C2.value != ""){
        R104_C3.value = Math.round(R104_C2.value/R104_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R104_C1.value == "" && R104_C2.value == ""){
        R104_C3.value = "";} 
    if(R104_C4.value != "" || R104_C6.value != ""){
        R104_C6.value = Math.round(R104_C5.value/R104_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R104_C4.value == "" && R104_C5.value == ""){
        R104_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 105-----------------------------------------------------
    if(R105_C1.value != "" || R105_C2.value != ""){
        R105_C3.value = Math.round(R105_C2.value/R105_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R105_C1.value == "" && R105_C2.value == ""){
        R105_C3.value = "";} 
    if(R105_C4.value != "" || R105_C6.value != ""){
        R105_C6.value = Math.round(R105_C5.value/R105_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R105_C4.value == "" && R105_C5.value == ""){
        R105_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 106-----------------------------------------------------
    if(R106_C1.value != "" || R106_C2.value != ""){
        R106_C3.value = Math.round(R106_C2.value/R106_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R106_C1.value == "" && R106_C2.value == ""){
        R106_C3.value = "";} 
    if(R106_C4.value != "" || R106_C6.value != ""){
        R106_C6.value = Math.round(R106_C5.value/R106_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R106_C4.value == "" && R106_C5.value == ""){
        R106_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 107-----------------------------------------------------
    if(R107_C1.value != "" || R107_C2.value != ""){
        R107_C3.value = Math.round(R107_C2.value/R107_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R107_C1.value == "" && R107_C2.value == ""){
        R107_C3.value = "";} 
    if(R107_C4.value != "" || R107_C6.value != ""){
        R107_C6.value = Math.round(R107_C5.value/R107_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R107_C4.value == "" && R107_C5.value == ""){
        R107_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 108-----------------------------------------------------
    if(R108_C1.value != "" || R108_C2.value != ""){
        R108_C3.value = Math.round(R108_C2.value/R108_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R108_C1.value == "" && R108_C2.value == ""){
        R108_C3.value = "";} 
    if(R108_C4.value != "" || R108_C6.value != ""){
        R108_C6.value = Math.round(R108_C5.value/R108_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R108_C4.value == "" && R108_C5.value == ""){
        R108_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 109-----------------------------------------------------
    if(R109_C1.value != "" || R109_C2.value != ""){
        R109_C3.value = Math.round(R109_C2.value/R109_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R109_C1.value == "" && R109_C2.value == ""){
        R109_C3.value = "";} 
    if(R109_C4.value != "" || R109_C6.value != ""){
        R109_C6.value = Math.round(R109_C5.value/R109_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R109_C4.value == "" && R109_C5.value == ""){
        R109_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 110-----------------------------------------------------
    if(R110_C1.value != "" || R110_C2.value != ""){
        R110_C3.value = Math.round(R110_C2.value/R110_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R110_C1.value == "" && R110_C2.value == ""){
        R110_C3.value = "";} 
    if(R110_C4.value != "" || R110_C6.value != ""){
        R110_C6.value = Math.round(R110_C5.value/R110_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R110_C4.value == "" && R110_C5.value == ""){
        R110_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 135-----------------------------------------------------
    if(R135_C1.value != "" || R135_C2.value != ""){
        R135_C3.value = Math.round(R135_C2.value/R135_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R135_C1.value == "" && R135_C2.value == ""){
        R135_C3.value = "";} 
    if(R135_C4.value != "" || R135_C6.value != ""){
        R135_C6.value = Math.round(R135_C5.value/R135_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R135_C4.value == "" && R135_C5.value == ""){
        R135_C6.value = "";} 
//--------------------------------------------------------------------------------------------

    
}

function fCAPII(){
    var R111_C1 = document.getElementById('26_368_111_1');
    var R111_C2 = document.getElementById('26_368_111_2');
    var R111_C3 = document.getElementById('26_368_111_3');
    var R111_C4 = document.getElementById('26_368_111_4');
    var R111_C5 = document.getElementById('26_368_111_5');
    var R111_C6 = document.getElementById('26_368_111_6');
    var R112_C1 = document.getElementById('26_368_112_1');
    var R112_C2 = document.getElementById('26_368_112_2');
    var R112_C3 = document.getElementById('26_368_112_3');
    var R112_C4 = document.getElementById('26_368_112_4');
    var R112_C5 = document.getElementById('26_368_112_5');
    var R112_C6 = document.getElementById('26_368_112_6');
    var R113_C1 = document.getElementById('26_368_113_1');
    var R113_C2 = document.getElementById('26_368_113_2');
    var R113_C3 = document.getElementById('26_368_113_3');
    var R113_C4 = document.getElementById('26_368_113_4');
    var R113_C5 = document.getElementById('26_368_113_5');
    var R113_C6 = document.getElementById('26_368_113_6');
    var R114_C1 = document.getElementById('26_368_114_1');
    var R114_C2 = document.getElementById('26_368_114_2');
    var R114_C3 = document.getElementById('26_368_114_3');
    var R114_C4 = document.getElementById('26_368_114_4');
    var R114_C5 = document.getElementById('26_368_114_5');
    var R114_C6 = document.getElementById('26_368_114_6');
    var R115_C1 = document.getElementById('26_368_115_1');
    var R115_C2 = document.getElementById('26_368_115_2');
    var R115_C3 = document.getElementById('26_368_115_3');
    var R115_C4 = document.getElementById('26_368_115_4');
    var R115_C5 = document.getElementById('26_368_115_5');
    var R115_C6 = document.getElementById('26_368_115_6');
    var R116_C1 = document.getElementById('26_368_116_1');
    var R116_C2 = document.getElementById('26_368_116_2');
    var R116_C3 = document.getElementById('26_368_116_3');
    var R116_C4 = document.getElementById('26_368_116_4');
    var R116_C5 = document.getElementById('26_368_116_5');
    var R116_C6 = document.getElementById('26_368_116_6');
    var R117_C1 = document.getElementById('26_368_117_1');
    var R117_C2 = document.getElementById('26_368_117_2');
    var R117_C3 = document.getElementById('26_368_117_3');
    var R117_C4 = document.getElementById('26_368_117_4');
    var R117_C5 = document.getElementById('26_368_117_5');
    var R117_C6 = document.getElementById('26_368_117_6');
    var R118_C1 = document.getElementById('26_368_118_1');
    var R118_C2 = document.getElementById('26_368_118_2');
    var R118_C3 = document.getElementById('26_368_118_3');
    var R118_C4 = document.getElementById('26_368_118_4');
    var R118_C5 = document.getElementById('26_368_118_5');
    var R118_C6 = document.getElementById('26_368_118_6');
    var R119_C1 = document.getElementById('26_368_119_1');
    var R119_C2 = document.getElementById('26_368_119_2');
    var R119_C3 = document.getElementById('26_368_119_3');
    var R119_C4 = document.getElementById('26_368_119_4');
    var R119_C5 = document.getElementById('26_368_119_5');
    var R119_C6 = document.getElementById('26_368_119_6');
    var R120_C1 = document.getElementById('26_368_120_1');
    var R120_C2 = document.getElementById('26_368_120_2');
    var R120_C3 = document.getElementById('26_368_120_3');
    var R120_C4 = document.getElementById('26_368_120_4');
    var R120_C5 = document.getElementById('26_368_120_5');
    var R120_C6 = document.getElementById('26_368_120_6');
    var R121_C1 = document.getElementById('26_368_121_1');
    var R121_C2 = document.getElementById('26_368_121_2');
    var R121_C3 = document.getElementById('26_368_121_3');
    var R121_C4 = document.getElementById('26_368_121_4');
    var R121_C5 = document.getElementById('26_368_121_5');
    var R121_C6 = document.getElementById('26_368_121_6');
    var R122_C1 = document.getElementById('26_368_122_1');
    var R122_C2 = document.getElementById('26_368_122_2');
    var R122_C3 = document.getElementById('26_368_122_3');
    var R122_C4 = document.getElementById('26_368_122_4');
    var R122_C5 = document.getElementById('26_368_122_5');
    var R122_C6 = document.getElementById('26_368_122_6');
    var R123_C1 = document.getElementById('26_368_123_1');
    var R123_C2 = document.getElementById('26_368_123_2');
    var R123_C3 = document.getElementById('26_368_123_3');
    var R123_C4 = document.getElementById('26_368_123_4');
    var R123_C5 = document.getElementById('26_368_123_5');
    var R123_C6 = document.getElementById('26_368_123_6');
    var R124_C1 = document.getElementById('26_368_124_1');
    var R124_C2 = document.getElementById('26_368_124_2');
    var R124_C3 = document.getElementById('26_368_124_3');
    var R124_C4 = document.getElementById('26_368_124_4');
    var R124_C5 = document.getElementById('26_368_124_5');
    var R124_C6 = document.getElementById('26_368_124_6');
    var R125_C1 = document.getElementById('26_368_125_1');
    var R125_C2 = document.getElementById('26_368_125_2');
    var R125_C3 = document.getElementById('26_368_125_3');
    var R125_C4 = document.getElementById('26_368_125_4');
    var R125_C5 = document.getElementById('26_368_125_5');
    var R125_C6 = document.getElementById('26_368_125_6');
    
    var R137_C1 = document.getElementById('26_368_137_1');
    var R137_C2 = document.getElementById('26_368_137_2');
    var R137_C3 = document.getElementById('26_368_137_3');
    var R137_C4 = document.getElementById('26_368_137_4');
    var R137_C5 = document.getElementById('26_368_137_5');
    var R137_C6 = document.getElementById('26_368_137_6');
    
    //--------------readOnly input ----------------------
    R111_C1.readOnly = true;
    R111_C2.readOnly = true;
    R111_C3.readOnly = true;
    R111_C4.readOnly = true;
    R111_C5.readOnly = true;
    R111_C6.readOnly = true;
    R112_C3.readOnly = true;
    R112_C6.readOnly = true;
    R113_C3.readOnly = true;
    R113_C6.readOnly = true;
    R114_C3.readOnly = true;
    R114_C6.readOnly = true;
    R115_C3.readOnly = true;
    R115_C6.readOnly = true;
    R116_C3.readOnly = true;
    R116_C6.readOnly = true;
    R117_C1.readOnly = true;
    R117_C2.readOnly = true;
    R117_C3.readOnly = true;
    R117_C4.readOnly = true;
    R117_C5.readOnly = true;
    R117_C6.readOnly = true;
    R118_C3.readOnly = true;
    R118_C6.readOnly = true;
    R119_C3.readOnly = true;
    R119_C6.readOnly = true;
    R120_C1.readOnly = true;
    R120_C2.readOnly = true;
    R120_C3.readOnly = true;
    R120_C4.readOnly = true;
    R120_C5.readOnly = true;
    R120_C6.readOnly = true;
    R121_C3.readOnly = true;
    R121_C6.readOnly = true;
    R122_C3.readOnly = true;
    R122_C6.readOnly = true;
    R123_C3.readOnly = true;
    R123_C6.readOnly = true;
    R124_C3.readOnly = true;
    R124_C6.readOnly = true;
    R125_C3.readOnly = true;
    R125_C6.readOnly = true;
    R137_C3.readOnly = true;
    R137_C6.readOnly = true;
    
//-----------------------------Vite şi păsări (în masă vie) – total---------------------------
//-------------------------------Rind 111-----------------------------------------------------
    R111_C1.value = parseInt(R112_C1.value*1 + R113_C1.value*1 + R114_C1.value*1 + R115_C1.value*1 + R116_C1.value*1);
    R111_C2.value = parseInt(R112_C2.value*1 + R113_C2.value*1 + R114_C2.value*1 + R115_C2.value*1 + R116_C2.value*1);
    if(R111_C1.value != "" || R111_C2.value != ""){
        R111_C3.value = Math.round(R111_C2.value/R111_C1.value*Math.pow(10,2))/Math.pow(10,2);} 
    if((R111_C1.value == "" && R111_C2.value == "") || (R111_C1.value == 0 && R111_C2.value == 0)){
        R111_C3.value = "";R111_C2.value = "";R111_C1.value = "";} 
    R111_C4.value = parseInt(R112_C4.value*1 + R113_C4.value*1 + R114_C4.value*1 + R115_C4.value*1 + R116_C4.value*1);
    R111_C5.value = parseInt(R112_C5.value*1 + R113_C5.value*1 + R114_C5.value*1 + R115_C5.value*1 + R116_C5.value*1);
    if(R111_C4.value != "" || R111_C5.value != ""){
        R111_C6.value = Math.round(R111_C5.value/R111_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if((R111_C4.value == "" && R111_C5.value == "") || (R111_C4.value == 0 && R111_C5.value == 0)){
        R111_C6.value = "";R111_C5.value = "";R111_C4.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 112-----------------------------------------------------
    if(R112_C1.value != "" || R112_C2.value != ""){
        R112_C3.value = Math.round(R112_C2.value/R112_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R112_C1.value == "" && R112_C2.value == ""){
        R112_C3.value = "";} 
    if(R112_C4.value != "" || R112_C6.value != ""){
        R112_C6.value = Math.round(R112_C5.value/R112_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R112_C4.value == "" && R112_C5.value == ""){
        R112_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 113-----------------------------------------------------
    if(R113_C1.value != "" || R113_C2.value != ""){
        R113_C3.value = Math.round(R113_C2.value/R113_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R113_C1.value == "" && R113_C2.value == ""){
        R113_C3.value = "";} 
    if(R113_C4.value != "" || R113_C6.value != ""){
        R113_C6.value = Math.round(R113_C5.value/R113_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R113_C4.value == "" && R113_C5.value == ""){
        R113_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 114-----------------------------------------------------
    if(R114_C1.value != "" || R114_C2.value != ""){
        R114_C3.value = Math.round(R114_C2.value/R114_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R114_C1.value == "" && R114_C2.value == ""){
        R114_C3.value = "";} 
    if(R114_C4.value != "" || R114_C6.value != ""){
        R114_C6.value = Math.round(R114_C5.value/R114_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R114_C4.value == "" && R114_C5.value == ""){
        R114_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 115-----------------------------------------------------
    if(R115_C1.value != "" || R115_C2.value != ""){
        R115_C3.value = Math.round(R115_C2.value/R115_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R115_C1.value == "" && R115_C2.value == ""){
        R115_C3.value = "";} 
    if(R115_C4.value != "" || R115_C6.value != ""){
        R115_C6.value = Math.round(R115_C5.value/R115_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R115_C4.value == "" && R115_C5.value == ""){
        R115_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 116-----------------------------------------------------
    if(R116_C1.value != "" || R116_C2.value != ""){
        R116_C3.value = Math.round(R116_C2.value/R116_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R116_C1.value == "" && R116_C2.value == ""){
        R116_C3.value = "";} 
    if(R116_C4.value != "" || R116_C6.value != ""){
        R116_C6.value = Math.round(R116_C5.value/R116_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R116_C4.value == "" && R116_C5.value == ""){
        R116_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//---------Lapte (în echivalent lapte cu un conţinut de grăsime stabilit) --------------------
//-------------------------------Rind 117-----------------------------------------------------
    R117_C1.value = parseInt(R118_C1.value*1 + R119_C1.value*1);
    R117_C2.value = parseInt(R118_C2.value*1 + R119_C2.value*1);
    if(R117_C1.value != "" || R117_C2.value != ""){
        R117_C3.value = Math.round(R117_C2.value/R117_C1.value*Math.pow(10,2))/Math.pow(10,2);} 
    if((R117_C1.value == "" && R117_C2.value == "") || (R117_C1.value == 0 && R117_C2.value == 0)){
        R117_C3.value = "";R117_C2.value = "";R117_C1.value = "";} 
    R117_C4.value = parseInt(R118_C4.value*1 + R119_C4.value*1);
    R117_C5.value = parseInt(R118_C5.value*1 + R119_C5.value*1);
    if(R117_C4.value != "" || R117_C5.value != ""){
        R117_C6.value = Math.round(R117_C5.value/R117_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if((R117_C4.value == "" && R117_C5.value == "") || (R117_C4.value == 0 && R117_C5.value == 0)){
        R117_C6.value = "";R117_C5.value = "";R117_C4.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 118-----------------------------------------------------
    if(R118_C1.value != "" || R118_C2.value != ""){
        R118_C3.value = Math.round(R118_C2.value/R118_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R118_C1.value == "" && R118_C2.value == ""){
        R118_C3.value = "";} 
    if(R118_C4.value != "" || R118_C6.value != ""){
        R118_C6.value = Math.round(R118_C5.value/R118_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R118_C4.value == "" && R118_C5.value == ""){
        R118_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 119-----------------------------------------------------
    if(R119_C1.value != "" || R119_C2.value != ""){
        R119_C3.value = Math.round(R119_C2.value/R119_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R119_C1.value == "" && R119_C2.value == ""){
        R119_C3.value = "";} 
    if(R119_C4.value != "" || R119_C6.value != ""){
        R119_C6.value = Math.round(R119_C5.value/R119_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R119_C4.value == "" && R119_C5.value == ""){
        R119_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//--------------------------------Ouă-total, mii bucăţi --------------------------------------
//-------------------------------Rind 120-----------------------------------------------------
    R120_C1.value = parseInt(R121_C1.value*1 + R122_C1.value*1);
    R120_C2.value = parseInt(R121_C2.value*1 + R122_C2.value*1);
    if(R120_C1.value != "" || R120_C2.value != ""){
        R120_C3.value = Math.round(R120_C2.value/R120_C1.value*Math.pow(10,2))/Math.pow(10,2);} 
    if((R120_C1.value == "" && R120_C2.value == "") || (R120_C1.value == 0 && R120_C2.value == 0)){
        R120_C3.value = "";R120_C2.value = "";R120_C1.value = "";} 
    R120_C4.value = parseInt(R121_C4.value*1 + R122_C4.value*1);
    R120_C5.value = parseInt(R121_C5.value*1 + R122_C5.value*1);
    if(R120_C4.value != "" || R120_C5.value != ""){
        R120_C6.value = Math.round(R120_C5.value/R120_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if((R120_C4.value == "" && R120_C5.value == "") || (R120_C4.value == 0 && R120_C5.value == 0)){
        R120_C6.value = "";R120_C5.value = "";R120_C4.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 121-----------------------------------------------------
    if(R121_C1.value != "" || R121_C2.value != ""){
        R121_C3.value = Math.round(R121_C2.value/R121_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R121_C1.value == "" && R121_C2.value == ""){
        R121_C3.value = "";} 
    if(R121_C4.value != "" || R121_C6.value != ""){
        R121_C6.value = Math.round(R121_C5.value/R121_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R121_C4.value == "" && R121_C5.value == ""){
        R121_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 122-----------------------------------------------------
    if(R122_C1.value != "" || R122_C2.value != ""){
        R122_C3.value = Math.round(R122_C2.value/R122_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R122_C1.value == "" && R122_C2.value == ""){
        R122_C3.value = "";} 
    if(R122_C4.value != "" || R122_C6.value != ""){
        R122_C6.value = Math.round(R122_C5.value/R122_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R122_C4.value == "" && R122_C5.value == ""){
        R122_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 123-----------------------------------------------------
    if(R123_C1.value != "" || R123_C2.value != ""){
        R123_C3.value = Math.round(R123_C2.value/R123_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R123_C1.value == "" && R123_C2.value == ""){
        R123_C3.value = "";} 
    if(R123_C4.value != "" || R123_C6.value != ""){
        R123_C6.value = Math.round(R123_C5.value/R123_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R123_C4.value == "" && R123_C5.value == ""){
        R123_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 124-----------------------------------------------------
    if(R124_C1.value != "" || R124_C2.value != ""){
        R124_C3.value = Math.round(R124_C2.value/R124_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R124_C1.value == "" && R124_C2.value == ""){
        R124_C3.value = "";} 
    if(R124_C4.value != "" || R124_C6.value != ""){
        R124_C6.value = Math.round(R124_C5.value/R124_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R124_C4.value == "" && R124_C5.value == ""){
        R124_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 125-----------------------------------------------------
    if(R125_C1.value != "" || R125_C2.value != ""){
        R125_C3.value = Math.round(R125_C2.value/R125_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R125_C1.value == "" && R125_C2.value == ""){
        R125_C3.value = "";} 
    if(R125_C4.value != "" || R125_C6.value != ""){
        R125_C6.value = Math.round(R125_C5.value/R125_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R125_C4.value == "" && R125_C5.value == ""){
        R125_C6.value = "";} 
//--------------------------------------------------------------------------------------------
//-------------------------------Rind 137-----------------------------------------------------
    if(R137_C1.value != "" || R137_C2.value != ""){
        R137_C3.value = Math.round(R137_C2.value/R137_C1.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R137_C1.value == "" && R137_C2.value == ""){
        R137_C3.value = "";} 
    if(R137_C4.value != "" || R137_C6.value != ""){
        R137_C6.value = Math.round(R137_C5.value/R137_C4.value*Math.pow(10,2))/Math.pow(10,2);}
    if(R137_C4.value == "" && R137_C5.value == ""){
        R137_C6.value = "";} 
//--------------------------------------------------------------------------------------------
    
}