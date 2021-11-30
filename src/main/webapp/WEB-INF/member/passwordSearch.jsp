<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Wdonald - find password</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">

<meta name="description" content="">
<meta name="author" content="Themelize.me">

<link rel="stylesheet" href="resources/css/main/custom.css?t=2021090901">

<!-- Bootstrap CSS -->
<link href="resources/css/join/bootstrap.min.css" rel="stylesheet">

<!-- Theme style -->
<link href="resources/css/join/theme-style.min.css" rel="stylesheet">

<!-- Your custom override -->
<link href="resources/css/join/custom-style_sh.css" rel="stylesheet">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="/m/appstrap/img/icons/114x114.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="/m/appstrap/img/icons/72x72.png">
<link rel="apple-touch-icon-precomposed"
	href="/m/appstrap/img/icons/default.png">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300|Rambla|Calligraffitti'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" type="text/css"
	href="/js/jquery/ui/themes/base/jquery-ui.css" />

<!-- Scripts -->
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
</head>
	<div id="content">
		<div class="container">
			<div class="find-pw-container">
				<div class="col-md-3 sidebar">
					<div class="section-menu">
						<ul class="nav nav-list">
							<li class="nav-header lnb-header">비밀번호 찾기<span>Find Password</span></li>
						</ul>
					</div>
				</div>
				<h3 class="title-divider mt_0">
					<span>비밀번호 찾기</span> <small>Find Password</small>
				</h3>
				<div id="find_password">
					<label>이메일</label>
					<div id="align-email-btn">
					<input name="user_email" id="m_email" type="email" class="form-control placeholder" placeholder="example@wdonald.com" />
						<span id="emailChecktxt"></span>
					<a href="javascript:void(0);" onclick="searchMyEmail();" class="btn btn-md btn-red" id="btnSearch">검색</a></div>
				</div>
			</div>
		</div>
	</div>
	<!-- //.container -->
<script type="text/javascript">
$(function(){
	$('#m_email').blur(function(){
		$('#emailChecktxt').html("");
	})	
	$('#m_email').focus(function(){
		$('#emailChecktxt').html("");
	})
});
function searchMyEmail(){
	var user_email = $('#m_email').val();
	var emailRegex = /^([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	console.log(user_email.search(emailRegex)==-1);
	
	if(user_email.search(emailRegex)==-1){
		$('#emailChecktxt').html("<font id='chk-span'><small>유효하지 않은 이메일 입니다.</small></font>")
	}else{
		$.ajax({
			type: "get",
			url: "emailChk.do?user_email="+user_email,
			contentType:"application/json"
		}).done(function(res){
			if(res==1){
				$.ajax({
					type: "POST",
					url: "findPw.do?email="+user_email,
					contentType:"application/json"
				}).done(function(res){
					$('#btnSearch').prop("onclick", null).off("click");
				})
				window.location.href="/controller/emailConfirm.do";
			}else if(res!=1){
				$('#emailChecktxt').html("<font id='chk-span'><small>등록하신 이메일이 아닙니다.</small></font>")
			}
		})//end done()
	}//if(user_email.search(emailRegex)==-1) end
}//searchMyEmail()end

</script>
<!-- //#content -->
<!--Hidden elements - excluded from jPanel Menu on mobile-->

<%@ include file="footer.jsp"%>