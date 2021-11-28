<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Wdonald - find password</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="description" content="">
<meta name="author" content="Themelize.me">

<link rel="stylesheet" href="resources/css/main/custom.css?t=2021090901">

<!-- Bootstrap CSS -->
<link href="resources/css/join/bootstrap.min.css" rel="stylesheet">

<!-- Theme style -->
<link href="resources/css/join/theme-style.min.css" rel="stylesheet">

<!-- Your custom override -->
<link href="resources/css/join/custom-style_sh.css" rel="stylesheet">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="/m/appstrap/img/icons/114x114.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="/m/appstrap/img/icons/72x72.png">
<link rel="apple-touch-icon-precomposed" href="/m/appstrap/img/icons/default.png">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300|Rambla|Calligraffitti' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="/js/jquery/ui/themes/base/jquery-ui.css" />
<!-- Scripts -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">

<script type="text/javascript" src="resources/js/join/join.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="resources/js/commons.js"></script>
<style type="text/css">
.container:not(.container) {
	height: 500px;
}


#content:not(.wrapper) {
	
}

#find_password:not(.form-control) {
	width: 30%;
	margin-left: 25%;
}

#find_password label:not(.form-control) {
	width: 20%;
}

#find_password input:not(.form-control) {
	width: 25%;
}

legend {
	display: block;
	padding-left: 2px;
	padding-right: 2px;
	border: 1px solid;
}

.find-pw-container {
	height: 400px;
}
#chk-span{
	color:red;
}

</style>
<c:if test="${eamilResult ne 'success' }">
<script>
	alert('정상적인 경로로 접근해주세요.');
	window.location.href='/controller/main.do';
</script>
</c:if>
<script>
function pwdRegex(){
			$("#buttonSubmit").attr("disabled", "disabled");
			var pwd1=$("#m_password1").val(); 
			var pwd2=$("#m_password2").val();
			if(pwd1.length>4){
			var reg = new RegExp(/^[0-9a-z]+$/);
			console.log(pwd1);
			console.log(!reg.test(pwd1));		
			if(!reg.test(pwd1)){
				$('#pwd1_span').html("<small><font style='color:green;'>사용 가능한 패스워드입니다.</font></small>");
				if(pwd1==pwd2){
					$("#buttonSubmit").removeAttr("disabled");
					console.log('pwd1 == pwd2 true');
				}else{
					$("#buttonSubmit").attr("disabled", "disabled");
					console.log('pwd1 == pwd2 false');
				}
			}else{
				$('#pwd1_span').html("<small><font style='color:red;'>사용 불가능한 패스워드입니다.</font></small>");
			}
		}
}
function pwdRegex2(){
	$("#buttonSubmit").attr("disabled", "disabled");
	var pwd1=$("#m_password1").val(); 
	var pwd2=$("#m_password2").val();
	var reg = new RegExp(/^[0-9a-z]+$/);
	if(!reg.test(pwd1)&&!reg.test(pwd2)){
		if(pwd1==pwd2){
			$("#buttonSubmit").removeAttr("disabled");
			$('#pwd2_span').html("<small><font style='color:green;'>비밀번호가 일치 합니다.</font></small>");
		}else{
			$('#pwd2_span').html("<small><font style='color:red;'>비밀번호가 일치 하지 않습니다.</font></small>");
		}
	}else{
		$('#pwd2_span').html("<small><font style='color:red;'>비밀번호가 일치 하지 않습니다.</font></small>");
	}
}
</script>
</head>
	<div id="content">
		<div class="container">
			<div class="find-pw-container">
				<div class="col-md-3 sidebar">
					<div class="section-menu">
						<ul class="nav nav-list">
							<li class="nav-header lnb-header">비밀번호 변경<span>Confirm Password</span></li>
						</ul>
					</div>
				</div>
				<h3 class="title-divider mt_0">
					<span>비밀번호 변경</span> <small>Confirm Password</small>
				</h3>
				<div id="find_password">
					<label>이메일</label> <br>
					<div>
					<br>
					<form method="post" action="confirmPassword.do">
						<div class="form-group">
						<input type="hidden" name="user_email" value="${email}" class="form-control" readonly="readonly" >
							<label for="m_password">패스워드</label>
							 <input type="hidden" id="login_pwd_chk" name="login_pwd_chk" value="0" />
							 <input type="password" id="m_password1" name="user_password" onkeyup="pwdRegex()" maxlength="16" class="form-control placeholder" />
							 <span id="pwd1_span"></span>
						</div>
						<div>
							<input type="password" id="m_password2"  onkeyup="pwdRegex2()" maxlength="16" class="form-control placeholder" />
								 <span id="pwd2_span"></span>
						</div>
						<br>
						<button id="buttonSubmit" class="btn btn-md btn-red" type="submit" disabled="disabled">confirm</button>
					</form>
							
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
	<!-- //.container -->
<!-- //#content -->
<!--Hidden elements - excluded from jPanel Menu on mobile-->

<%@ include file="footer.jsp"%>