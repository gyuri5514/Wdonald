function join_chk(){
	var form = document.join_form;

	if (form.checkbox1.checked==false || form.checkbox2.checked==false)	{
		alert("사이트 이용약관과 개인정보 취급방침에 대한 안내를 모두 동의해 주세요.")
		if (form.checkbox1.checked==false){
			form.checkbox1.focus();
			return;
		}else if (form.checkbox2.checked==false){
			form.checkbox2.focus();
			return;
		}
	}else{
		form.submit()
	}
}

/*----------------------------------------------------------------------------------*/

function photo_up(){
	window.open("/join/photo_up.asp","photo","width=600,height=250");
}

function zip_find(){
	window.open("zip_search.asp","zip_pop","width=600,height=200");
}

function zip_check(){
	document.zip_form.submit();
}


function zip_input(zip_form,i){
	var zipadd = document.zip_form.zipno[i].value
	opener.document.getElementById("m_zipcode1").value = zipadd.substring(0,3)
	opener.document.getElementById("m_zipcode2").value = zipadd.substring(4,7)
	opener.document.getElementById("m_address1").value = zipadd.substring(8,40)
	opener.document.getElementById("m_address2").focus()
	self.close()
}

function imagefile_onchange(){
	var form = document.getElementById("join_form");
	form.preview.src = form.file_name.value;
	form.preview.style.visibility = "visible";
}

function imagefile_onchange_input(){
	opener.document.join_form.m_photo.value = form.file_name.value;
	opener.document.join_form.preview.src = form.file.value;
	opener.document.join_form.preview.style.visibility = "visible";
}

function display_email(member_email2){ 
	for(var i=0; i<member_email2.length;i++){
		if (document.join_form.m_email2.options[i].selected){
			if (document.join_form.m_email2.value=="E00"){
				document.getElementById("toggleB1").style.display = 'inline'; 
				document.join_form.m_email3.focus();
			}else{
				document.getElementById("toggleB1").style.display = 'none'; 
				document.join_form.m_email3.value='';
				old_menu = ''; 
			}
		}
	}
}

function pass_chk(form){
	var pass =document.getElementById("m_password").value;
	var pass_ok = document.getElementById("m_password_chk").value;
	
	if(pass != pass_ok){
		document.getElementById("passchecktxt").innerHTML = "<span class='text-danger'>입력된 패스워드가 다릅니다.</span>";
		document.getElementById("pass_chk_ok").value == "false"
	}else if(pass == pass_ok){
		document.getElementById("passchecktxt").innerHTML = "<span class='text-success'>입력 확인 되었습니다.</span>";
		document.getElementById("pass_chk_ok").value == "true"
	}
}

function file_check(){
	var form = document.getElementById("photo_form");

	if (form.file_name.value.length == 0){
		alert("파일을 업로드해주세요");
		form.file_name.focus();
		return;
	}
	
	var pass_extension = 'gif||jpg||jpeg||bmp||png||GIF||JPG||JPEG||BMP||PNG';
	var file_name = form.file_name.value ;
	var file_arr = file_name.split('.');
	var file_extension = file_arr[file_arr.length-1];
	
	if (pass_extension.indexOf(file_extension) < 0){
		alert("업로드 불가능한 형식의 파일입니다. 확인후 다시 업로드해주세요.");
		form.file_name.select();
		document.selection.clear(); 
		return;
	}
	
	form.submit();
}

function checkOnlyAlphabetNumber(str){
	var checkRe = /^[a-z||A-Z||0-9||48]+$/;
    return checkRe.test(str);
}

function ResutCheckID(form){
	var email = document.getElementById("m_email").value;
	var form = document.getElementById("join_form")
	//var result = checkOnlyAlphabetNumber(email);
	
	if (email != '')
	{
		/*if(result == false)	{
			alert("사용 email는 영문 또는 숫자만 사용가능합니다");
			form.m_email.value = "";
			form.m_email.focus();
			return false;
		}*/
	}
	
	
	myAjax = createAjax();
	var toSend = email;
	var url  = "email_check.asp?m_id="+escape(toSend);
	
	myAjax.onreadystatechange = receiveResponse;
	myAjax.open("get",url,true);
	
	myAjax.send(null);
}

function createAjax(){
	if(typeof(ActiveXObject) == "function"){
		return new ActiveXObject("Microsoft.XMLHTTP");
	}else if(typeof(XMLHttpRequest) == "object" || typeof(XMLHttpRequest) == "function"){
		return new XMLHttpRequest();
	}else{
		alert("브라우저가 AJAX를 지원하지 않습니다.");
		return;
	}
}

function receiveResponse(){
	if(myAjax.readyState == 4){
		if(myAjax.status == 200){
			if(myAjax.responseText == "true"){
				alert("사용가능한 email입니다.");
				document.getElementById("emailchecktxt").innerHTML = "<span class='text-success'>사용가능한 Email입니다.</span>";
			}else{
				//document.getElementById("m_id").value = "";
				document.getElementById("emailchecktxt").innerHTML = "<span class='text-danger'>사용할 수 없는 Email입니다.</span>";
			}
		}else{
			//alert("서버에러200 status:"+myAjax.responseXML.status);
		}
	}
}


function member_del2(idx) {
	if (confirm("가입된 정보와 지원했던 내용이 전부 삭제 됩니다. \n탈퇴 하시겠습니까?") == true)
	{
		location.href="/m/appstrap/member_del.asp?idx="+idx+"";
		//document.getElementById("work_frame").src="/mypage/member_del.asp?m_id="+m_id+"&idx="+idx+"";
	}
}