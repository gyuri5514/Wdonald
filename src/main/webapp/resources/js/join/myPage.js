
$(function(){
	

	

    //비밀번호 체크하는거 
    $("#m_password").keyup(function() {
        $chkLevel = admPwdStrengthChk($(this).val(), $("#m_email").val());
        $("#login_pwd_chk").val($chkLevel);

        $(".pwd_str_msg").hide();
        $(".pwd_str_msg[level='"+$chkLevel+"']").show();
       
    }); //$("#m_password").keyup
   
    $("#m_password2").focus(function() { $("#pwd_chk_msg2").hide(); });
    $("#m_password2").blur(function() {
        $chk_login_pwd  = $("#m_password").val();
        $chk_login_pwd2 = $(this).val();

        $msgTxt   = "";

        if ($chk_login_pwd  != $chk_login_pwd2 && $.trim($chk_login_pwd2) != "" ) {
            $msgTxt   = "<span class='id_str_msg_x text-danger'><small>[패스워드]와 [패스워드 확인]이 일치하지 않습니다.</small></span><br/>";
            $("#pwd_chk_msg2").html($msgTxt).show();
        }else{
        	 $msgTxt   = "<span class='id_str_msg_x text-success'><small>[패스워드]와 [패스워드 확인]이 일치합니다.</small></span><br/>";
            $("#pwd_chk_msg2").html($msgTxt).show();
        }

    }); //$("#m_password2").blur
    



})
/*----------------------------------------------------------------------------------*/
function admPwdStrengthChk(val, arr_pattern) {

    var chk_str = 0 ;

    if ( (val.length - (val.replace(/[A-Z]/g,"").length ))  > 0 ) {
        chk_str = chk_str + 1;   //대문자 체크
    }
    if ( (val.length - (val.replace(/[a-z]/g,"").length ))  > 0 ) {
        chk_str = chk_str + 1;   //소문자 체크
    }
    if ( (val.length - (val.replace(/[0-9]/g,"").length)) > 0 ) {
        chk_str = chk_str + 1;   //숫자 체크
    }
    if ( (val.length - (val.replace(/\W/g,"").length))  > 0 ) {
        chk_str = chk_str + 1;   //특수문자 체크
    }

    var levelPoint  = 0;

    switch (chk_str) {
        case 4 : levelPoint = 120; break;
        case 3 : levelPoint = 100;  break;
        case 2 : levelPoint = 70;  break;
        case 1 : levelPoint = 50;  break;
    }

    //글자수
    if (val.length < 6) {
        levelPoint = 0;
    } else if ( val.length < 9 ) {
        levelPoint = levelPoint - 20;
    } else if ( val.length < 11 ) {
        levelPoint = levelPoint + 10;
    } else {
        levelPoint = levelPoint + 30;
    }

    // 한 개의 문자,숫자 사용
    if ( isSingle(val) ) {
       levelPoint = levelPoint - 20;
    }

    // 3자리 이상 동일한 문자,숫자
    if (isSame(val, 3)) {
        levelPoint = 0;
    }

    // 3자리 이상 연속된 문자,숫자
    if (isKeyPattern(val)) {
        levelPoint = levelPoint - 20;
    }

    // 연속된 문자,숫자
    if (isContinued(val,2)) {
        levelPoint = levelPoint - 20;
    }

    //특정 문자 포함 여부(아이디,생년월일 등 / 구분자 ',' )
    /*if (arr_pattern.length > 0 ) {
        var chk_arr = arr_pattern.split("||");

        for ( i=0 ; i < chk_arr.length ; i ++) {
            if ( chk_arr[i].length > 0  && val.indexOf( chk_arr[i] ) >= 0 ) {
                levelPoint = levelPoint - 20;
            }
        }
    }*/

    var level = "";

    //레벨등급
    if ( levelPoint >= 90 ) {
        level = "3";
    } else if ( levelPoint >= 70 ) {
        level = "2";
    } else if ( levelPoint >= 40 ) {
        level = "1";
    } else {
        level = "0";
    }
    return level;
}

function isSingle(val) {
    var cnt = 1;
    for (var i=0; i<=val.length; i++) {
        if (val.charAt(0)==val.charAt(i+1)) {
            cnt++;
        }
    }

    if (val.length == cnt) {
        return true;
    } else {
        return false;
    }
}

function isSame(val, cnt) {
    var ret  = false;
    var checkStr = ""; // 같은 반복문자 체크(예: aaaa)

    for(var z=1; z<cnt; z++){
        checkStr  += "val.charAt(i) == val.charAt(i + " + z + ")";
        if(z < cnt - 1){
            checkStr  += " && ";
        }
    }

    for(var i=0; i<val.length; i++){
        if(eval(checkStr)){
            ret = true;
            break;
        }
    }

    return ret;
}

function isContinued(val, cnt){
    var ret  = false;
    var checkAsc = "";  // 연속된 오름차순 숫자 혹은 문자(예: abcde)
    var checkDesc = ""; // 연속된 내림차순 숫자 혹은 문자(예: edcba)

    for(var z=1; z<cnt; z++){
        checkAsc  += "(val.charCodeAt(i) + " + z + ") == val.charCodeAt(i + " + z + ")";
        checkDesc += "(val.charCodeAt(i) - " + z + ") == val.charCodeAt(i + " + z + ")";
        if(z < cnt - 1){
            checkAsc  += " && ";
            checkDesc += " && ";
        }
    }

    for(var i=0; i<val.length; i++){
        if(eval(checkAsc) || eval(checkDesc)){
            ret = true;
            break;
        }
    }

    return ret;
}

function isKeyPattern(val) {
    var pt1 = "asdfghjkl";
    var pt2 = "lkjhgfdsa";
    var pt3 = "qwertyuiop";
    var pt4 = "poiuytrewq";
    var pt5 = "zxcvbnm";
    var pt6 = "mnbvcxz";
    var pt7 = "123456789";
    var pt8 = "1234";

    if (pt1.indexOf(val)>=0 || pt2.indexOf(val)>=0 || pt3.indexOf(val)>=0 || pt4.indexOf(val)>=0 || pt5.indexOf(val)>=0 || pt6.indexOf(val)>=0 || pt7.indexOf(val)>=0 || pt8.indexOf(val)>=0) {
        return true;
    } else {
        return false;
    }
}

