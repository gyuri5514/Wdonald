/*---회원가입----*/
$(function(){
	
	//아이디 패스워드 검증하기
    //var re_email = /^[a-zA-Z0-9]{4,16}$/;
    var re_pwd = /^[a-zA-Z0-9]{6,18}$/;
    
$("#m_email").blur(function(){
    var m_email = $("#m_email").val();
   // alert("1차 성공");
	   if (isEmailValid($("#m_email"))==false) {
	        $("#m_email").focus();
  	$("#emailchecktxt").html('<small><strong class="text-danger">잘못된 형식의 이메일 주소입니다.</strong></small>');
	        return false;
        }

        $.ajax({
            type    : "get",
            url     : "emailChk.do",
            data    : {"user_email" : m_email},
			success : function(data){
				
			console.log("중복확인 : " + data);
				
			if(data == 1){
                $("#emailchecktxt").html('<small><strong class="text-danger">사용할 수 없는 이메일 입니다.</strong></small>');
                $("#m_email").focus();
	        	return false;
            }else{
                $("#emailchecktxt").html('<small><strong class="text-success">사용가능한 이메일 입니다.</strong></small>');
            }
			},
			error : function(){
				alert("실패");
			}
        })
    });
	

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
        }

    }); //$("#m_password2").blur
    
    $login_pwd_str_conf = 0;
    
    //문자 인증
/*		var code2 = "";
		$("#inputPhone").click(function(){
			var regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
			var phone = $("#m_mobile3").val();
			
			if(!regExp.test(phone)){
			alert("올바른 번호가 아닙니다.");
			return false;
				}
			$.ajax({
		        type:"GET",
		        url:"check/sendSMS.do?phone=" + phone,
		        cache : false,
		        success:function(data){
		        	if(data=='error'){
		        		alert("휴대폰 번호가 올바르지 않습니다.")
						$(".successPhoneChk").text("유효한 번호를 입력해주세요.");
						$(".successPhoneChk").css("color","red");
						$("#m_mobile3").attr("autofocus",true);
						$("#sms_chk").val(0);
		        	}else{	       
		        		alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오."); 		
		        		$("#send_sms").attr("disabled",false);
		        		$("#inputCertified").css("display","inline-block");
		        		$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
		        		$(".successPhoneChk").css("color","green");
		        		$("#m_mobile3").attr("readonly",false);
		        		code2 = data;
		        		//alert("data : " + data);
		        	}
		        return code2;
		        
		        },error : function(){
		        	alert("실패");
		        }
		    });
		});*/
    //휴대폰 문자 인증번호 대조
/*	$("#inputCertified").click(function(){
		if($("#send_sms").val() == code2){
			$(".successPhoneChk").text("인증번호가 일치합니다.");
			$(".successPhoneChk").css("color","green");
			$("#inputCertified").val("true");
			$("#send_sms").attr("disabled",true);
			$("#m_mobile3").attr("readonly",true);
			$("#sms_chk").val("1");
		}else{
			$(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
			$(".successPhoneChk").css("color","red");
			$("#inputCertified").val("false");
			$(this).attr("autofocus",true);
		}
		return false;
	});*/

//필수입력사항	
/*$("#join_ok").click(function() {

        var m_email = $.trim($("#m_email").val());
        if (m_email=="") {
            alert('이메일주소를 입력해주세요.');
            $('#m_email').focus();
            return false;
        }

        if (isEmailValid("#m_email")==false) {
            alert('잘못된 이메일주소입니다.');
            $("#m_email").focus();
            return false;
        }
       
        var m_name = $.trim($("#m_name").val());
        if (m_name=="") {
            alert('이름을 입력해주세요..');
            $("#m_name").focus();
            return false;
        }

        var m_password =  $.trim($("#m_password").val());
        if (m_password=="") {
            alert('패스워드를 입력해주세요..');
            $("#m_password").focus();
            return false;
        }

        var m_password2 = $.trim($("#m_password2").val());
        if (m_password2=="") {
            alert('패스워드 확인을 입력해주세요.');
            $("#m_password2").focus();
            return false;
        }
		
		if(m_password != m_password2){
			alert('패스워드가 일치하지 않습니다. 다시 확인바랍니다.');
			$("#m_password2").focus();
            return false;
		}
		
        var m_zipcode = $("#m_zipcode").val();
        var m_address = $.trim($("#m_address").val());

        if (m_zipcode=="") {
            alert('주소를 검색해주세요.');
            $("#zip_find").focus();
            return false;
        }

        if (m_address=="") {
            alert('주소를 검색해주세요.');
            $("#zip_find").focus();
            return false;
        }

        var m_mobile3 = ($("#m_mobile3").val()).trim;
        if (m_mobile3=="") {
            alert('휴대폰번호를 입력해주세요.');
            $("#m_mobile3").focus();
            return false;
        }
       
        var m_birth = $("#m_birth").val();
        if (m_birth=="") {
            alert('생년월일을 입력해주세요.');
            $("#m_birth").focus();
            return false;
        }

        var m_sex = $(":radio[name='user_gender']:checked").val();
        if (m_sex=="" || m_sex==undefined) {
            alert('성별을 선택해주세요.');
            $("#m_sex1").focus();
            return false;
        }
		
		var pwd_chk = $("#login_pwd_chk").val();
		if(pwd_chk == 0){
			alert('비밀번호 안전도 올려올려');
			$("#m_password").focus();
			return false;
		}
		
		var pwd_chk = $("#login_pwd_chk").val();
		if(pwd_chk == 0){
			alert('비밀번호 안전도 올려올려');
			$("#m_password").focus();
			return false;
		}
		
		var sms = $("#sms_chk").val();
		if(sms == 0){
			alert('문자 인증을 완료해 주세요.');
			$("#send_sms").focus();
			return false;
		}
		
        $("#join_form").submit();

    });*/
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
    if (arr_pattern.length > 0 ) {
        var chk_arr = arr_pattern.split("||");

        for ( i=0 ; i < chk_arr.length ; i ++) {
            if ( chk_arr[i].length > 0  && val.indexOf( chk_arr[i] ) >= 0 ) {
                levelPoint = levelPoint - 20;
            }
        }
    }

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

function isEmailValid(obj){
    var email = $(obj).val();
    var emailFormat = /^([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;

    if(email.search(emailFormat) == -1)
        return false;
    return true;
}